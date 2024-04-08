# Formal Verification

Verification of a system is extremely important aspect of hardware design
specifically because you can't just deploy a patch to the system. The stakes may
be even higher if your hardware is used for the safety of customers/consumers of
your product.

- Proving that a property holds of a mode of a design
- Aims to give the same promise as exhaustive simulation
  - Handshaking protocols
  - Functional correctness
  - Performance/timing
  - Reliability
  - Etc

## Binary Decision Diagrams (BDDs)

Data structures used to represent boolean functions.

Uses for BDDs:

1. Combinational equivalence: checking to see if two circuits are equivalent.
2. Sequential Equivalence: Determine if all reachable states are equivalent
   between two unique finite state machines (FSM).
3. Model checking: check that a model in a FSM has certain properties.

### Example

| a   | b   | c   | d   | f   |
| --- | --- | --- | --- | --- |
| 0   | 0   | 0   | 0   | 0   |
| 0   | 0   | 0   | 1   | 1   |
| 0   | 0   | 1   | 0   | 1   |
| 0   | 0   | 1   | 1   | 0   |
| 0   | 1   | 0   | 0   | 1   |
| 0   | 1   | 0   | 1   | 0   |
| 0   | 1   | 1   | 0   | 0   |
| 0   | 1   | 1   | 1   | 1   |
| 1   | 1   | 0   | 0   | 1   |
| 1   | 1   | 0   | 1   | 0   |
| 1   | 1   | 1   | 0   | 0   |
| 1   | 1   | 1   | 1   | 0   |

## BDD Reduction

1. Merge uquivalent leaves
2. Merge isomorphic nodes
   - Isomorphic: equivalent variables with the same outputs.
3. Eliminate redundancy

- Assertions
- Constrained Randomization
- Testbench automation




