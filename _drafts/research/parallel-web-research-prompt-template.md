# Parallel Web Research Prompt Template

This document contains the exact prompts used to conduct comprehensive web research using multiple parallel agents. Use these templates for future research projects by replacing the `$ARGUMENTS` placeholders with your specific research topic.

## Usage Instructions

1. Replace `$TOPIC` with your research subject (e.g., "Claude Code", "React 19", "Docker alternatives")
2. Replace `$PLATFORM_SPECIFIC_FOCUS` with relevant areas for each platform
3. Run all four agents simultaneously using separate Task tool calls
4. Compile results into a comprehensive document

---

## Agent 1: YouTube Research Prompt

```
Search YouTube for discussions, reviews, and tutorials about $TOPIC. Focus on:
1. User experience reviews and testimonials
2. Comparisons with other $PLATFORM_SPECIFIC_FOCUS
3. Technical demonstrations and workflows
4. Professional developer opinions

CRITICAL REQUIREMENTS:
- Always include the exact URLs of videos, channels, and sources in your findings
- Use proper quotation marks for any direct quotes from video titles, descriptions, or comments
- Distinguish between quoted material and your analysis (mark your analysis clearly)
- Provide specific video URLs, channel names, and publication dates when available
- Focus on unique insights not already covered in previous research

Return your findings with:
- Source URLs for each piece of information
- Proper attribution to video creators/channels
- Clear distinction between quoted content and analysis
- Organized by theme or topic for easy reading
```

## Agent 2: Hacker News Research Prompt

```
Search Hacker News for discussions, comments, and posts about $TOPIC. Focus on:
1. Technical analyses and comparisons
2. User experiences and practical applications
3. Cost discussions and value propositions
4. Integration with development workflows
5. Community best practices and tips

CRITICAL REQUIREMENTS:
- Always include specific Hacker News URLs for posts and comment threads
- Use proper quotation marks for any direct quotes from posts or comments
- Include usernames when quoting comments (if available)
- Provide post titles, dates, and comment scores when available
- Distinguish between quoted material and your analysis (mark your analysis clearly)
- Focus on technical depth and community insights

Return your findings with:
- Direct links to HN posts and comment threads
- Proper attribution to usernames and post authors
- Clear distinction between quoted content and analysis
- Organized by topic with source URLs for each section
```

## Agent 3: Reddit Research Prompt

```
Search Reddit across programming-related subreddits for $TOPIC discussions. Focus on:
1. Real-world usage experiences and case studies
2. Workflow integration and productivity impacts
3. Comparisons with competing tools
4. Community tips, tricks, and best practices
5. Critical feedback and limitations

CRITICAL REQUIREMENTS:
- Always include specific Reddit URLs for posts and comment threads
- Use proper quotation marks for any direct quotes from posts or comments
- Include subreddit names and usernames when quoting
- Provide post titles, scores, and dates when available
- Distinguish between quoted material and your analysis (mark your analysis clearly)
- Search across relevant subreddits: r/programming, r/MachineLearning, r/webdev, r/Python, r/javascript, etc.

Return your findings with:
- Direct Reddit links to posts and comment threads
- Proper attribution including subreddit and username
- Clear distinction between quoted content and analysis
- Organized by subreddit or topic with source URLs
```

## Agent 4: Technical Blogs Research Prompt

```
Search for technical blog posts, articles, and in-depth analyses about $TOPIC from developer blogs, tech publications, and company engineering blogs. Focus on:
1. Detailed technical reviews and analyses
2. Integration guides and best practices
3. Performance comparisons and benchmarks
4. Professional adoption stories and case studies
5. Architecture discussions and technical deep-dives

CRITICAL REQUIREMENTS:
- Always include specific URLs to blog posts and articles
- Use proper quotation marks for any direct quotes from articles
- Include author names, publication names, and dates when available
- Distinguish between quoted material and your analysis (mark your analysis clearly)
- Focus on authoritative sources and technical depth
- Look for content from established tech blogs, company engineering blogs, and recognized developers

Return your findings with:
- Direct URLs to articles and blog posts
- Proper attribution including author and publication
- Clear distinction between quoted content and analysis
- Organized by source type or topic with full citations
```

---

## Implementation Example

To use these prompts, create four simultaneous Task tool calls:

```
Task 1: YouTube Research
Description: "YouTube $TOPIC research"
Prompt: [YouTube Research Prompt with $TOPIC replaced]

Task 2: Hacker News Research  
Description: "Hacker News $TOPIC research"
Prompt: [Hacker News Research Prompt with $TOPIC replaced]

Task 3: Reddit Research
Description: "Reddit $TOPIC research" 
Prompt: [Reddit Research Prompt with $TOPIC replaced]

Task 4: Technical Blogs Research
Description: "Technical blogs $TOPIC research"
Prompt: [Technical Blogs Research Prompt with $TOPIC replaced]
```

## Document Compilation Template

After gathering results from all four agents, compile them using this structure:

```markdown
# $TOPIC: Comprehensive Research Analysis [YEAR]

*Research conducted using parallel web search agents across multiple platforms*

**Important Note**: This document contains findings from extensive web searches conducted across YouTube, Hacker News, Reddit, and technical blogs. All quotes are properly attributed with source URLs. Analysis sections are clearly marked to distinguish between quoted content and interpretive comments.

## Executive Summary
[Brief overview of key findings]

## YouTube and Video Content Analysis
[Compile YouTube agent results here]

## Hacker News Technical Community Analysis  
[Compile Hacker News agent results here]

## Reddit and Developer Community Insights
[Compile Reddit agent results here]

## Technical Blogs and Professional Analysis
[Compile Technical Blogs agent results here]

## Key Insights and Conclusions
[Your analysis and synthesis of all findings]

## Research Methodology
[Document your approach and any limitations]
```

## Quality Checklist

Before finalizing research, ensure:

- [ ] All quotes have proper attribution and URLs
- [ ] Analysis sections are clearly marked as interpretive
- [ ] No information is repeated across sections
- [ ] Sources are diverse and authoritative
- [ ] URLs are functional and accurate
- [ ] Content is organized logically by platform and topic
- [ ] Executive summary captures key insights
- [ ] Methodology section explains approach and limitations

---

## Notes

- **Timing**: Run all four agents simultaneously for maximum efficiency
- **Customization**: Adjust focus areas based on your specific research needs
- **Follow-up**: Consider additional specialized searches if initial results reveal gaps
- **Verification**: Spot-check URLs and quotes for accuracy before publication
- **Updates**: Research reflects point-in-time community sentiment; consider refresh frequency for evolving topics