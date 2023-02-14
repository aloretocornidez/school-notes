# Matrix Multiplication


### Warp Divergence

GPUs have predicated instructions which are carried out only if a logical flag is true.

```c
p = (i & 0x01);
p: x[i] = x[i] + 1;
!p: x[i] =x[i] + 2;
```

*Execution Cost*
All threads execute both conditional branches, so execution cost is the sum of both branches


### Matrix Multiplication (Square Matrices)

*Vector Multiplication*
Generate a grid of threads that covers the entire output array
Convention: Row, Col is the element at Rowth positinon in the (y) vertical direction and the Colth position in the (x) horizontal direction.

$$P_{Row, Col} = \sum\limits M_{row, k} * N_{col, k}$$
where, $k = 0, 1, \dots, \text{Width} - 1$

```c
if ((Row < Width) && (Col < Width)) 
{  
	float Pvalue = 0;  
	// each thread computes one element of the block sub-matrix  
	for (int k = 0; k < Width; ++k) {  
		Pvalue += M[Row*Width+k]*N[k*Width+Col];  
	}
	
	P[Row*Width+Col] = Pvalue;

}
```



### Thread Blocks: Natural Tiling of the Matrix

- Thread-to-data mapping
	- divides P into tiles
- Thread Block
	- Matrix divided into TILES
		- Block_Width x Block_Width

Good: when threads have similar access timing
Bad: when threads have a very different timing



### Phase Based Execution












