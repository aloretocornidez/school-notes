**Professor Information**
Name: Ali Akoglu
Email: akoglu@arizona.edu



# Introduction
January 12, 2022

### Computation Patterns
These are problems that can be parallelized, how do we determine if/when we should use parallelization to optimize our problems?
- Matrix Multiplication
- Reduction: MapReduce problems in big data
- Gather/Scatter: quick-sort, matrix transpose
- Convolution

The way you store memory (one large unit vs four smaller units) can greatly affect the performance of an application.

### Computational Thinking
- Decomposition
	- Breaking big problems into smaller, easier to manage problems
- Pattern Recognition
	- 
- Abstraction
	- 
- Algorithm Design



# Modern Trends in Computing

### Modern Trends
Traditionally, performance improvements were attained by speeding up hardware. Nowadays, programs run in parallel and must be programmed in parallel in order to improve performance.

Are processors today getting faster because we are:
- [ ] We are clocking transistors faster
- [*] We have more transistors available for computation.

Why don't we keep increasing clock speed?
- Power dissipation
- Unreliable operation as transistors get faster.

What are the main trajectories for designing microprocessors?
- Multi-core
	- seek to maintain sequential program execution speed.
	- Out-oof-order execution
- Multi-thread
	- Many, smaller lightweight processors

### Processor Design

CPUs vs GPUs
- CPUs
	- Latency oriented cores
	- Optimized for sequential code performance
	- A single thread executes in parallel.
	- Reducing latency is expensive 
	- Larger cache than GPUs (MB vs kB)
	- Complex control schemes (out-of-order execution and other optimizations.)
	- Few Registers
	
- GPUs
	- Throughput oriented cores
	- Saves chip area and power
	- Smaller cache than CPUs
	- Increasing throughput is cheaper
	- Many registers must be used to have data available for SIMD compute units.

Latency Oriented Devices (CPUs)
- Powerful ALUs
	- Reduced arithmetic operation latency
- Large Caches
	- Convert long latency memory accesses to short latency accesses (Spatial and Temporal Locality)
- Sophisticated Control
- Neither control logic nor cache memories contribute to peak calculation throughput.

Throughput Oriented Devices (GPUs)
- Small Caches
	- To boost memory thoughput
- Simple control
	- No branch prediction
	- No data forwarding
- Energy efficient ALUs
	- Many, long latency but heavily pipe-lined for high throughput.
- Require massive number of threads to tolerate latencies
	- Threading Logic
	- Thread State


**Best Strategy : Use both CPUs and GPUs**
- Use CPUs for sequential parts of execution where latency matters
- Use GPUs for parallel parts where throughput wins.

### Latency Devices vs Throughput Devices
Mix of DSP, Programmable, CPU and GPU cores, cellular radios, image processors, audio/video decoders.

- Heterogeneous Parallel Computing
	- Developer must use the best match for the job.

There is a need for Software developers to learn parallel programming.


### Challenges in Parallel Programming
1. It can be challenging to design parallel algorithms with the same level of algorithmic complexity as sequential algorithms.
2. Execution speed of many applications is limited by memory access speed.
3. Many real world problems are described with mathematical occurences, parallelization of these problems requires non-intuitive ways of thinking about a problem.




# GPU Programming Approach
Heterogeneous execution model: CPU is the host, GPU is the device
Develop a C-Like programming language for the GPU
Unify all forms of GPU parallelism as a CUDA thread
Programming model: "Single Instruction Multiple Thread"


## What does CUDA stand for?

- "Compute Unified Device Architecture"
	- When introduced it eliminated the constraints associated with the GPGPU
	- It enables a general purpose programming model
		- User kicks off batches of threads on the GPU to execute a function (kernel)
- Enables explicit GPU memory management
	- CUDA APIs


## Programming Approaches

Developer Resources for GPU computing
- Libraries: developed by exports, common routines
- Compiler Directives: annotated code for compiler as hints
- Programming Languages: Significant coding effort
	- Once you understand the computation on GPU through programming you can easily take advantage of the first two approaches.

