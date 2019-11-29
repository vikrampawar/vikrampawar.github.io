---
layout: post
title:  "Rest paper by Roy Fielding"
date:   2018-10-21 14:00:00 +0100
categories: rest
---


##  1. Software Architecture

`Runtime Abstraction` : A software architecture is an abstraction of the run-time elements of a software system during some phase of its operation. A system may be composed of many levels of abstraction and many phases of operation, each with its own software architecture.

`Architecture` is an abstraction of a view of a run-time system. Therefore a system may need many architectures organised in multiple levels.

Software structure (Implementation) refers to static software source code. This is independent of Software Architecture.

Architectural elements - components, connectors and data whose relations exhibit the behavior.

Rationale is not part of the architecture. Instead provide architectural properties.

For network-based architecture, the nature, location and movement of data elements within the system is often the single most significant determinant of the system behavior.

`Component` : A component is an abstract unit of software instructions and internal state that provides a transformation of data via its interface.

Example of transformation - Loading into memory from secondary storage, performing some calculation, translating to a different format, encapsulation with other data.

A component is defined by the interface and services it provides to other components.


`Connector` : A connector is an abstract mechanism that mediates communication, coordination , or cooperation among components.

E.g. Shared representations, Message passing protocol, RPC, and data streams

They enable communication by transferring data without changing it (transformation for transfer are ignored)

`Data` : A datum is an element of information that is transferred from a component, or received by a component, via a connector.

E.g. byte-sequences, messages, marshalled parameters, serialized objects

File is a transformation - 'file name' datum transformed to sequence of bytes recorded internally.

`Configuration`: A Configuration is the structure of architectural relationships among components, connectors, and data during a period of system run-time.


`Style` : An architectural style is a coordinated set of architectural constraints that restricts the roles/features of architectural elements and the allowed relationships among those elements within any architecture that conforms to that style.

A method of abstraction.


## 2. Network-based Application Architectures

Communication is restricted to message passing.

Different to distributed systems which appears as centralized system to users. NAA operates across network.

Different to Networking software. NAA is concerned with application software, concerned with user action, whereas Networking software is concerned with moving bits.

To evaluate the design of application application architectures, create a derivation tree of constraints, root being no constraint. The constraints result in the properties. Compare them with desired properties.

# Properties of key interest

__Network Performance__

_Throughput_ : rate at which information, including both application data and information overhead, is transferred between components. Overhead - can be initial setup or per-interaction.

_Bandwidth_ : Maximum available throughput over a given network link. Usable bandwidth is that which is actually available to the application.

Styles influence number of interactions per user action, and granularity of data elements.

__User-perceived Performance__

_Latency_ : is the time period between initial stimulus and the first indication of response.

Time is spent for the below. All affected by the chosen style. 
* application recognizes the event
* interaction between components
* transmit interaction
* process the interaction
* minimum transfer & process required before response

_Completion_ : time taken to complete action.

optimizing for latency degrades completion and vice-versa.

compressing improves completion, and it works efficiently when it can sample large chunks of data, but this will affect latency.

__Network Efficiency__

Improve by 

* Minimize using the network
* Reduce frequency - replicate data
* Move processing close to source (mobile code)



