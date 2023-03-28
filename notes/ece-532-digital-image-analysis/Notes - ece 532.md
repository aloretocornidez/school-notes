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

We want the smoothing filter to have its energy concentrated near zero in the frequency domain for behavior as a low-pass filter. We also want it to have its energy concentrated near the origin in the spatial domain so that image analysis is not affected by pixel-intensity activity in other image regions. The Gaussian function is ideal for this purpose since it is the function that minimizes the 'uncertainty' quantity: 

$$U = \left(\int_{-\infty}^{\infty} x^{2} |f(x)|^{2} dx\right)\left(\int_{-\infty}^{\infty} x^{2} |F(\omega)|^{2} d\omega \right)$$

*Why the Gaussian Smoothing Kernel?*
- A kernel must suppress high frequencies
- Our kernel must be compact in the spatial and frequency domain
- The Gaussian kernel is proven to optimize the spatial and frequency size.

Note: The Gaussian has minimum width in both spatial and frequency domain. 
Combine the Gaussian smoothing & the Laplacian into a single: 

The Gaussian smoothing and Laplacian can be merged into a single operator:



![[Pasted image 20230207133812.png]]

The Laplacian of a Gaussian is a bandpass filter.


![[Pasted image 20230207134434.png]]

![[Pasted image 20230207134446.png]]


![[Pasted image 20230207134500.png]]

![[Pasted image 20230207134513.png]]



Prior studies of the human visual system (HVS) found that the ganglion cells in the retina have a center-surround behavior with approximately four spatial-frequency-selective 'channels'. This impulse response of each channel was modeled as a difference of Gaussian's

**Benefits of the Laplacian of Gaussian**
- If you have an image with round shaped objects in the scene, this method will create some 'nice' contours in the scene when compared to previous methods.
- You can change $\sigma$ and allow for different kinds of analysis. Larger $\sigma$'s allow for higher level analysis.




### Logan's Theorem

- Can you re construct an image from the zero crossings in an edge map? Yes!
- Zero Crossing contours provide a very rich representation of an image.

- Logan's Theorem (1977): A one-octave 1D band-pass signal can be completely reconstructed (within a scale factor) from its Zero-Crossings
- Curtis extended this to 2D with certain restrictions.

### Laplace of Gaussian Localization Error

Suppose we want to find the edge map for an impulse function:



### Canny's DroG Edge Detector

Canny showed that the derivative of a Gaussian (DroG) closely approximates an optimal 1D edge detector with the following optimality criteria:
- Good detection accuracy
- Good localization
- Only one response to a single edge


**Implementation**
- Compute $f_{x}$ and $f_{y}$ using separable filtering with the DrOG filter. He reported $\sigma$ values from 0.7 to 8
- Calculate the gradient magnitude
- Do Non Maximum Suppression (NMS)
- Keep a weak edge pixel if it is connected to a strong one, A pixel is a strong edge if it is greater than the upper threshold. Eliminate an edge pixel if the gradient magnitude is less than the lower threshold.
- Feature Synthesis: Start from the smallest scale, then synthesize the larger scale outputs that would occur if there were the only edges present. Then compare the large-scale output tot he synthesized output.
- Canny wrote in his technical report, "A version of the detector which used the Gaussian convolution followed by directional non-maximum suppression has been implemented."






### Hysteresis Thresholding

- Breaking up the edge contours where there were large amounts of curvature exist

Hysteresis is a very important step because it stops spurious edges from appearing in the image. 

There is an upper and lower threshold:
Upper Threshold: A higher threshold to deem whether a pixel is a strong edge.
Lower: How likely you are to throw away an edge, a larger lower threshold causes more discontinuities in the edge map.


### Feature Synthesis
- Mark all edges from the $\text{smallest}-\sigma$ operator.
- Using the responses to the $\text{smallest}-\sigma$ operators, synthesize the response to the next larger $\sigma$ that would have been produced if these were the only edges in the image.
- Synthesize by taking the response to the small operator in a particular direction, and convolved with a Gaussian normal to the edge direction for this operator. Use the Gaussian $\sigma$ of the next-larger operator.
- Compare the actual response to the synthesizes response. Mark additional edges only if the larger operator has significant greater response than the predicted by the synthesized response.
- Repeat for each $\sigma$





# Module 5 | Hough Transform

