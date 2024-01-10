# Cuda Memory Review


This piece of code finds the global memory average

```
__global__ void global_memory_average(intv*array, float* average, int size)
{  
	int i, index = threadIdx.x;  
	float avg = 0.0f;  
	int sum = 0;  
	
	for (i=0; i<index; i++)  
		sum += array[i];  
	
	if (index>0)  
		avg = sum/(index+0.0f);  
	
	average[index] = avg;  
}
```








