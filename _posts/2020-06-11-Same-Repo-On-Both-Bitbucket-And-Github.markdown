---
layout: post
title:  "Same Repo On Both Bitbucket And Github"
published : true
description : 
date:   2020-06-11 19:00:00 +0000
categories: #git #github #bitbucket
tags: #git #github #bitbucket
---

I used bitbucket as my main remote hub for some years now. The main reason was that we use bitbucket at work, so I was more familiar with it. The other reason of course was that I could host my private repositories there. Now Github also allows hosting of private repositories, so I wanted to add Github as another remote to my existing git repositories. Here is what I did.

First I checked what is the remote by using the below command.

```bash
# Shows remote
git remote -v show

### output
origin  https://Vikrampawar@bitbucket.org/Vikrampawar/javaprojects.git (fetch)
origin  https://Vikrampawar@bitbucket.org/Vikrampawar/javaprojects.git (push)

```

Then I looked at the git config in a text editor.

The config is in the file  `.git/config`. It has an entry as below

```bash
[remote "origin"]
	url = https://Vikrampawar@bitbucket.org/Vikrampawar/javaprojects.git
	fetch = +refs/heads/*:refs/remotes/origin/*
```

To set Github as another remote, I ran the below command.

```bash
git remote set-url origin --add git@github.com:vikrampawar/javaprojects.git

### output
origin  https://Vikrampawar@bitbucket.org/Vikrampawar/javaprojects.git (fetch)
origin  https://Vikrampawar@bitbucket.org/Vikrampawar/javaprojects.git (push)
origin  git@github.com:vikrampawar/javaprojects.git (push)

```

This added the remote to the config

```bash
[remote "origin"]
	url = https://Vikrampawar@bitbucket.org/Vikrampawar/javaprojects.git
	fetch = +refs/heads/*:refs/remotes/origin/*
	url = git@github.com:vikrampawar/javaprojects.git	
```

I had issues. So, I first created an empty project called 'javaprojects' on Github, and then I also changed the protocol to https instead of git.

```bash
git remote -v show
### output
origin  https://Vikrampawar@bitbucket.org/Vikrampawar/javaprojects.git (fetch)
origin  https://Vikrampawar@bitbucket.org/Vikrampawar/javaprojects.git (push)
origin  https://github.com/vikrampawar/javaprojects.git (push)
```

When I did a push, it worked. I have the repo on Github as well now.

This only works one way now. I can push changes to Github, but I can't pull from it. I'll do that setup later.
