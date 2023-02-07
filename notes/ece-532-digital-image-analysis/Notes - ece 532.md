# What is a Digital Image?
A digital image is composed of pixels having discrete values that are provided by a 2D function indexed by a pair of discrete spatial coordinates; those values, when displayed, provide a visual representation of something.
- A digital image is usually stored as an array of pixel values
- A pixel may be a vector of values (e.g., an RGB image).
- A pixel value may include a non-visual quantity (e.g., a range image)
- An animated 'image' is a sequence of digital images that depicts motion when displayed in rapid succession. Thus, we consider it to be a special case of video.

### Where do Digital Images Come From?
**Digital Cameras**
- An array of CMOS or CCD sensor elements.

**Flatbed scanner**
- Scanning/sampling a document or photograph:
$$x(n_1, n_2) = f(x, y)| x=n_1 T_1, y = n_2 T_2$$
Here, $(T_1, T_2)$ indicate the sampling period (e.g., units: m). Coordinates $n_1$ and $n_2$ are integers.

**Mathematical Function**
Example: $$x(n_1, n_2) = (2n_1+n_2)^2$$


**Data Entry**
We can create a 2D signal by simple entering some pixel values into an array.
![[Pasted image 20230117124347.png]]


**Hybrid Sampling**
For example, consider a 1D array of microphones spaced apart by one meter. If we sample the microphone outputs every milisample, then we obtain a 2D array of data, where one dimension is spatian and the other is temporal:
$$f(x, t) for x = 0, 1, ..., M; t = 0, 1, ..., N$$
This is certainly a 2D signal, but whether it qualifies as a digital image may depend on whether one considers the display of its pixel values a visual representation of something.
Nevertheless, image processing/analysis techniques may be applicable.



### Elementary 2D Signals
#functions
**Impulse Function**:
![[Pasted image 20230117124922.png]]

**Unit Step Function:**
![[Pasted image 20230117124943.png]]

### Names for 2D Digital Signals
Common names for 2D input and output signals:
![[Pasted image 20230117125053.png]]
- X and Y are sometimes reserved as the spatial coordinates

Common names for 2D coordinates:
![[Pasted image 20230117125129.png]]


### Common Ways to Define the Axes
Textbook graphs usually have the vertical axis pointing up:
![[Pasted image 20230117125433.png]]

The usual convention is for the top row of the image to be stored first in the digital image file format. Thus, in software implementations, the vertical axis usually points down:
![[Pasted image 20230117125441.png]]


### Graphing 2D Signals

Assumptions:
- Unlabeled dots have value 1.
- Missing dots have value 0.
- Value is 0 outside the shown region.

### Continuous / Discrete / Analog / Digital
**Continuous-Space Continuous-Amplitude Signal**
Also known as an *Analog Signal*
![[Pasted image 20230117125921.png]]

Note that a continuous-amplitude signal may be a discontinuous function in the mathematical sense:
![[Pasted image 20230117125859.png]]


**Discrete-Space Continuous-Amplitude**
Also known as a *sampled-data signal*. This type of singal representation is commonly used for filter design. The impulse response $h(n_1, n_2)$ of a 'digital filter' is usually represented as a discrete-space continuous amplitude signal despite the name.

Example:
![[Pasted image 20230117130309.png]]

**Continuous-Space Discrete-Amplitude Signal**
This type of signal is not commonly used.

Example: 
![[Pasted image 20230117130354.png]]


**Discrete-Space Discrete-Amplitude Signal**
Also known as a *discrete signal*. This type of signal representation is commonly used to represent the input and output signals.

Example: 
![[Pasted image 20230117130508.png]]


### 2D Sinusoidal Signal

Example
$x(n_1, n_2) = 0.5cos(\omega_1 n_1 + \omega_2 n_2)$
where $$\omega_1 = 0.03\pi$$  and $$\omega_2 = 0.04\pi$$

The origin is at the lower left. Size of 100 x 100 pixels.

![[Pasted image 20230117131223.png]]


Note: Digital Frequencies are always measured in units of radians.

