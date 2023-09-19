
# Readings | CSC 522




## Frontier System
The Frontier system was an exascale computer system designed and build by HPE, Cray, and AMD, and installed at Oak Ridge National Labratory (ORNL) in Tennessee for the Department of Energy

Different kinds of layouts:
- Dragonfly Network
- Flattened Butterflies
- Fat Trees
	- Bandwidth of the roots of the tree is larger than at the ends of the tree.

**Applications Development**
- Chemistry and Materials
- Co-Design
- Data Analytics and Optimization
- Earth and Space Science
- Energy
- National Security







## Dragonfly Network (Sections 1 - 2)
Two prominent implementations of multi-level direct networks are the PERCS interconnect by IBM and the Cascade system by Cray.

First, we consider different alternative routings with adaptivity and study their impact on network throughput. 
Second, we consider representative job workloads at supercomputing sites and simulate different routings and job placement strategies for these workloads. 
Third, this paper presents analysis for the dragonfly network at an unprecedented scale (8.8 million cores).




## Eraser | A Dynamic Race Detector for Multi-threaded Programs

Definitions: 

- Lock: A lock is a simple synchronization object used for mutual exclusion. It is either available or owned by a thread. Only the owner of a lock is allowed to release it. 
- Data Race: a data race occurs when two concurrent threads access a shared variable and when at least one access is a write and the threads use no explicit mechanism to prevent access from being simultaneous.
- Happens before: memory accesses are separated by synchronization events.
- Happens-after: 


Related Work:
- `lock_lint` and the Extended Static Checker are compile time (static) race detection systems that work in the presence of dynamically allocated stared data. However, they require statistically reasoning about the program's semantics.







