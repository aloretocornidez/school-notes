# Unit 7 Notes | ECE 541 | Automatic Control

Unit Overview 7.1 Controller Overview 7.2 Phase-Lead Controller 7.3 Phase-Lag
Controller --> PI (PID) 7.4 Controller Design Evolution 7.5 Stabilizing Unstable
Systems

## Evolution of Controllers | Lecture 7.4

Analog Controller ![[Pasted image 20231113140448.png]]

Input and Feedback Impedance:

![[Pasted image 20231113140515.png]]

The final System Transfer function is:

$$G(s) = \frac{(s R_1 C_1 + 1) (s R_2 C_1 + 1)}{s R_1 C_2}$$

$$
G_c(s) = \frac{k (\tau_{1}s + 1) (\tau_{2}s + 1)}{s}, k =
\frac{1}{R_{1}C_{2}}
$$

### Controller Design Evolution

Given a Mass Spring Damper System

$$
G(s) = \frac{4,969.2}{s^{2} + 4s + 404} = \frac{12.3 ((2)^{2} +
(20)^{2})}{(s+2)^{2} + (20)^{2}}
$$

Poles: $-2 \pm j20$ DC Gain: $12.3 = G(0)$

Open Loop Behaviour:

$2\% T_s = 4 \tau = \frac{4}{\sigma} = \frac{4}{2} = 2 \text{ seconds}$

$\theta = tan^{-1}\left(\frac{20}{2}\right) = 84.3 \degree$

$\zeta = cos(\theta) = cos(84.3 \degree) = .1$ --> P.O. is about 12%

### Pure Gain Controller: $G_{c}(s) = k$

$T_{c} = \frac{kG}{1+kG}$ 

$T_{s} = 2 \text{ seconds}$
$\text{P.O.} \approx 80\%$

$$T_{c}(s) = \frac{k(4969)}{(s+ 2)^{2}+ (20)^{2} + k(4969)}$$

$k = 0.1$

Den = $(s+ 2)^{2}+ (20)^{2} + k(4969) = (s_{2)^{2}}+ (20)^{2} + (4.969)$

$$\theta = tan_{-1}\left(\frac{29.95}{2}\right)= 86.2 \degree$$

$$\zeta = cos(86.2 \degree) = 0.067$$


### Phase-Lead Controller

$$G_{c}(s) = \frac{k(s+z_{c})}{s + p_{c}}$$

The main purpose behind the Phase-lead controller is to shorten the settling time.

You will likely not improve the percent overshoot using this controller.

When using this controller, you want to make your $\sigma_{a}$ to be where you want your settling time to be. 


### PI Controller 
Improves the gain at low frequencies (due to the zero at the origin). Using the PI controller lets us achieve a steady state error of zero

$$G_{c}(s) = k_{p}+ \frac{k_{i}}{s} = \frac{k_{p}(s+z_{c})}{s}$$


### PID Controller

$$G_{c} (s) = k_{p}+ \frac{k_{i}}{s} + k_{d}s = \frac{k_{d}(s+z_{1})(s+z_{2})}{s(s+p)}$$

This controller is the 'best of both worlds'. This lets us trade off between the benefits of I controllers and D controllers.



## Stabilizing Unstable Systems


Can the system $G(s) = \frac{6(s-1)}{s(s+2)}$ be stabilized with $G_{c}(s) = k (k > 0)$> Why?

![[Pasted image 20231115140438.png]]




### System 3

$$G(s) = \frac{5s}{(s-2)(s+2)}$$

