### 2D Digital Frequency and Fundamental Period
$$x(n_1, n_2) = cos(\omega_1 n_1 + \omega_2 n_2) $$
Let $\omega_1 = 0.03\pi, \omega_2 - 0.04\pi$. 
Then the overall frequency is $$\omega = \sqrt{\omega_1^2 + \omega_2^2} = 0.05\pi$$

The fundamental period of the signal envelope is calculated as follows:

![[Pasted image 20230117131618.png]]




### Complex Exponential Signals
**Analog Complex Exponential Signal**
$f(x, y) = e^{j(\Omega_1 x + \Omega_2 y + \theta)} = e^{j(2\pi f_1 x_1 + 2\pi f_2 y + \theta)}$






### Discrete -Space Complex Exponential Signal
Let the sampling interval be $T_1, T_2$ with units: m.

![[Pasted image 20230117132258.png]]

Note that $cos()$ and $sin()$ require an argument with units of radians, so we observer the following units:
$n_1, n_2$ ~ unit-less
$\omega_1, \omega2$ ~ rad

### Relation between Analog and Digital Frequency

We have:
$$ \omega_1 n_1 = \Omega_1 x = \Omega_1 n_1 T_1$$
$$ \omega_2 n_2 = \Omega_2 y = \Omega_2 n_2 T_2$$
Thus, the mapping between analog and digital frequency is: 
$$\omega_1 = \Omega_1 T_1$$
$$\omega_2 = \Omega_2 T_2$$

Note that $e^{j(\omega _ 2\pi k )n} = e^{j \omega n}$ for any integer $k$. This applies to both dimensions. Therefore, in both dimensions, we observe the following conclusion: 

> Digital Frequencies $\omega$ and $\omega + 2\pi k$ are indistinguishable for any integer $k$

Thus, when calculating or graphing the frequency spectrum of a 2D digital signal, we only need to consider a $2\pi$ interval for each dimension. For example:
$$-\pi < \omega \le \pi$$
$$0 < \omega < 2\pi$$

### Region of Support
**Definition**: The Rectangular region of support (ROIS) of a signal $x(n_1, n_2)$ is the smallest rectangular region (i.e., the bounding box) in the $n_1 - n_2$ plane that contains all the non-zero samples of the signal.

### Separability
**Definition**: A separable 2D signal $x(n_1, n_2)$ can be expressed as $x(n_1, n_2) = f(n_1) g(n_2)$.

Examples:

$$\delta(n_1, n_2) = \delta_1(n_1) \delta_1(n_2)$$ where $\delta$ is the 1D impulse function.


$$u(n_1, n_2) = u_1(n_1) u_1(n_2)$$

### Sifting Property
Consider a 2D signal $x(n_1, n_2)$. It can be shown that

$$x(n_1, n_2) = \sum_{k_1 = -\infty}^{\infty} \sum_{k_2 = -\infty}^{\infty}{x(k_1, k_2)\delta(n_1 - k_1, n_2 - k_2)}$$

This is known as the sifting property.





### System Notation
A systemn operates on an input signal to produce an output signal.
Sometimes we represent the system by transformation operator $T$.
![[Pasted image 20230119123746.png]]


### Linearity
Definition: When a linear system operaties on the sum of two input signals, the output signal is the sum of the corresponding two output signals, and when a linear system operates on an input signal that has been scaled by a constant, the output signal is scaled by the same constant. This additivity property and scaling property can be stated mathematically as: 
![[Pasted image 20230119123921.png]]

$$T\{ax_1(n_1, n_2) + bx_2(n_1, n_2)\} = ay_1(n_1, n_2) + by_2(n_1, n_2) \forall a, b, x_1, x_2, n_1, n_2$$

where

$$y_1(n_1, n_2) = T{x_1(n_1, n_2)}$$
$$y_2(n_1, n_2) = T{x_2(n_1, n_2)}$$



### Shift Invariance
Definition: When a shift-invariant system operates on a spatially shifted input signal, the otput signal is unchanged except for a shift by thge same amount. This property can be stated mathematically as: 


