# ECE 579 | AI: A Brief Primer (in the context of ECE 479/579)

Date: 2024-01-11

## What is AI?

Artificial Intelligence is when an answer that the computer computes is
indistinguishable from that which gives an answer and possesses conciousness.

## The Turing Test

Are the answers that I'm getting with my interactions from the machine
indistinguishable from human answers?

## Attributes of Intelligence

Humans, who possess intelligence:

    - Perceive things and events.
    - Have mental states.
    - Learn.
    - Use language.
    - Make and use models.

AI systems typically posses intelligence in isolated forms:

    - Neural nets
    - Planners
    - etc.

## What can we do with AI?

- AI is a tool that makes a computer better at carrying out their tasks.

Example:
[Traveling Salesman Problem](https://en.wikipedia.org/wiki/Travelling_salesman_problem)

- Travel to every city at least once, ideally spending the least amount of
  resources doing so.

Nowadays the perception is that we can calculate this sort of problem with the
computers of today (iPhones, etc.)

Sure, we could throw our terabytes of data and wait two days for an answer
(especially when we need the data quick, such as when we're navigating). But AI
can help us solve these problems in a relatively short time.

## Selected Topics in Class

- State space-based search
- Knowledge representation
- Logic
- Model-based reasoning
- Planning
- Open problems (active student project participation)

## Non-Trivial Example Problems

![[Pasted image 20240111085538.png]]

We would like to reconfigure the 8-puzzle toy so that the tiles are ordered as
shown on the right.

**How would you do this?**

We would have to come up with a representation to allow us to employ the use of
an algorithm. This would allow us to find out how to reach the goal. The next
step is a bit more difficult, we may have to find out a proper strategy.

Using **State Space** based approaches would allow us to approach a situation.

## Types of Artificial Intelligence

The artificial agents that we build perceive the environment and take action
that correspond to the environment.

![[Pasted image 20240111090123.png]]




# Problem Spaces

Given an intersection:

![Intersection](./attachments/Screenshot_20240116_081124.png)

Design a control pattern for traffic lights so that the intersection as safe as
possible.

The first thing we need to find out is which turns are compatible.

## Identify safe and unsafe turns.

![](./attachments/Pasted image 20240116081402.png)

|     | AB  | AC  | BC  | CB  |
| --- | --- | --- | --- | --- |
| AB  | -   | O   | X   | X   |
| AC  | O   | -   | X   | O   |
| BC  | X   | X   | -   | O   |
| CB  | X   | O   | O   | -   |

## Convert the table into a graph.

$G = <V, E>$

![](./attachments/Pasted image 20240116082130.png)

> What does each edge signify?

Each edge displays a pair of incompatible turns.

![](./attachments/Pasted image 20240116082216.png)

## Color the Graph

[Graph Coloring](https://en.wikipedia.org/wiki/Graph_coloring)

Coloring parts of a graph so that no to edges/nodes are the same color.

Picking a set of parameters that you want to prioritize and use them
efficiently.

- Greedy optimization
  - Opportunistic Approach

> How do we color the graph?

- Pick a node and color it with a new color.
- Scan the list of nodes not connected to this node and paint it with the same
  color.
  - Repeat this step until there are no more nodes that can be painted with this
    color.
- Pick up a new color and repeat 1 - 3 until you are done.

> What are some pitfalls of this greedy algorithm?

Given the following graph labeled {1 ,2, 3, 4, 5}

![](./attachments/Pasted image 20240116083713.png))

When completing the algorithm in the sequential order:

![](./attachments/Pasted image 20240116084047.png)

Everything turns out fine.

However, when we change the order that the notes are colored in, the minimum
number of colors cannot be achieved with the greedy approach.

![](./attachments/Pasted image 20240116084252.png)

Creating a formal system to analyze this process: State Spaces

## State Spaces

Capturing the condition/situation of a system at a point in time. State paces
are a representation method.

Given the graph representation of the finite state acceptor. In a device that
accepts or rejects strings.

$Q=<S_1, S_2, S_3, S_4>$

![](./attachments/Pasted image 20240116085111.png)

Any string that has an even number of zeroes and even number of ones, then it is
accepted. If the string contains an odd number of zeroes or odd number of ones,
then the string is not accepted.

![](./attachments/Pasted image 20240116085934.png)

### Example | 8-Puzzle

![](./attachments/Pasted image 20240116090031.png)

> Abstraction for moves

Instead of moving tiles next to the black, you move the black tile.

MOVE BLACK UP, DOWN, LEFT, RIGHT (U, D, L, R)

A solution is the sequence of moves that gives me the goal state from the
initial state.

Back to the example:

up, up, left, down, right.

### How To Do This Systematically

1. Define the state space (DB)
   - A $3\times3$ board $$DB = \{ T_{i,j} | T_{i,j} \in \{
     1,2,,...,8,\text{blank} | i,j = 1,2,3,4,5,6,7,8\}$$

And not true that there is: $T_{i,j} = T_{m,n} \in \{1, 2, 3\}$

> Is it possible that given a Goal and Initial state: Is it possible that there
> does not a exist a path to the goal state from the initial state?

Yes, it is possible.

Operators: "Moves" that allow you to transform/transition between states.

## AI Production System (AIPS) <-- Problem Solving Paradigm

![AIPS Block Diagram](./attachments/Pasted image 20240118080838.png)

DB: Data base/state space Rules: operators that allow you to change states CS:
Control strategy

Goal state will sometimes be referred to as goal state/states/termination
condition.

> So, what are the operators of a given system?

Rules are typically given as an `if <condition> then <action>`, in terms of
state machine representation, the action that is completed when a set of
conditions is met changes the state of the system.

Control Strategies are a method that select and apply the "best" possible rule
so that a solution can be found in the most efficient way.

The possible states of a given system can be arranged into a tree. You can take
care to avoid cycles in the tree.

> Does the tree give us a solution?

Yes

> Is the solution from the tree efficient?

It is not the most efficient, but it is good enough, we cna change what we
prioritize if we're smart about it.

## Procedure Reduction

Let's take $D$ to be a state from the database.

$R$ is a rule from the set of all possible rules that apply/match to $D$.

while $R$ is not empty and $D$ does not satisfy the termination condition:

- Select a rule to apply to the database
- Apply the rule to the database
- Update the set of rules that are available

The rule that you select to perform is dependent on how "smart" you want to be
to receive the most payoff from your transformation.

### Water Jug Problem

> Given two jugs of water of capacities $<C_1, C_2>$ and no markings on them,
> how can you get precisely $<x, y>$ amounts of water in them starting with
> state $<i_1, i_2>$

For us, the following instance:

initial state: $<0,0>$

goal state: $<2,y>$, where $y$ is any amount of water $0 \le y \le 3$

> Let's use the AIPS method to approach this problem.

Such that:

$DB = \{ <x,y> | 0 \le x \le 4 \text{ and } 0 \le y \le 3 \}$

initial state: $<0,0>$

goal state: $<2,y>$, where $y$ is any amount of water $0 \le y \le 3$

**How to go about the solution?**


Control strategy 
- irrevocable: you cannot take back moves, once you have conducted a transformation, you cannot go back.
- tentative: you try a transformation, but if you end up at a dead end, then you can turn back.

We could try randomly searching for a solution, but it's better to be systematic about our approach.

Take an initial state and see what rules apply:

(0,0) --> (4,0), (0,3)

(4,0) --> (4, 3), (1, 3)
(0,3) --> (4, 3), (3,0)

Eventually, you would find the solution you seek by following the nodes of this state-tree.










