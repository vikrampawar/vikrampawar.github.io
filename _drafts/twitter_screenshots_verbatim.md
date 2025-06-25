# Twitter Screenshots - Verbatim Text Extraction

## Screenshot 1:

**Tweet thread by Pawar:**

**Tweet 1:**
"2. Get context on how components interact
> how do these authentication calls work

3. Understand the execution flow
> let's go from front-end to database

Tips:
• Be specific about what you're looking for
• Use descriptive language from the codebase"

**Tweet 2:**
"I'd probably try 'I'm new to this project, what all should I ask to get a good understanding of this project'"

**Understand new codebases**
"Suppose you've just joined a new project and need to understand its structure quickly.

1. Navigate to the project root directory
   cd /path/to/project

2. Start Claude Code
   claude

3. Ask for a high-level overview"

**Tweet 3:**
"That is the tool that spawns the sub agents!"

Shows a screenshot of Claude Code settings page:

**Tools available to Claude**
"Claude Code has access to a set of powerful tools that help it understand and modify your codebase:

- Tool (shows descriptions for each tool including permissions)
- Agent: Launch a sub-agent for specific searches, executable requested: Yes
- Bash: Commands/scripts on environment: Yes  
- Edit: Makes targeted edits to specific files: Yes
- Glob: Finds files based on pattern matching: No"

**Tweet 4:**
"Good to know. The default is 'true'. No wonder it's difficult to get rid of using prompts or saving instructions in CLAUDE.md 😅"

Shows settings with environment variables and permissions, including "includeInstructions: false"

**Settings precedence**
"Settings are applied in order of precedence:"

## Screenshot 2:

**Tweet 1:**
"Using Git work trees it's possible to let many Claude code instances work in parallel on the same code base. We could even be working one manually.

git worktree remove --/project-foo"

**Tips:**
"• Each worktree has its own independent file state, making it perfect for parallel Claude Code sessions
• Changes made in one worktree won't affect where, preventing clashes instances from interfering with each other
• You can switch between them via Git history and remote connections
• For multiple builds, you can have Claude working in one workspace while you continue development in another
• Use descriptive directory names to easily identify which task each worktree is for
• Remember to initialize your development environment in each new worktree according to your project's setup"

**Tweet 2:**
"Just having 'think' anywhere in the prompt triggers this, in both Sonnet and Haiku"

Shows "Extended thinking" section with:
"• Debugging intricate issues
• Creating implementation plans for new features
• Understanding complex codebases
• Evaluating tradeoffs between different approaches

The way you prompt for thinking results is simple. Simply include phrases like:
• 'think' triggers basic extended thinking
• Intensifying phrases such as 'think more', 'think a lot', 'think harder', or 'think longer' triggers deeper thinking

For more information on prompting tips, see Extended thinking tips.

🔵 Claude will display its thinking process so make sure you share the response"

**Tweet 3:**
"Feels weird to copy paste images onto the terminal, but it works well.

Suppose you need to work with images in your codebase, and you want Claude's help analyzing image content.

Add an image to the conversation

You can use any of these methods:

1. Drag and drop an image into the Claude Code window
2. Copy an image and paste it into the CLI with ctrl+v (cmd+v on macOS)
3. Provide an image path claude, e.g., 'Analyze this image: /path/to/your/image.png'

3. Ask Claude to analyze the image"

**Tweet 4:**
"It amazingly assumes you are working with GitHub, but can work with Azure DevOps using both command line as well as MCP

Create pull requests

Once you need to create a well-documented pull request for your changes:

1. Summarize your changes
   > summarize the changes I've made

2. Generate a PR with Claude
   > create a pr"