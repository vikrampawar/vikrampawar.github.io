---
layout: post
title:  "Go Proberbs"
date:   2019-12-01 10:00:50 +0000
categories: Go proverbs
---

*Don't communicate by sharing memory, share memory by communicating.*

If you send an object onto a channel and don't have a pointer, there is no way of changing it, making it possible to use it safely by concurrent goroutines. 


*Concurrency is not parallelism.*

Concurrency is structuring your programs as independent executable parts whereas parallelism is the actual execution of multiple goroutines in parallel.


*Channels orchestrate; mutexes serialize* 

*The bigger the interface, the weaker the abstraction*

*Make the zero value useful*

*interface{} says nothing*

Carries no information

*Gofmt's style is no one's favorite, yet gofmt is everyone's favorite*

*Little copying is better than a little dependency*

An example strconv and unicode packages have a a piece of duplicated code. This is alight to keep them independent. To ensure that these two do the same thing, the testing ensures they both work the same way.

*Sycall must always be guarded with build tags*

*Cgo must always be guarded with build tags*

*Cgo is not Go*

*With unsafe package there are no guarantees*

*Clear is better than clever*

*Reflect is never clear*

*Errors are values*

*Don't check errors, handle them gracefully*

*Design the architecture, name the components, document the details*

*Documentation is for users*

Why is it for rather than what it does



