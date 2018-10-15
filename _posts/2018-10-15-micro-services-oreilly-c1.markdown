---
layout: post
title:  "Microservices - Chapter 1"
date:   2018-10-15 22:15:00 +0100
categories: microservices 
---

Notes from Microservices - Oreilly, chapter 1


## What are microservices?

Domain driven design Eric evans

Continuous deployment

Hexagonal architecture Alistair Cockburn's 

Virtualization platforms

Small teams

Systems at scale

## Small and focussed on doing one thing well

Robert C Martin Single responsibility principle. Keep things that change for the same reason together and separate those things that change for different reasons.

Service boundaries align with business boundaries

How small?

## Autonomous

Communication between services via network calls.

Avoid tight coupling and allow separation of services

## Key benefits

# Technology heterogeneity

Netflix and Twitter use JVM

# Resilience

Service boundary becomes a bulkhead - problem is isolated it's not cascaded.

# Scaling

Scale only the required services - cost saving.

Gilt online fasion retailer embraces microservices.  


# Ease of deployment

Smaller change, easy identification of issues and rollback. 

# Organizational alignment

Smaller teams


# Composability

# Optimizing for Replaceability

Rewrite services. 

## What about Service-Oriented Architecture

SOA not practical

## Other decompositional techniques

# Shared libraries

No technological heterogeneity.

Different parts cannot be scaled.

Reduced ability to deploy in isolation.

# Modules

OSGI - Open source gateway initiative

Java doesn't have modules?!

Erland has modules 

Modular decomposition within process boundary doesn't happen in practice.






