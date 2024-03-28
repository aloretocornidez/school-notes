# Expert Systems

These AI systems worked on the principle of knowledge acquisition (instead of
training data) to execute actions.

Applications of this AI system include:

1. Analysis <-- Confirming a hypothesis
2. "Design" / Configuration

Systems had the following components:

- Working Memory | The "state" of the system
- Inference Engine | Control/reasoning process.
- Rule Base | knowledge about the domain.

These systems must consider the confidence of the data that is being input into
the system. This is called the Confidence factor.

## Example

Configuration

Overview: Assume you have to sort a random array of capacitors and resistors on
a conveyor belt into two bins. One for resistors, one for capacitors. You have a
robot arm that can pick up up to two parts and cannot drop them selectively.
(Meaning you must drop both things you pick up)

A rule set for this system can be generated as follows:

1. If there is an R, then pick it up and place it in the R-bin.
2. If there is an R and an R next to it, then place them both in the R-bin.
3. If there is a C, then pick it up and place it in the C-bin.
4. If there is a C and a C next to it, place them in the C-bin.
5. If there is no at and C, stop.

Let's talk about inference/efficiency within the rule sets.

In the inferencing process, you look at the sets of conditions and a given rule
subsumes another, then that rule is more specific (because it is a subset).:

1. Specificity
2. Index based ordering
3. Context

In this case, rule 2 can subsume rule 1.

What if we pick up a wrong item?

We can backtrack to the nearest known state and re-execute actions.

It is also possible to do dynamic action execution.