After doing edge detection, we may want to process the edge map to find straight lines, circles, ellipses, or other shapes.

![[Pasted image 20230214125434.png]]

### Hough Transform Overview
- A powerful, generalization method for finding lines, circles, or other shapes in an edge map.
- Robust - the detection can work even if the edge map has broken contours.
- But the curve or shape must be analytically specifiable.
- Map all edge pixels to a 'Hough Space' and then do peak detection in Hough space.

![[Pasted image 20230214125738.png]]

### Finding Straight Lines
- We need an analytical specification of the curve or shape we want to detect.
- As a first attempt, let's represent a straight line passing through $(x_{i}, y_{i})$ as follows:

$$y_{i} = mx_{i} + b$$

- For each edge pixel $(x_{i}, y_{i})$, identify all the lines passing through it.
- Choose the line (m,b) that passes through the most edge points.

![[Pasted image 20230214130023.png]]


- We will have an auxiliary array called a 'Hough' array that will keep count of how many points each line goes through.
- After you find the amounts of points for each possible equation, you look at the bins in the 'Hough Array' and see which equation has the most points.

*Note:* The $y = mx + b$ cannot represent a vertical line, so we use a polar parameterization instead:
$$\rho = x cos(\theta) + y sin(\theta)$$

![[Pasted image 20230214130501.png]]

### Steps for Detecting Straight Lines
1. Allocate a Hough array, $H(\rho , \theta )$. Quantize $\rho$ and $\theta$ over a desired rance so that the array has finite size.
2. For each edge pixel, $(x_{i}, y_{i})$, fine all lines going through that pixel and increment the corresponding elements in the Hough Array.
3. Apply thresholding and NMS to the Hough array to determine the lines that pass through the most edge pixels

**Algorithm**

![[Pasted image 20230214130759.png]]

Here, $\rho$ and $\theta$ are the array indexes. The actual value is determined based on the starting value and the quantization step size:
$$\rho_{value}= \rho_{0}+ \rho (\Delta\rho)$$
$$\theta_{value}= \theta_{0}+ \theta (\Delta\theta)$$

![[Pasted image 20230214130823.png]]

### Ways to select the Origin

**Origin at the Corner of the Edge Map**
- Non-negative $\rho$
$$- \frac{\pi}{2} < \theta < \pi $$
$$0 \le \rho \le N \sqrt{2}$$

$\Longrightarrow$ # of bins in the Hough array $\propto \left(\frac{3\pi}{2}(N\sqrt{2})\right) \dot{=} 2.12 \pi N$

![[Pasted image 20230214131527.png]]

- Signed $\rho$. Fewer loops but larger Hough array.
$$0 \le \theta < \pi$$
$$\left(\text{or } \frac{-\pi}{2}\le \theta < \frac{\pi}{2} \right)$$
$$-N \le \rho \le N\sqrt{2}$$

$\Longrightarrow$ # bins in the Hough array $\propto (\pi) (N) (1 + \sqrt{2} \dot{=} 2.41 \pi N)$

![[Pasted image 20230214132034.png]]

**Origin at the Center of the Edge Map**
- Non-negative $\rho$
$$-\pi \le \theta < \pi$$
$$0 \le \rho \frac{N}{2}\sqrt{2}$$

