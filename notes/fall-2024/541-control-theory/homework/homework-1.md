# Homework 1 | ECE 541
Name: Alan Manuel Loreto Cornídez

- [ ] Question 1
- [ ] Question 2
- [ ] Question 3
- [ ] Question 4
- [x] Question 5

## Question 1
## Question 2
## Question 3
## Question 4
## Question 5
Using the Op-Amp circuit of a lead-lag filter,

Part A: Derive the transfer function between $V_{1}(s)$ and $V_{2}(s)$

Part B: If $R_{1}= 1 \Omega$, $R_{2}= 10 \Omega$, $C_{1}= 0.1 F$, and $C_{2}= 0.001 F$, find the poles and zeroes of the transfer function from part (A). 

![[Pasted image 20230828095201.png]]

**Part A:**

The transfer function of an inverting configuration Op-Amp configuration is:
$$T(s) = - \frac{Z_{f}(s)}{Z_{i}(s)}$$

The impedance of the **feedback** block is:
$$Z_{f}(s) = R_{2}+ \frac{1}{sC_{2}} $$

Simplifying:
$$Z_{f}(s) = \frac{sC_{2} R_{2}+ 1}{s C_{2}}$$


The impedance of the **input** block is: 
$$Z_{i}(s) = \frac{
\frac{R_{1}}{s C_{1}}
}{
R_{1}+ \frac{1}{sC_{1}}
}$$

Simplifying:
$$Z_{i}(s) = \frac{R_{1}}{s C_{1}R_{1} + 1}$$

Plugging this into the equation for $T(s)$:
$$T(s) = -\frac{
\frac{sC_{2} R_{2}+ 1}{s C_{2}}
}{
\frac{R_{1}}{s C_{1}R_{1} + 1}
}$$

Simplifying renders the answer:
### Q 5.A | Answer
$$\Rightarrow T(s) = - \frac{
(sC_{2}R_{2} + 1) ( s C_{1} R_{1} + 1)
}{
s C_{2} R_{1} 
}$$



**Part B**
Recall: $R_{1}= 1 \Omega$, $R_{2}= 10 \Omega$, $C_{1}= 0.1 F$, and $C_{2}= 0.001 F$

Solving for the poles:
$$s C_{2} R_{1} = s (0.001)(1) = 0 $$
$$\Rightarrow P_{1} = 0$$

Solving for the zeros:

First Zero $Z_{1}$:
$$s C_{2}R_{2}+ 1 = 0$$
$$s = - \frac{1}{C_{2} R_{2}} = - \frac{1}{(0.001)(10)} = - 100$$

$$\Rightarrow Z_{1}= -100$$


Second Zero $Z_{2}$:

$$s C_{1} R_{1} + 1 = 0$$
$$s = - \frac{1}{C_{1} R_{1}} = - \frac{1}{(0.1) (1)} = -10$$
$$\Rightarrow Z_{2} = - 10$$


### Q 5.B | Answer
Zeroes: $Z_{1}= -100, Z_{2} = -10$
Poles: $P_{1} = 0$