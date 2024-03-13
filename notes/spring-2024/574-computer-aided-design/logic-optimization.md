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



