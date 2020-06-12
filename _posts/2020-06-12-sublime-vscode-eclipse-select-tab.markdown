---
title:  Select any open tab in Sublime, VS Code, and Eclipse with ease
published : true
description : 
tags: #sublime #vscode #eclipse #tab
layout: post
date:   2020-06-12 18:00:00 +0000
categories: #sublime #vscode #eclipse #tab
---

When working in text editors and IDEs, it's natural to have several tabs open. To work efficiently with the tabs, it is good to be acquainted with the commands we can use to quickly move between the tabs.

I use Eclipse extensively as I do development in Java and IBM ESQL. I have been using Sublime for quite some time, and I've recently started using VS Code. The first thing I did was to opt for Sublime key-bindings in VS Code. So the actual key-bindings of the commands I mention below may be different.

Now coming to the topic of the post, first and basic way to work with tabs is to be able to cycle between the tabs.

In Eclipse, I can cycle between the open tabs using `cntrl-F6`. In Sublime (and VS Code), I can use `ctrl-tab` and `ctrl-shift-tab`.

The next level up would be to get a list of all the open tabs and select the one I want. In Eclipse, I can press `ctrl-e` to get a list of open tabs and then I can type a few characters to filter the list, and select the tab I want.

Today, I discovered that I can use the same key combination `ctrl-e` in Sublime and it works exactly as in Eclipse. 

So, I suddenly began missing this in Sublime :). I searched and found this helpful [Stack Overflow link](https://stackoverflow.com/questions/38561302/is-there-a-shortcut-for-sublime-text-to-find-an-open-file-eclipse-ctrl-e). I implemented the suggestion and now I can use `ctrl-e` in Sublime as well and do the same thing.

Only thing is that `ctrl-e` in Sublime actually does something called `slurp_find_string` which basically selects the word under cursor as the string to search for in a find command. I won't be able to use it now unless I map it to a new key. I resist using new key combinations.  I never really use this command in that much in Sublime. So, I'll leave it for now. I remember that I used to like a similar feature in Vim, where I could press '*' and the cursor moves to next occurrence of the word under cursor.

Sometimes using a new tool teaches us something that makes us look at familiar tools in a new light. So, although I know that all editors more or less do the same thing, I still play around with new ones to learn new things.






