---
title:  Kakfa is not messaging !
published : false
description : 
tags: #kafka #messaging #distributed-systems
layout: post
categories: #kafka
date:   2023-04-15 10:00:00 +0000
---

In the below diagram, we see a producer, and a consumer interacting via a black box. Can we tell just by looking at it, what that black box is? All weu are told is that this interaction results in the consumer getting the information that the producer had.


```mermaid
graph LR
P[Producer] --> |IN?| B((Black Box))
B --> |OUT?| C[Consumer]
```

There are many possibilities here. It could be either on disk or in memory. It could be
- A database 
- A file
- A message queue
- A log

Next if we are told that this black box operates using memory only, we can rule out database, file and log. It has to be a message queue and therefore that black box is probably a messaging system.

However, let's suppose that we are told that this black box operates using disk only, then again all possibilities are open because a messaging system can write to disk as well if the messages need to be persistent.

If we know that it's a sequence of bytes, we still cannot narrow down the possibilities.

If the producer is sending this data knowing that there is a consumer for it, then it's more likely to be a message queue only. Files, database tables and logs can be written to persist data with out any concern for who is going to make use of them next. The producer could write it for its own use.

If the sequence of bytes has a header which says a lot of the content, so that we know what the data is about, where it originated, where it possibly would be sent, then we recognise this sequence of bytes as a message. Therefore we know that we are dealing with a message queue.















See the below resources for further information on Kafka.

1. [Kafka Learning Resources Notion Database](https://sincere-wildflower-595.notion.site/409619ed704344e38af90c26df8a1774?v=e111c8100a7e45ec9b933b762dc31d90).
2. 
