---
layout: post
title:  "Basic key concepts"
date:   2018-10-15 20:15:00 +0100
categories: cryptography security keys
---

## Cryptography 

Notes from _Understanding the digital world_

Caesar cipher shifts letters by 3 positions

The rot13 algorithm shifts letters by 13 positions.

Mary, Queen of Scots beheaded in 1587 as her code was cracked.

To keep contents private, the contents are scrambled which is called encryption. This is done using a secret which is called a _key_. The key is then used to unscramble or decrypt the contents.

Frequency analysis is used to crack substitution cyphers as the above.

Security by obscurity never works.

# Secret-key cryptography 

This is aka symmetric-key cryptography. 

The key is secret and it used for encryption and decryption. 

Data encryption standard - DES
Advanced encryption standard - AES 

Key distribution is a problem, as each party must have it.

Key proliferation is a problem as a new one is needed for each new party.


# Public-key cryptography

Each person has a pair - private key and public key. Message encrypted by one can be decrypted by other and vice-versa.

A encrypts using B's public key. B decrypts using corresponding private key.

B encrypts using A's public key. A decrypts using corresponding private key.

No shared secrets - no distribution problem.

Browser generates temporary symmetric key, encrypts using server's public key. Server decrypts using it's private key. Then the browser and server can use symmetric key for further exchanges.

Is slow. So used in step 1, then symmetric key used for next step which is orders of magnitude quicker.

For digital signing, A would encrypt using A's private key. It's to show that the content has come from A and not others. It's not for encryption as it can be decrypted using A's public key. To encrypt, A will first encrypt using B's public key and then sign by encrypting with A's private key. B decrypts with A's public key to verify it's from A and then decrypts using B's private key to see the contents.

_Forward secrecy_ : Each message encrypted with one time password. 

RSA algorithm generates large > 500 digit composite which is a product of equal sized primes and uses these to create the public and private keys. The prime numbers are required to decrypt the messages.  

Is slow. Message digest or cryptographic hash is a faster method of indirect signing.

A fixed-length sequence of bits, the digest or hash is generated from text. It's computationally infeasible to generate a text that has the same digest. A slight change in text will change half the bits in the digest.

Message digest algorithms - MD5 (128 bit), SHA (160 bits), SHA-2 & SHA-3 (224-512 bits)   
Servers prove identity by presenting a certificate issued by a certificate authority.










