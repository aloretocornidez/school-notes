# ECE 501 | Linear Systems Theory

### Announcements
- Passport Assignment (Due Wed 08/30/2023)
- Textbooks are on D2L



# Unit 0 | Prerequisite Class

### Linear Vector Spaces
- Linear Algebra 
	- Finite Dimensions
	- Axler's Texbook
- Functional Analysis
	- Infinite Dimensions
	- Frank's Textbook

Both domains share many features.

This class won't shy away from mathematical proofs.

### Principal Component Analysis (PCA)

--> Find Meaning from data.
- Symmetric matrices
- Eigenvalues
- Eigenvectors
- Singular Value Decomposition

--> BCS (Bowl Championship Series)
	How did you pick the best four teams in a bowling championship? You can't play every other possible team, so how can you rank them?
- Positive Matrices were used for this operation

--> Google Page Rank (Importance of Page Rank)
- 'The \$25B (Billion) Eigenvector'
- Eigenvectors and other matrix concepts

--> 'Road to Reality | Roger Pinrose'


## Chapter 1 | Axler Texbook

### Background
- We will conentrate on two "fields" (Pg. 10)
- *Field*: A set from which we will draw numbers 

**Terminology**
$\mathbb{R}$: Real Numbers
$\mathbb{C}$: Complex Numbers
$\mathbb{Q}$: Rational Numbers.
$\mathbb{F}$: Either field can be used.


$x = a + ib : a, b  \in \mathbb{R}$

**Properties of a Field**
1. Commumativity
	- $a, b, \in \mathbb{F}$
	- $a + b = b + a$
	- $ab = ba$
2. Associativity
	- $a, b, c, \in \mathbb{F}$
	- $(a + b) + c = a + (b + c)$
	- $(ab)c = a(bc)$
3. Identities
	- 0 and 1 in $\mathbb{F}$
	- Additive Identity: $0 + a = a$
	- Multiplicative Identity: $1 * a = a$
4. Inverses
	- $\forall a \in \mathbb{F}$ 
	- $\exists a \in \mathbb{F}$ such that
	- $(-a) + a = 0$
	- For every nonzero $a \in \mathbb{F}$, there exists $(a^{-1}) \in \mathbb{F}$ such that $(a^{-1})(a)= 1$
5. Distributive
	- $a, b, c, \in \mathbb{F}$
	- $a(b+c) = ab + ac$

### Examples

Recall: 

$\mathbb{R}$: Real Numbers
$\mathbb{C}$: Complex Numbers
$\mathbb{Q}$: Rational Numbers.
$\mathbb{F}$: Either field can be used.

The set of integers, $\mathbb{Z}$, is not a field because there is no multiplicative inverse.

*List*: An ordered collection of "n" (finite #) objects. (The objects are usually numbers)

$(x_{1}, x_{2}, x_{3}, ..., x_{n}), x_{1}, x_{2}, ..., x_{n}$

When possible, we will use a single variable to represent an entire list.
$x = (x_{1}, x_{2}, ..., x_{n})$

***Important Note:*** A list is not a set

Order and repition matter in a list.

$Set \Rightarrow$ {2, 4, 4} = {2, 4} = {4, 2}
$Lists \Rightarrow (2, 4, 4) \neq (4, 2, 4) \neq (2, 4))$

Coordinate: An element of a list.

### List Addition 
List addition is element-wise addition of the coordinates.

$z = x+y = (x_{1} + y_{1}, x_{2} + y_{2}, ..., x_{n} + y_{n}) = (z_{1}, z_{2}, ..., z_{n})$


### Scalar Multiplication
Scalar multiplication of a list by a scalar number $a\in \mathbb{F}$. Defined as an element-wise scalar operation to each element of the list.


### Vector Space
3 Main Concepts

1. We have a "set" $V$ with two binary (two things being combined) operations.
	- Vector/List addition & Scalar multiplication where the vector is an element of a set.
2. "Abstract usage of a vector"

Examples of a vector:

1. $\begin{bmatrix} 1 \\ 2 \\ 3 \end{bmatrix}$
2. $\begin{bmatrix} 1 && 2\\ 3 && 4 \end{bmatrix},\begin{bmatrix} 6 && 2\\ -7 && 8 \end{bmatrix}$ where the matrices are $\mathbb{R}^{2\times2}$
3. $f \in \begin{cases} \text{Set of Continuous functions} \end{cases}$
4. $p(x) \in \begin{cases} \text{Set of polynomials of degree less than 'n' with coefficients in } \mathbb{F} \end{cases}$

### Definition of Vector Spaces
Any set, $V$, of lists that has the following properties:

Closed under Addition:
$x+y \in V : x, y, \in V$
": " is such that

Closed under scalar multiplcation:
$ax \in V: x \in V, a \in \mathbb{F}$

Commutativity:
$x + y = y + x: x, y, \in V$

Associativity:
$(x+y) + z = x + (y + z)$ and $(ab)x = a(bx): x, y, z, \in V \text{ and } a, b \in \mathbb{F}$

Additive Identity:
$x + O = x: 0, x \in V$

Multiplicative Identity:
$1 * x =x : x \in V, 1 \in \mathbb{F}$

Additive Inverse:
For every $x \in V$, there exists a $y\in V$, such that $x + y = 0$

Distributive Property:
$a(x + y) = ax + ay$




























