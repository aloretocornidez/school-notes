# What is a Digital Image?
A digital image is composed of pixels having discrete values that are provided by a 2D function indexed by a pair of discrete spatial coordinates; those values, when displayed, provide a visual representation of something.
- A digital image is usually stored as an array of pixel  values
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

### Discrete-Space  Fourier Transform
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
### Spatial Resolution
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











