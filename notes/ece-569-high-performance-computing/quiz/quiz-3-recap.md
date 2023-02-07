Move frequently accessed data to fast memory

- local < shared << global << host

Local is either in registers or in L1 cache.




1. Assume that a kernel is launched with 800 thread blocks

Max number of resident threads per SM: 2048
Max # of 32-bit registers per thread block: 64 K


To maximize the number of threads on a CUDA compute capability 6.1, how many registers per thread should be used?

$$\frac{2^{6}*2^{10}}{2*2^{10}} = 2^{5}$$



5. Bandwidth

Which configuration is compute bound?
The kernel performs 96 floating point operations and 20 32-bit global memory accesses per thread.

$$\frac{GB}{s} \rightarrow \frac{FLO}{s}$$

$$\frac{GB}{s}*\frac{f_{p}96}{B_{20(4)}}$$





6. For the color space conversion kernel, which thread block configureation will result with the best thread utiliztion per SM on a device with the following features:
- Max number of threads per blocks: 1024
- Maximum number of threads/SM: 2048
- Maximumm number of resibent blocks/SM: 16

$5*16 = 80$
$14*32 = 448$
$36*32 = 1152$
$20*16 = 320$
$25*16 = 400$















