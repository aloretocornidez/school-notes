# Unit 9 Notes

## Lecture 9.1 | Phase-Lag Bode Plot Controller Design with MATLAB





### Phase-Lag Controller Design Process

$$G_{c}(s) = \frac{1+\tau s}{1+\alpha \tau s} = \frac{1 + \frac{s}{z_{c}}}{1 + \frac{s}{p_{c}}}$$

1. Determine the gain necessary to achieve the specified steady-state accuracy.
2. Plot the uncompensated (no poles or zeroes from the controller) bode plots using the gain determined in step 1.
3. Determine the phase margin from the uncompensated system, $PM_{u}$.
	- If the phase margin is sufficient, then no phase-lag compensator is needed. --> stop! Otherwise, go to step 4.
4.  Determine the frequency $\omega_{c}`$. $\omega_{c}`$ is the desired gain crossover frequency. FInd $\omega_{c}`$ from the phase curve using $PM_{c}$ $\omega_{c}`$ is the frequency where $PM_{c}$ if the gain curve crossed zero dB at $\omega_{c}`$. $$PM_{C} = PM_{desired} + SM$$ SM is the safety margin ($5 \degree$ or $10 \degree$)
5. Place a zero at the desired crossover frequency $\omega_{c}`$, determined in step 4. $$z_{c} = \frac{1}{\tau}$$
6. Calculate the pole/zero separation using the amount of attenuation needed to cause the magnitude curve to cross 0 dB at $\omega_{c}`$. 
   $$-20 log(\alpha) = (\text{attenuation needed})$$ 
   $$\alpha = 10$$

7. Calculate the compensator pole location suing the value of $\alpha$ found in step 6. $$p_{c}= \frac{z_{c}}{\alpha} = \frac{1}{\alpha \tau}$$
	- Draw the compensated Bode plot $$G_{c}(j \omega) G(j \omega)$$
	- Is there enough phase margin? if so, you're done, of not, then go back to step 5. 



### Example 

$$G_{s}()= \frac{10 k  }{s(0.1 s +1)(0.05 s +1)} = \frac{10 k  }{s\left(\frac{s}{10} +1\right)\left(\frac{s}{20} +1\right)}$$

There is 1 pole at the origin, so this is a Type-1 system. This means that the steady state error can be 0 as long as the system is stable (due to a unit step input).

Design Specs:
1. $e_{ss} \le 0.\bar3\bar3$
2. $PM \ge 30 \degree$


We want our velocity gain constant to be $k_{v} \ge 30$

$$K_{v} = \lim_{s\to\infty} sG(s) = 10k = 30 \Rightarrow k = 3$$

$$G(s) = \frac{30}{s\left(\frac{s}{10}+ 1 \right)\left(\frac{s}{20}+1\right)}$$

Now we need to compensate our phase margin to have 5-10 degrees of safety margin. $3\degree + 10\degree = 40 \degree$