![[Pasted image 20230119124225.png]]

$$T\{x(n_1-k_1, n_2 - k_2)\} = y(n_1 - k_1, n_2 - k_2) \forall x, n_1, n_2, k_1, k_2$$

Examples:

$y(n_1, n_2) = x^2(n_1, n_2)$ is a shift-invariant system.
$y(n_1, n_2) = n_1 x(n_1, n_2)$ is not a shift-invariant system.

### Impulse Response of a System
Definition: The impulse response (aka point-spread function) $h(n_1, n_2)$ of a system is given by 

$$h(n_1, n_2) = T\{\delta()\}$$

where $T\{\}$ is the transformation operator of the system.
We can illustrate this as follows: 
![[Pasted image 20230119124839.png]]



### Derivation of the Convolution Sum

![[Pasted image 20230119124631.png]]

![[Pasted image 20230119125142.png]]


If we use $y(n_1, n_2)$ as the name of the output signal, then we have:

$$y(n_1, n_2) = \sum_{k_1 = -\infty}^{\infty} \sum_{k_2 = -\infty}^{\infty} x(k_1, k_2) \delta(n_1 - k_1, n_2 - k_2) $$

This is known as the 2D convolution sum.
For comparison, the 2D analog convolution integral is:
$$g(x, y) = \int_{-\infty}^{\infty}\int_{-\infty}^{\infty} {f(\alpha, \beta) h(x-\alpha, y-\beta)} d\alpha d\beta$$


### Convolution Properties

Convolution Operator
$$*\ is\ the\ convolution\ operator$$ $$y(n_1, n_2) = x(n_1, n_2) * h(n_1, n_2)$$

Commutative
$$x*h = h*x$$

Associative
$$(x*h_1) *h_2 = x*(h_1 *h_2) $$

Distributive with respect to Addition

$$x*(h_1,h_2) = (x*h_1) + (x*h_2)$$



# Fourier Transform

### Discrete-Space Fourier Transform
We can represent an arbitrary signal as a linear combination of complex exponential signals.
Definition: The discrete-space 2D Fourier Transform is
$$X(\omega_1, \omega_2) = \mathfrak{F}\{ x(n_1, n_2) \} = $$


### Discrete Fourier Transform (DFT)
For computer-based frequency analysis, we need a discrete representation for frequencies $\omega_1$ and $\omega_2$ so that we can store the Fourier transform in a 2D array. Assume the ROS for $x(n_1, n_2)$ is $0 \le n_1 \le N_1 -1; 0 \le n \le N_2 - 1$.

Definition: The discrete Fourier transform of $x(n_1, n_2)$ is
![[Pasted image 20230119130507.png]]

![[Pasted image 20230119130522.png]]


$$X(k_1, k_2) = \sum_{n_1 = 0}^{N_1 - 1}\sum_{n_2 = 0}^{N_2 - 1} x(n_1, n_2) e^{\frac{-j 2\pi k_1 n_1}{N_1}} e^{\frac{-j 2\pi k_2 n_2}{N_2}}$$
for
$$0 \le k_1 \le N_1 - 1; 0 \le k_2 \le N_2 -1$$


We can think of DFT as samples of the discrete-space Fourier trnsform:
![[Pasted image 20230119130903.png]]

The fast Fourier Transform (FFT) is a fast computational algorithm for computing the DFT. There are various FFT algorithms, which typically have trade-offs regarding speed vs. computational complexity. A very popular FFT algorithm is Cooley & Tukey's radix-2 decimation-in-time FFT.

### Frequency Response
Definition: The frequency response of a linear, shift-invariant system is the Fourier transform of the impulse response:

![[Pasted image 20230119131122.png]]


and is often expressed in terms of its magnitude and phase angle:
$$ H(\omega_1, \omega_2) = |H(\omega_1, \omega_2)|e^{j\angle H(\omega_1, \omega_2)}$$

The frequency response tells us how the system responds to a sinusoidal input signal at a given frequency. If the signal is:

