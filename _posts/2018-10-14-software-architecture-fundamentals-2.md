---
layout: post
title:  "Software Architecture Fundamentals - 2"
date:   2018-10-14 16:40:00 +0100
categories: architecture
---

Notes from the Software Architecture Fundamentals a video series on Safari books online - continued.

**Continuous Delivery**

XP & TDD practices

Integrate once everyday

Early and often

*Continuous Integration* :

* Tests on commit. 
* Production readiness on code change.

*Continuous Deployment/Delivery*:

* Software always deployable. 
* Production readiness on configuration change.
* Reliable deployments
* Release on business needs


*Pre-requisites*

* Configuration management
* Automated testing
* Configuration Integration - deployment pipelines
* E2E in production like environments.


Deployments self-serviced

Pull vs Push systems

Pull - manual - Continuous delivery
Push - automated - Continuous deployment


Why => Responsiveness to business

Goal => Cycle time shorter

*Shorter time cycles leads to* : 

* What-if scenarios
* More releases which can be business differentiator

Engineering sophistication is required

*Production-like*
* Increases confidence in production readiness
* Environments become production-like.
* Faster feedback

Repeatable reliable process for releasing software

Provisioning boxes with devops

Deployments and database migrations

Try to automate everything.

Separate things that can be automated with those that cannot be.

Keep everything in version control

Developer machines images can be used - Puppet/Chef. Check [boxen][boxen]

If it hurts, do it more often.

Bring the pain forward

Everyone responsible for delivery - dev, dba, qa, ops


Check
[97 Things Every Architect Should Know][97]

[boxen]:https://github.com/boxen
[97]:https://www.amazon.co.uk/Things-Every-Software-Architect-Should/dp/059652269X