---
layout: post
title:  "Software Architecture Fundamentals - 5 : Architecture patterns"
date:   2018-10-14 17:58:00 +0100
categories: architecture
---

Notes from the Software Architecture Fundamentals a video series on Safari books online - continued.

History of Patterns movement

[Design patterns in Architecture Book][book] by Christopher Alexander 1977

GoF book 1984


**Traditional layered architecture**

Presentation Layer
Business Layer
Persistence Layer
Database Layer

Layers are closed. 

Go from one layer to another.

Information flows down. Never up.

Separation of concerns. 

Layers of isolation

Database can  be changed from DB2 or Oracle. First two layers won't change.

Persistence Layer changes, it does not affect other layers.

Active record mixes Persistence and Business layers.

Architecture sinkhole. Too many layers of abstraction.

Variations and hybrids, services layer comes between Business and Persistence layers. It is open, it can go direct to Database layer.

presentation to managed bean -> business object -> 

Good general purpose architecture - particularly with J2EE

Easy to implement, test and govern

Good starting point for most systems

Not suitable for a Trading application 


**Event-driven architecture - EDA/SEDA**

{% highlight bash %}
 Event->process->process->process
          \
           ->process->process <- event
                          \
                           ->process

{% endhighlight %}

3 types of topology

*Event processor topology*


{% highlight bash %}
# Kicked off by event, and then mediated by Event processor
# Asynchronous IBM message flow follows this pattern
Event -> Event queue -> Event processor -> Event topic -> process
                              \
                               -> Event topic -> process 
                                         \
                                          -> process
{% endhighlight %}

Allows orchestration, mediation, transformation


*Broker topology*


{% highlight bash %}
# Kicked off by Event, there's no event queue or event processor/mediator
# IBM Publish Subscribe follows this pattern
Event  -> Event topic(on message broker) -> process
                                              \
                                               -> Event topic -> process 
                                                     \
                                                      -> process
{% endhighlight %}


*Brokerless topology*

{% highlight bash %}
# No broker, more complicated, process need to know which processes 
# they need to communicate with
Event  ->  process -> process
                \
                 -> process <- Event
                        \
                         -> process
{% endhighlight %}

*Example*

{% highlight bash %}
# One way fire and forget

(motorist address change event) 
---> [Customer processor] 
         \
          --(address change)--> [quote process] -------(recal quote)-------> [notification process]
                           \                                            /
                            --> [claims process] --(claims update)------ 
                                                                        \
                                                                         -->  [adjustment process]       


{% endhighlight %}

Fire and forget

Highly decoupled and distributed

Highly scalable

High degree of complexity

Good for event-based business models and business processes

Not good for processes which require high degree of data sharing, orchestration, and reuse

**Service-oriented architecture**


{% highlight bash %}
business services BS1 BS2 BS3  ..

message bus
   process chreographer
   service orchestrator

enterprise service ES1 ES2 ES3..
application services AS1  ---> infrastructure services IS1
{% endhighlight %}

*business services template*

{% highlight bash %}
type 		: abstract
owner 		: business users
granularity : course-grained
scope 		: enterprise-level
notes 		: contains names
{% endhighlight %}

Placing an order, a trade.
Abstract, not linked to any tech - BPEL, WSDL, XML 

*enterprise services template*

{% highlight bash %}
type 		: concrete
owner 		: architect / shared services team
granularity : course-grained
scope 		: enterprise-level
notes 		: custom or vendor implementation
			  one-to-one or many-to-one relationship with BS
{% endhighlight %}

CreateCustomer
CalculateQuote

Granularity is the hard part			  

*application services template*

{% highlight bash %}
type 		: concrete
owner 		: application development team
granularity : fine-grained
scope 		: application-level
notes 		: 
{% endhighlight %}

addDriver
addVehicle
getInventoryCount

*infrastructure services template*

{% highlight bash %}
type 		: concrete
owner 		: application development team
granularity : fine-grained
scope 		: enterprise-level
notes 		: supports application and enterprise service
			  non business functionality
{% endhighlight %}

writeAuditLog
checkUserAccess
writeErrorLog
singleSignon


*message bus*

process choreography

service orientation

service registry

protocol transformation

message enhancement

message transformation			 

*example*

{% highlight bash %}

BS           CreateQuote
                |
MB          [ message bus ]
            /          \
ES   Create Customer   Calc Quote
         /      \           \
AS  AddDriver AddVehicle    CheckDrivingRecord
           \     \          / 
IS           WriteAuditTrail
{% endhighlight %}


Good pattern for understanding and implementing business processes and services

very high level of complexity

difficult to implement due to complex tools, hype, misconceptions, and heavy business user involvement

SOA is a pattern, not an implementation of a vendor.

good for pattern for large, complex, heterogeneous businesses that have a large number of common services (e.g., insurance)


*References*


[Wikipedia (Event Driven Architecture )] [wiki]
[Creating an Effective SOA Service Taxonomy] [taxonomy]




Don't forget it's all about data

Data is spread around the enterprise, there is no system of record. Whose's data is right? Users are protective about data. Data consolidation is difficult to do.




[book]: https://www.amazon.co.uk/Pattern-Language-Buildings-Construction-Environmental/dp/0195019199/ref=sr_1_1?ie=UTF8&qid=1539541549&sr=8-1&keywords=a+pattern+language 

[wiki]: https://en.wikipedia.org/wiki/Event-driven_architecture

[taxonomy]: https://soa.sys-con.com/node/738704