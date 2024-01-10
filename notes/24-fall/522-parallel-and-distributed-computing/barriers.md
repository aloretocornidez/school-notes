# Barriers

Barriers are statements that ake threads not be able to execute until all threads have reached that point in code (`__threadsync` in cuda).

There are multiple types of barriers:
- Centrailized Barriers 
- Symmetric Barriers 

## Centrailized Barrier



## Symmetric Barrier

(Two Threads)


## Dissemination Barrier 


```
int arrive[0:P] = {0, 0, ..., 0}

```
Thread i's code:
```
for j = 1 to ceiling(log(P)) {
    while (arrive[i] != 0);
    arrive[i] = j;
    lookAt = (i + 2^{j-1}) mod P 
    
    while (arrive[lookAt] != j); 
    arrive[lookAt] = 0;
}
```


