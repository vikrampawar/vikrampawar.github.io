---
layout: post
title:  "Software Architecture Fundamentals - 10 : Integration Architecture"
date:   2018-10-21 09:00:00 +0100
categories: Integration
---

## Integration Architecture

Mainframe applications 

* closed
* didn't scale
* high-availability
* no integration required

Now, heterogeneous systems - require integration 

3 type apps

Open internal app

Closed internal apps

Closed external app


# Challenges

Slow method invocations

Remote system unavailable

Remote contract changes - versioning is one solution

Remote connections secure?

Four Integration styles

## 1. File Transfer 

* Shared directory, easy, 
* Expensive, error processing, timeliness, data synch, data-only transfer
 
## 2. Shared database

 * universal via sql, system decoupled, system abstraction , but db coupled.
 * can't use persistent caching, perf issues, coupled forever
 * schema can't be changed
 * ORMs don't work with shared database. ORM is a cache. So can't assume cache is current.
 * change slow
 * Book Refactoring databases

 Move column refactoring
 1. transistion period
 2. same column on both tables
 3. then remove

## 3. Remote procedure

Pros
* Data encapsulation 
* Webservices
Cons
* systems coupled
* poor async

Current - SOAP and REST

# Richardson's restful levels of maturity

# Level 0  RPC Architectural Style
 
Single URI and single HTTP verb

* semantics in XML
* HTTP meta-data ignored
* lightweight
* Not robust

# Level 1 URI Tunneling

Many URIs , single HTTP verb

URI determines the the service, params etc.

URI encode operations, rather than identify operations

# Level 2 CRUD web services

Numerous URI addressable resources


# Level 3

URI And verb

HATEOAS


Rest in Practice book

Aligning resource state
 * state conflicts inevitable
 * entity tags (ETags) - token to uniquely identify state
 * if-match (ETag) before update

CRUD Services
 * HTTP and URI
 * reliable, robust, and easy to implement

 tightly couple, shared, 

 Microservice , REST style 


## 4. Messaging

Too brief







