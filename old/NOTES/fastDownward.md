# [MuniHac 2019: Fast Downward: Solving Declarative Planning problems in Haskell](https://www.youtube.com/watch?v=riugQmHx0K0)

Foward Chaining State Space Search

Re-encode problem as graph. Nodes are possible states and edges are state transitions.

BFS is a complete search algorithm, if there is a solution it will be found. It is also optimal in the sense that it takes the minimum number of steps.

BFS takes no domain specific knowledge either. We can't guide this search. We have to fight a combinatorial explosion of states.

A* - 1968 - is an approach that informs using heuristics. Maintains a pqueue based on heuristics.

For example in a 2D scenario we can approximate a heuristic with euclidean distance in the 2d grid. While it doesn't correspond to the graph traversal its a cheap heuristic.

```haskell
solve :: SearchEngine -> [Effect a] -> [Test] -> Problem (SolveResult a)
```

25:00 - Your effects need to return metadata on each step solving the problem. This is because SolveResult takes a type which is returned.

TODO what if we modelled certain quest puzzles first??


# [Solving Planning Problems with Fast Downward and Haskell](https://ocharles.org.uk/blog/posts/2018-12-25-fast-downward.html)
