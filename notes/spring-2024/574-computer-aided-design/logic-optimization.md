# Logic Optimization

There are often two important design criteria in design:

- Delay: the time from inputs changing to stable outputs.
- Size: number of transistors.

## Optimization vs tradeoff

Optimizations are defined as better in all areas of interest

Tradeoffs improve one area of interest at the cost of another's performance.

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
  - The only prime implicant that covers a particular minterm in a funciotn's
    on=set
  - Importance: we must include all essential PIs in a function's cover.
  - In contrast, some, but not all, non-essential PIs will be included.
