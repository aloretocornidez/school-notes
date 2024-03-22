# Logic Optimization

There are often two important design criteria in design:

- Delay: the time from inputs changing to stable outputs.
- Size: number of transistors.

## Optimization vs tradeoff

Optimizations are defined as better in all areas of interest

Tradeoffs improve one area of interest at the cost of another's performance.

## Pareto Points

Often, we would like to optimize a system, however. it is likely that we will
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

