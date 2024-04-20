---
id: logic-optimization
aliases:
  - Logic Optimization
tags: []
---

# Logic Optimization

There are often two important design criteria in design:

- Delay: the time from inputs changing to stable outputs.
- Size: number of transistors.

## Optimization vs tradeoff

Optimizations are defined as better in all areas of interest

Tradeoffs improve one area of interest at the cost of another's performance.

## Pareto Points

Often, we would like to optimize a system, however, it is likely that we will
have to make tradeoff. Ideally, we would like the optimizations that we make to
be as close to the optimal pareto measurement.

## Algebraic Two-Level Size Minimization

You can use boolean algebra to minimize the logic in a system. However, this
requires you to work with boolean algebra. Using karnaugh maps lets you minimize
logic without having to work with the boolean algebra.

## Review Definitions

- Minterm

  - product term whose literals include every variable of the function exactly
    once in true or complemented form

- On-set

  - All minterms that define when $F=1$

- Off-set

  - All minterms that define when $F=0$

- Implicant:

  - any product term that when 1 causes $F=1$
  - on a K-map, any legal circle

- Prime Implicant:

  - Maximally expanded implicant: any further expansion would cover 1s not in
    the on-set.

- Essential Prime implicant
  - The only prime implicant that covers a particular minterm in a function's
    on=set
  - Importance: we must include all essential PIs in a function's cover.
  - In contrast, some, but not all, non-essential PIs will be included.

## Methods Used to Optimize Logic

- Boolean Algebra

  - Using boolean algebraic theorems to reduce the amount of logic whilst
    maintaining the same functionality in the logic.
  - Properties that are used are: Commutative, Associative, Distributive,
    Absorption, Combining, DeMorgan's Theorem.
  - This method is very computationally expensive and error prone.

- Karnaugh Maps
  - A graphical method for logic
  - Allows generation of minterms and optimization of the logic while finding
    the "don't cares" of the systems.

## Exact Algorithms Vs Heuristics

- Algorithm: a defined way, or a finite set of instructions, to solve a problem
  that terminates when a known/goal state is reached.
- Heuristics: efficient, and can find a good, but not necessarily the best
  solution.

## Quine-McCluskey

The Quine-McCluskey, also known as the "Method of Prime Implicants", is an
algorithm used for the minimization of boolean functions.

The method involves two steps:

- Finding all prime implicants of the function.
- Use those prime implicants in a prime implicant chart to find the essential
  prime implicants of the function, as well as other prime implicants that are
  necessary to cover the function.

"Don't Cares" in the Quine-McCluskey algorithm function similar to the way you
use them in as fill ins for variables that help develop prime implicants/matched
pairs.

### Iterated Consensus / Complete Sum

- A complete sum is a formula comprised of all prime implicants of a function.
- A sum of product formula is a complete sum iff:
  1. No term includes any other term
  2. The consensus of any two terms of the function either does not exist or is
     contained in some other term of the formula.

Finding the consensus:

- 3 Variables: Each variable is repeated twice in true or complemented form.
- 1 variables is complemented
- Keep the terms with the complemented variable.

In this case, $x$ is complemented, so:

$$xy + x'z + yz = xy + x'z$$

The process for the iterated consensus contains four steps:

1. Start with the 'sum of product' form.
2. Add consensus term of all pairs of terms. The consensus term must not be
   contained in any other term.
3. Compare new terms with other terms to see if any new consensus terms can be
   generated.
4. Remove all terms contained in any other term. Repeat steps 2 - 4 until there
   is no change.

<!-- prettier-ignore-start -->

Example:

$$F = wx + x'y + xyz + wy + yz$$

$$1, 2: wy$$

$$1, 3: $$

$$2, 3: yz$$

$$F = wx + x'y + wy + yz$$

Another Example:

$$F(a, b, c) = \sum m(2, 4) + \sum d (1, 5, 6)$$

$$F = a'b'c + a'bc' + ab'c' + ab'c + abc'$$

Term 1: $a'b'c$, Term 2: $a'bc'$ Term 3: $ab'c'$ Term 4: $ab'c$ Term 5:$abc'$

1, 2: 0

1, 3: 0

1, 4,: $b'c$

1, 5: 0

2, 3: 0

2, 4: 0

2, 5: $bc'$

3, 4: $ab'$

3, 5: $ac'$

4, 5: 0

New equation:

$$F = b'c + bc' + ab' + ac'$$

Another Example:

$$F(a, b, c, d) = \sum m (0, 1, 3, 7, 8, 9, 11, 15) $$

$$F = a'b'c'd' + a'b'c'd + a'b'cd + a'bcd + ab'c'd' + ab'c'd + ab'cd + abcd$$

Term 1: $a'b'c'd'$

Term 2: $a'b'c'd $

Term 3: $a'b'cd $

Term 4: $a'bcd $

Term 5: $ab'c'd' $

Term 6: $ab'c'd $

Term 7: $ab'cd $

Term 8: $abcd$

1, 2: $a'b'c'$

1, 3: 0

1, 4: 0

1, 5: $b'c'd'$

1, 6: 0

1, 7: 0

1, 8: 0

2, 3: $a'b'd$

2, 4: 0

2, 5: 0

2, 6: 0

2, 7: 0

2, 8: 0

3, 4: $a'cd$

3, 5: 0

3, 6:

<!-- prettier-ignore-end -->

## Row/Column Dominance

- Row dominance: If a row, $r_i$ in a constraint matrix has all the $1$s, in
  another row, $r_j$, we say that $r_i$ dominates $r_j$. We remove all
  dominating rows.

|       | P1  | P2  | P3  |
| ----- | --- | --- | --- |
| $m_1$ | 1   | 1   | 0   |
| $m_2$ | 1   | 1   | 1   |

In this case, row 2 is removed.

- Column dominance: If a column, $P_i$ has all $1$s in another column $P_j$, and
  the cost of $P_i \le P_j$, $P_i$ dominates $P_j$ and we remove the dominated
  column.

|       | P1  | P2  | P3  |
| ----- | --- | --- | --- |
| $m_1$ | 1   | 1   | 0   |
| $m_2$ | 0   | 1   | 1   |

In this case, P2 is removed.

### Example

|     | P1  | P2  | P3  | P4  | P5  | P6  |
| --- | --- | --- | --- | --- | --- | --- |
| m1  | 1   | 1   |     |     |     |     |
| m2  | 1   | 1   |     |     |     |     |
| m3  |     | 1   | 1   |     |     |     |
| m4  |     | 1   | 1   | 1   |     |     |
| m5  |     |     |     | 1   | 1   |     |
| m6  |     |     |     | 1   | 1   | 1   |

1. Remove rows with EPI
2. Remove dominating rows
3. Remove dominated columns.

Row Dominance: In this case, remove rows for m1, m4, and m6 since they are
dominated by m2, m3, and m5 respectively.

Column Dominance: remove P1, P3, and P5.

Cover = P2 + P4

### Example With Letters

|     | a'd' | b'd' | a'c | b'c | ab' |
| --- | ---- | ---- | --- | --- | --- |
| m0  | 1    | 1    |     |     |     |
| m2  | 1    | 1    | 1   | 1   |     |
| m3  |      |      | 1   | 1   |     |
| m4  | 1    |      |     |     |     |
| m6  | 1    |      | 1   |     |     |
| m7  |      |      | 1   |     |     |
| m8  |      | 1    |     |     | 1   |
| m9  |      |      |     |     | 1   |
| m10 |      | 1    |     | 1   | 1   |
| m11 |      |      |     | 1   | 1   |

Our essential prime implicants are on row m4, m7, and m8.

So EPI: a'd', a'c, ab'.

Null example, however, assuming that we continue with the process.

We remove rows m2 becuase of m0 and m3.

After removing the row domainated rows: m0, m3, m6, m8, and m11 are the rows
that are left.

Column Dominance (in this case) will not apply.

# Recursive Consensus

Finding the essential prime implicants can be done in multiple ways, the two
methods we learned:

- constraint matrix
- prime implicant chart

Recursive consensus uses the Shannon Expansion Theorem

$$
f(x_1, x_2, ..., x_n) = (x_1' f(0, x_2, ..., x_n)) + (x_1, f(1, x_2, ...,
x_n)) = (x_1' + f(1, x_2, ..., x_n))(x_1 + f(0, x_2, ..., x_n))
$$

So the steps are:

- Recursively expand terms to get F1, F2
- Multiply out F1 and F2
- Eliminate all terms contained in any other term.

### Example

Let's do an example:

$$F(a, b, c) = a'b' + a'bc' + ac$$

We can take the complement of a variable and recursively expand them.

a:

a' -> c

a -> b' + bc'

b' -> c'

b -> 1

Our equation then is represented by: $(b' + c') (b+1)$

Then we can get the other one: $(a' + c) (a+b'+c') = a'b' + a'c' + ac + b'c$

Then the last step is to remove all terms containing another term.

Generally, working with the most commonly used variable in the original equation
makes the tree expand less.

### Example

Let's do another example.

$$F = \sum m(0, 1, 3, 7, 8, 9, 11, 15)$$

Can be expanded to:

$$F = a'b'c'd' + a'b'c'd + a'b'cd + a'bcd + ab'c'd' + ab'c'd + ab'cd + abcd$$

Let's start recursively expanding $a$:

- a' -> b'c'd' + b'c'd + b'cd + bcd

  - b' -> cd
  - b -> c'd' + c'd + cd
    - c' -> d
    - c -> 1

- a -> b'c'd' + b'c'd + b'cd + bcd

  - b' -> cd
  - b -> c'd' + c'd + cd
    - c' -> d
    - c -> 1

Then we can 'and' branches.

$$(b + c' + d)(b'+cd)+a' = a'+b'c'+b'd + bcd + cd$$

We can 'and' it with the other branch and get the final set of prime implicants.

$$(a'+b'c'+b'd + bcd + cd)(a + b'c' + b'd + bcd + cd) = b'c' + b'd + cd$$

# New Topic

Some problems are hard and it may not be feasible to find the best solution,
this is where we can tradeoff solution optimality for speed to arrive to the

- Local Sea solution. This method is called heuristics instead of algorithms.

We implement heuristics using many methods, such as: Local Search

- Local Search: find a solution in the by approaching the minimum, however, this
  method is susceptible to getting trapped in the local minimum.

## Espresso Algorithm

Espresso utilizes the local search to approach a possible solution for
scheduling your resources in a module.


- Expand Operator
  - Randomly takes a term, and eliminates on of the literals.