$$\Longrightarrow \text{ \# of bins in the Hough array} \propto (2\pi ) \left(\frac{N}{2}\sqrt{2}\right) \dot{=} 1.41\pi N$$



- Signed $\rho$.
$$0 \le \theta < \pi$$
$$\left(\text{ or} \frac{-\pi}{2} \le \theta < \frac{\pi}{2}\right)$$
$$\frac{-N}{2}\sqrt{2} \le \rho \le \frac{N}{2}\sqrt{2}$$

$$\Longrightarrow \text{ \# of bins in the hough array } \propto (\pi) (N\sqrt{2} \dot{=} 1.41 \pi N)$$

*Note: when quantizing $\theta$, try to ensure that horizontal and vertical lines map exactly to a bin center since those are common angles.*

### Non-Maximum Suppression

Test whether the Hough array value is greater than or equal to the neighboring values. At the borders of the Hough array, be carefule to check the correct neighbors. Note that $\theta = \pi$, $\rho = \rho_{0}$ corresponds to $\theta = 0$, $\rho = -\rho_{0}$.

![[Pasted image 20230214132816.png]]

### Using Edge Strength

- The edge detector may provide edge strength information (e.g., gradient magnitude).
- To obtain sharper peaks in the Hough array, let's increment the Hough array bins by $|\vec\nabla f|$ instead of 1.


### Using Edge Orientation
- The edge detector may also provide edge orientation (i.e., gradient direction).
- To obtain sharper peaks in the Hough array, let's increment *only* the Hough array bins located near the edge orientation provided by the edge detector.


### Hough Transform Output

Here's the typical workflow:

![[Pasted image 20230214134022.png]]

It would be helpful to find the endpoints of each line segmen tand fill small gaps.
Then we can display the line segments instead.




### Endpoint Calculation
For each detected line $(\rho, \theta)$, determine $x_{min}, x_{max}, y_{min}, y_{max}$ for edge points along that line.
If the line is moastly vertical, then we just need to find $y_{min}$ and $y_{max}$.

![[Pasted image 20230214134500.png]]

I.e., calculate the Hough array plus two additional arrays:

![[Pasted image 20230214134519.png]]

If the line is mostly horizonal, then we just need to find $x_{min}$ and $x_{max}$.

### Circle Detection

All the circles passing through an edge point $(x_{i}, y_{i})$ can be represented as follows:
$$(x_{i}- a)^{2}+(y_{i}- b)^{2}= r^{2} \text{ } \forall a, b, r$$

**Algorithm**
```pseudo
For each edge pixel(xi, yi)
	For each a
		For each b
			r^2 = (xi - a)^2 + (yi - b)
			Increment H(a, b, r)
		Next b
	Next a
Next edge pixel
```

![[Pasted image 20230216124752.png]]

![[Pasted image 20230216124804.png]]


### Merlin-Farber Algorithm

First, choose an arbitrary reference point, $(x_{0}, y_{0})$.

*R-table*

For each pixel $x_{j}, y_{j}$ along the shape boundary, list the $\vec{R}$ vector pointing form $x_{j}, y_{j}$  to edge pixel $x_{0}, y_{0}$. This forms the 'R-Table': 

$\begin{bmatrix}
R_{x_1} = X_0 - X_1 \\ 
R_{x_2} = X_0 - X_2 \\ 
\dots
\end{bmatrix}$

**Steps**
1. For each edge pixel $x_{j}, y_{j}$, and for each $(R_{x_{k}}, R_{y_{j}})$ in the R-table, increment the bin in the Hough array at $(x_{0}, y_{0}) = (x_{i}+R_{x_{j}}, y_{i}+R_{y_{j}})$.
2. Perform thresholding and NMS on the Hough array to find the coordinate of the strongest detected shapes. The detected coordinates corresponds to the reference points of the detected shapes.

**Algorithm**
```pseudo
For each edge pixel (xi, yi)
	For each R vector
		x0 = 
	Next R Vector
Next Edge Pixel
```

### Ballard's Algorithm

- Assume we know the edge orientation or gradient direction from the edge detector.
- When constructing the R-table, list the gradient direction $\phi(x_{j,}y_{j})$, along with $R_{x_{j}}$ and $R_{y_{j}}$.
















# Module 6 | Segmentation by Histogram Thresholding



### Introduction
- Instead of using edge detection to detect opject boundaries, we may perform image segmentation to group similar pixels to form regions.
- Image segmentation is the dual of image detection.
- The output can be represented as an array where each pixel is assigned to a region label. Alternatively, the output can be represented as a list of regions, where each region consists of a list of pixel locations.
- The region labels may be binary, such as 'foreground' and "background." Or there may be more than two types of region labels.

![[Pasted image 20230216131437.png]]



![[Pasted image 20230216131447.png]]


### Image Partition
Goal: Partition the image into homogeneous regions.

**Def**: Let $A$ be the set containing all pixels in an image (e.g., the pixel coordinates), and let $A_k$ be the set of pixels in region $k$. Then $\cases{A_{k;}k = 1, \dots, N}$ is called the *partition* of A if:

![[Pasted image 20230216131713.png]]

### Image Segmentation

**Def** Let H be some homogeneity measure (e.g., similar intensity, color, or texture). Then a segmentation of image A is a partition satisfying:

1. $H[A_{k}]= \text{True } \forall k$
2. $A_{i} \text{ adj } A_{j} \Rightarrow H [A_{i}\cup A_{j}] = \text{False for all } i \ne j$
3. $A_{k} \text{ is connected (optional)}$ 

Desirable properties of an image segmentation:
- Regions don't have too many small holes
- Region boundaries are smooth
- Region boundaries are consistent with physical edges in the scene.


### Histogram Thresholding

- Consider the histogram of an image feature, such as pixel gray level.
- We can perform image segmentation by histogram thresholding.

![[Pasted image 20230216132239.png]]

Challenges:
- The number of clusters in the histogram may not be clear.
- Optimal threshold locations may be unclear.
- Pixels with similar intensity may not be connected  in the spatial domain, leading to disconnected regions.

### Iterative Threshold Selection Algorithm
- Assume two regions: foreground(fg) and background (bg)
- Assume fg is near the center of the image and is surrounded by bg.

Step 1. Initialize the bg region to be just the four corners of the image. (or another region that is expected to the the bg). Let the 


### Early Approaches to Histogram Thresholding

**Chow**: Adaptive Histogram Thresholding
- Divide the image into disjoint blocks
- Compute a local histogram for each block
- Determine a threshold for each block histogram
- Associate the thresholds with the block centers
- Interpolate the thresholds to get thresholds for pixels not at a block center

**Watanabe**: Sum of Gradients
- Choose the threshold that maximizes the sum of gradient magnitudes at all pixels whose gray level equals the threshold.
- If you pick the correct threshold, the pixel that would correspond to a boundary would have a pretty high gradient at transition points.
- What if you pick a threshold that's too small? There will be a lot of small gradient crosses


**Weska**: Large Laplacian Magnitude

Perform histogram calculations for all pixels, calculate 

thresholding at only for pixels with large Laplacian magnitudes.




**Weska & Rosenfeld**: Busyness

Busyness = number of pixels that are border pixels

When you pick the correct threshold, you will have the least amount of boundaries.


**Kohler**: Max Contrast

Selext the threshold that maximizes the average contrast, defined as:
$$AveContrast = \frac{C(T)}{\#E(t)}$$

Define total contrast as:
$$C(T) = \sum\limits min{\{|I(i,j) - T|, |I(k, l) - T|\} }$$

Define edges as: (slidess)
$$E(t) = \{ [ ] \}$$


**Ridler's**: Iterative Threshold Selection Algorithm
- Assume two regions: forground (fg) and background (bg).
- Assume fg is neat the center of the image and is surrounded by bg.

1. Initialize the bg region to be small patches at the four couners of the image (or other region that is expeted to be bg). Let the fg region be the remainder of the image.
2. For each iterations, calcualte the mean gray level of the fg and bg
3. Calculate the next threshold value
4. If the previous threshold value is the same as the next background, then stop, otherwise, repeat step two with the new bg and fg regions.


**Trussell's**: Improvement to Ridler's Method

Just read the paper (it's half a page): https://ieeexplore.ieee.org/document/4310204



**Otsu's Method**:

- Assume a grayscale image such that h(i) is the number of occurences of gray level i in the image.
- Let N be the number of pixels in the image.
- Normalize the histogram to obtain an observed 'probability distibution'
- Assume the histogram can be classified as bimodal and find the optimal threshold to partition the histogram into two classes (e.g., fg, bg)

![[Pasted image 20230221133329.png]]

- Select the theshold that minimizes the variance:

$$\sigma_{w}^{2}= q_{1}\sigma_{1}^{2}+ q_{2}\sigma_{2}^{2}$$

The within-class variance plus the between-class variance equals the overall variance:

$$\sigma_{w}^{2} + \sigma_{B}^{2}= \sigma^{2}$$

Thus, an equivalent method is to select the threshold that minimizes the between-class variance:

$$\sigma_{B}^{2}= q_{1}(t) q_{2}(t) [\mu_{1}(t) - \mu_{2}(t)]^2$$

There are followup papers that have computationally efficient versions of this technique.


**Otsu's Multilevel Thresholding**

- For example, consider finding two thresholds to distinguish three classes.
- The between-class variance becomes a funciton of two variables.

![[Pasted image 20230221134014.png]]

- Select threshold $t_{1}$ and $t_{2}$ to maximize $\sigma_{b}^{2}(t_{1}, t_{2})$, where $t_{1} < t_{2}$
- The selected thresholds typically become less credible as the number of classes increases.


**Kittler & Illingworth's Method**

Kittler & Illingworth's method is optimal in the sense that it minimizes the Kullback-Leibler divergence between the image histogram and a sum-of-truncated-Gaussians probability model

Their method was ranged #1 in Glasbey's 1992 survey and Sezgin's 2004 survey.


- Assume a grayscale image image. Let h(\*) be the image such 


Kullback-Liebler Divergence










# Module 8 |  Morphological Image Analysis

### Binary Morphology
* Assume a bi-level image.
* Represent an image as a set $A$ of foreground points in a d-dimensional Euclidean space: $A \subset \mathbb{R}$



### Erosion

![[Pasted image 20230314124814.png]]

### Border and Interior and Whole

**Definition:** A border pixel or boundary pixel of binary object A is a pixel of A such that at least one of its neighbors is not in A. The border or boundary of binary object A is the set of its border pixels. If 4-connectivity (8-connectivity) is used for this definition, then the border will be an 8-connected (4-connected) region.

![[Pasted image 20230314125315.png]]


### Convex Hull

![[Pasted image 20230316124020.png]]

### Discrete Disk
Let a 'disk' be a discrete approximation to a circular disk, where the bounding box is a square with an odd dimension

### Medial Axis Transform

![[Pasted image 20230316124402.png]]

Pretty much finds the largest possible disk that fits within a certain position.


### Top Surface of a Set

$$T[A] (x) = max \{ y | (x,y) \in A\}$$












# Module 9 | Stereoscopic Image Analysis

### Pinhole Camera Model

This model approximates the mathematical relationship between the 3d coordinates of a point in the scene and the pixel coordinates of its projection onto the image plane of the camera.

![[Pasted image 20230323124626.png]]

Light rays from the illumination source will be reflected off the object, will pass through the pinhole aperture of the camera, and then hit the sensor elements on the image plane within the camera.


### World Coordinates

Let the focal lenght $f$ be the distance between the image plance and the pinhole aperture of the camera. Define world coordinates $(x, y, z)$ as follows:

![[Pasted image 20230323124820.png]]

### Viewpoint Model

Equivalently, we can consider the image plane to be located at $z=-f$ instead of $z=f$, due to the similarity of triangles.

![[Pasted image 20230323124918.png]]

Object point $(x, y, z)$ maps to image point $(x', y')$

![[Pasted image 20230323125037.png]]

In the $x-z$ plane, we see a pair of similar triangles.

![[Pasted image 20230323125112.png]]

By analyzing similar triangles, we find the relationship between object's $(x, y)$ coordinates and image plane $(x', y')$ coordinates.

![[Pasted image 20230323125217.png]]

This mapping is known as *perspective projection.*

Here, world coordinates and the image plane coordinates have the same units (i.e., meters instead of pixels).

### Binocular Imaging Geometry

Assume the left and right image planes are centered at $(x,y,z) = (0,0,-f)$ and $(x,y,z) = (b,0,-f)$, respectively, where $b$ is the *baseline distance* between the camera centers.

Assume the optical axes of the cameras are parallel.

Object point $P(x, y, z)$ maps to left and right image coordinates $(x_{L},y_{L})$ and $(x_{R},y_{R})$ respectively.

Observe that $X_{L} > x_{R}$ if the object distance is finite.

![[Pasted image 20230323125603.png]]

Recall the perspective projection equations:

$$x' = \frac{fx}{-z}$$
and 
$$y' = \frac{fy}{-z}$$

Applying the perspective projection equations to each camera, we have:

$$x_{L}= \frac{fx}{-z}$$

$$x_{R} = \frac{f(x-b)}{-z}$$

$$y_{L}= \frac{fy}{-z}$$

### Disparity and 3D Reconstruction

Define disparity as 

$$d = x_{L}- x_{R}$$

There will be greater disparity for points in the scene that are closer to the cameras. This is known as the *parallax effect*. Points at an infinite distance will have zero disparity.

We can exploit the parallax effect to reconstruct the distance to a point in the scene.


### Disparity and 3D Reconstruction

After we measure the disparity between the left and right image points for a point in the scene, we can reconstruct the 3D world coordinates of that points:

$$d = x_{L}- x_{R} = \left(\frac{fx}{-z}\right) - \left(f\frac{x-b}{-z}\right) = \frac{bf}{-z} \Rightarrow -z = \frac{bf}{d}$$

$$x_{L}= \frac{fx}{-z}\Rightarrow x = \frac{-zx_{L}}{f}\Rightarrow x=\frac{bx_{L}}{d}$$

$$y_{L}= \frac{fy}{-z} \Rightarrow y=\frac{-zy_{L}}{f} \Rightarrow y = \frac{by_{L}}{d}$$


### Stereo Image Pair

![[Pasted image 20230323130604.png]]

This can be used to generate a ***Disparity Map***

![[Pasted image 20230323130630.png]]


### Units
- When calculating the disparity and applying the reconstruction equations, we must use consistent coordiantes for all quantities -- i.e. meters.
- Integer pixel coordinates must be converted to meters by multiplying by the physical pixel dimension (i.e., the size of the CCD or CMOS element for a single pixel).

### Correspondence Matching Problem

The main challenge is to determine which point in the right image corresponds to a given point in the left image. This is known as the *Correspondence Matching Problem*.


### Epipolar Constraint

Since $y_{L}= y_{R}$, we can restrict the search to the same row in the other image if the imaging geometry is ideal. In practice, however, there will be some jitter in the camera orientation, so nearby rows should also be searched.

For stereo imaging geometries, the reconstruction equations and the epipolar constraint are a bit more complicated.


### Baseline

If the baseline distance $b$ is too small, then
- The two images will look similar -e.i., lots of image overlap, meaning Correspondence matching will be easier.
- Pixel quantization error is significant, leading to more error in the calculation of disparity and distance.

If the baseline distance $b$ is too small, then
- The field of view for the left image may be quite different from that of the right image -i.e., not much image overlap, meaning that correspondence matching will be much more difficult.
- Pixel quantization error is less  significant, leading to a more accurate calculation of disparity and distance.


### Example of Disparity and Distance Calculation

Assume the following values:
focal length $f = 50\ mm$
baseline $b = 0.8\ m$
pixel size $\delta = 0.5\ mm$

Suppose we've identified pixels in the left and right images that correspond to the same object point in the scene, and their image coordinates are

$$(x_{L}, y_{L}) = (110, 200) \delta$$
$$(x_{R}, y_{R}) = (100, 200) \delta$$

We can reconstruct the distance to the object point in terms of the disparity:

$$d = (110 - 100) (0.5\ mm) = 5\ mm)$$

$$-z = \frac{bf}{d} = \frac{(0.8\ m)(50\ mm)}{5\ mm} = 8\ m$$


Let's assume that the image location of the projected object point pixel has been rounded to the nearest integer pixel coordinate -i.e., the nearest integer multiple of $\delta$. Thus, the worst-case quantization error in each pixel coordinate is $\pm 0.5$ pixel, ie., $\pm 0.5\delta$.

When we subtract pixel coodinates, the potential error will double, so the worst case quantization error in the calculated disparity is $\pm 1$ pixel, i.e. $\pm \delta$.

We can thus calculate bounds for the calculated distance:

$$(-z)_{min} = \frac{bf}{d_{max}} = \frac{(0.8\ m)(50\ mm)}{(10+1)(0.5\ mm)} = 7.27\ m$$

$$(-z)_{max} = \frac{bf}{d_{min}} = \frac{(0.8\ m)(50\ mm)}{(10-1)(0.5\ mm)} = 8.89\ m$$



### Grimson's Stereo Algorithm

- Stereo reconstruction requires matching corresponding pixels between left and right images.
- Grimson matches edge pixels between left and right images instead of gray levels.
- Image size: 288 x 244 pixels
- Generate Edge maps using Gaussian with several $\sigma$ values.
- Dissertation: $w = 9, 18, 36, 72$ pixels
- PAMI paper: $w = 9, 17, 33; w= 5, 9, 13, 17$
- LoG truncation radius $\approx 1.8w$
- Ignore horizontal edge segments
- Record the edge orientation in increments of 30 degrees
- For each pixel in the left image, search for a match near the corresponding location of the right image.
- Divide the search region of the right image into three "pools"

![[Pasted image 20230328130102.png]]

![[Pasted image 20230328130111.png]]

- Two edges match if they have the same contrast sign and th orientation is within 30 degrees.

![[Pasted image 20230328130136.png]]

- If exactly one candidate is found within a pool, then it is sent to the "matcher"
- If two or more are found in the same pool, then no disparity is assigned to that pixel.
- If only one match is found in only one pool, then it is selected as the matching edge pixel.
- If two or three pools have candidate matches, then they are stored for later disambiguation.

### Disambiguation
After processing the left edge map, resolve any ambiguities. Choose the candidate match that is most consistent with the neighbooring disparities.

### Coarse to Fine
Repeat for the next-finer scale of edge maps.
I.e., start with the largest $\sigma$ and proceed to smaller $\sigma$ values.
Center the search window based on the disparities previously computed near that location.

### Figural Continuity
Grimson discussed a way to improve the stereo matcher results. If a contour with $j$ gaps has length $\ge l_j$, then keep the disparity results along that contour. Here, $l_j$ is a threshold based on Rice's Theorem.

### Post-Processing of Sparse Disparity Map
- Grimson's stereo matching algorithm results in a sparse disparity map.
- Reconstruct the $(x, y, z)$ coordinates corresponding to each disparity value.
- Interpolate a smooth 3D surface through the sparse set of $(x,y,z)$ points.
- Uniformly resample the interpolated surface to obtain a dense depth map.

![[Pasted image 20230328130719.png]]


### Example
- Aircraft navigation in stealth mode without GPS or radar.
- Using a single camera, take a sequence of photos of the terrain below.
- Consecutive images act as a stereo pair.
- Use stereo reconstruction to estimate an elevation map.
- Match the estimated depth map to a reference digital elevation map to determine the location.

![[Pasted image 20230328130910.png]]

### Compute an Estimated Elevation Map and Cliff Map
- Use Grimson's algorithm to derive an estimated elevation map.
- Then apply LoG edge detection to extract a 'cliff map'
- Identify "critical points" as the point of high curvature along cliff contours.

![[Pasted image 20230328131027.png]]

Compute a Cliff Map from the Reference Elevation Map

![[Pasted image 20230328131054.png]]

### Find the Estimated Cliff Map within the Reference Cliff Map
- Each critical point in the estimated cliff map is compared to each critical point in the reference cliff map.
- Each hypothesized match results in a hypothesized transofmration (rotation and translation)
- An alignment check determines how well the transformed estimated cliff map aligns with the reference cliff map.
- The best fit is selected as the final match.

Detected Location within the Reference Cliff Map 

![[Pasted image 20230328131303.png]]

### Stereo Algorithms for Dense Disparity Map Calculation
**Block Matching Method**
**Semi-Global Matching Method**

### Camera Calibration
- Camera calibration to determine intrinsic parameters and extrinsic parameters.
- Intrinsic parameters:
	- Optical center (pixel coordinates)
	- Focal length
	- Pixel size $\delta_{x}\times \delta_{y}$
	- Skew (if x- & y-axes not perpendicular)
	- Lens distortion parameters
- Extrinsic parameters between the two cameras:
	- Translation vector
	- Rotation Angles
	- Scaling factor

### Random Dot Stereograms
- Julesz used random dot stereograms to demonstrate that the HVS can perceive stereoscopic depth separately from cognition of image content. Stereoscopic depth can be computed in the absence of any cues available to either eye alone.

![[Pasted image 20230328131806.png]]

- Instead of random dots, grayscale or color textures may be used.
- A stereogram can also be achieved using a single image (autostereograms).


### Extensions
- Stereoreconstruction from three views (or more)
- Stereo reconstruction using single view with multiple depths of focus.


### MATLAB for Stereo Image Analysis

```matlab
stereoCameraCalibrator % interactive app used to calculate stereoParams  
% Rectify stereo images onto a common image plane so corresponding points have same row coordinates:  
[J1,J2,reprojectionMatrix] = rectifyStereoImages(I1, I2, stereoParams)  
disparityMap = disparitySGM(J1, J2) % compute disparity map using semi-global matching method  
disparityMap = disparityBM(J1, J2) % compute disparity map using block matching method  
xyzPoints = reconstructScene(disparityMap,reprojectionMatrix) % reconstruct (x,y,z) values from disparity map  
pcshow(xyzPoints) % plot 3D point cloud
```