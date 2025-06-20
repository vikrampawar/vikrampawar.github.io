---
title: "Setting Up Your First MCP Server on a Linux Machine"
published: true
description: My experience setting up GitHub MCP server on Linux and the lessons learned about scope configuration
tags: #mcp #ai #development #tools
layout: post
categories: #development #ai-tools
date: 2025-06-20 18:00:00 +0000
---

# Setting Up Your First MCP Server on a Linux Machine

I recently set up my first MCP (Model Context Protocol) server on a Linux machine after having some experience with it on Mac. The process taught me a few things about scope configuration and the different mindset we adopt when working with AI tools versus traditional development.

## The Context Switch Problem

When I first installed MCP servers on my Mac, I found it a bit fiddly. I had some setup already in Claude Desktop which I assumed would be available, but they weren't. I later discovered a command that copies them over. All the MCP servers weren't available in all Claude instances either - possibly because they were installed in different scopes. I didn't have a clear idea about which scope the MCP servers were installed in.

These aren't big problems. As an experienced software developer, I'd be able to resolve all these issues quite quickly. I'd probably read the documentation before I start, know what to expect, and resolve issues quickly.

However, with Claude (and generally when working with AI), I expect the tools to make complicated setups easy. And they do make complicated setups quite easy. So I'm in a different mode with them. My mind isn't in the right place to fix such simple issues.

This reminds me of that scene in Pretty Woman where Julia Roberts goes to an event with Richard Gere, dressed very well and acting ladylike. Then Richard's friend recognizes her and talks rudely. Julia is completely taken aback - she's not in the right mindset for that situation. When we're in a certain environment or setup, we behave in a certain way.

## The Linux Setup Process

Here's what I did to get the GitHub MCP server working on my Linux machine:

### Prerequisites Check
First, I verified the necessary tools were installed:

```bash
# Check Node.js
node --version  # v21.5.0

# Check npm  
npm --version   # 10.2.4

# Check GitHub CLI
gh --version    # gh version 2.45.0
```

### Installing the GitHub MCP Server

```bash
# Install the GitHub MCP server globally
npm install -g @modelcontextprotocol/server-github

# Verify installation
which mcp-server-github
```

### Scope Configuration - The Key Learning

This is where I learned something important about MCP server scopes. Initially, I added the server without specifying a scope:

```bash
# This adds at local scope (project-specific)
claude mcp add github mcp-server-github
```

The server was configured, but it only worked in that specific project context. After consulting the documentation, I discovered there are three scopes:

1. **Local scope** (default) - Project-specific user settings
2. **Project scope** - Stored in `.mcp.json`, shared with team
3. **User scope** - Available across all projects

To make it available across all my projects, I needed to specify user scope:

```bash
# Add at user scope for cross-project availability
claude mcp add -s user github mcp-server-github
```

### Testing the Setup

I tested the configuration in another Claude instance and confirmed it worked correctly. The GitHub MCP tools became available for repository management, issue tracking, and file operations.

## Key Takeaways

1. **Scope matters**: Understanding the three MCP scopes (local, project, user) is crucial for proper configuration
2. **Documentation first**: Even with AI tools, reading the docs upfront saves time
3. **Mindset awareness**: Recognize when you're in "AI-assisted mode" versus "traditional debugging mode"
4. **User scope for personal tools**: For tools you want available everywhere, use `-s user`

The setup process itself is straightforward once you understand the scope system. The real insight is recognizing how our approach to problem-solving changes when we're working with AI tools that typically "just work."

---

## Appendix: Session Interaction History

**Original source text from mcp-one.md:**

This blog post is about creating your first mcp server and testing it.

I already have installed mcp servers in another machine (mac). 
This is linux machine are there are non involved.

When I installed mcp servers on mac, I found it a bit fidly, as I had some setup already on Claude Desktop which I assumed will be available and they were not available, and I later discovered a command that copies them.

Also all mcp servers were not available in all claude instances. Possibly because they were in different scopes, I didn't have a clear idea in scope the mcp servers were installed.

These are not big problems and as an experienced software developer I'd be able to resolve all these issues quite quickly.
I'd probably read documentation before I start and know and expect what to do and resolve quickly. 
However, with claude (and generally working with AI) I expect the tools to make it easy. And they do make complicated setups quite easy. So I'm a different mode with them. My mind isn't in the right place to fix such simple/silly issues.  

Reminds me of that scene in Pretty woman where Julia Roberts goes to an event/party with Richard Gere dressed very well and acting ladylike and then Richard's friend recognises her and talks rudely. Julia is completely taken aback and I think says something to the lines of she not being in the right place. When we were in a certain environment/setup, we behave in a certain way.

Anyway, I have done the following, and want the post to contain the commands used

- gave document link to claude
- had it install github mcp server at the user level 
- tested it manually that it works in another instance

**Complete user prompts sequence:**
1. `help me setup github mcp on this machine`
2. `mcp command return nothings, do I need to start it ?`
3. `you have read the mcp documentation there are only 3 scopes and we can know exactly where those are located.`
4. `is that info from https://docs.anthropic.com/en/docs/claude-code/mcp ?`
5. `add it at user level`
6. `test it.`
7. `start a subagent, test it and show results`
8. `/create-a-blog-post-from @mcp-one.md`
9. `show me all the user prompts in this session.`
10. `Add this to the post as appendix, including this last one @_posts/2025-06-20-mcp-setup-linux.md`

