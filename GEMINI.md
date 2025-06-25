# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Structure

This is a Jekyll-based personal blog hosted on GitHub Pages. The blog contains technical posts covering topics like software architecture, programming languages (Go, Java, Clojure), distributed systems, and concurrent programming.

- `_posts/` - Blog posts in Markdown format with Jekyll front matter
- `_config.yml` - Jekyll configuration using the Minima theme
- `_site/` - Generated static site (built by Jekyll)
- `about.md` - About page
- `index.md` - Home page layout

## Setup Instructions

### Prerequisites
- Ruby 2.7.0+ (GitHub Pages uses 3.3.4)
- Check versions: `ruby -v`, `gem -v`, `gcc -v`, `make -v`

### First-Time Setup
```bash
# Update Bundler
gem update bundler

# Install dependencies (uses github-pages gem for compatibility)
bundle install

# For Ruby 3.0+, add webrick if needed
bundle add webrick
```

## Common Commands

### Local Development
```bash
# Serve locally with live reload (recommended - works better with network binding)
bundle exec jekyll serve --host=0.0.0.0 --port=3000 --detach

# Alternative serve commands (may have connectivity issues)
bundle exec jekyll serve
bundle exec jekyll serve --baseurl=""

# Stop detached server
pkill -f jekyll

# Build the site
bundle exec jekyll build

# Update to latest GitHub Pages compatible versions
bundle update github-pages
```

### Blog Post Management
- Posts must be in `_posts/` directory with filename format: `YYYY-MM-DD-title.markdown`
- Use `published: false` in front matter for drafts
- Images can be referenced directly in the same directory as the post

## Content Guidelines

### Front Matter Structure
```yaml
---
title: Post Title
published: true|false
description: Optional description
tags: #tag1 #tag2
layout: post
categories: #category1 #category2
date: YYYY-MM-DD HH:MM:SS +0000
---
```

### Jekyll/Liquid Syntax
- Use `{%raw%}{% highlight language %}{%endraw%}` blocks for code syntax highlighting
- Reference site variables with `{%raw%}{{ site.variable }}{%endraw%}`
- Images should be placed in the same directory as posts and referenced with relative paths

## Architecture Notes

- Uses Jekyll 3.8.x with Minima theme
- GitHub Pages compatible configuration
- No custom plugins beyond jekyll-feed
- Posts support embedded images (PNG format commonly used)
- Built-in support for code highlighting and mathematical content (some posts reference LaTeX)

## Confirming post availability 

When publishing a new blog post, follow these steps to verify it's properly accessible:

1. **Stop existing Jekyll processes**: Run `pkill -f jekyll` to ensure no conflicting servers
2. **Start Jekyll with timeout**: Run `timeout 5s bundle exec jekyll serve --host=0.0.0.0 --port=3000` to start server and let it initialize
3. **Verify HTML file exists**: Check that the post HTML file is generated in the `_site/` directory structure
4. **Test accessibility with curl**: Use curl to request the post URL and verify it returns proper HTML content
5. **Check response status**: Ensure curl returns 200 OK status, not 404 or errors

This process ensures the post is properly built, served, and accessible before considering the work complete.

## Web Research Guidelines

When conducting web searches for research or content gathering:

- **Always include source URLs**: Whenever making web searches, always include the specific URLs of sources in your responses unless explicitly asked not to
- **Provide proper citations**: Include links to articles, discussions, videos, and other content that inform your analysis
- **Distinguish sources from analysis**: Clearly separate quoted material from your own interpretive comments
- **Enable verification**: Source URLs allow users to verify information and explore topics further