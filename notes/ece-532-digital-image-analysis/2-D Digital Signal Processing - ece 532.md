## What is a Digital Image?
A digital image is composed of pixels having discrete values that are provided by a 2D function indexed by a pair of discrete spatial coordinates; those values, when displayed, provide a visual representation of something.
- A digital image is usually stored as an array of pixel  values
- A pixel may be a vector of values (e.g., an RGB image).
- A pixel value may include a non-visual quantity (e.g., a range image)
- An animated 'image' is a sequence of digital images that depicts motion when displayed in rapid succession. Thus, we consider it to be a special case of video.

## Where do Digital Images Come From?
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



## Elementary 2D Signals
#functions
**Impulse Function**:
![[Pasted image 20230117124922.png]]

**Unit Step Function:**
![[Pasted image 20230117124943.png]]

## Names for 2D Digital Signals
Common names for 2D input and output signals:
![[Pasted image 20230117125053.png]]
- X and Y are sometimes reserved as the spatial coordinates

Common names for 2D coordinates:
![[Pasted image 20230117125129.png]]


## Common Ways to Define the Axes
Textbook graphs usually have the vertical axis pointing up:
![[Pasted image 20230117125433.png]]

The usual convention is for the top row of the image to be stored first in the digital image file format. Thus, in software implementations, the vertical axis usually points down:
![[Pasted image 20230117125441.png]]


## Graphing 2D Signals

Assumptions:
- Unlabeled dots have value 1.
- Missing dots have value 0.
- Value is 0 outside the shown region.

## Continuous / Discrete / Analog / Digital
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


## 2D Sinusoidal Signal

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




## Complex Exponential Signals
**Analog Complex Exponential Signal**
$f(x, y) = e^{j(\Omega_1 x + \Omega_2 y + \theta)} = e^{j(2\pi f_1 x_1 + 2\pi f_2 y + \theta)}$






## Discrete -Space Complex Exponential Signal
Let the sampling interval be $T_1, T_2$ with units: m.

![[Pasted image 20230117132258.png]]

Note that $cos()$ and $sin()$ require an argument with units of radians, so we observer the following units:
$n_1, n_2$ ~ unit-less
$\omega_1, \omega2$ ~ rad

## Relation between Analog and Digital Frequency

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

## Region of Support
**Definition**: The Rectangular region of support (ROIS) of a signal $x(n_1, n_2)$ is the smallest rectangular region (i.e., the bounding box) in the $n_1 - n_2$ plane that contains all the non-zero samples of the signal.

## Separability
**Definition**: A separable 2D signal $x(n_1, n_2)$ can be expressed as $x(n_1, n_2) = f(n_1) g(n_2)$.

Examples:

$$\delta(n_1, n_2) = \delta_1(n_1) \delta_1(n_2)$$ where $\delta$ is the 1D impulse function.


$$u(n_1, n_2) = u_1(n_1) u_1(n_2)$$

## Sifting Property
Consider a 2D signal $x(n_1, n_2)$. It can be shown that

$$x(n_1, n_2) = \sum_{k_1 = -\infty}^{\infty} \sum_{k_2 = -\infty}^{\infty}{x(k_1, k_2)\delta(n_1 - k_1, n_2 - k_2)}$$

This is known as the sifting property.




