---
id: predicate-logic
aliases: []
tags: []
---

# Predicate Logic

Intro to predicate logic as a means of knowledge representation

Notation Notes:

- Typically, Dr. Rozenblit will use capital letters to describe objects in the
  real world.

- Predicates will be used to express a particular state of an object or a
  relationship between those objects.

- $z$ = logic-function($x$) will be used to say that A is a B.

Basic Definitions

- Operators
  - Negatives: $\neg, \sim$
  - And: $\wedge, &$
  - Or: $\vee$

$(A \vee B) \rightarrow F$ if A and B are false $(A \wedge B) \rightarrow T$ if
A and B are true, else false.

| A   | B   | A->B |
| --- | --- | ---- |
| T   | T   | T    |
| T   | F   | F    |
| F   | T   | T    |
| F   | F   | T    |

### Understanding The Logic Intuitive

Sentence: If I win the election, then I will lower your tuition.

> Would you agree that I'm making a promise to you?

If I pay your tuition, I have not broken my promise.

If lose and pay your tuition, I have not broken my promise.

If I win and do not pay your tuition, then I have broken my promise.

## De Morgan's Laws

Conjunction: $\neg (A\vee B) \equiv \neg A \wedge \neg B$

Disjunction/Clause Form: $\neg (A\wedge B) \equiv \neg A \ \neg B$

Properties: $\wedge$ and $\vee$ are commutative

$A \vee B \equiv B \wedge A$

Distributive:

$A \vee (B \vee C) \equiv (A \vee B) \vee C$ $A \wedge (B \wedge C) \equiv (A
\wedge B) \wedge C$

$\forall x$: for all $x$. $\exists x$: there exists an $x$

What is $\forall x P(x)$ mean?

What about $\exists x P(x)$?

$$
\forall x \text{City}(x) \Rightarrow \exists y { \text{Dogcatcher}(x, y)
\wedge \forall z { \text{Dog} (z) \wedge \text{lives in}(x,z) \Rightarrow
\text{bitten}(y,z)}}
$$

## Example

Theorem Drondy

Axioms:

1. Barks(FIDO)
2. $\forall x [Barks(x) \Rightarrow Dog(x)]$

Theorem: Dog(FIDO)

## Sound Rules of Reasoning

1. `Modus Ponens` [Modus Ponens](https://en.wikipedia.org/wiki/Modus_ponens)

If $A$ is true AND $A \Rightarrow B$ is true,

Then $B$ MUST FOLLOW.

1. BARKS(FIDO)

2a. $\forall x : x \Leftarrow FIDO$ Eliminate $\forall X$

2b. BARK(FIDO) $\Rightarrow$ DOG(FIDO)

The DOG(FIDO) MUST BE TRUE.
