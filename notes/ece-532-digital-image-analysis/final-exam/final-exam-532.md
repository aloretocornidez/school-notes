# ECE 532 Final Exam
Name: Alan Manuel Loreto Cornídez
NedId: aloretocornidez

## Question 1
![[Pasted image 20230510131519.png]]
![[Pasted image 20230510131533.png]]
### Part A
![[Pasted image 20230510131917.png]]

$$h_{1} = \begin{bmatrix} 
0 && -1 && 0 && 1 && 0 \\ 
-1 && -1 && 0 && 1 && 1  \\ 
0 && -1 && 0 && 1 && 0 \\ 
\end{bmatrix}$$

Center Pixel: 

$$f_{1} = 
255 + 255 + 255 + 255 = 1020
$$

### Part B

$$h_{1} = \begin{bmatrix} 
0 && 1 && 0  \\ 
1 && 1 && 1 \\ 
0 && 0 && 0 \\ 
-1 && -1 && -1 \\ 
0 && -1 && 0 \\ 
\end{bmatrix}$$

Center Pixel:
$$f_{2} = 4 (255) + - 255 = 765$$

### Part C
$$\frac{\partial f_{1}}{n_{1}} = 255$$
$$f_{1} = 1020 $$
$$\frac{\frac{\partial f_{1}}{n_{1}}}{f_{1}} = \frac{1}{4}$$

Second one
$$\frac{\partial f_{2}}{n_{2}} = 255$$
$$f_{1} = 765 $$
$$\frac{\frac{\partial f_{1}}{n_{1}}}{f_{1}} = \frac{1}{3}$$

$$\therefore s = \frac{1}{3} \frac{1}{4} = \frac{1}{6}$$


### Part D

$$G = \frac{1}{6}\sqrt{765^{2} + 1020^{2}} = \frac{1275}{6} = 212.5$$

$$\theta = \arctan{\left(\frac{f_{y}}{f_{x}}\right)} *\frac{180}{\pi} = 36.87\degree$$

### Part E

Prewitt Operator:
$$h_{1} = \begin{bmatrix}
-1 && 0 && 1 \\ 
-1 && 0 && 1 \\ 
-1 && 0 && 1 \\ 
\end{bmatrix}$$

$$h_{2} = \begin{bmatrix}
-1 && -1 && -1 \\ 
0 && 0 && 0 \\ 
1 && 1 && 1 \\ 
\end{bmatrix}$$

$$f_{1} = 3(255) = 765$$
$$f_{2} = 2(255) - 255 = 255$$

$$G = \sqrt{765^{2}+255^{2}} = 806.38$$
Using the same scalar:
$$G = 806.38 * \frac{1}{6} = 134.396 $$
$$\theta = \arctan \frac{255}{765}* \frac{180}{\pi} = 18.43 \degree$$

### Part F

After calculating both of the edge pixels, it is clear to see that for this situation, the first operator was more accurate for two reasons.
- The first operator rendered a larger gradient value for the center pixel. 
- The angle was also closer to the intuitive $45\degree$ seen from the image. 
The reason I think this is the case (for this problem) is because we take a larger $h_{1}$ window. This takes into account that the pixel edge is an actual edge and not noise.


## Question 2

![[Pasted image 20230510135748.png]]
![[Pasted image 20230510135753.png]]


### Hough Array Population Steps
Parameterize the equation so that the bottom left of each pixel is the coordinate point. I.E., $(0,0)$ and $(0,2)$ are edge pixels.

If the parameterized line is $\pm \frac{1}{3}$ of the pixel value, the pixel is included in the Hough Array generation.

The Hough Array is parameterized as follows:
- Y-Axis, $b$ values (-1 is bottom, 4 is top)
- X-Axis, $m$ values. (-2 is left, 2 is right)

Here is the generated Hough array:

$$H = \begin{bmatrix}
1 && 2 && 2 && 0 && 0  \\ 
0 && 0 && 1 && 0 && 0  \\ 
0 && 1 && 1 && 1 && 0  \\ 
0 && 0 && 0 && 1 && 1  \\ 
1 && 1 && 2 && 3 && 1  \\ 
0 && 0 && 0 && 0 && 0  \\ 

