# Unit 8 Notes

## 8.1 | Introduction to Bode Plots

Learning Goals #learninggoals

- Bode Plots
  - Characteristics
  - Stability Margins
  - System Identification from Bode Plots (finding the transfer function from
    bode plots)

Bode plots provide information about a system's frequency response. For example,
a Bode plot tells us how a system will respond to a sinusoidal excitation (input
waveform).

Bode Plot: Walking up the imaginary axis and finding the magnitude and phase at
each frequency.

(**Question**: How will a system respond to a sinusoidal input signal at a given
frequency?)

![[Pasted image 20231120141002.png]]

Bode plot for $$G(s) = \frac{1000}{(s+2)(s+50)}$$

$$G(s) = \frac{1000}{(2) (\frac{s}{2} +1) (50)(\frac{s}{50} + 1)}$$

Time Consant form $$G(s) = \frac{10}{\left(\frac{s}{2} +
1\right)(\frac{s}{50}+1)} = \frac{10\angle{0\degree}}{\left(\frac{s}{2} +
1\right)(\frac{s}{50}+1)}$$

Recall the formula for signal power

$$20 log_{10}\left(\frac{V_{out}}{V_{in}}\right) = A \text{ db}$$

$$|G(j\omega)|_{db}$$

1. #todo
2. Stability of the closed loop system is governed by $1 + G(j\omega)$. If $1 =
   G(j\omega)$ is close to zero, then we know we are near instability. At the
   stability boundary: $1 + G(j\omega) \Longrightarrow G(j\omega) = -1 =
   1\angle{-180\degree}$

![[Pasted image 20231120143924.png]]

Gain margin and phase margin are the amounts between the current plant value and
the $-180\degree$ and the - db line.

$\omega_{g}= \text{Grain Crossover frequency}$ 
$\omega_{p} = \text{Phase
crossover frequncy}$

Compensators (Controllers) are used to improve or adjust our

Bode plot example:

$$G(s) = \frac{4(s+5)}{(s+0.1)(s+20)}$$


### Minimum Phase System v.s. 

Note: A minimum phase system is when all poles and zeroes are in the left half
side of the s-plane.

![[Pasted image 20231120144254.png]]







## Lecture 8.2 | Bode Plots

Pole-Zero Form 

$$G(s) = K\frac{\left(\frac{s}{z_{1}} + 1\right)\left(\frac{s}{z_{2}}+1\right)}{\left(\frac{s}{p_{1}}+1\right)\left(\frac{s}{p_{2}}+1\right)}$$


### Phase Margin and Gain Margin
[[541-unit-9-notes]]
