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


Next: [[Data Level Parallelism vs Task Level Parallelism - Module 5]]









