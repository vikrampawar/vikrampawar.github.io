---
title:  What is a CIDR
published : true
description : 
tags: #cidr #networking
layout: post
date:   2020-06-15 07:00:00 +0000
categories: #cidr #networking
---

The Wikipedia link is here [Classless Inter-domain Routing](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing)

And here is the basic information you need to know.

A CIDR identifies a machine connected to a network.

An example CIDR for IPV4 address looks like this `192.168.100.14/24`.

The numbers `192`, `168`, `100`, `14` are four octets. An octet represents `8` bits. We use four octets, so we are using `32` bits to represent the machine. 

A bit can have two possibilities either `0` or `1`. So, an octet can have 256 (2 ** 8) values, starting from 0 and ending with 255, which means 4 octets can represent 4,294,967,296 possibilities (2 ** 32).

But, the number after the `/` puts a limit on this.

Before, I explain how the limit is applied, I'll have to explain what number `24` means. The number `24` could also have been represented as 4 octets. If we did, it would look like `255.255.255.0`. The number `24` is a compact way of representing these 4 octets. Are you wondering how these are equivalent? The value `255` when represented by a an octet (8 bits) looks like this `11111111`. So `255.255.255.0` would be `11111111.11111111.11111111.00000000`. I put `.` in between for readability. As you can see, this big number has `24` leading bits set to `1`. That's the link between the two representations.

This number is telling us that while using the address `192.168.100.14`, don't use the first 24 bits or the first 3 octets. That is, `192.168.100` are off limits. That leaves us with only the last octet, so only 256 possible values :( ! Imagine if this number was `31`, that leaves only `1` bit or two possibilities. 

The 3 octets that we do not use, along with a `0` for the fourth octet `192.168.100.0` represents something called a `routing prefix`. If you represent this routing prefix in the form `255.255.255.0`, it's called the `subnet mask` and logically represents the same thing.




