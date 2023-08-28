# Homework 1 | ECE 541
Name: Alan Manuel Loreto Cornídez

- [x] Question 1
- [ ] Question 2
- [ ] Question 3
- [ ] Question 4
- [x] Question 5

## Question 1
Find the differential equations relating the applied force, $f(t)$, to the dynamics of the masses. Write your equations in terms of $x_{1}(t)$, $x_{2}(t)$, and their derivatives.

![[Pasted image 20230828111042.png]]


**Mass 1:**
Free-body Diagram:
![[Pasted image 20230828113209.png]]

Resulting equation from FBD:
$$0 = f(t) - f_{i}(t) - f_{b}(t) - f_{k}(t)$$

Move terms around:
$$f(t) = f_{i}(t) + f_{b}(t) + f_{k}(t)$$

Term definitions:
$$f_{i}(t) = M_{1} x_{1}''(t)$$
$$f_{b}(t)= B x_{1}'(t)$$
$$f_{k}(t) = -K (x_{2}(t) - x_{1}(t))$$

Plug in terms:
$$\Rightarrow f(t) = M_{1} x_{1}''(t) + B x_{1}'(t) + K (x_{1}(t) - x_{2}(t))$$

**Mass 2:**

Free-Body Diagram:
![[Pasted image 20230828115114.png]]

Resulting equation from FBD:
$$0 = f_{i}(t) - f_{k}(t)$$

Term Definitions: 
$$f_{k}(t) = -K ( x_{2}(t) - x_{1}(t))$$
$$f_{i}(t) = M_{2} x_{2}(t)$$

Plugging in terms:
$$\Rightarrow M_{2}x_{2}''(t) + K (x_{2}(t) - x_{1}(t)) = 0$$


### Q 1 | Answer
$$\Rightarrow f(t) = M_{1} x_{1}''(t) + B x_{1}'(t) + K (x_{1}(t) - x_{2}(t))$$
$$\Rightarrow M_{2}x_{2}''(t) + K (x_{2}(t) - x_{1}(t)) = 0$$

## Question 2
Find an expression for the transfer function between $V(s)$ and $I_{2}(s)$. You may assume the initial conditions are zero.

![[Pasted image 20230828110941.png]]









## Question 3
Using the given block diagram, determine the requested transfer functions:

1. $T_{1}(s) = \frac{E(s)}{U(s)}$
2. $T_{2}(s) = \frac{Y(s)}{U(s)}$
3. $T_{3}(s) = \frac{Y(s)}{D(s)}$
   
![[Pasted image 20230828110716.png]]







## Question 4
Find the differential equations relating the applied force, $f(t)$, to the dynamics of the masses. Write your equations in terms of $x_{1}(t)$, $x_{2}(t)$, and their derivatives.

![[Pasted image 20230828110534.png]]



















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