---
layout: post
title:  "Rest in Practice - 1"
date:   2018-10-21 14:00:00 +0100
categories: rest
---

Resource can mean a real world resource. We can then have a informational resource for it that can be uniquely identified and has multiple representations. This fact can be used to build systems.


URI - Uniform Resource Identifier : Uniquely identifies a resource 

{% highlight bash %}
<scheme>: <scheme-specific-structure>

{% endhighlight %}

It has a many to one relationship with the resource

URL - Uniform Resource Locator (obsolete!). Special form of URI. It specifies how the resource will be accessed as well.

URN - Uniform Resource Name : Also a special form of URI. Unique name in a namespace. It's a URI that uses the scheme 'urn'. 
`e.g urn:isbn:0131401602`

Resource  must have at least one identifier to be addressable. The identifier can be viewed as a transferable format (XML, HTML etc). 

Underlying resource is not accessed (no pointers in web), only the representations are exchanged.

One resource (URI) can have multiple representations.

The requester can populate HTTP Accept header for particular representation that's used in `content negotiation`.

These resources can be manipulated through a small set of HTTP verbs referred to as the `uniform interface`

HTTP Verbs : GET, POST, PUT, DELETE, OPTIONS, HEAD, TRACE, CONNECT AND PATCH.

HTTP defines response codes such as 200 OK, 201 Created and 404 Not Found.

These facts can be used to operate on these resources


{% highlight bash %}

                                                 agent
            agent(xyz.org)                         |   
http://xyz.org/Order1  |               +-------------------------+
      Resource         |               | GET /Order1 HTTP/1.1    | 
                       |        <--    | Accept: application/xml | 
                       |               | ...                     |  
              +--------------------+   +-------------------------+
              |  HTTP/ 1.1 200 OK  |               |
              |  ...               |--->           |
              |     Order1.xml     |
              |                    |
              +---------------------         

Resource
{% endhighlight %}




