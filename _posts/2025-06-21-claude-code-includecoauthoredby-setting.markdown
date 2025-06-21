---
title: "Customizing Claude Code Commit Authorship with includeCoAuthoredBy"
published: true
description: "How to control whether Claude's byline appears in your git commits and pull requests"
tags: #claude-code #git #configuration
layout: post
categories: #tools #development
date: 2025-06-21 08:00:00 +0000
---

When using Claude Code for development tasks, you might notice that git commits and pull requests automatically include a "Co-Authored-By: Claude" line. While this transparency about AI assistance can be valuable, there are scenarios where you might prefer cleaner commit messages without the co-authorship attribution.

## The includeCoAuthoredBy Setting

Claude Code includes an `includeCoAuthoredBy` setting that controls this behavior. By default, it's set to `true`, meaning all commits will include Claude's byline. Setting it to `false` removes this attribution entirely.


## Configuration

Add this setting to your `settings.json` file:

```json
{
  "includeCoAuthoredBy": false
}
```

The settings file is typically located at:
- **macOS/Linux**: `~/.config/claude-code/settings.json`
- **Windows**: `%APPDATA%\claude-code\settings.json`

## Considerations

While removing the co-authorship attribution gives you cleaner commits, consider whether transparency about AI assistance aligns with your project's collaboration standards. Some teams value knowing when AI tools contributed to code changes for review and maintenance purposes.

