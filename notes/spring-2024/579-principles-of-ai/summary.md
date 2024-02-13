# ECE 479 | Summary of Topics

This document contains the main ideas that have been discussed in class along
with a quick summary of the topic.

## Traveling Salesman Problem

The
[Traveling Salesman Problem](https://en.wikipedia.org/wiki/Travelling_salesman_problem)
is a problem that cna be used in many optimization problems. It is somewhat
related to the $P \text{ vs } NP$ problem which asks if every question that is
quickly verifiable is also quickly solvable.

In modern contexts, this problem can be applied to path-finding for map
navigation on a phone, or for path-finding for network packets, or circuit
traces on an ASIC.

In short, the traveling salesman problem is used in AI applications when the
subject of finding the optimal solution is at hand.

## State Space

[State Space search](https://en.wikipedia.org/wiki/State_space_search) is a
process used in computer science in which successive (or states) are considered,
with the intention of finding a goal state with the desired property.

A Problem space has an initial state and a goal state. Rules can be applied in
order to change the state of a system. The rules that are applied in a given
state are determined by the control strategy that is being applied.

## State Space Searches

[State Space Search](https://en.wikipedia.org/wiki/State_space_search]

## Control Strategy

Control strategy in an artificial intelligence scenario is a technique or
strategy that tells us about which rule has to be applied next while searching
for the solution of a problem within problem space.

## A Star Search

[A\* Search | Wikipedia](https://en.wikipedia.org/wiki/A*_search_algorithm)

- This is a path-finding algorithm that can find the best solution (in many
  cases) in a weighted graph.

- However, it uses a lot of memory (space complexity) as it has an $O(b^{d})$
  worst case space complexity.

- A\* can be seen as an extension of Dijkstra's Algorithm that achieves better
  performance by employing the use of heuristics in its search pattern.

## Heuristic Functions

## Graph Search

- Breadth First Search
- Depth First Search
  - Hill Climbing



