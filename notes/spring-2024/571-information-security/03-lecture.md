# ECE 571 | Lecture 3 | Modular Arithmetic and Crypto-systems

Date: 2024-01-17

## Basic Modular Arithmetic

### Division

- Divisibility: A nonzero $b$ divides $a$ if $a=md$ for some $m$ (all are
  integers)
  - If $b|a$ then $b$ is a divisor of $a$

Properties of Divisibility:

- If $a|b$ and $b|c$ then $a|c$
- If $b|g$ and $b|h$ then $b | (mg + nh)$ for arbitrary integers $m$ and $n$

Division Algorithm:

- Given any positive integer $n$, integer $a$: $a = qn + r$,$0 \le r < n$, $p =
  \text{floor}(\frac{a}{n})$ where q is the quotient and r is the residue
  (remainder).



Modulus

$a$ mod $n$: the remainder when $a$ is divided by $n$.


Congruence 

if $a$ mod $n$ = $b$ mod $n$: $a$ $\equiv$ $b$ mod $n$

Properties of Modulo

- $a \equiv b$ mod $n$ iff $n | (a-b)$
- $a \equiv b$ mod $n$ iff $b \equiv a$ mod $n$
- $a \equiv b$ mod $n$ and $b \equiv c$ mod $n$ ==> $a \equiv c$

Modular Addition and Multiplication

- Arithmetic operations within the set $Z_{n} = \{0, 1, 2, ..., (n-1)\}$

![[Pasted image 20240117133935.png]]


<!-- TODO: Figure out the modulo of numbers raised to a power modulo something. -->

Additive Identity (A.I.)

[Additive Identity](https://en.wikipedia.org/wiki/Additive_identity) 

Additive and Multiplicative Inverse

[Multiplicative Inverse](https://en.wikipedia.org/wiki/Multiplicative_inverse) 




