---
layout: post
title:  "Software Architecture Fundamentals - 8 : Architecture Anti-patterns 1"
date:   2018-10-16 22:00:00 +0100
categories: anti-patterns
---

## Architecture Anti-patterns

More Anti-patterns than patterns

We repeatedly do that produces negative results

## Architecture by implication

Systems lacking clearly documented 

What architecture pattern are you using?

What client model is most appropriate?

Does the hardware or os matter?

How do you handle component integration?

What communication protocols will you used?

Is the solutions even feasible given the skills, budget and time?

How secure does the system need to be?

Does the system need to scale?

How much performance is needed from the system?

How available the system needs to be?

Maintainability?

Be careful about over-confidence

Remember that agile methodologies are not a substitute for creating an architecture.

## Covering your assets

Continuing to document and present alternatives without ever making an architecture decision

Architect has to present alternatives, clearly articulate the pros and cons of each, and recommend the best solution for the situation

## Witches brew / Design by committee

Architectures are designed by groups resulting in a complex mixture of ideas and lack of clear vision


## Gold plating

Continuing to define the architecture well past the point which the extra effort is adding any value

Too many details hide the core principles and standards

Commonly leads to the analysis paralysis anti-pattern 

increases costs, adds no value

No big-picture, difficult to understand

## Vendor king

product-dependent architecture 

Vendor app as a service, use message bus 


## Bing bang architecture

Defining at the beginning when we know little about the system

Architect only what is absolutely necessary. Let the architecture evolve

Don't forget req, business etc change - so must architecture

### Anti-Patterns 2

## Arm-chair Architecture

design not proven

ivory tower 

non-coding architects

not involved in full project lifecycle

stay current

peer programming

code reviews

don't release architecture decisions too early

be an integral part of the dev team


## Playing with new toys

Purpose?

RDA - Resume driven architecture/development

Proven? Be careful about being a pioneer.

Overlap? 

Feasibility?

## Spider web architecture

Large number of webservices that are not needed

let requirements drive


## Infinity architecture

Over-generalized and infinitely-flexible. Hard to change

Use domain-driven architectures to reduce scope

Business requirements, goals, directions, industry trends
{% highlight bash %}
; flexible but also means no contract
[component1] -> hashmap -> [component2]
{% endhighlight %}


## Groundhog day (Email driven architecture)

Critical decisions are not communicated, forgotten.

Same decision keeps getting discussed. Keeps questioning.

Keep important decisions in a wiki (it evolves)


## Stovepipe architecture

Ad-hoc collection of ideas

Lack of proper abstraction

Lack of an integration solution

Lack of architecture guidance

Difficult to change








