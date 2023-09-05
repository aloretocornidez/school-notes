# Homework 1 | ECE 541
Name: Alan Manuel Loreto Cornídez


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


### Question 1 | Answer
$$\Rightarrow f(t) = M_{1} x_{1}''(t) + B x_{1}'(t) + K (x_{1}(t) - x_{2}(t))$$
$$\Rightarrow M_{2}x_{2}''(t) + K (x_{2}(t) - x_{1}(t)) = 0$$

## Question 2
Find an expression for the transfer function between $V(s)$ and $I_{2}(s)$. You may assume the initial conditions are zero.

![[Pasted image 20230828110941.png]]

KVL $I_{1}(s)$:
$$V(s) = I_{1}(s) (R_{1}+ sL) + (I_{1}(s) - I_{2}(s))\left(R_{2} + \frac{1}{sC_{1}}\right)$$

$$V(s) = I_{1}(s) \left(R_{1}+ sL + R_{2} + \frac{1}{sC_{1}}\right) - I_{2}(s)\left(R_{2} + \frac{1}{sC_{1}}\right)$$

KVL $I_{2}$:

$$0 = I_{2}(s)\left(R_{3}+ \frac{1}{sC_{2}}\right)+ (I_{2}(s) - I_{1}(s)) \left(R_{2}+ \frac{1}{sC_{1}}\right)$$

$$I_{2}(s)\left(R_{3}+ \frac{1}{sC_{2}} + R_{2}+ \frac{1}{sC_{1}}\right)= I_{1}(s) \left(R_{2}+ \frac{1}{sC_{1}}\right)$$

$$I_{1}(s) = I_{2}(s) \frac{\left(R_{3}+ \frac{1}{sC_{2}} + R_{2}+ \frac{1}{sC_{1}}\right)}{\left(R_{2}+ \frac{1}{sC_{1}}\right)} $$


Plug in equations to get in terms of $V(s)$ and $I_{2}(s)$

$$V(s) = I_{2}(s) \frac{\left(R_{3}+ \frac{1}{sC_{2}} + R_{2}+ \frac{1}{sC_{1}}\right) \left(R_{1}+ sL + R_{2} + \frac{1}{sC_{1}}\right)}{\left(R_{2}+ \frac{1}{sC_{1}}\right)}   - I_{2}(s)\left(R_{2} + \frac{1}{sC_{1}}\right)$$


Simplify:

$$V(s) = I_{2}(s) \frac{\left(R_{3}+ \frac{1}{sC_{2}} + R_{2}+ \frac{1}{sC_{1}}\right) \left(R_{1}+ sL + R_{2} + \frac{1}{sC_{1}}\right)}{\left(R_{2}+ \frac{1}{sC_{1}}\right)} -  \frac{\left(R_{2} + \frac{1}{sC_{1}}\right)^{2}}{\left(R_{2} + \frac{1}{sC_{1}}\right)}$$

$$V(s) = I_{2}(s) \frac{
\left(R_{3}+ \frac{1}{sC_{2}} + R_{2}+ \frac{1}{sC_{1}}\right) \left(R_{1}+ sL + R_{2} + \frac{1}{sC_{1}}\right) - \left(R_{2} + \frac{1}{sC_{1}}\right)^{2}
}{
\left(R_{2}+ \frac{1}{sC_{1}}\right)
}$$

Assuming $V(s)$ is the denominator of the transfer function:

### Question 2 | Answer

$$G(s) = \frac{I_{2}(s)}{V(s)} = 
\frac{
\left(R_{2}+ \frac{1}{sC_{1}}\right)
}{
\left(R_{3}+ \frac{1}{sC_{2}} + R_{2}+ \frac{1}{sC_{1}}\right) \left(R_{1}+ sL + R_{2} + \frac{1}{sC_{1}}\right) - \left(R_{2} + \frac{1}{sC_{1}}\right)^{2}
}$$

## Question 3
Using the given block diagram, determine the requested transfer functions:

1. $T_{1}(s) = \frac{E(s)}{U(s)}$
2. $T_{2}(s) = \frac{Y(s)}{U(s)}$
3. $T_{3}(s) = \frac{Y(s)}{D(s)}$
   