$$x(n_1, n_2) = cos(\omega_1 n_1  \omega_2 n_2 +\theta)$$

then the output signal will be

$$y(n_1, n_2) = |H(\omega_1, \omega_2)| cos(\omega n_1 + \omega_2 n_2 + \angle H(\omega_1, \omega_2))$$

### $H(\omega)$ for Frequnecy Selective Filters
Consider the special case where the frequency response depends only on the magnitude of the 2D frequency:
$$H(\omega_1, \omega_2) H(\sqrt{\omega_1^2 + \omega_2^2})$$


We can describe four basic types of frequency-selective filters:

![[Pasted image 20230119131645.png]]


# Image Resolution
## Spatial Resolution
- Image resolution refers to the amount of detail that can be resolved.
- One way to measure spatial resolution in a printed image is by the maximum number of line pairs (e.g., a black adjacent to a white line) per mm that can be distinguished.
- A resolution target may be used for measuring spatial resolution: 
![[Pasted image 20230119131828.png]]


- In a digital image, one way to measure spatial resolution is by the umber of line pairs per pixel.
- An image containing alternating black and white lines with a thickness of one pixel corresponds to the maximum possible spatial resolution, which is 0.5 line pairs per pixel. If we interpolate such an image by a factor of 2 in each dimension, (e.g., by linear interpolation), then the total number of pixels will increase by a factor of 4, but the spatial resolution will decrease to 0.25 line pair per pixel.
- Outside the technical community, the number of pixels n an image is often referred to as the image resolution, but this does not necessarily correspond to the amount of detail that can be resolved. For example, consider the following 10,000 x 10,000 image which has very poor spatial resolution: 

![[Pasted image 20230119132330.png]]

Down-sampling reduces spatial resolution.
![[Pasted image 20230119132431.png]]


Interpolation creates more pixels, but does not increase spatial resolution. 
![[Pasted image 20230119132829.png]]


Zooming the middle of the prior images confirms that the spatial resolution has not increased. 

![[Pasted image 20230119132928.png]]

### Bit Depth
Bit depth is also known as radiometric resolution.

We see the effect of decreasing the number of bits per pixel (bpp) used to represent the gray level.

8 bpp $\rightarrow$ 256 gray levels
4 bpp $\rightarrow$ 16 gray levels
2 bpp $\rightarrow$ 4 gray levels
1 bpp $\rightarrow$ 2 gray levels

![[Pasted image 20230119133238.png]]

### Histogram
The histogram is a 1D array of counts showing how many pixels have each possible gray values.

8 bpp $\rightarrow$ 256 gray levels
4 bpp $\rightarrow$ 16 gray levels

![[Pasted image 20230119133450.png]]


### Bi-level Image

An image with 1 bpp is referred to as a bi-level image, bitmap, or binary image. However, the term *binary image** is ambiguous as it also refers to the storage of an image file using a non-ASCII representation of the pixel values. For example, the Netpbm image file formats include an ASCII PGM format for grayscale images and a PGM format for binary formats.

![[Pasted image 20230119133813.png]]



## Color Images
### 24-Bit RGB Color Image
- Each pixel includes an 8-bit red value, 8-bit green value, and an 8-bit blue value.
- One method is to store the RGB values for the first pixel, followed by the RGB values of the next pexiel, and so on: RGBRGBRGBRGBRGB...
- Another method is to store all the red values, followed by all the green values, followed by all the blue values: RRRRRRRR... GGGGGGGG... BBBBBBBB...

![[Pasted image 20230119134055.png]]

### Color Mapped Image
- An alternative color image format is to use a look-up table (color map) to store the color values.
- For example, in a 3-bit color mapped image, there are 8 possible colors that can be represented.
- Each element of the array of pixel values is a 3-bit integer index value that indicates which entry in the color map contains the RGB triplet for that pixel.

%%24-bit RBG image 3-bit color-mapped image%%
![[Pasted image 20230124124300.png]]

%%This is the Color Map %%
![[Pasted image 20230124124314.png]]