\end{bmatrix}$$

As seen in the Hough Array above the best threshold to minimize false positives in this image is a threshold of Hough parameters $H[j,k] \gt 2$. This way, the only line that is detected is $y = (1)x + 0$


## Question 3
![[Pasted image 20230510141015.png]]


Here are some improvements off the top of my head:
- When selecting the threshold, find the deepest valley between classes of objects $J(t)$. This means that we use the value that creates the best division between different groups as discussed in Cho's correction term (image shown below) 
![[Pasted image 20230510142058.png]]

- Another method to use gradient information is by including the gradient in an adaptive thresholding method, that is, change the threshold for a section of an image by using the gradient values present in that area. This can help a lot when trying to binarize text in an image, so if a gradient is larger within an area, the threshold should also be higher to minimize the amount of text information that is lost when binarizing the image. 

- One last method that I would use to maintain accuracy is to use the gradient to determine when the scene changes in an image (a face with half of the face in the sun and the other half in the shade).  For example if there is a large gradient that is present in the image, but the average of the pixels at that large gradient point does not change, we can assume that the pixel is an edge pixel, however, of the gradient of the pixels is large but the surrounding pixels also have a different local average, we can assume that a change in scene has occurred. This is similar to the adaptive thresholding technique. 

## Question 4
![[Pasted image 20230510142418.png]]

![[Pasted image 20230510143141.png]]

Input Image:

$$\begin{bmatrix}
0 && 1 && 0 && 1 \\ 
1 && 0 && 1 && 0 \\ 
1 && 0 && 1 && 1 \\ 
1 && 1 && 1 && 0 \\ 

\end{bmatrix}$$

Four-Connected Auxilary Matrix:

$$\begin{bmatrix}
0 && 1 && 0 \\ 
1 && x && 1 \\ 
0 && 1 && 0 \\ 
\end{bmatrix}$$
Where $x$ is the pixel being examined.

Running the algorithm across rows:

$$\begin{bmatrix}
0 && 1 && 0 && 1 \\ 
1 && 0 && 1 && 0 \\ 
1 && 0 && 1 && 1 \\ 
1 && 1 && 1 && 0 \\ 
\end{bmatrix}
\text{Finding 4-connected components}
  \begin{bmatrix}
0 && 1 && 0 \\ 
1 && x && 1 \\ 
0 && 1 && 0 \\ 
\end{bmatrix}
$$

Iterations: 
First Row
$$\begin{bmatrix}
0 && 0 && 0 && 0 \\ 
1 && 0 && 1 && 0 \\ 
1 && 0 && 1 && 1 \\ 
1 && 1 && 1 && 0 \\ 
\end{bmatrix}$$

Second Row:
$$\begin{bmatrix}
0 && 0 && 0 && 0 \\ 
a && 0 && b && 0 \\ 
1 && 0 && 1 && 1 \\ 
1 && 1 && 1 && 0 \\ 
\end{bmatrix}$$

Third Row:
$$\begin{bmatrix}
0 && 0 && 0 && 0 \\ 
a && 0 && b && 0 \\ 
a && 0 && b && b \\ 
a && 1 && b && 0 \\ 
\end{bmatrix}$$

Fourth Row (And Final Iteration):
Both are part of an object and are connected, so the label changes to the same label (in this case, the lower letter, $a$)
$$\begin{bmatrix}
0 && 0 && 0 && 0 \\ 
a && 0 && a && 0 \\ 
a && 0 && a && a \\ 
a && a && a && 0 \\ 
\end{bmatrix}$$


## Question 5 
![[Pasted image 20230510144429.png]]

![[Pasted image 20230510144445.png]]

Given:
$$\begin{bmatrix}
1 && 1 && 1 && 1 && 1 \\ 
0 && 1 && 1 && 1 && 0 \\ 
1 && 1 && 1 && 1 && 0 \\ 
1 && 1 && 1 && 1 && 1 \\ 
1 && 1 && 1 && 0 && 1 \\ 
\end{bmatrix}
\ominus
  \begin{bmatrix}