![[Pasted image 20230828110716.png]]


First, define $A$ to be the output of the center summing junction.:

![[Pasted image 20230829152328.png]]


Now start making characteristic (unique) definitions for each output.


<!-- Y(s) -->
$$\Rightarrow Y(s) = G_{2}G_{3}A(s)$$

$$A(s) = D(s) + G_{1}E(s) - G_{2}H_{2} A(s)$$

<!-- A(s) -->
$$\Rightarrow A(s) = \frac{D(s)+G_{1}E(s)}{1 + G_{2}H_{2}}$$

$$E(s) = U(s) - G_{1}H_{1}E(s) - H_{3}Y(s)$$


<!-- E(s)-->
$$\Rightarrow E(s) = \frac{U(s) - H_{3}Y(s)}{1 + G_{1}H_{1}}$$


Start with $A(s)$: and plug in $E(s)$. (Keep factor at beginning for less arithmetic).

$$A(s) (1+G_{2} H_{2}) = D(s) + G_{1} \frac{1}{1+ G_{1}H_{1}} (U(s) - H_{3}G_{3}G_{2}A(s))$$

Factor $A(S)$ terms and move them to the left.

$$A(s) \left(1 + G_{2}H_{2} + \frac{H_{3}G_{123}}{1+ G_{1}H_{1}}\right) = D(s) + \frac{G_{1}}{1+ G_{1}H_{1}} U(s) $$

Now get the common denominator on the left side.

$$\frac{(1+G_{2}H_{2})(1+H_{1}G_{1}) + G_{123}H_{3}}{1+G_1H_{1}} A(s) = D(s) + \frac{G_{1}}{1 + H_{1}G_{1}} U(s)$$

Move all terms to right side.

$$A(s) = \frac{1 + G_{1}H_{1}}{(1+G_{1}H_{1})(1+G_{2}H_{2}) + G_{123}H_{3}} D(s) + \frac{G_{1}}{(1+G_{2}H_{2})(1+G_{1}H_{1}) + G_{123}H_{3}} U(s)$$

Now plug $A(s)$ into $Y(s)$.

$$Y(s) = G_{2}G_{3}A(s)$$

$$Y(s) = \frac{(G_{2}G_{3})(1 + G_{1}H_{1})}{(1+G_{1}H_{1})(1+G_{2}H_{2}) + G_{123}H_{3}} D(s) + \frac{G_{123}}{(1+G_{2}H_{2})(1+G_{1}H_{1}) + G_{123}H_{3}} U(s)$$

Now, we can plug get $T_{2}(s)= \frac{Y(s)}{U(s)}$ and $T_{3}(s) = \frac{Y(s)}{D(s)}$ by setting the non-used transfer functions to zero (And moving the proper terms).

---

$T_{2}(s) = \frac{Y(s)}{U(s)} = \frac{G_{123}}{(1+G_{2}H_{2})(1+G_{1}H_{1}) + G_{123}H_{3}}$

$T_{3}(s) = \frac{Y(s)}{D(s)} =  \frac{(G_{2}G_{3})(1 + G_{1}H_{1})}{(1+G_{1}H_{1})(1+G_{2}H_{2}) + G_{123}H_{3}}$

---

Solving for $T_{1}(s) = \frac{E(s)}{U(s)}$.

Recall $E(s)$: 

$$E(s) = \frac{U(s) - H_{3}G_{2}G_{3}A(s)}{1 + G_{1}H_{1}}$$

Plug in $A(s)$.

$$E(s) = \frac{1}{1+ G_{1}H_{1}}
\left( U(s) - G_{23}H_{3} \left(\frac{1 + G_{1} H_{1}}{(1+G_{1}H_{1})(1+G_{2}H_{2})+G_{123}H_{3}}D(s)+\frac{G_{1}}{(1+G_{1}H_{1})1+G_{2}H_{2})+G_{123}H_{3}} U(S)
\right)\right)$$

Now, set the $D(s)$ factor to zero and then simplify.

$$E(s) = \frac{1}{a + G_{1}H_{1}}\left(U(s) - G_{23}H_{3} \frac{G_{1}}{(1+G_{1}H_{1})(1+G_{2}H_{2})+G_{123}H_{3}} U(s) \right)$$