### Color Coordinate Systems
- sRGB is a standard RGB color space that was developed in 1996, it is used in many device today.
- When using non-negative values of R, G, and B, the color gamut (the range of colors that can be represented) is limited.
- Some color spaces represent color in terms of perceptual quantities:
	- HSL (Hue, Saturation, Lightness)
	- HSV (Hue, Saturation, Value)
- Color spaces with an approximately uniform distance metric:
	- CIELAB (lightness L* and chromatic components a* and b*)
	- CIELUV (lightness L* and chromatic components u* and v*)
- Updated color appearance model with improved properties:
	- CIECAM02 (lightness J, colorfulness M, hue h)


### Image File Formats
**Tagged Image File Format (TIFF)**
- No compression or a form of run-length encoding (RLE).
- Pixel data is stored in a sequence of 'strips' to facilitate image editing.


**Graphics Interchange Format (GIF)**
- GIF suppors image sequences, which can be configured for playback as a video clip.
- Uses Lempel-Ziv-Welch (LZW) compresssion, which was patented in 1985. This led to the development of PNG as an alternative file format.

**Portable Network Graphics (PNG)**
- Released in 1996, is now owned by the Wolrd Wide Web Consortium (W3C).
- Cuntomizable through the use of ancillary chunks.
- A predictor model c(called a 'filter') is used, which predicts the value of each pixel base don the values of previous neighboring pixels.
- Supports:
	- Palette-Color (1, 2, 3, or 8 bpp)
	- Palette-color with transparency
	- Grayscale (1, 2, 3, 4, 8, or 16 bpp)
	- Grayscale with transparency
	- RGB (24 bpp or 48 bpp)
	- RGB with transparency
	- RGB with alpha channel

Sample Hex Dump for a PNG
```
0000000 89 50 4e 47 0d 0a 1a 0a 00 00 00 0d 49 48 44 52  >.PNG........IHDR<
0000020 00 00 01 7e 00 00 01 be 08 02 00 00 00 1b 50 f8  >...~..........P.<
0000040 1f 00 00 00 09 70 48 59 73 00 00 0e c4 00 00 0e  >.....pHYs.......<
0000060 c4 01 95 2b 0e 1b 00 00 20 00 49 44 41 54 78 9c  >...+.... .IDATx.<
0000100 ec dd 7d 5c 54 55 e2 3f f0 0f 08 73 47 61 66 90  >..}\TU.?...sGaf.<
0000120 87 19 43 79 30 40 70 01 d1 00 35 48 13 ac 04 b2  >..Cy0@p...5H....<
```



# Programming for Image Processing | Module 3

### Negative Image
A grayscale image with 8 bits per pixel (bpp) is represented by a 2D array of pixel values with values ranging from 0 to 255. For example, we may define gray level 0 to be black and gray level 255 to be white.


If 𝑥(𝑟, 𝑐) is an input 8-bpp image, then the negative image is defined by
$$𝑦(𝑟,𝑐) = 255 − x(r,c)$$
This causes bright pixels to become dark, and vice versa.

```matlab
function y = negative(x) 

[nrows,ncols] = size(x);  
y = zeros(nrows,ncols,'uint8');  
for r = 1:nrows  
	for c = 1:ncols  
		y(r,c) = uint8(255) – x(r,c);  
	end  
end
return
```

**Faster MATLAB Implementation**

```matlab
function y = negative2(x)  
%NEGATIVE2 Compute the negative of an 8-bit grayscale image  

y = uint8(255)-x;  
  
return
```
This implementation takes advantage of the array calculations in Matlab.


### Image Blur by Local Average Filtering
The simplest way to blur an image is using a local average filter, which is a crude lowpass filter. For an N-by-N local average filter, the value of each output pixel is defined as the mean value of an N-by-N neighborhood of pixel values centered at the corresponding position in the input image. For a 3-by-3 local average filter, the output pixel value is defined by
$$y(r,c) = mean\{ x(r-1, c-1), x(r-1, c),
x(r-1, c+1), c(r+1, c-1), x(r+1, c), x(r+1, c+1)\}$$

