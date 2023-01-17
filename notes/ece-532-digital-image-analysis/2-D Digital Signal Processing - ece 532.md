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















