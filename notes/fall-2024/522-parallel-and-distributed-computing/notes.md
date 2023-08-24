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
- Invalidate + Write Through
	- 
- Update + Write through
	- All values are updated

Race conditions are when there are reads before the value in the read location can be updated.




### SIMD Machine (e.g. Connection Machine)

- Instructions are broadcast; implicit synchronization between instructions is present.
- Many cores execute the same instruction
- Like a GPU

> You cannot let each core have its own program counter

### Distributed Memory Multicomputer
- Memory is not shared
- Also a MIMD machine.
- $n$ CPU's each have independent cache and independent local memory, all blocks are then connected through an interconnection network.

### Key Advantages/Disadvantage: Shared-Memory Multiprocessors
*Advantage*: Can write a sequential program, profile it, and then parallelized the expensive parts. 
*Disadvantage*: Does not scale to large core counts because of memory bus saturation and hardware complexity.


### Key Advantages/Disadvantage: Distributed-Memory Multicomputers
*Advantage*: Can scale to large numbers of nodes
*Disadvantage*: Harder to program because you must modify the entire program even if only a small part needs to be parallelized.

### Hybrid Machines
**Non-Uniform Memory Access Time (NUMA) shared memory machines**
Memory is physically distributed memory in the hardware, by the user sees a shared-memory model, hardware is what actually satisfies the remote memory request.

Most multi-core machines are actual NUMA

Even if the programmer can use shared-memory programming models, the programmer must pay attention to locality (spatial and temporal) for maximum performance

### The Cloud
Cloud computing is generally thought to be aimed at distributed computing, but this is not really true any more.

- Examle: Amazon EC2 and HPC cluster nodes.

Many clouds have nodes with GPU's and FPGA's


### High End Architectures

**BlueGene/L (Lawrence Livermore National Lab)**
- \# 1 in the world from 2004 - 2007
- Allowed up to 120K cores on 60K nodes
- It focused on using **lots of slow machines** instead of a smaller amount of fast machines.
- 1 MW of power

**Jaguar (Oak Ridge National  Lab)**
- \#1 in the world in 2009
- 224,000 Opteron cores with 18,688 compute notes
- Infiniband network (low latency and high memory bandwidth)
- 7 MW of power
	- A lot of power for 1.75 petaflops

**Tianhe-1A (China)**
- Overtook Jaguar in 2010 (4 petaflops peak)
- 14K Xeons plus 7K GPU's 
- Custom networks; twice the performance of Inifiniband
- Consumes 4 MW of power

**K-Computer (Japan)**
- 8 Petaflops (\#1 in 2011)
- 88K sparcs at 8 cores each

**Sequoia \[BG/Q\] (IBM/Lawrence Livermore)**

**Tianhe-2 (China)**

**Summit (IBM/Oak Ridge)**


**Frontier (Oak Ridge)**
1.6 Exaflops
9,408 nodes
4 GPUs and one CPU per node
1 TB memory/node
Between 20 and 30 MW of power

> Will we be able to get near an Exaflop for typical non "race car" applications?

Memory is coherent across CPU's and GPU's
- Eliminates copy time between CPU's and CPU's

4 TB on-node non-volitial memory
- Helps with large data sets and especially with checkpointing

CPU has modest nominal cycle time: 2.0 GHz
- 'Turbo' mode allows cycle time increase to 3.5 GHZ, but total CPU power consumption max is 280W

Slingshot interconnect
- Provides adaptive routing and congestion management
- Can support many topologies, but configured as a dragonfly
- We will talk about interconnects next




### Interconnects
> How are the nodes of a system connected?
Critical question for efficiency, as HPC programs commmunicate.


**Torus Network**
Each node has six neighbors
If dimensions are $N \times N \times N$, the worst case number of hops is $\frac{3N}{2}$ (or $\frac{5N}{2}$ for $N^{5}$)

**Dragonfly Network**
The number of hops is independent of the number of nodes
























