**Image Padding**
A common solution is to extend the input image so that the neighboring pixel values needed during the filtering calculation do exist.

__Zero Padding__
The simplest method is zero padding, where we extend the image array with zeros. Let the input image have size $nrows$ by $ncols$. 


%%Zero Padded Array%%
![[Pasted image 20230124133312.png]]

__Non Zero Padding also exists__

![[Pasted image 20230124133301.png]]

__Pixel Replication__

![[Pasted image 20230124133341.png]]

__Symmetric Padding__
![[Pasted image 20230124133442.png]]




### Dynamic 2D Array Allocation in C

Static array allocation
- Allocated on the stack which can be limited on some systems.

Variable Length Arrays
- Apparently very stupid and slow according to Linux Torvalds.

Pseudo-2D Array Using a Vector of Row Pointers

![[Pasted image 20230126130901.png]]
- By using `malloc()` to allocate memory for the pseudo-2D array, it will be allocated on the heap, so it can be used for a large array without risk of stack overflow.
- This example uses `uint8` as the data type, but any data type may be used.
- Here we allocate a 1D array for the row pointers and another 1D array for the data.
- This function uses the `x[]` array as an auxiliary array that holds addresses to the data array, `r[]`
```c
uint8_t **x, *data;  
/* allocate a vector of row pointers */  
x = (uint8_t **)malloc(nrows*sizeof(void *));  
/* allocate a chunk of memory to hold the array data */  
data = (uint8_t *)malloc(nrows*ncols);  
/* initialize row pointers to point to the start of each row */  
for(r = 0; r < nrows; r++)  
x[r] = data + r*ncols;  
/* now we can easily access an array element */  
x[5][7] = 1;
```

### Better Implementation of a Pseudo Array
- It is more efficient to use a single `malloc` call to allocate a chunk of memory large enough to hold the row pointers and the data.
![[Pasted image 20230126131818.png]]

```
x = (uint8_t **)
malloc(nrows * sizeof(void*) + nrows*ncols);
```

- The row pointers will be stared at the beginning of the memory chunk and they will be initialized to the proper values.
- we must be careful about using such arrays. Memory allocated by `malloc` is not automatically freed after exiting a function, so we must explicitly call `free( )` for each chunk that was allocated, passing the corresponding pointer as the argument.


# Edge Detection | Module 4

### What is a Physical Edge?
- A digital image is usually a projection of a 3D scene onto a 3D sensor array. So, let's begin by considering what is a physical edge in a 3D scene.
- How should we define a physical edge in the 3D world?
- Consider some special cases
	- Change in texture of material surfaces?
	- Change in color of material surfaces?
	- Boundary between black and white zebra stripes?
	- Foreground object partially occluding a background object?
	- The faces of a cube?
	- A red ball in front of a blue sky?
- Are edges the same as boundaries?
- Here are some examples of physical edges:
	- Points where there is a significant change in the local orientation of a physical surface (i.e., a significant change in the angle of the surface normal vector).
	- Points where there is a significant change in the tactile properties of a physical surface (e.g., smooth/rough, tile/carpet, wood/stone)


### What is an Edge in an Image?

- It depends on the application.
- Edge detection usually involves finding pixels in a 2D image where there is a significant change in intensity or another attribute (e.g., color or texture).
- An intensity edge in a 2D image sometimes corresponds to a physical edge in the 3D scene, but not always.
	- We may have edges in the image due to shadows that don't correspond to physical edges.
	- Points where there is a change in color may not correspond to physical edges if we require a physical edge to be something one can fell.
	- Diffuse, uniform lighting may result in a low-contrast image where there is no intensity edge at an object boundary.

### 1D Continuous-Amplitude Step Edge

![[Pasted image 20230126134151.png]]

- To detect edges, we have several options:
	- Significant changes in $f(x)$. But how significant?
	- Local extrema of $f'(x)$
	- Zero-crossings of $f''(x)$
