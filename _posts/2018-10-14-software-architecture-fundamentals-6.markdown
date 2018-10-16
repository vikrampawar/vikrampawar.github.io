---
layout: post
title:  "Software Architecture Fundamentals - 6 : Architecture patterns 2"
date:   2018-10-14 22:11:00 +0100
categories: architecture
---

## Pipeline architecture pattern ##

a.k.a pipes and filter architecture

roots from OS


# pipes

Connects different filters and transfers data

{% highlight bash%}
pipe         filter         pipe
------> [ transformation] ------->
{%endhighlight%}

1. uni-directional only

2. usually  point-point for high performance, but could be message-based for scalability

3. payload can be any type (text, bytes, object)

useful for smaller deterministic systems with a distinct processing flow

filters can easily be added and removed

provides for high level of decoupling

supports evolutionary design

able to easily adapt to changing requirements

can easily be incorporated into another pattern


# filters

Receives data, does something on it and pushes it on to the next filter

self-contained and independent from other filters

perform one single very specific task

{% highlight bash%}
4 different filter types
             producer    -----pipe-------> starting point, outbound only
  --pipe-->  transformer -----pipe-------> input, processing, output     
  --pipe-->  tester      - - -pipe- - - -> input, discard or pass-thru
  --pipe-->  consumer                      ending point, inbound only       

example

[input reader(P)] --raw data--> [converter(Tr)] --xml data--> [reducer(Tr)]-- 
                                                                             |
                 [input processor(C)]<--validator(Te)-- [scoped xml data] <--


{%endhighlight%}


# pipeline vs event-driven 

pipeline 
* synchronous data filtering 
* single target
* simple single purpose filters

event-driven
* asynchronous event processing
* multiple targets for events
* complex multi-purpose processors

## Microkernel architecture


architectural components

**core system**
* minimal functionality to run the system
* general business rules and logic
* doesn't contain customer processing


**plugin module**

* standalone independent module
* specific additional rules or logic

Example: Eclipse

core : claims processing

plugins : CA, NY, GA etc


* useful for systems that have custom processing or processing is susceptible to change
* plug-in modules can easily be added and removed
* supports evolutionary design
* easily adapts to change in requirements

## Space based architecture

# Traditional scaling

![Scaling][scaling] 

# Space scaling

![Space][space]


# Processing Unit
![Processing Unit][processing-unit]

# Features

* it's all about variable scalability
* good for applications that have variable load or inconsistent peak times
* not a good fit for traditional large-scale relational database systems
* relatively complex and expensive pattern to implement


# Links

[ Wikipedia Space based architecture][4]

[Pipeline software][5]

[ EAI pipes and filters][6]





[scaling]: /assets/img/scaling.jpeg
[space]: /assets/img/space.jpeg
[processing-unit]: /assets/img/processing-unit.jpeg
[4]: https://en.wikipedia.org/wiki/Space-based_architecture
[5]: https://en.wikipedia.org/wiki/Pipeline_(software)
[6]: https://www.enterpriseintegrationpatterns.com/patterns/messaging/PipesAndFilters.html



