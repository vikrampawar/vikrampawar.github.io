---
title: "Claude Code vs GitHub Copilot: A Week That Changed My Workflow"
published: true
description: "Why I switched from GitHub Copilot to Claude Code after just one week"
tags: #ai #coding #productivity #claude #copilot
layout: post
categories: #ai #tools
date: 2025-06-14 11:05:00 +0000
---

It's only been a week since I started using Claude Code, but I can already see it will be my main coding assistant for some time.

As someone who's had a GitHub Copilot subscription for most of its existence, this wasn't a decision I made lightly. I've invested considerable time learning to work with Copilot's agents, building my own documentation and memory systems, and developing workflows that maximized its effectiveness. But after just seven days with Claude Code, I'm convinced that command-line AI assistance represents a fundamental shift in how we should think about AI-powered development.

## The GitHub Copilot Foundation

Before diving into the comparison, let me establish my Copilot credentials. I've been using it since its early days, primarily in four ways:

- **Powerful autocomplete**: Though I had to explicitly stop it several times when it got in my way
- **Command generation**: Using comments to describe what I wanted, then pressing F1 to execute the suggested command—this worked remarkably well for complex CLI operations
- **Example code generation**: Writing comments and letting it fill in implementation details
- **Code chat**: Asking questions about code I was browsing

These uses genuinely saved me time, but I wouldn't say they made me definitively more productive. As a senior developer, I don't spend most of my time coding in familiar languages and frameworks where I need autocomplete assistance. When learning something new, Copilot often became a crutch that hindered deep learning.

## The Agentic Coding Experiment

When Copilot introduced agents, I was intrigued but skeptical. I'd read about agentic coding from Replit, Cursor, and others, but it seemed obvious these tools would only work when starting from scratch. They all struggled with existing large and complex codebases—something I confirmed when trying Replit on some of my projects.

However, my first substantial project with Copilot's agents changed my perspective. I used Claude 3.5 (through Copilot) to create a SpringBoot project based on an existing one. It wasn't particularly complicated work, but it would have taken me 2-3 days to get right. Instead, I completed it in half a day while simultaneously learning how to use agentic coding effectively.

More importantly, the documentation and tests were significantly better than what I would have normally produced. That experience blew my mind and opened my eyes to the potential of AI agents for real work.

## The Command Line Revelation

Despite being comfortable with the command line—knowing vi, using vi bindings, and appreciating its efficiency—I initially felt that having a coding assistant constrained to the terminal would be limiting. I was completely wrong.

Right from day one with Claude Code, I immediately understood why the command line is the best option for a coding assistant.

The command line is the most efficient way to get anything done, if you know the commands. Everything comes to you. You write commands and control what's produced based on your appetite for information. There's a level of programmatic control that's been refined over the last 30+ years by countless brilliant individuals.

Every important program is available as a command—even Git is fundamentally a command-line program. Now the assistant has access to all of this. It knows all the commands, so you don't have to remember any of them. You just need a vague idea of what's possible.

## The Speed Difference

The most immediately apparent difference between Claude Code and Copilot is speed. Claude is remarkably quick compared to Copilot, which frequently makes you wait for responses that feel painfully slow. With Copilot, I often found myself thinking, "I could do this myself faster than waiting for the agent."

This happens constantly with Copilot, but with Claude it's rare. Even when it does happen, I can press escape, tell Claude exactly what to do, and it executes quickly. This responsiveness fundamentally changes the interaction model—you're not fighting the tool's pace, you're collaborating at your own speed.

## Built-in Intelligence vs Manual Workarounds

Claude Code comes with features I was manually trying to create with Copilot agents:

- **Automatic documentation**: Claude documents what it's doing without being asked
- **Persistent memory**: It saves how it's working, what it created, and what it learned
- **Context awareness**: It understands the project structure and maintains state across sessions

With Copilot, I spent considerable time in the initial weeks building these capabilities:
- Making the agent document its actions
- Saving work progress and learnings as documents to serve as memory
- Saving and improving my prompts
- Creating batch scripts for tasks rather than direct execution

Reading about instruction files and other Copilot features a month later confirmed that much of this wasn't available out of the box when I started.

## The Killer Feature: Controlled Output

The most transformative aspect of Claude Code is that it controls what it shows you. You're not overwhelmed with information when you just want to see what it's doing. This seems simple, but it's revolutionary for maintaining focus and understanding.

In traditional IDEs or even with Copilot, you're constantly context-switching between different panes, files, and information sources. Claude brings everything to a single interface and presents exactly what you need, when you need it.

## Real-World Complexity Test

I've used Claude Code on some genuinely complex SpringBoot projects—ones using complicated PostGIS databases with custom routing queries. Despite running Claude Code in a VSCode terminal, I haven't needed to switch to the editor. I can tell it what I want, and it handles it quickly and accurately.

This is particularly impressive because these aren't toy projects or demos. They're production-grade applications with real complexity, legacy constraints, and intricate business logic.

## The Anthropic Advantage

Several factors work in Claude Code's favor beyond the technology itself:

- **Model expertise**: Anthropic created the underlying model, so they understand its capabilities intimately
- **Dogfooding**: They use it extensively themselves, ensuring real-world testing
- **Documentation quality**: Their docs are excellent, likely created using Claude itself
- **Minimalist philosophy**: Command-line interface means less code to write and test, fewer potential failure points

There's an inherent minimalism to Anthropic's approach that I appreciate—only two main models (Sonnet and Opus), command-line simplicity, minimal setup requirements. It's a "start small and discover yourself" philosophy that contrasts sharply with feature-heavy alternatives.

## The Subscription Model Difference

One often-overlooked factor is pricing psychology. Per-API costs make you think about optimization and cost reduction rather than getting work done efficiently. When I'm worried about each query's cost, I hesitate to explore, experiment, or ask clarifying questions.

Claude Code's monthly subscription model (starting at around £15) removes this mental friction. I can focus on productivity rather than cost optimization, which paradoxically makes the tool more valuable despite potentially higher overall costs.

## What This Means Going Forward

After extensive use of both tools, I believe any coding agent that wants to compete seriously needs to be command-line based. The interface advantages are simply too significant to overcome with GUI-based alternatives.

This doesn't mean Claude Code is perfect—no tool is. But it represents a more mature understanding of how humans and AI should collaborate on code. It's not trying to replace the developer; it's trying to amplify the developer's capabilities through the most efficient interface we have.

The question isn't whether AI will change how we code—it already has. The question is which interaction models will prove most effective for real, complex, long-term development work. Based on this first week, I believe Claude Code points toward that future.

Over the coming weeks, I'll be using it extensively on personal projects and documenting the journey. But even now, I'm confident this represents a significant step forward in AI-assisted development.

---

*This is the first in a series of posts about AI coding assistants. Next up: why the command line is the perfect interface for AI development tools.*