- When using this technique, it is important to watch out for noise.







### Algorithms for 1D Continuous-Space Edge Detection

Let $f(x)$ represent the intensity values of a 1D continuous-space signal (e.g., one row of a 2D image).
**Def**: Non-maximum supression (NMS) is the omission of points where $|f'(x)|$ is not a local maximum.

**Algorithm 1**: Edge at $x$ if $|f'(x)|$ is a local maximum and $|f'(x)| \ge threshold$.
- If we skip the thresholding step, then we get many false edges due to noise.
- If we skip the NMS step, we get thick edges or stripts.
- Special Case: local extremum is not a single point.

**Algorithm 2**: Edge is at $x$ if $|f'(x)|\ge threshold$.

### Phantom Edges
Small perturbations due to noise can cause spurious zero-crossings.

![[Pasted image 20230131124357.png]]

### 2D Continuous-Space Edge Detection

Let $f(x,y)$ represent the intensity values of a 2D continopus-space image.

**Def**: The gradient of $f(x)$ is he vector:

$$\vec{\nabla}f(x,y) = \frac{\partial f(x,y)}{\partial x}\vec {i_x} + \frac{\partial f(x,y)}{\partial y} \vec{i_y}$$

Notes:

![[Pasted image 20230131124706.png]]

### Gradient Vector
![[Pasted image 20230131124733.png]]


### Directional Derivative
![[Pasted image 20230202124122.png]]

### Isotropy
![[Pasted image 20230202124135.png]]

### Approximation of Gradient Magnitude
![[Pasted image 20230202124151.png]]


### 2D Gradient of Discrete-Space Image
![[Pasted image 20230202124209.png]]




### First-Difference Operator
![[Pasted image 20230202124225.png]]




### Non-Maximum Suppression

1. Nearest neighbor method
2. Interpolation
	1. Interpolate new gradient values in between pixels



### Sobel Edge Detector
![[Pasted image 20230207124611.png]]


### Argyle Edge Detector
![[Pasted image 20230207124556.png]]


### Macleod Edge Detector
![[Pasted image 20230207124710.png]]




<!-- $$h_{1} = \begin{bmatrix}
-3 & -3 & 5 \\
-3 & 0 & 5 \\
\end{bmatrix}$$


$$h_{1} = \begin{bmatrix}
-3 & -3 & 5 \\
-3 & 0 & 5 \\
\end{bmatrix}$$
-->


### Robinson Operator

$$\begin{bmatrix}

\end{bmatrix}
$$



### Larger Edge Operators
$$
 h_{1} = 
\begin{bmatrix}
-1 & -1 & 0 & 1 & 1 \\
-1 & -1 & 0 & 1 & 1 \\
-1 & -1 & 0 & 1 & 1 \\
-1 & -1 & 0 & 1 & 1 \\
-1 & -1 & 0 & 1 & 1 \\
\end{bmatrix}
$$
You can extend the operators to larger dimensions as well, it is more computationally expensive, but it also provided more control.

### Compass Operators
Instead of using the gradient using two orthogonal derivaties, we can use a separate operator for each direction. Start with Prewitt, Sobel, etc., and then rotate to form operators tuned to each direction.


Compass Operators based on the Sobel Operators:
![[Pasted image 20230207130728.png]]


### Laplacian
The 2nd-derivative version of the gradient is the Laplacian.

**Def**: The Laplacian of $f(x)$ is the scalar,
$$\nabla^{2}f(x,y) = \vec \nabla \cdot \vec \nabla f(x,y) = \partial^{2}f\frac{x,y}{\partial x^{2}} + \partial^{2}f\frac{x,y}{\partial y^{2}}$$
where, 
$$\vec \nabla = \frac{\partial}{\partial x} \vec{i_{x}} + \frac{\partial}{\partial y} \vec{i_{y}}  $$

**Algorithm**: an edge exists at (x,y) if $\nabla^{2} f(x,y) = 0$ and some form of threshold is statisfied.




