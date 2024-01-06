---
title:  A Science of Concurrent Programs - Begin
published : true
description : 
tags: #book #concurrency 
layout: post
categories: #book #concurrency
date:   2024-01-06 06:00:00 +0000
---
I have started reading the book [A Science of Concurrent progam PDF](https://lamport.azurewebsites.net/tla/science.pdf). Don't remember where I got it from, but am interested after reading the first few pages. 

I've come across Leslie Lamport, the author, first when I was reading about [Consensus](https://en.wikipedia.org/wiki/Consensus_(computer_science)) and then it lead to [time & clocks](https://lamport.azurewebsites.net/pubs/time-clocks.pdf). There are several more reasons to pay attention to Leslie Lamport's work, one more I just learnt today that 'LA' in LaTeX is for Lamport in recognition of his contribution to LaTeX.

I want to read this book so that I am able to think mathematically of programs in general. As a professional programmer, there aren't many opportunities to think about programs mathematically.

Also, this will be an excuse for me to get more familiar with LaTeX. 

I've created [github](https://github.com/vikrampawar/pdfs/tree/main/2024/science-of-concurrent-programs) repo folder to keep the PDF and the notes.

Refreshing basics and in the process getting acquainted with LaTeX.

**Boolean operators vs Mathglish :**

The symbols

$$

\\ 
 \lnot \quad  negation \: not \qquad \Rightarrow implies  
\\ 
\land \quad conjunction \: and \qquad \equiv \text{if and only if}
\\ 
\lor \quad disjunction \: or \qquad \forall for all
$$

Negation
$$
\\
\lnot TRUE \equiv FALSE
\\
\not FALSE \equiv TRUE

$$

And

$$
\\
\\ TRUE \land TRUE \equiv TRUE
\\ TRUE \land FALSE \equiv FALSE
\\ FALSE \land TRUE \equiv FALSE
\\ FALSE \land FALSE \equiv FALSE
$$


Definition of other operators $\lor, \Rightarrow, \ and \equiv$ in terms of $\lnot \ and \ \land$.


$$
\\ 
A \lor B \coloneqq \lnot (\lnot A \land \lnot B)
\\ 
A \Rightarrow B \coloneqq \lnot A \lor B
\\
A \equiv B \coloneqq (A \Rightarrow B) \land (B \Rightarrow A)
$$


Or

$$
\\
\\ TRUE \lor TRUE \equiv TRUE
\\ TRUE \lor FALSE \equiv TRUE
\\ FALSE \lor TRUE \equiv TRUE
\\ FALSE \lor FALSE \equiv FALSE
$$

Implication

$$
\\
\\ TRUE \Rightarrow TRUE \equiv TRUE
\\ TRUE \Rightarrow FALSE \equiv FALSE
\\ FALSE \Rightarrow TRUE \equiv TRUE
\\ FALSE \Rightarrow FALSE \equiv TRUE
$$

Equivalence (need to represent it better)

$$
\\
\\ TRUE \equiv TRUE \equiv TRUE
\\ TRUE \equiv FALSE \equiv FALSE
\\ FALSE \equiv TRUE \equiv FALSE
\\ FALSE \equiv FALSE \equiv TRUE
$$

Tautologies with names :
Can be derived by substituting $\land, \lor, and \equiv$ for $*, +, and =$. The last one is a special case, this has no counterpart in ordinary arithmetic.

$$
Commutativity :\\
\\ \vDash A \land B \equiv B \land A
\\ \vDash A \lor B \equiv B \lor A 
\\
Associativity :\\
\\ \vDash A \land (B \land C) \equiv (A \land B) \land C
\\ \vDash A \lor (B \lor C) \equiv (A \lor B) \lor C
\\
Distributivity : \\
\\ \vDash A \land (B \lor C) \equiv (A \land B) \lor (A \land C)
\\ \text{Special Case.}
\\ \vDash A \lor (B \land C) \equiv (A \lor B) \land (A \lor C)
$$

De Morgan's Laws

$$
\\
\vDash \lnot (A \land B) \equiv \lnot A \lor \lnot B
\\
\vDash \lnot (A \lor B) \equiv \lnot A \land \lnot B
\\
Transitivity : \qquad
\vDash (A \Rightarrow B) \land (B \Rightarrow C) \Rightarrow (A \Rightarrow C)

$$

