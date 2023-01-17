## Modern Trends
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

## Processor Design

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


### Best Strategy : Use both CPUs and GPUs
- Use CPUs for sequential parts of execution where latency matters
- Use GPUs for parallel parts where throughput wins.

## Latency Devices vs Throughput Devices
Mix of DSP, Programmable, CPU and GPU cores, cellular radios, image processors, audio/video decoders.

- Heterogeneous Parallel Computing
	- Developer must use the best match for the job.

There is a need for Software developers to learn parallel programming.


## Challenges in Parallel Programming
1. It can be challenging to design parallel algorithms with the same level of algorithmic complexity as sequential algorithms.
2. Execution speed of many applications is limited by memory access speed.
3. Many real world problems are described with mathematical occurences, parallelization of these problems requires non-intuitive ways of thinking about a problem.










 