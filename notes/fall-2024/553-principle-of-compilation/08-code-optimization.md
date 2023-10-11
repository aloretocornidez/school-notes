# Code Optimization

## Introduction to Code Optimization

- Aim

  - The aim of code optimization is to improve program performance.
  - Optimization, however is a misnomer, so obtaining "optimal" performance is
    impossible or impractical in general.

- Criteria
  - must be "safe", i.e., preserve program semantics;
  - On average, you should measurably improve performance.
    - Occasionally a few programs may suffer performance degradation. The
      transformation should be worth the effort.

## Basic Requirements of Optimization

- Fundamental Requirement: Safety
  - The "obervable behaviour" of the program must not change.
- Program analysis must be correspondingly safe.

## Some Important Optimizations

- Peephole optimization
- Loop transformations
- Function preserving transformations

### Peephole Optimization

Examine the instruction sequence for inefficient patterns and replace them with
more efficient patterns. This optimziation process optimizes the three-address
code, so it is machine independent.

#### Common Patterns in Peephole Optimization

- Null Sequences | delete useless operations.
- Combine operations | a jump to a jump -> jump to the ultimate target the first time.
- Algebraic simplification | $i = i * 1 = i$.

### Copy Propagation

- Take instructions of the form `x = y`
  - Arise from normal code generation
  - Also as a result of other optimzations.
- Goal of copy Propagation
  - Given a copy instruction `x = y`, true to replace subsequeny uses of `x` by
    `y`.
  - If the copy instruction becomes dead as a result, it can then be optimized
    away (dead code elimination).

#### Local Copy Propagation (Intra Block)

Given a copy instruction `x = y` in a basic block:

- iterate through the instructions in the rest of the block.
- replace any use of `x` by `y`.

```
x = y
z = x + w
```

becomes:

```
x = y
z = y + w
```

- If either x or y is redefined, stop propagating since `x` and `y` are no
  longer guaranteed to have the same value.

#### Example | Local Copy Propagation

You can plug 10 into the first assignment of `z`, but not into the first
assignment of `w`.

```
x = 10
y = x
z = y + 1
x = z * 2
w = x - 1
y = u + 1
w = z * y
```

#### Effects of Copy Propagation

When a copy instruction `s === x = y` is propagated to the uses of x, the number
of uses of `s` is decreased. If the number of uses of `s` goes to 0, then it is
dead code and it can be eliminated.

### Dead Code Elimination

A three address instruction is dead if the value the instruction computes is
guaranteed to not be used. Dead code can arise due ot other optimizations, e.g.,
constant propagation or copy propagation.

When you get rid of an instruction that is dead, other instrucitons that were
previously not dead can also become dead.

#### Dead Code Elimination | Algorithm 1

1. Mark all instructions as 'live' Repeat: for each instruction `i === x = ...`:
   if the value of x is defined by `i` (i) is not visible outisde the current
   function and (ii) is nnot used by any instruction marked live then mark `I`
   dead. until no more instrucitons are marked dead.

#### Dead Code Elimination | Algorithm

```
repeat:
1. perform liveness analysis
2. for each basic block B:

liveset = out[B]
for each instruction in reverse order from B's end:

let/= 'x=y \plus z'
if dst(I) \in liveset:
    liveset = (liveset - {x}) \union {y,z}

else:
    mark / as 'dead'

until no more instructions can be marked 'dead'
```






















