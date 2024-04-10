---
id: research-tosi
aliases: []
tags: []
---

# Tosi's Research

# Intro

High Level Synthesis (HLS): rapidly evolving and popular approach to designing,
synthesizing, and optimizing embedded systems.

Over the past few years, interest in HLS has increased. You are able to specify
your design in a high level language, plug it in to the HLS tool, and the HLS
spits out verilog code.

## Motivation for Lichao's Work

Limitations of the State-Of-The-Art: current HLS methodologies do not bridge the
gap between pre-HLS DSE and post-HLS multi-component system-level DSE.

- Precise timing constraints must be accounted for
- System-level ...

## System Representation and Design Space

Periodic State Machines (PSMs): modeling formalism

- modify finite state machines to enable specification of time-triggered
  execution
- A fixed period, global, time clock constraints, and time-driven events

## Pareto-Optimal Subspace Pruning (PSP)

PSP: a priority pruning algorithm

PSP Goal: preemtively eliminate suboptimal solutions in the MCC subspace

- Make DSE more tractable
- Prune solutions that do not satisfy the timing constraints

## Pareto-Optimal Elite Genetic Algorithm (PEGA)

System-level design space remiansvery large after PSP

Multi-objective ...

Three Features to improve efficiency:

- Variable Pareto-Optimal elitism: Pareto-optimal solutions in one generation
  are carried over to the next generation.

- Suitable genetic representation: MCC alternative with its assigned frequency
  combination as a gene

- Leverage GA's inherent parallelism: separating the pruned design space
  according to the valid frequency combinations for the target FPGA.

The kids of the best parent remain for the next generation. The elite subset of
the samples remain and then the rest are mutated.
