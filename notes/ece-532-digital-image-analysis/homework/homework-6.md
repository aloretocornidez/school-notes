# Homework 6

### Problem Description | Texture Analysis
In the following image, where each pixel is represented as a 2-bit grayscale value. The pixel values are undefined outside the region (no padding; not zero).

(a) Calculate the gray-level-co-occurrence matrix, sym.
$C_{45\degree, 1.414}$

(b) Calculate the gray-level-co-occurrence matrix, asym.
$C_{90\degree, 1}$

$\begin{bmatrix}
2 & 2 & 1 & 2 & 3 \\ 
0 & 0 & 2 & 0 & 3 \\ 
1 & 1 & 2 & 1 & 0  \\ 
3 & 1 & 3 & 3 & 2 \\ 
2 & 3 & 3 & 1 & 0
\end{bmatrix}$

![[Pasted image 20230417162557.png]]




### Part A | Calculate the gray-level-co-occurrence matrix, sym.

(a) Calculate the gray-level-co-occurrence matrix, sym.
$C_{45\degree, 1.414}$

Given $\begin{bmatrix} 2 & 2 & 1 & 2 & 3 \\ 0 & 0 & 2 & 0 & 3 \\ 1 & 1 & 2 & 1 & 0  \\ 3 & 1 & 3 & 3 & 2 \\ 2 & 3 & 3 & 1 & 0\end{bmatrix}$ 

Calculate 
 asym. $C_{45\degree, 1.414} = 
\begin{matrix}
 \frac{a}{b} & 0 & 1 & 2 & 3 & \\ 
0 & 0 & 0 & 0 & 0  \\ 
1 & 1 & 1 & 1 & 0  \\ 
2 & 0 & 0 & 1 & 1  \\ 
3 & 1 & 1 & 1 & 1  \\ 
\end{matrix} 
$

Similarity calculating 
 asym. $C_{-45\degree, 1.414} = 
\begin{matrix}
 \frac{a}{b} & 0 & 1 & 2 & 3 & \\ 
0 & 0 & 1 & 0 & 1  \\ 
1 & 0 & 1 & 0 & 1  \\ 
2 & 0 & 1 & 1 & 1  \\ 
3 & 0 & 0 & 1 & 1  \\ 
\end{matrix} 
$

Therefore, 

sym $C_{45\degree, 1.414} = \begin{bmatrix}
 \frac{a}{b} & 0 & 1 & 2 & 3 & \\ 
0 & 0 & 1 & 0 & 1  \\ 
1 & 1 & 2 & 1 & 1  \\ 
2 & 0 & 1 & 2 & 2  \\ 
3 & 1 & 1 & 2 & 2  \\ 
\end{bmatrix}$

### Part B | Calculate the gray-level-co-occurrence matrix, asym.



Given $\begin{bmatrix} 2 & 2 & 1 & 2 & 3 \\ 0 & 0 & 2 & 0 & 3 \\ 1 & 1 & 2 & 1 & 0  \\ 3 & 1 & 3 & 3 & 2 \\ 2 & 3 & 3 & 1 & 0\end{bmatrix}$ 

We can calulate the gray-level-co-occurrence matrix as follows:


$C_{90\degree, 1} = \begin{bmatrix}
 \frac{a}{b} & 0 & 1 & 2 & 3 & \\ 
0 & 1 &0 & 4 & 1  \\ 
1 & 3 & 1 & 0 & 1  \\ 
2 & 1 & 1 & 1 & 1  \\ 
3 & 0 & 3 & 1 & 2  \\ 
\end{bmatrix}$

