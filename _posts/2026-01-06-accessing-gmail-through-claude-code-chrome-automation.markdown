---
title: Accessing Gmail Through Claude Code with Chrome Automation
published: true
description: How to use Claude Code's browser automation to access Gmail via claude.ai, creating a connector-free workflow for email summarization
tags: #claude-code #chrome-automation #gmail #productivity
layout: post
categories: #productivity #ai-tools
date: 2026-01-06 19:00:00 +0000
---

I've been looking for ways to integrate Gmail with Claude Code without introducing new connectors or complex integrations. Today I discovered a surprisingly elegant solution: using Claude Code's Chrome automation to control claude.ai, which already has Gmail integration.

## The Problem

My typical workflow involves:
1. Using claude.ai to search and summarize emails into markdown files
2. Downloading those markdown files
3. Using Claude Code skills that consume those markdown files

The first part required switching to the browser and manually interacting with claude.ai. I wanted to automate this entirely from Claude Code.

## The Solution

Claude Code has access to Chrome browser automation tools (`mcp__claude-in-chrome__*`) that can control browser tabs. Since claude.ai already has Gmail integration built-in, we can leverage this without building any new connectors.

## How It Works

### Step 1: Navigate to claude.ai

Claude Code creates a new browser tab and navigates to claude.ai:

```
Navigate to https://claude.ai
```

### Step 2: Enter the prompt

Claude Code types a prompt into the chat interface requesting email extraction:

```
from my gmail find the last 5 emails from product-sense@shreyasdoshi.com
and create a markdown file. Download it.
```

### Step 3: Wait for processing

Claude.ai searches Gmail, reads the threads, and creates a comprehensive markdown artifact containing all the email content.

### Step 4: Download the artifact

Using the Copy dropdown menu, Claude Code clicks "Download" to save the markdown file to `~/Downloads`.

### Step 5: Read and summarize

Back in Claude Code, we read the downloaded file and create a summary.

## Real Example

I tested this with emails from Shreyas Doshi's Product Sense newsletter. Here's what the automated process extracted:

**5 emails** spanning December 12, 2025 to January 6, 2026, all about his World-class Product Sense course:

- **Course Details:** 8-day intensive on product sense, strategy, and creativity
- **Pricing:** $2,500 (rising to $3,000 in 2026), with 20% discount code available
- **Next Cohorts:** January 24 - February 1, 2026 and March 7 - 14, 2026
- **Audience:** Senior PMs, engineers, designers, data scientists, startup founders
- **Key Themes:** Product creativity, motivation theory, "training your LLM" with quality content

The downloaded markdown file included full email headers, complete content, and even student testimonials from the course.

## Trade-offs

**Pros:**
- No new connectors or integrations needed
- Uses existing claude.ai Gmail integration
- Creates properly formatted markdown files
- Works entirely within Claude Code

**Cons:**
- Slower than direct API integration
- Requires browser to be available
- Dependent on claude.ai interface remaining stable

## When to Use This

This approach is ideal when:
- You occasionally need to pull email content into your Claude Code workflow
- You don't want to set up OAuth flows or API credentials
- You need the flexibility of natural language queries for email search
- You're already using claude.ai and want to bridge it with Claude Code

## The Bigger Picture

This pattern extends beyond Gmail. Any service that claude.ai can access through its integrations (Google Drive, Calendar, etc.) becomes accessible to Claude Code through this browser automation approach.

It's not the fastest solution, but it's remarkably flexible and requires zero additional setup beyond having the Chrome automation tools configured.

---

*This workflow was tested and documented entirely using Claude Code's browser automation capabilities.*
