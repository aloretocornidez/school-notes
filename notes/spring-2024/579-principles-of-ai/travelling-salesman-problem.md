# Traveling Salesman Problem

Given the following nodes used to denote costs and destinations:

![Traveling Salesman Problem](assets/imgs/graph-travelling-salesman-problem.png)

$$f(n) = g(n) + h(n)$$

When using A\* to solve this problem, you gain:

- the guarantee of finding the best solution
- We now have a certain level of efficiency

When imposing the monotone restriction, you can narrow down the search any make
it more efficient.

Working with the 8-puzzle, you can find the heuristic values of a node by
taking the sum of all of the out of place nodes and then adding the number of
steps that it took to get there.



