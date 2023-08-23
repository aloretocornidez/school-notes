# CSC 522 | Parallel and Distributed Computing


## Lecture 1 | August 22
**Sequential Computer**
CPU --> Cache --> Bus --> Memory

**Shared-Memory Multiprocessor ("Multicore")**
Memory is shared; Cache coherence is an issue
*MIMD* machine; each core can execute independent instruction streams.

### Cache Coherence
- Cached copies must remain coherent
You can: 
- Invalidate all but one cached copy
- Update all cached copies

**Different coherence schemes**
- Invalidate + Writeback
	- Cache controller invalidates all copies except the writer's
	- When $C_{1}$ writes $x=0$, it invalidates the data in $C_{0}$
- Update + Writeback
	- Cache controller updates the 
- Invalidate and Write Through
	- 
- Update and Write through
	- All values are updated



































