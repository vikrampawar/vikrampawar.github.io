---
title:  What is a Message?
published : true
description : 
tags: #message
layout: post
categories: #message
date:   2020-06-16 18:00:00 +0000
---
What is a `Message`?

Here is a good definition of a [Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/Message.html).

I want to develop your intuition about a `Message`, so I'll elaborate this concept.

`Message` is an overused word. I want to develop intuition about a `Message` as used in Software Development.

Now let us suppose two people Alice and Bob want to communicate. If Alice shouts at Bob, we can't say Alice has given a `Message` to Bob. If instead, Alice tells Charlie something about Bob, and Charlie goes and tells it to Bob, we can say Charlie has passed on a `Message` to Bob. 

What is the difference between the two situations? Of course, I introduced Charlie. But, Alice could have written the same thing in a piece of paper and sent that to Bob, or Alice could have sent an email or a text that has the same content, and in all these cases, we would say that Alice has sent Bob, a `Message`.

So, the fundamental thing that makes a `Message` a `Message` is that it leaves one person and then goes to another person. It has an independent existence outside of both people. And, because it leaves one person and then goes to another person, a `Message` by necessity needs to have the following information for it to be considered a `Message`.

It needs to have the information about where is it coming from, where is it going to, what is it about, and finally the actual content. These are called `Sender`, `Recipient`, `Type` (Subject) and `Payload`, respectively. The `Sender`, `Recipient` and `Type` are grouped together as a `Header`. 

The same concept is used when information leaves one Application and goes to another Application. 

An email, or a text, that we send is a `Message`. It has a `Header`, i.e, `Sender`, `Recipient` and `Type` along with the `Payload`.

A `Message` can be a lot more things, it can have a lot more information, but the `Header` and the `Payload` are the absolute minimum information that it needs to have for it to be able to leave one person or an Application, be independent, and reach the right `Recipient`.

