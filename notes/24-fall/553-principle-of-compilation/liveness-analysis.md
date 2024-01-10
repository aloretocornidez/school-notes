# Analysis 2 | Liveness Analysis
Definition: A variable is live a a program point `p` if the value my be used at a later point `w` without getting redefined between `p` and `q`.

Dataflow Sets 
- `in` is the set of variables that are live at the entry of the block. 
- `def` are the set of variables definitely assigned to within the block within before being used. 
- `use` are the set of variables that may be used in the block prior to being defined.



## Equations and Algorithm
This is the formula for calculaitng the liveness of the in and outsets. 


```in[B] = use[B] \union (out[B] - def[B])```
```out[B] = \union {in[X] | X is a successor of B}```

### Algorithm 
This is the algorithm:

```
for each basic block B, set in[B] = use[B]

repeat:
    for each basic block B {
        out_+1[B] \union {in[X] | X is a successor of B};
        in[B] = use[B] - (out[B] - def[B]);
        
    }

until no change to in[B] or out[B] for any B.
```






