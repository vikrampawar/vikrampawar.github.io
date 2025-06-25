---
layout: post
title:  "Software Architecture Fundamentals - 9 : Tooling and Documentation"
date:   2018-10-21 09:00:00 +0100
categories: anti-patterns
---

## Tooling and Documentation

Pick tools and practices


Feature branching - merge branching problem

Continuous Integration - features show up when needed

Can't separate process from architecture

Tools offer a primrose path - 

Composable (Bash, Rake, Gant, emacs, vi, gradle)

* less implicit behaviour
* better building blocks
* greater eventual power
* less initial power
* more flexibility

Contexual (PowerShell, Ant, Maven, eclipse, visual studio,)

* More "out of the box"
* better contexual integlligence
* less flexibility
* less ability to evolve

Dietlzer's law

Users always want 100% of what they want

What user wants, what a contextual tool gives

80% Easy
10% Difficult
10% Impossible

Once you start fighting, tool is never good again

Pick the best tool for the job & the lifecycle station

Revaluate when friction appears

Build anti-corruption layers


## Documentation

UML distilled - Martin Fowler - 

UML Goldilocks problem - Too technical for business, not technical enough for tech people

Model Driven Architecture - Dead on Arrival 

Infinite regress problem with documentation

Who is it for?

Effort vs benefit.

Fungible/Malleable

Always (potentially) out of date

# Building an API

Java-doc level documentation at the end of project - refactoring

Emergent design

Ceremony vs essence

Whiteboard drawing - ipad + note + evernote

Update timestamp of the document to show it's current

{% highlight bash %}
docs -> current
  \
   + -> archeology
{% endhighlight %}

Architecture views vs one diagram trying to capture everything