## GPU Accelerated Libraries
- Deep Learning: model creation, trainging etx
	- cuDNN
	- TensorRT: building DNN applications
	- DeepStream SDK: allows deployment of deep learning  inference applications
- Linear Algebra
	- cuBLAS: basic linear algebra sub-programs
	- cuSPARSE: sparse matrices
	- cuSOLVER: both sparse and dense matrices, targeted primarily for computation in checmisty, fluid dynamics and comput vision.
- Signal, Image, Video
	- cuFFT
	- NVIDIA NPP
	- CODEC SDK
- Parallel Algorithms
	- nvGRAPH: graph analytics applications
	- NCCL: effectively scalling applications to multi-gpu setups
	- THRUST

[Library descriptions](https://developer.nvidia.com/gpu-accelerated-libraries)

## Libraries
- When computation can be partitioned into common patters
	- **Ease of use**: using libraries enables GPU acceleration without in-depth knowledge of GPU programming.
	- **'Drop-in'**: Many GPU-accelerated libraries follow standard APIs, thus enabling acceleration with minimal code changes.
	- **Quality**: Libraries offer high-quality implementations of functions encountered in a broad range of applications

### Vector addition in the Thrust library
![[Pasted image 20230117110641.png]]

- As you can see, the low-level details of program execution are hidden from the end-user
	- For example, the programmer does not have to know how many threads are being used





## Compiler Directives: Easy, Portable Acceleration
- Ease of Use
	- Compiler takes care of details of parallelism management and data movement
- Portable
	- The code is generic, not specific to any type of hardware and can be deployed into multiple languages
- Uncertain
	- Performance of code can vary across compiler versions


We will be using the CUDA C language  this semester to learn parallel programming.


### Programming Languages: Most Performance and Flexible Acceleration
- Performance
	- programmer has the most control of parallelism and dat amovement
- Flexible
	- The computation does not need to fit into a limited set of library patters or directive types.
- Verbose
	- The programmer often needs to express more details, meaning ***longer code***






### Cuda Parallelism Model - Multidimensional

- Vector Addition Kernel Launch (Host Code)
```cu
__host__ void vecAdd(float* h_A, float* h_B, float* h_C, int n)
{
	dim3 DimGrid((n-1) / 256 + 1, 1, 1);
	dim3 DimBlock(256, 1, 1);
	vecAddKernel<<<DimGrid, DimBlock>>>(d_A, b_B, d_C, n);
}

```


### Vector Addition Kernel
Each thread performs on epair-wise addition.
```cu
__global__
void vecAddKernel(float *A, float *B, float *C, int n)
{
	int i = block.Idx.x + blockDim.x * threadIdx.x;
	if(i < n) C[i] = A[i] + B[i];
}
```
Observations:
1. There is no loop in the code, it is replaced with a grid of threads.
2. With ```(i<n)``` we can operate on arbitrary array lengths.
	1. As long as this guard is in place, potential out-of-bound accesses are prevented when this code is running on multiple threads.


### A Multi-Dimensional Grid Example

- ```dim3 dimGrid(2, 2, 1)```
	- 4 blocks
- ```dim3 dimBlock(4, 2, 2)```
	- 16 threads




# Memory Mapping

# Quiz 2 Overview
1. If we need to use each thread to calculate one output element of a vector addition, what would be the expression for mapping the thread/block indices to the data index?

```cuda

i = blockId.x * blockDim.x threadIdx.x

```

We would use the standard mapping.

2. We want to use each thread to calculate two (adjacent) output elements of a vector addition. Assume that variable i should be the index for the first element to be processed by a thread. What would be the expression for mapping the thread/block indices to a data index of the first element?
- Block Size: 4
- Data Size: 16 elements
- Workload per block: 8 elements
- 2 Thread blocks

```cuda

```



### Efficiency Considerations | Memory Access Stride
With a scalar CPU it is efficient to request sequential elements, i.e. elements next to each other (arrays a\[0] - a\[31])

In a GPU it is important to utilize memory bandwidth, so allowing thread zero to pull the memory and then the subsequent threads to utilize the next steps in memory is critical to allowing better use of memory bandwidth. This means that stride sizes will be larger.






















