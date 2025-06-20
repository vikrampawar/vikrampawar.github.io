---
title: "Streamlining Blog Creation with Custom Claude Code Commands"
published: true
description: "How I built a simple workflow to transform ideas into blog posts using Claude Code's custom slash commands"
tags: #claude-code #blogging #automation #workflow
layout: post
categories: #productivity #tools
date: 2025-06-20 10:00:00 +0000
---

# Streamlining Blog Creation with Custom Claude Code Commands

I've been using Claude Code extensively for writing blog posts, and I've discovered something quite useful: you can save prompts with placeholders that are easily accessed through slash commands. This has transformed how I approach content creation.

## My Current Workflow

The process I'm using now is surprisingly simple and effective:

1. **Capture ideas quickly** - I jot down thoughts with just enough words that I'm confident would make sense to Claude Code
2. **Transform to content** - I ask Claude Code to read the document and create a blog post
3. **Refine and publish** - The AI handles the heavy lifting of structure and flow

What makes this powerful is that I don't need to worry about perfect formatting or complete sentences in my initial notes. I can focus on capturing the essence of an idea, knowing that Claude Code will help me develop it into a coherent post.

## Building a Custom Command

I decided to formalize this workflow by creating a custom command called `create-a-blog-post-from <arguments>`. This lets me use it as a slash command directly in Claude Code, making the process even more streamlined.

The beauty of this approach is that it turns an informal workflow into a repeatable process. Instead of typing out the same instructions each time, I can simply use the slash command and let the system handle the transformation.

## How to Create Custom Slash Commands

Creating custom slash commands in Claude Code is straightforward. You store commands as Markdown files in specific directories, and Claude Code automatically makes them available as slash commands.

### Command Types and Locations

There are two types of custom commands:

**Project Commands** - Specific to your current project:
- Location: `.claude/commands/` in your project root
- Prefix: `/project:`
- Shared with anyone working on the project

**Personal Commands** - Available across all your projects:
- Location: `~/.claude/commands/` in your home directory  
- Prefix: `/user:`
- Personal to your setup

### Creating the Blog Post Command

Here's how I created my `create-a-blog-post-from` command:

1. **Create the commands directory:**
```bash
mkdir -p ~/.claude/commands
```

2. **Create the command file:**
```bash
touch ~/.claude/commands/create-a-blog-post-from.md
```

3. **Add the command content:**
   
```
# Blog Post Generation Command

Transform the content from $ARGUMENTS into a well-structured blog post that:

1. Adheres to the writing style specified in VIKRAM_WRITING_STYLE_ANALYSIS.md
2. Maintains the core information and insights from the source material
3. Uses appropriate headings, formatting, and structure for web readability

## Output Format
- Include a compelling title and introduction
- Format with clear section headers where appropriate
- Add a brief conclusion or call-to-action

## Appendix Requirements
Add an appendix with all the user prompts in sequence. Start with the original source text from $ARGUMENTS.
```

### Using the Command

Once created, I can use it in Claude Code like this:
```
/user:create-a-blog-post-from @filename.md
```

The `$ARGUMENTS` placeholder gets replaced with whatever I pass to the command - in this case, the reference to my source file.


### Command Organization

You can organize commands in subdirectories for better structure:


~/.claude/commands/
├── blog/
│   ├── create-post.md
│   └── edit-post.md
├── code/
│   ├── review.md
│   └── optimize.md
└── writing/
    └── summarize.md


This creates namespaced commands like `/user:blog:create-post` and `/user:code:review`.

The key is to start with workflows you're already using and then formalize them into commands. This way, you're building on proven patterns rather than creating something entirely new.

## Why This Matters

This approach does more than save time - it changes how I think about content creation. When I know I have a reliable way to transform rough ideas into polished posts, I'm more likely to capture thoughts as they occur. The friction between idea and execution becomes nearly zero.

I'm finding that this workflow works particularly well for technical topics where the core insights are clear but the presentation needs work. Claude Code excels at taking technical concepts and making them accessible while maintaining accuracy.

## Next Steps

I'm planning to expand this approach to other types of content creation. The same principle - capture ideas quickly, then use AI to develop them - could work for documentation, email templates, or project planning.

If you're using Claude Code regularly, I'd encourage you to look for patterns in your prompts. Chances are, there are workflows you could formalize into custom commands, making your interaction with AI more efficient and consistent.

---

## Appendix: Original Source Material

### User Prompts in Sequence

**Original source text from user-slash-commands.md:**

```
it's quite easy to save prompts along with placeholders that are easily accessed from Claude Code using slash commands.

For example I'm currently using claude code a lot to write blog posts.

I'm using a simple workflow now.

I jot down ideas with just enough words that I'm sure would make sense to claude code.

Then ask cc to read the document and create a blog post.

I'll implement it using  this feature.

creating a command called create-a-blog-post-from <arguments>

Then in claude I can use it as a slash command  

explain how to setup a command
```

**Command used:**
```
/create-a-blog-post-from @user-slash-commands.md
```

**Command definition:**
```
# Blog Post Generation Command

Transform the content from %ARGUMENTS into a well-structured blog post that:

1. Adheres to the writing style specified in VIKRAM_WRITING_STYLE_ANALYSIS.md
2. Maintains the core information and insights from the source material
3. Uses appropriate headings, formatting, and structure for web readability

## Output Format
- Include a compelling title and introduction
- Format with clear section headers where appropriate
- Add a brief conclusion or call-to-action

## Appendix Requirements

Add an appendix with all the user prompts in sequence. Start with the original source text from %ARGUMENTS.
```