- Zero-crossing contours usually have single-pixel thickness, so thinning techniques such as NMS are not needed.  
- Need some form of thresholding to suppress spurious and phantom edges.  
- Laplacian-based edge detection generates mostly closed contours, but thresholding usually breaks the contours.  
- The Laplacian is isotropic for the continuous-space case, but only approximately so for the discrete case.  
- More sensitive to noise than the gradient operator.

### Discrete Laplacian-Based Edge Detection

Consider the backward first difference in the $n_{1}$-direction:

$$F_{x}(n_{1}, n_{2}) = f(n_{1} + 1,n_{2}) - f(n_{1}, n_{2})$$

Using this result, apply a backward first difference to get a 2nd derivative estimate:

$$F_{xx}(n_{1}, n_{2}) = $$

![[Pasted image 20230207131534.png]]

Similarly, 
![[Pasted image 20230207131553.png]]


Thus, 

![[Pasted image 20230207131612.png]]


Other discrete Laplacian estimates, which use the diagonal neighbors, have been proposed:
![[Pasted image 20230207131634.png]]




### Zero-Crossing Detection

- The zero crossing usually lies between pixels, so find neighboring pixels where the Laplacian has opposite sign.
- If opposite sign, then define the zero crossing to be at the pixel with smaller Laplacian magnitude.

### Zero-Crossing Detection Code

Let $L(r,c) = \nabla^{2}f(r,c)$

```matla

zc = zeros(nrowc, ncols, ’logical’);  
for r = 1:nrows  
	for c = 1:ncols  
		if L(r,c) == 0  
			zc(r,c) = true;  
		elseif L(r,c) > 0  
			if L(r-1,c-1) < 0 && L(r,c) < –L(r-1,c-1) || L(r-1,c) < 0 && L(r,c) < – L(r-1,c) || ... [check all neighbors]  
		zc(r,c) = true;  
		else % L(r,c) < 0  
			if L(r-1,c-1) > 0 && -L(r,c) < L(r-1,c-1) || L(r-1,c) > 0 && -L(r,c) < L(r-1,c) || ... [check all neighbors]  
			zc(r,c) = true;  
		end  
	end  
end
```

We also need to incorporate thresholding into the above loop or do it as post-processing.



### Zero-Crossing Thresholding

Threshold to suppress spurious or phantom edges.

**Algorithm 1**: Local variance of $f(n_{1}, n_{2}) \ge$ threshold.

**Algortihm 2**: Look at the gradient: $|\vec{\nabla}f(n_{1}n_{2})| \ge$ threshhold

**Algorithm 3**: Look at the laplacian:
![[Pasted image 20230207133004.png]]

**Algorithm 4**:
![[Pasted image 20230207133033.png]]


**Algorithm 5**:
![[Pasted image 20230207133045.png]]

**Algorithm 6**:
![[Pasted image 20230207133055.png]]

Note: Algorithms 5 & 6 require more computation, but they perform better.



### Laplacian of Gaussian (LoG) = Marr-Hildreth Operator
Marr & Hildreth, Proc. Royal Society of London, v. B207, 1980.


They proposed doing edge detection at various scales of resolution.
Use Gaussian smoothing with various $\sigma$ values to control the amount of detail in the edge maps.

For each $\sigma$, find the ZC pf tje Laplacian of the smoothed image. We get a set of edge maps.
We can then plot the results in $x - y - \sigma$ "scale space" for possible further analysis.

*Why the Gaussian Smoothing Kernel?*
- A kernel must suppress high frequencies
- Our kernel must be compact in the spatial and frequency domain
- The Gaussian kernel is proven to optimize the spatial and frequency size.

Note: The Gaussian has minimum width in both spatial and frequency domain. 
Combine the Gaussian smoothing & the Laplacian into a single: 

![[Pasted image 20230207133812.png]]

The Laplacian of a Gaussian is a bandpass filter.


![[Pasted image 20230207134434.png]]

![[Pasted image 20230207134446.png]]


![[Pasted image 20230207134500.png]]

![[Pasted image 20230207134513.png]]

































