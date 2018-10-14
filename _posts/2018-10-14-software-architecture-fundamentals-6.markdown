---
layout: post
title:  "Software Architecture Fundamentals - 6 : Architecture patterns 2"
date:   2018-10-14 22:11:00 +0100
categories: architecture
---

# Pipeline architecture pattern #

a.k.a pipes and filter architecture

roots from OS


**pipes**

Connects different filters and transfers data

{% highlight bash%}
pipe         filter         pipe
------> [ transformation] ------->
{%endhighlight%}

1. uni-directional only

2. usually  point-point for high performance, but could be message-based for scalability

3. payload can be any type (text, bytes, object)

**filters**

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



