# Jekyll Server Accessibility Issue Analysis

## Problem Description

When Claude runs `bundle exec jekyll serve --host=0.0.0.0 --port=3000`, the server starts successfully but curl requests return HTTP Status 000 (connection failure). However, when the user runs the same command, the server is accessible.

## Potential Root Causes

### 1. Timing/Race Condition
**Theory**: The 5-second timeout terminates Jekyll before it's fully ready to serve requests.

**Evidence**:
- Jekyll shows "Server running... press ctrl-c to stop" message
- But timeout kills the process immediately after
- Jekyll might need more time for full initialization

**Test**: Try longer timeout (10-15 seconds) or remove timeout entirely

### 2. Process Management
**Theory**: The `timeout` command interferes with Jekyll's server setup.

**Evidence**:
- `timeout 5s` sends SIGTERM to Jekyll after 5 seconds
- Jekyll might not handle abrupt termination gracefully
- Server socket might not be properly bound before termination

**Test**: Run without timeout and use `pkill` afterward

### 3. Tool Environment Isolation
**Theory**: The Bash tool runs in a different process context that affects networking.

**Evidence**:
- Tool processes might have different network namespace
- Socket binding permissions could be different
- Process lifecycle management varies between tool and interactive shell

### 4. Concurrency Issues
**Theory**: Multiple rapid Jekyll starts/stops create port conflicts.

**Evidence**:
- Previous `pkill -f jekyll` might not fully clean up sockets
- Port 3000 might be in TIME_WAIT state
- New Jekyll process can't properly bind to the port

**Test**: Use different port or add wait time after pkill

### 5. Output Buffering/Detection
**Theory**: Jekyll appears ready but isn't actually serving requests yet.

**Evidence**:
- "Server running" message appears in stderr
- Actual socket binding might happen asynchronously
- curl executes before server is truly ready

## Diagnostic Tests

### Test 1: Extended Timeout
```bash
timeout 15s bundle exec jekyll serve --host=0.0.0.0 --port=3000
sleep 2
curl -s -I http://localhost:3000/
```

### Test 2: No Timeout
```bash
bundle exec jekyll serve --host=0.0.0.0 --port=3000 &
SERVER_PID=$!
sleep 5
curl -s -I http://localhost:3000/
kill $SERVER_PID
```

### Test 3: Different Port
```bash
timeout 5s bundle exec jekyll serve --host=0.0.0.0 --port=3001
curl -s -I http://localhost:3001/
```

### Test 4: Socket Check
```bash
# After Jekyll start, check if socket is listening
netstat -tlnp | grep :3000
# Or with ss
ss -tlnp | grep :3000
```

### Test 5: Process Investigation
```bash
timeout 5s bundle exec jekyll serve --host=0.0.0.0 --port=3000 &
TIMEOUT_PID=$!
sleep 2
ps aux | grep jekyll
curl -s -I http://localhost:3000/
wait $TIMEOUT_PID
```

## Hypothesis Ranking

1. **Most Likely**: Timing issue - Jekyll needs more time to fully initialize
2. **Second**: Process management - timeout interferes with proper server setup
3. **Third**: Concurrency - port conflicts from rapid start/stop cycles
4. **Least Likely**: Tool environment isolation

## Recommended Fix

Update the CLAUDE.md confirmation process:

```bash
# Stop existing processes
pkill -f jekyll
sleep 2  # Allow cleanup time

# Start Jekyll without timeout
bundle exec jekyll serve --host=0.0.0.0 --port=3000 &
SERVER_PID=$!

# Wait for server to be ready
sleep 5

# Test accessibility
curl -s -I http://localhost:3000/

# Cleanup
kill $SERVER_PID
```

## Next Steps

1. Test the extended timeout approach
2. Try the no-timeout + background process method
3. Add socket checking to verify server readiness
4. Update CLAUDE.md with working procedure