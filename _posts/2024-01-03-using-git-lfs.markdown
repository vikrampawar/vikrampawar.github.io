---
title:  Using Git Large File Storage (LFS)
published : true
description : 
tags: #git #lfs
layout: post
categories: #git #lfs
date:   2024-04-03 18:00:00 +0000
---

[Git LFS](https://git-lfs.com/) is an extension to git that allows us to track large files. It does this by storing the large files in a separate location and storing a pointer to the file in the git repository. This allows us to keep the git repository small and still be able to track large files.

To install it, we'll use [brew](https://brew.sh/) that's available for both Mac and Linux.

Install git lfs

```bash
brew install git-lfs
```

Check if a git repository has any git lfs files

```bash
git lfs ls-files
```


To see how to add a large file, let's initialize an empty git repository

```bash
git init test
cd test
```

Add a large file to the repository

```bash
cp ~/tmp/model.pkl test/

```

Track the file using git lfs

```bash
git lfs track "model.pkl"
```
This creates a file called `.gitattributes` that contains the following line

```bash
model.pkl filter=lfs diff=lfs merge=lfs -text
```

Then, you can add the files to git as usual `git add .`.
At this stage, you can check if the file is being tracked by git lfs using `git lfs ls-files`

```bash
❯ git lfs ls-files
e7d28f7f26 * model.pkl
```

