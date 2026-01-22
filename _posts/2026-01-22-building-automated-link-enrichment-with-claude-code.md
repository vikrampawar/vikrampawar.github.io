---
title: "Building an Automated Link Enrichment System with Claude Code"
published: true
layout: post
date: 2026-01-22 10:00:00 +0000
description: How I built a personal workflow that transforms bare URLs into rich, searchable knowledge base entries—using plain English instructions instead of code.
tags: #claude-code #automation #obsidian #productivity #ai
categories: #technology #ai
---

My daily notes are full of URLs. GitHub repos someone mentioned, articles to read later, tools to try. I paste the link, move on, and three weeks later I'm staring at `https://github.com/some-user/some-repo` with no memory of what it is or why I saved it.

I wanted something that would automatically capture what each link *is*—a title, a summary, a screenshot for visual recognition, relevant tags. Something that would turn throwaway URLs into proper searchable notes.

So I built it with Claude Code. And here's the interesting part: there's no code.

## The Vision

Before building anything, I sketched what I wanted:

1. A command I could run on any journal entry
2. Automatic detection of bare URLs (not already processed)
3. For each URL: visit the page, extract the title, generate a summary, take a screenshot, identify tags
4. Create a note in a `/Links` folder with structured metadata
5. Replace the bare URL in the journal with a wiki link

The end result transforms this in my journal:

```
https://github.com/steveyegge/gastown
```

Into this:

```
[[Gastown Multi-Agent Workspace Manager]]
```

With a full note containing everything I need to remember why I saved it.

## Plain English Instructions, Not Code

Claude Code supports custom "skills"—markdown files in `.claude/commands/` that define reusable workflows. When I type `/enrich-links`, Claude reads the skill file and follows the instructions.

Here's the key insight: the entire automation is just plain English in a markdown file. No Python, no JavaScript, no scripting language. I describe what I want, and Claude Code figures out how to do it.

The skill file looks something like this:

```markdown
# Enrich Links Command

Process a journal entry and create dedicated pages for each link.

## Instructions

1. Determine the journal file based on arguments
2. Find all bare URLs on their own lines
3. For each URL:
   - Navigate to the page using Playwright
   - Extract the title
   - Take a screenshot and save to /assets
   - Generate a 2-3 sentence summary
   - Extract relevant tags
   - Create a note in /Links with frontmatter
4. Replace each URL in the journal with a wiki link
5. Report what was processed
```

That's it. Claude Code handles the browser automation, file operations, and content generation. I just described what I wanted.

## How It Works Under the Hood

When I run `/enrich-links 2026-01-21`, here's what happens:

**Step 1: Parse the journal**

Claude reads the file, finds URLs on their own lines, filters out anything already processed.

**Step 2: Process each URL**

For each link, Claude:
- Navigates with Playwright (browser automation)
- Takes a snapshot to understand the page
- Captures a screenshot
- Generates a summary from the content
- Creates a note with structured frontmatter

**Step 3: Update the journal**

Each URL gets replaced with a wiki link to the new note.

Processing five links takes a couple of minutes. The browser automation is the slowest part—but it's fully automated, so I kick it off and do something else.

## Example Output

Here's what an enriched link note looks like:

```yaml
---
url: https://github.com/steveyegge/gastown
date_saved: 2026-01-21
tags:
  - github
  - multi-agent
  - ai
  - orchestration
source: github.com
---
```

```markdown
# Gastown - Multi-Agent Workspace Manager

Gastown is a multi-agent orchestration system that coordinates
multiple Claude Code agents working on different tasks. It maintains
persistent state through git-backed storage and uses a "Mayor" AI
coordinator to manage agent handoffs.

![[github-gastown.png]]

**Original URL**: https://github.com/steveyegge/gastown
**Saved from**: [[2026-01-21]] journal
```

Now when I search for "multi-agent" or "orchestration," this surfaces. The screenshot helps me visually recognise it. The backlink connects it to when I saved it.

## The Browsing Layer

I added an Obsidian Base view to browse all saved links:

```yaml
filters:
  and:
    - file.path.startsWith("Links/")
views:
  - type: table
    name: All Links
    order:
      - file.name
      - source
      - date_saved
      - tags
    sort:
      - property: date_saved
        direction: DESC
```

This gives me a sortable, filterable view of everything I've saved. I can filter by source domain, search by tags, or just browse chronologically.

## What I Learned

**Browser automation has quirks.** Playwright saves files to a sandbox directory, requiring a move command to get screenshots where you want them. Plan for these friction points.

**Frontmatter design matters.** I spent time thinking about what to capture: url, date_saved, tags, source. The `source` field is particularly useful for filtering—show me all my GitHub saves, all my articles.

**Skip logic prevents duplicates.** The instruction to skip already-processed URLs means I can run the command multiple times without creating duplicates.

**Screenshots add real value.** I was unsure if they were worth the overhead. They absolutely are. Visual recognition is powerful.

## The Bigger Picture

What struck me building this: I didn't write code, but I needed to think like a developer.

I had to understand file systems, browser automation, metadata structures, markdown syntax. The *implementation* is handled by Claude Code, but the *design* is mine.

This is a different skill than traditional programming, but it's still technical. You're describing systems, thinking about edge cases, designing data structures. You just don't have to translate that thinking into a programming language.

For technically-minded people who have friction points in their workflows, this is powerful. You identify a problem, describe what you want, and build exactly that—not limited to what some app decided to include as a feature.

The mental shift: stop looking for apps that have the feature you need. Start thinking about what you'd tell an assistant to do. If you can describe it clearly, you can probably build it.

---

*Built January 2026 using Claude Code with Playwright MCP and Obsidian.*
