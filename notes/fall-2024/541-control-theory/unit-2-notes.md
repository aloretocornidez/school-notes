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

**Returning to the example**

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