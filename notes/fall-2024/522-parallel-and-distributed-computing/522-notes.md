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



























































## Lecture 2 | August 29th

#todo Missed notes


### What's a process?
Informally: A program execution

A process encapsulates a physical processor
Everything needed to run a program:
	- code
	- registers
	- stack
	- data
	- files

*Note: A process is sequential*
There is no parallelism in a processes

**Examples of Processes**
Shell: creates a process to execute commands `ls foo`,, `ls foo & cat bar & wc`

OS: creates a process to manage printer
- process executes code such as 
- - wait for data to come into system buffer
- Move data to #todo 


**Creating a Process**

Must somehow specify code, data, files, stack, registsers

Example: UNIX
- Use the `fork()` system call to create a process
- Makes an exact duplicate of the current process
- Typically `exec()` is run on the child

*We will not be doing this `(systems programming)`*


**Example of Three Processes**

The OS switches betweeen the three processes `("multiprogramming")`.

Review: Run-Time Stack

```c
A(int x)
{
	int y = x;
	if(z == 0 ) return;
	else return A(y - 1) + 1
	
}

B()
{
	int z; 
	A(1);
}
```


**Decomposing a Process**
Process: everything needed to run a program
Consists of:
- Thread(s)
- Address space

**What is a Thread?**


**What is an Address Space?**
Consists of:
- Code
- Data
- Open Files

Address space can have > 1 thread
- Threads share code, data files
- Threads have separate stacks and registers


**One Thread, one address space**

**Many threads, one address space.**

### Thread States

There are three states for a thread

1. Ready
	- Eligible to run, but another thread is running
2. Running
	- Using CPU
3. Blocked
	- Waiting for something to happen

**Thread State Graph**

![[Pasted image 20230829084501.png]]


### Scheduler

The scheduler decides which thread to run.

It chooses what thread via an algorithm.

From our point of view, the scheduler is something we cannot control.
	- We have no idea which thread will run, and **our programs must not depend on execution order of two ready threads**.



### Context Switching
This is the action of switching between two threads.

Switching between 2 threads
- change PC to current instruction of new thread
	- might need to restart old thread in the future
- must save exact state of first thread
What must be saved?
- registers (including PC and SP)
- what about stack itself?




#### Procedure Call Breakdown (time goes down)

![[Pasted image 20230829085453.png]]

---

![[Pasted image 20230829085510.png]]


---

#### Context Switching Breakdown (time goes down)

![[Pasted image 20230829085644.png]]

---

![[Pasted image 20230829085652.png]]

---

![[Pasted image 20230829085712.png]]



### Multiple Treads, One Machine (Single Core)

![[Pasted image 20230829090125.png]]

Note that there are two threads.
Recall, the code, data, and files, are shared in the address space.

- First we start thread 1 and put it in the machines *actual* PC, SP, R1, and R2

- Then to switch to thread 2, we save the machine's memory in a location.

- Thread 2 is then executed by placing the PC, SP, R1, and R2 in the machine memory. 








# Missed Lecture on September


# September 5 | 


## Steps to Parallelization

### 1 | Find Parallelism
- Concerned about what can *legally* execute in parallel
- At this stage, expose as much parallelism as possible
- Partitioning can be based on data structures or by function.

### 2 | Control (Potentially Coarsen) Granularity
- You must trade off advantages/disadvantages of fine granularity
	- Advantages: Better load balancing, better scalability
	- Disadvantages: process/thread overhead and communication
- Combine small threads into larger ones to coarsen granularity
	- Try to keep the load balanced.


### 3 | Distribute Computation and Data
- Assign which processor does which computation.
- If memory is distributed, decide which processor stares which data (why is this?)
- Goals: minimize communication and balance the computational workload.
	- often conflicting


### 4 | Synchronize and/or Communicate 

**On a shared memory machine:**
Memory synchronization comes in two forms: mutual exclusion and Sequence control

*Mutual Exclusion*:
*Sequence control*: 'something better happen before something else'

**On a distributed-memory machine**: you communicate using message passing, typically communication involved implicit synchronization.

```c
process worker [i = 0 to p-1] {
	double A[n][n], B[n][n], C[n][n] // wasting space!
	startrow = i * n / p; endrow = (i+1) * n / p – 1
	if (i == 0) { // The first threadshall send the data to all other cores.
		for j = 1 to p-1 {
			sr= j * n / p; er = (j+1) * n / p – 1 // Calculate other cores' 
			send A[sr:er][0:n-1], B[0:n-1][0:n-1] to process j // 
}
else
receive A[startrow:endrow][0:n-1], B[0:n-1][0:n-1] from 0

```


**Adaptive Quadrature**
Sequential (Recursive) Program

Parallelism can be done by exploiting data structures (like the matrix multiplication) and via exploitation of functions (Like this numerical integral analysis)


```c

double f()
{
	...
}

double area(a, b)
c := (a+b)/2

coumpute area of each half and area of whole

if(close)
{
	return area of whole
}
else
{
	return area(a,c) + area(c,b)
}
```

Challenge with Adaptive quadrature
- For efficiency, we must control the granularity
	- Without this control, the granularity will be too fine
	- Can strop thread creation after "enough" threads are created.
		- This is hard in general because we do not want cores to idle either.
	- Thread implementation can perform work stealing
		-* Idle cores take a thread and execute that thread*. Care must be taken to avoid synchronization problems and/or efficiency problems.

### 5 | Assign Processors to Tasks
(Only if using task and data parallelism)
- Must also show dependencies between tasks
- Usually task parallelism is used if limits of data parallelism are reached.


### 6 | Parallelism-specific optimizations
- Examples:
	- message aggregation
	- overlapping communication with computation
		- Most of these refer to message-passing programs (targeting distributed-memory multi-computers)


### 7 | Acceleration
- Find parts of the code that can run on GPU/FPGA/Cell/etc., and optimize those parts
- This step is difficult and time consuming, but it may be quite worth it.



























