Factor out $U(s)$.

$$E(s) = \frac{1}{1 + G_{1}H_{1}}\left(1 - G_{23}H_{3} \frac{G_{1}}{(1+G_{1}H_{1})(1+G_{2}H_{2})+G_{123}H_{3}}\right) U(s)$$

Get a common denominator.
$$
E(s) = \frac{1}{1 + G_{1}H_{1}}
\left(
\frac{(1+G_{1}H_{1}) (1+H_{2}G_{2}) + G_{123}H_{3}}{(1+G_{1}H_{1}) (1+H_{2}G_{2}) + G_{123}H_{3}}
- \frac{G_{123}H_{3}}{(1+G_{1}H_{1})(1+G_{2}H_{2})+G_{123}H_{3}}\right) U(s)
$$

Simplify.
$$
E(s) = \frac{1}{1 + G_{1}H_{1}}
\left(
\frac{(1+G_{1}H_{1}) (1+H_{2}G_{2})}{(1+G_{1}H_{1}) (1+H_{2}G_{2}) + G_{123}H_{3}}
\right) U(s)
$$

$$
E(s) =\frac{(1+H_{2}G_{2})}{(1+G_{1}H_{1})(1+H_{2}G_{2}) + G_{123}H_{3}}U(s)
$$

And then get $T_{1}(s) = \frac{E(s)}{U(s)}$.

$$T_{1}(s) = \frac{E(s)}{U(s)} = \frac{(1+H_{2}G_{2})}{(1+G_{1}H_{1})(1+H_{2}G_{2}) + G_{123}H_{3}}$$

### Question 3 | Answers

$$T_{1}(s) = \frac{E(s)}{U(s)} = \frac{(1+H_{2}G_{2})}{(1+G_{1}H_{1})(1+H_{2}G_{2}) + G_{123}H_{3}}$$

$$T_{2}(s) = \frac{Y(s)}{U(s)} = \frac{G_{123}}{(1+G_{2}H_{2})(1+G_{1}H_{1}) + G_{123}H_{3}}$$

$$T_{3}(s) = \frac{Y(s)}{D(s)} = \frac{(G_{2}G_{3})(1 + G_{1}H_{1})}{(1+G_{1}H_{1})(1+G_{2}H_{2}) + G_{123}H_{3}}$$



## Question 4
Find the differential equations relating the applied force, $f(t)$, to the dynamics of the masses. Write your equations in terms of $x_{1}(t)$, $x_{2}(t)$, and their derivatives.

![[Pasted image 20230828110534.png]]


Freebody Diagram for $M_{1}$:
![[Pasted image 20230905105605.png]]

$$f_{k_{1}} + f_{k_{2}} + f_{B} + f_{M_{1}} = 0$$

$$M_{1}x_{1}''(t) + K_{1}x_{1}(t) + B(x_{1}'(t) - x_{2}'(t)) + K_{2}(x_{1}(t) - x_{2}(t)) = 0 $$

Freebody Diagram for $M_{2}$:

![[Pasted image 20230905110219.png]]

$$f_{k_{2}} + f_{B} + f_{k_{3}} + f_{M_{2}} + f$$

$$M_{2}x_{2}''(t) + B (x_{2}'(t) - x_{1}'(t)) + K_{3}x_{2}(t) + K_{2}(x_{2}(t) - x_{1}(t)) + f(t) = 0$$


### Question 4 | Answer
$$M_{1}x_{1}''(t) + K_{1}x_{1}(t) + B(x_{1}'(t) - x_{2}'(t)) + K_{2}(x_{1}(t) - x_{2}(t)) = 0 $$



$$M_{2}x_{2}''(t) + B (x_{2}'(t) - x_{1}'(t)) + K_{3}x_{2}(t) + K_{2}(x_{2}(t) - x_{1}(t)) + f(t) = 0$$



















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
### Question 5.A | Answer
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


### Question 5.B | Answer
Zeroes: $Z_{1}= -100, Z_{2} = -10$
Poles: $P_{1} = 0$























$T_{1}(s) = \frac{E(s)}{U(s)}$.