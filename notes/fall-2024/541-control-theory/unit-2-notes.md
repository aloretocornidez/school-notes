# Lecture 2.1 | Linearization of Non-Linear Systems
#learninggoals 
- Linearization Quiz
- Discuss Linearization


## Linearization

### Background

A linear system satisfies:
- Superposition (Additivity)
	- $f(x_{1}, x_{2}) = f(x_{1}) +f(x_{2})$
- Homogeneity
	- $f(\alpha x) = \alpha f(x)$

**Mental Image**
![[Pasted image 20230911141343.png]]

$A$ is the system matrix, $B$ is the Input matrix.

![[Pasted image 20230911141406.png]]


If you do the multiplication, then all of the pieces on the right hand side have:
- No product terms:
	- $\alpha x_{1}(t)x_{2}(t)$
	- $\beta u^{2}(t)$ 
- No non-linear terms:
	- $\gamma sin(x_{1}(t))$
	- $\gamma \sqrt{x_{2}(t)}$


### Common Non-Linearities

**Amplifier Saturation**
![[Pasted image 20230911141822.png]]


**Dead Zone**
![[Pasted image 20230911141834.png]]

**Backlash**
![[Pasted image 20230911141853.png]]

Our tools (analysis & design) work best with linear systems.

What do we do if we have non-linearity in our system?

__Answer__: Linearization (See Schaum's Chapter 19).

### Example of Linearization

$$x'(t) - 2x^{2}(t) = u(t)$$

isolate the derivative term
$$x'(t) = 2x^{2}(t) + u(t)$$

$$f(x(t), u(t)) = 2x^{2}(t) + u(t)$$

$$x'(t) = f(x(t), u(t))$$


In general, $x'(t) f(x(t), u(t))$ contains non-linear terms containing $x(t)$, $u(t)$, or both.







**Taylor Series Expansion**

$$f(x(t), u(t) = f(x_{0}, u_{0})) + \frac{\partial f}{\partial x}$$


![[Pasted image 20230911142533.png]]



Now we just want the expression to be written in first order variations of $x(t)$ and $u(t)$.

![[Pasted image 20230911142714.png]]

*Note the $\approxeq$ approximation instead of the $=$*

**Returning to the example and applying the Taylor Series**

$$x'(t) = 2x^{2}(t) + u(t)$$

Nominal operating point (Needs to satisfy the governing differential equation):

$$x_{0}= 1, u_{0} = -2$$

Verify:

$$x_{0}'(t) = f(x_{0}(t), u_{0}(t))$$


$$0 = 2x_{0}^{2}+u_{0}(t) = 2 - 2 = 0$$

These now satisfy the governing eqution:
$$\therefore x_{0}=1, u_{0}=2$$ 


Notation: Let $x-x_{0}= \Delta x, u-u_{0}= \Delta u$

$$\Rightarrow x(t) = x_{0}+ \Delta x, u(t) = u_{0}+ \Delta u$$

![[Pasted image 20230911143417.png]]

$$x'(t) = (x_{0}+\Delta x)' = x_{0}' + (\Delta x)'$$

![[Pasted image 20230911143500.png]]

After approximation, we get this system:

![[Pasted image 20230911143629.png]]



Now we evaluate the functions and render out partial differential equations:

![[Pasted image 20230911143851.png]]





![[Pasted image 20230911143940.png]]


Now, the final linearize system is:

$$z'(t) = 4z(t) + v(t)$$


### Is the System Stable?

First, let's Laplace transform the funrciton to get the system into the frequency domain:





# Lecture 2.2 | Vector Linearization with Example

#learninggoals 

- Work through vector Linearization Example
- Begin System Identification from Step Response Data











### Vector Linearization 

Non linear system, $x(t) \in \mathbb{R}^{n}$


$$x'(t) = f(x(t), u(t))$$


$$x_{0}'(t) = f(x_{0}(t), u_{0}(t))$$


**Second Order Example**

Phase plane
![[Pasted image 20230913140609.png]]

The yellow and magenta lines are the eigen vectors of the phase plane.

$$\begin{bmatrix}
x_{1}'  \\ x_{2}'
\end{bmatrix} = 

\begin{bmatrix}
f_{1}(x_{1} , x_{2}, u) \\ 
f_{2}(x_{1} , x_{2}, u)
\end{bmatrix}
$$

This is a non-linear system. $x(t) = x_{0}(t) + \Delta x(t)$

$$x'(t) = x_{0}'(t) + \Delta x(t) =\begin{bmatrix}x_{10}'(t) \\ 
x_{20}'(t) 
\end{bmatrix}+\begin{bmatrix}
\Delta x_{1}'(t) \\ 
\Delta x_{2}'(t) 
\end{bmatrix}$$

We state that we have a **nominal equilibrium condition** solution of this

![[Pasted image 20230913141332.png]]


$$\approx 
\begin{bmatrix}
f_{1}(x_{10}, x_{20}u_{0}) \\ 
f_{2}(x_{10}, x_{20}u_{0})
\end{bmatrix}

\begin{bmatrix}
\frac{\partial f_{1}}{\partial x_{1}} && \frac{\partial f_{1}}{\partial x_{2}} \\ 
\frac{\partial f_{2}}{\partial x_{1}} && \frac{\partial f_{2}}{\partial x_{2}}
\end{bmatrix} 

\begin{bmatrix}
\Delta x_{1} \\ 
\Delta x_{2}
\end{bmatrix}
+
\begin{bmatrix}
\frac{\partial f_{1}}{\partial u} \\ 
\frac{\partial f_{1}}{\partial u} 
\end{bmatrix}

\begin{bmatrix}
\Delta u
\end{bmatrix}
$$

When we throw out the higher order terms, we finally end up with the following:

![[Pasted image 20230913142045.png]]






Now, an example:

$$x''(t) = g(x(t), x'(t), u(t))$$

$$x''(t) = 4x + 6 x x' - (x')^{2} + u x' + 5u$$

Let $z_{1}= x$, and $z_{2}= x'$. To rewrite the equation as two, 1st order coupled non-linear differential equations.

$$z_{1}'' = \frac{dz_{1}}{dt}= \frac{dx}{dt} = x' = f_{1}(z_{1}, z_{2}, u)$$

$$z_{2}= x'' = 4z_{1} + 6 z_{1}z_{2} - z_{2}^{2} + u z_{2} + 5u = f_{2}(z_{1}, z_{2}, u)$$

Now, we have rewritten the given example in terms of $z_{1}$, and $z_{2}$. 

$$z_{1}' = f_{1}(z_{1}, z_{2}, u)$$
$$z_{2}' = f_{2}(z_{1}, z_{2}, u)$$


%% $$\Delta z_{1}'(t) = \frac{\partial f_{1}}{\partial z_{1}} \biggr\rvert_{z_{1}= z_{0}, z_{2}= z_{20}, u= u_{0}} (z_{1} - z_{10}) 
+
\frac{\partial f_{1}}{\partial z_{2}} \biggr\rvert_{z_{1}= z_{0}, z_{2}= z_{20}, u= u_{0}} (z_{1}= z_{10}) 

$$ %%




![[Pasted image 20230913143259.png]]




**Equilibrium Condition**

Many times, it is an operating point and we are looking for values of $z_{1}, z_{2}$, and $u$ when $z_{12}' = 0$, and $z_{20}'=0$ 































