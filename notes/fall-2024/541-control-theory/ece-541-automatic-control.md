# ECE 541 | Automatic Control

# Unit 0 | Pre-Requisite Lecture
## Announcements | August 28th, 2023
- Passport Assignment Due Monday 08/28/2023
- Prerequisite Quiz Due Wednesday 09/06/2023
- Homework 1 Due Monday 09/11/2023
	- Submit work on D2L assignments
	- Submit answers on D2L quizes.

# Class Units
In a quick 'image' this is the structure of the class.
1. Modelling
2. Analysis
3. Controller Design

## Methods of Modelling

### Physics
- Mechanical
	- $F = ma$
- Electrical
	- $KVL$, $KCL$, $v_{l} = L \frac{di_l(t)}{dt}$, ELI, $i_c(t) = C \frac{dv_c(t)}{dt}$
- Electro-mechanical
	- Combining  mechanical and electrical, for example, a DC motor.

### Time Domain
We can generate the transfer function $G(s)$ by observing the system response.
- Peak Time $T_p$
- 1% settling time $T_s$
- Percent overshoot

### Frequency Domain
We can also generate the transfer function $G(s)$ from the measurements in the frequency domain using the Bode plots.



## Methods of Analysis
### Time Domain
Using $T_p$, $T_s$, and 1% settling time we can observe behaviours.

$T_p$ = peak time, P.O. = Percent overshoot, $T_s$ = settling time.

### Frequency Domain

Using the $\text{s-plane}$ you can make a controller using the Root locus

## Controller Design
How do we design the controller $D[s]$? How do we build/design/create $D[s]$

It may be fairly straightforward:
$$D[s] = \frac{K(s+z)}{(s+p)}$$

Or maybe we can use the Root Locus, or bode plot/frequency domain perspective.

### PID Controllers
With higher order controllers, (PID) Controllers you can still use Root Locus and Bode plot strategies.

We will have State Space strategies that measure the full state of the system or even have some unknown variables and generate observed/estimated values and feed them back.

Impact of a Controller on Transient and Stead-State Behavior.



### Series LRC Circuit

Using ELI and ICE


































































