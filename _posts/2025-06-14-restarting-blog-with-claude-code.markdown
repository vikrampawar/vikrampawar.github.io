---
title: "Restarting My Blog with Claude Code: How AI Made Jekyll Setup Effortless"
published: true
description: "How Claude Code turned what used to be a painful blog resurrection into a smooth 10-minute setup experience"
tags: #blogging #ai #claude #jekyll #github-pages #coding-assistant
layout: post
categories: #ai #blogging #development
date: 2025-06-14 12:00:00 +0000
---

After years of sporadic blogging, I'm back. But this time was different – instead of the usual painful process of remembering how Jekyll works, updating dependencies, and debugging setup issues, the entire experience was smooth and effortless. Why? Because I had Claude Code as my coding assistant.

## The Problem: Blogging Restart Friction

Every time I've tried to restart blogging in the past, it's been the same story. My local Jekyll setup would be broken, dependencies outdated, and I'd spend hours just trying to get `bundle exec jekyll serve` to work. By the time I got the technical hurdles sorted, my motivation to actually write had evaporated.

This time, I simply told Claude Code: "I have started this a long time ago on another machine. I don't think I have local setup for this. Can you gather info from the web to find out if I need to update in anyway, and how to setup locally."

## What Claude Code Did

In less than 10 minutes, Claude Code:

1. **Analyzed my codebase** - Examined my Jekyll site structure, Gemfile, and configuration
2. **Researched current requirements** - Fetched up-to-date information from GitHub Pages documentation
3. **Identified what was outdated** - My Jekyll 3.8.4 was old, I was using direct Jekyll gem instead of github-pages gem, and Ruby requirements had changed
4. **Fixed my Gemfile** - Updated it to use the github-pages gem for compatibility
5. **Handled the setup process** - Updated Bundler, installed dependencies, resolved version conflicts
6. **Debugged issues** - When Jekyll failed due to Liquid syntax errors in my documentation, it quickly identified and fixed them
7. **Got the server running** - Had my blog accessible at localhost:3000

## The Technical Details

Here's what was wrong and how Claude Code fixed it:

### Outdated Dependencies
- **Problem**: Using Jekyll 3.8.4 (GitHub Pages now uses 3.10.0)
- **Solution**: Switched to `github-pages` gem which automatically pulls in the right versions

### Gemfile Configuration
**Before:**
```ruby
gem "jekyll", "~> 3.8.4"
```

**After:**

```ruby
gem "github-pages", group: :jekyll_plugins
```

### Ruby Version Compatibility
- **Problem**: GitHub Pages now requires Ruby 2.7.0+ (uses 3.3.4)
- **Solution**: Verified my Ruby 3.1.4 was compatible and updated all dependencies

### Liquid Syntax Errors
When Jekyll failed with cryptic errors about unclosed highlight tags, Claude Code quickly identified that my newly created CLAUDE.md file had unescaped Liquid syntax and fixed it using proper raw tags.

## What This Means for My Blogging

Now that AI can handle the technical drudgery, I can focus on what I actually want to do: write and share ideas. This is particularly relevant as I dive deeper into AI tools and coding assistants.

## My AI Learning Journey

I want to document my exploration of AI tools, particularly:
- **Coding assistants** like Claude Code, GitHub Copilot, and Cursor
- **How AI changes development workflows** and what skills become more/less important
- **Practical AI applications** beyond just code generation
- **The evolving landscape** of AI tools and how to choose between them

The irony isn't lost on me that my first post about exploring AI was itself made possible by AI.

## Why Blog Again?

Three main reasons:

1. **Track my learning publicly** - The AI space moves fast, and writing helps me process and remember what I'm learning
2. **Share practical insights** - Beyond the hype, what actually works day-to-day?
3. **Document the journey** - I'm curious how my thinking about AI evolves over time

Previously, blogging felt like a chore because of all the setup friction and editing overhead. Now with AI handling the technical hassles and helping with writing polish, it feels sustainable again.

## Looking Forward

This is just the beginning. I plan to write regularly about my experiments with AI tools, both successes and failures. If you're also exploring this space, I hope these posts are useful.

Next up: A deeper dive into Claude Code specifically and how it's changing my development workflow.

---

*P.S. - Yes, Claude Code helped me write and polish this post too. Meta? Absolutely. Useful? Definitely.*