1 && 1 \\ 
1 && 0 \\  
\end{bmatrix}
$$

Beginning iterations (First Row):
$$\begin{bmatrix}
0 && 1 && 1 && 1 && 0 \\ 
0 && 1 && 1 && 1 && 0 \\ 
1 && 1 && 1 && 1 && 0 \\ 
1 && 1 && 1 && 1 && 1 \\ 
1 && 1 && 1 && 0 && 1 \\ 
\end{bmatrix}
$$

Second Row:
$$\begin{bmatrix}
0 && 1 && 1 && 1 && 0 \\ 
0 && 1 && 1 && 0 && 0 \\ 
1 && 1 && 1 && 1 && 0 \\ 
1 && 1 && 1 && 1 && 1 \\ 
1 && 1 && 1 && 0 && 1 \\ 
\end{bmatrix}
$$

Third Row: 
$$\begin{bmatrix}
0 && 1 && 1 && 1 && 0 \\ 
0 && 1 && 1 && 0 && 0 \\ 
1 && 1 && 1 && 0 && 0 \\ 
1 && 1 && 1 && 1 && 1 \\ 
1 && 1 && 1 && 0 && 1 \\ 
\end{bmatrix}
$$

Fourth Row:
$$\begin{bmatrix}
0 && 1 && 1 && 1 && 0 \\ 
0 && 1 && 1 && 0 && 0 \\ 
1 && 1 && 1 && 0 && 0 \\ 
1 && 1 && 1 && 0 && 0 \\ 
1 && 1 && 1 && 0 && 1 \\ 
\end{bmatrix}
$$

Final Row (Output Array):
$$\begin{bmatrix}
0 && 1 && 1 && 1 && 0 \\ 
0 && 1 && 1 && 0 && 0 \\ 
1 && 1 && 1 && 0 && 0 \\ 
1 && 1 && 1 && 0 && 0 \\ 
0 && 0 && 0 && 0 && 0 \\ 
\end{bmatrix}
$$

The final output array is given above. If the size of the mask requires that all  rows and columns contain at least 1 non-zero number, then the appropriate array size is $4\times4$ rows$\times$ columns.

If that is the case, then the final array is as follows:
$$\begin{bmatrix}
0 && 1 && 1 && 1 \\ 
0 && 1 && 1 && 0 \\ 
1 && 1 && 1 && 0 \\ 
1 && 1 && 1 && 0 \\ 

\end{bmatrix}
$$

## Question 6
![[Pasted image 20230510145438.png]]

### Answer
The order of operations in it's elementary form is:

Dilation, erosion, dilation, erosion, erosion, dilation.

This operation will find the islands that are in an image. In other words, it will isolate all separate connected components that are smaller than the mask, $S$, used in the operations.



## Question 7
![[Pasted image 20230510150148.png]]

$f = 6$ cm
$b = 10$ cm
spacing: $10$ mm

Focal range: 2 meters.
Given the formulas:

![[Pasted image 20230510151132.png]]


Using $$-z = \frac{bf}{d}$$

We can plug in our values

$$-z = \frac{10*10^{-2}*6*10^{-2}}{10^{-3}*2}= 0.3$$

$$x_{R} = x_{L} - D = 200 - 2 = 198$$
$$y_{R} = y_{L} - D = 200 - 2 = 40$$


## Question 8 
![[Pasted image 20230510150159.png]]
![[Pasted image 20230510150204.png]]






## Question 9 
![[Pasted image 20230510150218.png]]
![[Pasted image 20230510150223.png]]
![[Pasted image 20230510150228.png]]


### Part A
$D = \frac{2 |G \cap A|}{|A| + |G|}$

$D = \frac{8}{19} = 0.421$

### Part B

$J(G,A) = \frac{|G \cap A|}{|G| + |A| - |G \cap A|} = \frac{8}{9 + 10 - 8} = 0.72$

### Part C
The maximum of the minimum distance between the pixels in set $G$ and set $A$ is 2 pixels. 

$\therefore H = 2$







