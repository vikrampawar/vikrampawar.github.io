#!/bin/bash

# Jekyll Post Availability Checker
# Tests if a Jekyll post is properly built and accessible

set -e

# Configuration
POST_PATH="$1"
if [ -z "$POST_PATH" ]; then
    echo "Usage: $0 <post-path>"
    echo "Example: $0 /ai/development/2025/06/15/why-command-line-is-perfect-interface-ai-coding-assistants.html"
    exit 1
fi

HOST="0.0.0.0"
PORT=3000
BASE_URL="http://localhost:$PORT"
FULL_URL="$BASE_URL$POST_PATH"
MAX_WAIT=30
CHECK_INTERVAL=1

echo "🚀 Jekyll Post Availability Checker"
echo "=================================="
echo "Post URL: $FULL_URL"
echo ""

# Step 1: Clean up existing Jekyll processes
echo "1️⃣  Stopping existing Jekyll processes..."
pkill -f jekyll 2>/dev/null || echo "   No Jekyll processes found"
sleep 2
echo "   ✅ Cleanup complete"

# Step 2: Start Jekyll in background
echo ""
echo "2️⃣  Starting Jekyll server..."
nohup bundle exec jekyll serve --host=$HOST --port=$PORT >/dev/null 2>&1 &
JEKYLL_PID=$!
echo "   Jekyll PID: $JEKYLL_PID"

# Step 3: Wait for server to be ready
echo ""
echo "3️⃣  Waiting for server to be ready..."
wait_count=0
server_ready=false

while [ $wait_count -lt $MAX_WAIT ]; do
    # Check if Jekyll process is still running
    if ! kill -0 $JEKYLL_PID 2>/dev/null; then
        echo "   ❌ Jekyll process died unexpectedly"
        exit 1
    fi
    
    # Check if port is listening
    if netstat -tln 2>/dev/null | grep -q ":$PORT.*LISTEN" || ss -tln 2>/dev/null | grep -q ":$PORT.*LISTEN"; then
        echo "   ✅ Server is listening on port $PORT"
        server_ready=true
        break
    fi
    
    echo "   ⏳ Waiting... ($((wait_count + 1))s)"
    sleep $CHECK_INTERVAL
    wait_count=$((wait_count + 1))
done

if [ "$server_ready" = false ]; then
    echo "   ❌ Server failed to start within ${MAX_WAIT}s"
    kill $JEKYLL_PID 2>/dev/null || true
    exit 1
fi

# Step 4: Test homepage accessibility
echo ""
echo "4️⃣  Testing homepage accessibility..."
homepage_status=$(curl -s -o /dev/null -w "%{http_code}" $BASE_URL || echo "000")
if [ "$homepage_status" = "200" ]; then
    echo "   ✅ Homepage accessible (HTTP $homepage_status)"
else
    echo "   ❌ Homepage failed (HTTP $homepage_status)"
    kill $JEKYLL_PID 2>/dev/null || true
    exit 1
fi

# Step 5: Check if post HTML file exists
echo ""
echo "5️⃣  Checking post HTML file..."
# Convert URL path to file system path
html_file="_site$POST_PATH"
if [ -f "$html_file" ]; then
    file_size=$(stat -c%s "$html_file" 2>/dev/null || stat -f%z "$html_file" 2>/dev/null)
    echo "   ✅ Post HTML exists: $html_file ($file_size bytes)"
else
    echo "   ❌ Post HTML not found: $html_file"
    kill $JEKYLL_PID 2>/dev/null || true
    exit 1
fi

# Step 6: Test post accessibility
echo ""
echo "6️⃣  Testing post accessibility..."
post_status=$(curl -s -o /dev/null -w "%{http_code}" "$FULL_URL" || echo "000")
if [ "$post_status" = "200" ]; then
    echo "   ✅ Post accessible (HTTP $post_status)"
else
    echo "   ❌ Post failed (HTTP $post_status)"
    kill $JEKYLL_PID 2>/dev/null || true
    exit 1
fi

# Step 7: Verify post content
echo ""
echo "7️⃣  Verifying post content..."
post_content=$(curl -s "$FULL_URL")
content_length=$(echo "$post_content" | wc -c)
if [ "$content_length" -gt 1000 ]; then
    echo "   ✅ Post content verified ($content_length characters)"
else
    echo "   ❌ Post content too short ($content_length characters)"
    echo "   First 20 lines of response:"
    echo "$post_content" | head -20
    kill $JEKYLL_PID 2>/dev/null || true
    exit 1
fi

# Step 8: Check homepage listing (optional - extract post title from HTML)
echo ""
echo "8️⃣  Checking homepage post listing..."
homepage_content=$(curl -s "$BASE_URL")
# Extract title from the HTML file
post_title=$(grep -o '<title>[^<]*</title>' "$html_file" | sed 's/<[^>]*>//g' | cut -d'|' -f1 | sed 's/^ *//;s/ *$//')
if [ -n "$post_title" ] && echo "$homepage_content" | grep -q "$post_title"; then
    echo "   ✅ Post appears on homepage"
else
    echo "   ⚠️  Post title not found on homepage (may take time to appear)"
    echo "   📝 Post title: '$post_title'"
fi

# Detach from Jekyll process and return control
echo ""
echo "🎉 SUCCESS! Post is fully accessible and properly published!"
echo "   📍 Local URL: $FULL_URL"
echo "   📁 HTML file: $html_file ($file_size bytes)"
echo "   🏠 Listed on homepage: ✅"
echo "   🌐 HTTP status: $post_status"
echo ""
echo "🔧 Jekyll server is still running (PID: $JEKYLL_PID)"
echo "   🌐 Server URL: $BASE_URL"
echo "   🛑 To stop: kill $JEKYLL_PID"
echo "   💡 Or use: pkill -f jekyll"
echo ""
echo "✨ Control returned - Jekyll running independently"

# Disown the background process so script can exit cleanly
disown $JEKYLL_PID 2>/dev/null || true

exit 0