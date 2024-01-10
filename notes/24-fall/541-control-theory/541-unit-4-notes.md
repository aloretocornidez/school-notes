# Unit 4 | Design Specifications


### How do you classify/categorize the Plots?

Overshoot | The overshoot is dependent on the angle of the poles. (As $\theta$ goes to 90, the overshoot increases.)

Setting Time | Setting time is dependent on the damping
Percent Overshoot | $\theta$ or $\zeta$ 
Peak Time | 


A higher $\omega_d$ makes the system peak earlier.







## Design Specifications

Our analysis of systems will be based on a pure (no finite zeros), two-pole system's response. Many higher order systems have a response that is similar to a two-pole system response.

![[Pasted image 20231006142517.png]]

Our G(s) is the same one that we had for the motor earlier in the semester.

Which cheer would we use to find T?

Cheer II:

$$T(s) = \frac{G(s)}{G(s)H(s) + 1} = \frac{\frac{k}{s(s+p)}}{1 + \frac{k}{s(s+p)}} = \frac{k}{s^{2}+ps+k} = \frac{k}{s(s+p) + k}$$



This is a pure, two pole system because there are no finite zeroes and there are two poles.


Recall the Cheers:

Cheer 1: $$G = C(sI - A)^{1} B + D$$ 
Cheer 2: $$\frac{G}{1+GH}$$
Cheer 3: $$\Phi (t) = e^{At} = \mathscr{L}^{-1}\{(sI - A)^{-1}\}$$
#cheer #formula 


Using generalized notation:
$$T(s) = \frac{\omega^{2}}{s^{2}+2\zeta\omega_{n}s+\omega_{n}^{2}}$$

$\zeta$ | Damping ratio
$\omega_{n}$ | Natural frequency

Poles of T(s):

$$\frac{-B\pm\sqrt{B^{2}-4AC}}{2A}$$


Plugging In:

$$\frac{-2\zeta\omega_{n}\pm \sqrt{4\zeta^{2}\omega_{n}^{2}-4\omega_{n}}}{2} $$
$$-\zeta\omega_{n}\pm\sqrt{\zeta^{2}\omega_{n}^{2}-\omega_{n}^{2}} $$
$$-\zeta\omega_{n}\pm\omega_{n}\sqrt{\zeta^{2}-1}$$

Complex Poles: $0 \le \zeta \lt 1$

(factoring out the j negatizes the insize of the root.)
$$-\zeta\omega_{n}\pm j\omega_n\sqrt{1-\zeta^{2}}$$



![[Pasted image 20231006143816.png]]





$$cos(\theta) = \frac{\sigma}{\omega_{n}}= \frac{\zeta\omega_{n}}{\omega_{n}} = \zeta$$

$$\theta = cos^{-1}{(\zeta)}$$


### Time Response

$$Y(s) = T(s) R(s)$$

Response when $R(s) = \frac{1}{s}$


![[Pasted image 20231006144146.png]]



$$\theta = tan^{-1}\left({\sqrt{\frac{1-\zeta^{2}}{\zeta}}}\right) = cos^{-1}\left(\frac{\sigma}{\omega_{n}}\right) = cos^{-1}(\zeta)$$









## 2% Settling Time

$$T_{s} = 4\tau$$

$$e^{-\sigma\tau}= e^\frac{-t}{\tau}$$

evaluating at $t = 4\tau$

$$e^{-4} = 0.0183 \lt 2\%$$

Decay Envelope:

$$e^{-\zeta\omega_{n}t} = e^{-\sigma t}$$



What if we want the settling tome to be less than 1 second


$$T_{s} = 4\tau = \frac{4}{\sigma}\lt 1 \Rightarrow$$





## Peak Time

$y(t)$ expression

Peak time is determines when $$\frac{dy(t)}{dt} = 0$$

for the first time after $t=0$

The peak time is:

$$t_{p}= \frac{\pi}{\omega_{d}}= \frac{\pi}{\omega_{n}\sqrt{1 - \zeta^{2}}}$$

Let's suppose we want $T_p$ to be less than 1 second:

$$T_{p}= \frac{\pi}{\omega_{d}} \Rightarrow \pi \lt \omega_{d}$$


## Percent Overshoot

Unit step response of a Pure, 2-Pole system.











