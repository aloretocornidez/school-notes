# Program Analysis

### Analysis And Optimization | Organization

![[Pasted image 20230919130622.png]]

### Undesirability

An algorithm is defined as a computation that goes to completion.

Some problems cannot be solved using any algorithm (Some problems are
undecidable | Turing)

This does not rule out:

- Algorithms that correctly solve some instances of that problem and always
  terminate
- Computations that attempt to solve all instances but sometimes do not
  terminate.

### Rice's Theorem

[Rice's Theorem](https://en.wikipedia.org/wiki/Rice's%20theorem)

Any non trivial property behavioral properties of programs are undecidable.

(A property is trivial if either all programs have it or else no program has it)

This means:

- we can have program analyses that produce safe (but sometimes imprecise)
  analysis results and always terminate
- if we tried to always produce precise analysis results, the analysis would
  sometimes not terminate

Note: "safe" means that all possible executions are accounted for in the
analysis results (however, imprecision arising from undecidablity means that the
analysis can also account for executions that cannot actually occur at runtime)

### Program Analysis and Precision

In general, we can expect precise results for some, but not all, input programs

The more work an analysis does, the larger the set of inputs for which it can be
precise.

![[Pasted image 20230919133118.png]]

There is tension between programmers wanting quick compilation vs optimized
programs.

If the user is willing to pay time, the program can be optimized more in
different ways.

# Control Flow Analysis

### Goals

To obtain higher level information about the possible control flow behavior of
the program.

- “which blocks are guaranteed to have been executed if control reaches some
  block B?”
- “which blocks are guaranteed to be executed once control reaches some block
  B?”
- “what is the loop structure of the code?”

Criteria:

- must be "safe" i.e., must take into account all possible executions of the
  program.

## Control Flow Analysis

### Dominators

Definition: A node $d$ in a flow graph $G$ dominates a node $n$ (written "$d$
dom $n$") iff every path from the entry node of $G$ to $n$ contains the node
$d$.

Facts:

- every node dominates itself
- the "dom" relation is a partial order
- every node has a unique immediate dominator.
- The dominator relationships in a glow graph form a tree.

If x dominates y:

Properties of Domination:

1. Reflexive
2. Transitive
3. Antisymmetric

### Immediate Dominator

x is an immediate dominator of y iff:

- x dom y and there is no z (z != x) such that x dom z and z dom y

Since every node has 1 unique immediate dominator, this means that the Control
flow diagram can actually be expressed as a Tree (and not only a graph).

### Reaching Definitions | Dataflow Equations

gen and kill sets, to propagate all of the code that is valid in a control flow
diagram.

$$out[B] = gen[B] \union (in[B] - kill[B])$$ $$in[B] = \union { out[X]}$$ where
X is a predecessor of B.

Points to note:

- out[B] is computed from in[B]
- in[B] is computed from predecessors ob B.
- information is propagated along direction of control flow
- "forward dataflow analysis"
- in the presence of loops, the equations become circular.

### How can we generate `gen` and `kill` sets?

Initially, the gen and kill sets are empty sets.

If out block contains an instruction, A, then we update the gen set, g. After
this, we must update the kill set: all previous definitions of the A instruction
are then killed. This means that the kill

## Analysis 2 | Liveness Analysis

[Liveness Analysis](./liveness-analysis.md)

## Analysis 3 | Available Expressions

[Available Expressions](./available-expressions.md)


