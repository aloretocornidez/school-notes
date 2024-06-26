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

**Mental Image** ![[Pasted image 20230911141343.png]]

$A$ is the system matrix, $B$ is the Input matrix.

![[Pasted image 20230911141406.png]]

If you do the multiplication, then all of the pieces on the right hand side
have:

- No product terms:
  - $\alpha x_{1}(t)x_{2}(t)$
  - $\beta u^{2}(t)$
- No non-linear terms:
  - $\gamma sin(x_{1}(t))$
  - $\gamma \sqrt{x_{2}(t)}$

### Common Non-Linearities

**Amplifier Saturation** ![[Pasted image 20230911141822.png]]

**Dead Zone** ![[Pasted image 20230911141834.png]]

**Backlash** ![[Pasted image 20230911141853.png]]

Our tools (analysis & design) work best with linear systems.

What do we do if we have non-linearity in our system?

**Answer**: Linearization (See Schaum's Chapter 19).

### Example of Linearization

$$x'(t) - 2x^{2}(t) = u(t)$$

isolate the derivative term $$x'(t) = 2x^{2}(t) + u(t)$$

$$f(x(t), u(t)) = 2x^{2}(t) + u(t)$$

$$x'(t) = f(x(t), u(t))$$

In general, $x'(t) f(x(t), u(t))$ contains non-linear terms containing $x(t)$,
$u(t)$, or both.

**Taylor Series Expansion**

$$f(x(t), u(t) = f(x_{0}, u_{0})) + \frac{\partial f}{\partial x}$$

![[Pasted image 20230911142533.png]]

Now we just want the expression to be written in first order variations of
$x(t)$ and $u(t)$.

![[Pasted image 20230911142714.png]]

_Note the $\approxeq$ approximation instead of the $=$_

**Returning to the example and applying the Taylor Series**

$$x'(t) = 2x^{2}(t) + u(t)$$

Nominal operating point (Needs to satisfy the governing differential equation):

$$x_{0}= 1, u_{0} = -2$$

Verify:

$$x_{0}'(t) = f(x_{0}(t), u_{0}(t))$$

$$0 = 2x_{0}^{2}+u_{0}(t) = 2 - 2 = 0$$

These now satisfy the governing eqution: $$\therefore x_{0}=1, u_{0}=2$$

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

First, let's Laplace transform the funrciton to get the system into the
frequency domain:

# Lecture 2.2 | Vector Linearization with Example

#learninggoals

- Work through vector Linearization Example
- Begin System Identification from Step Response Data

### Vector Linearization

Non linear system, $x(t) \in \mathbb{R}^{n}$

$$x'(t) = f(x(t), u(t))$$

$$x_{0}'(t) = f(x_{0}(t), u_{0}(t))$$

**Second Order Example**

Phase plane ![[Pasted image 20230913140609.png]]

The yellow and magenta lines are the eigen vectors of the phase plane.

$$
\begin{bmatrix} x_{1}' \\ x_{2}' \end{bmatrix} =

\begin{bmatrix} f_{1}(x_{1} , x_{2}, u) \\ f_{2}(x_{1} , x_{2}, u) \end{bmatrix}
$$

This is a non-linear system. $x(t) = x_{0}(t) + \Delta x(t)$

$$
x'(t) = x_{0}'(t) + \Delta x(t) =\begin{bmatrix}x_{10}'(t) \\ x_{20}'(t)
\end{bmatrix}+\begin{bmatrix} \Delta x_{1}'(t) \\ \Delta x_{2}'(t) \end{bmatrix}
$$

We state that we have a **nominal equilibrium condition** solution of this

![[Pasted image 20230913141332.png]]

$$
\approx \begin{bmatrix} f_{1}(x_{10}, x_{20}u_{0}) \\ f_{2}(x_{10},
x_{20}u_{0}) \end{bmatrix}

\begin{bmatrix} \frac{\partial f_{1}}{\partial x_{1}} && \frac{\partial
f_{1}}{\partial x_{2}} \\ \frac{\partial f_{2}}{\partial x_{1}} &&
\frac{\partial f_{2}}{\partial x_{2}} \end{bmatrix}

\begin{bmatrix} \Delta x_{1} \\ \Delta x_{2} \end{bmatrix}

-

\begin{bmatrix} \frac{\partial f_{1}}{\partial u} \\ \frac{\partial
f_{1}}{\partial u} \end{bmatrix}

\begin{bmatrix} \Delta u \end{bmatrix}
$$

When we throw out the higher order terms, we finally end up with the following:

![[Pasted image 20230913142045.png]]

Now, an example:

$$x''(t) = g(x(t), x'(t), u(t))$$

$$x''(t) = 4x + 6 x x' - (x')^{2} + u x' + 5u$$

Let $z_{1}= x$, and $z_{2}= x'$. To rewrite the equation as two, 1st order
coupled non-linear differential equations.

$$z_{1}'' = \frac{dz_{1}}{dt}= \frac{dx}{dt} = x' = f_{1}(z_{1}, z_{2}, u)$$

$$
z_{2}= x'' = 4z_{1} + 6 z_{1}z_{2} - z_{2}^{2} + u z_{2} + 5u = f_{2}(z_{1},
z_{2}, u)
$$

Now, we have rewritten the given example in terms of $z_{1}$, and $z_{2}$.

$$z_{1}' = f_{1}(z_{1}, z_{2}, u)$$ $$z_{2}' = f_{2}(z_{1}, z_{2}, u)$$

%% $$\Delta z*{1}'(t) = \frac{\partial f*{1}}{\partial z*{1}}
\biggr\rvert*{z*{1}= z*{0}, z*{2}= z*{20}, u= u*{0}} (z*{1} - z\_{10})

-

\frac{\partial f*{1}}{\partial z*{2}} \biggr\rvert*{z*{1}= z*{0}, z*{2}= z*{20},
u= u*{0}} (z*{1}= z*{10})

$$
%%

![[Pasted image 20230913143259.png]]

**Equilibrium Condition**

Many times, it is an operating point and we are looking for values of $z_{1},
z_{2}$, and $u$ when $z_{12}' = 0$, and $z_{20}'=0$

# First Order Systems and Their Identification (2.12)

#learninggoals

- List/Discuss Common First-Order Systems
- Work through a 1st-order System Identification Example
- 1st Order System ID w/ different data
- 2nd order system ID (See Lab \#1)

### First Order Systems Example

![[Pasted image 20230915140810.png]]

RC Circuit

**KVL**

$$-v_{i}(t) + RCv_{0}'(t) + v_{0}(t) = 0$$

$$\Longrightarrow v_{0}'(t) = -\frac{1}{RC}v_{0}(t) + \frac{1}{RC}v_{i}(t)$$

Transfer Function:

$$sV_{0}(s) = \frac{-1}{RC}V_{0}(s) + \frac{1}{RC}V_{i}(t)$$

$$\left(s + \frac{1}{RC}\right)V_{0}(s) = \frac{1}{RC}V_{i}(s)$$

$$\frac{V_{0}(s)}{V_{i}(s)) } = \frac{\frac{1}{RC}}{s + \frac{1}{RC}} =
\frac{\frac{1}{RC}}{\frac{1}{RC}(RCs+1)} = \frac{1}{\tau s + 1}
$$

### Cruise Control

![[Pasted image 20230915141655.png]]

$$\Longrightarrow mv' + bv = u $$

**Transfer Function**

$$smV(s) = bV(s) = U(s)$$

$$(sm+b) V(s) = U(s)$$

$$
\frac{V(s)}{U(s)} = \frac{1}{sm+b} = \frac{1}{b(\frac{m}{b}s+1)}=
\frac{\frac{1}{b}}{\frac{m}{b}s + 1}= \frac{\alpha}{\tau s + 1 }
$$

These are examples of first order systems:

- Thermal System
- Fluid in a Tank
- DC Motor

For example: The DC motor system is a first order system.

![[Pasted image 20230915141542.png]]

### First Order System Identification

![[Pasted image 20230915142008.png]]

Where: $G(s) = \frac{\alpha}{\tau s +1 }$

![[Pasted image 20230915142338.png]]

$$e^{-5} \approx 0.00674$$

This is 0.1 because I'm an engineer, so:

$$e^{-5} \approx 0.01$$

Setting Time: $T_{s}= 5\tau$

Now, assume a constant input: $U(s) = \frac{A}{s}$

$$\Longrightarrow = Y(s) = G(s) U(s)$$

$$Y(s) = \frac{\alpha}{\tau s + 1 }\frac{A}{s} = \frac{A\alpha}{s(\tau s + 1)}$$

Using the Final Value Theorem:

$$y_{fv} = \lim_{t\rightarrow \infty }y(t) = \lim_{s \rightarrow 0}s Y(s)$$

$$
y_{fv}= \lim_{s \rightarrow 0} \frac{A\alpha s}{s (\tau s + 1 )} = A\alpha =
A_{1}
$$

$$\therefore \alpha A \Longrightarrow \alpha = \frac{A_{1}}{A}$$

The DC Gain of $G(s)$ : $G0 = \alpha$

1% Settling Time $T_{s} = 5 \tau$

$$\Longrightarrow \tau = \frac{T_{s}}{5}$$

**Example**

Objective: FInd $\alpha$ and $\tau$

$$\omega(s) = G(s) V(s)$$

![[Pasted image 20230915143639.png]]

This is the `Pole-Zero Form`

Do Partial Fraction Expansion

This renders the following:

$$\omega(t) = B_{1}+ B_{2}e^\frac{-t}{\tau}$$

$$\omega(t) = A\alpha - A\alpha e^{\frac{-t}{\tau}} = A\alpha (1 - e^{-t\tau})$$

Now what?

![[Pasted image 20230915144420.png]]

We can find the final value using the `final value theorem`

![[Pasted image 20230915144618.png]]

Recall, this value is actually equal to $A_{1}$

$$\alpha = \frac{A_{1}}{A} $$

![[Pasted image 20230915144824.png]]

$$\omega(t_{1}) = w_{1} = A\alpha\left(1- e ^{\frac{-t_{1}}{\tau}}\right)$$

Now, we can solve for $\tau$ using the star equation.

%% $$\frac{\omega_{1}}{{A\alpha}} = $$ %%

![[Pasted image 20230915145043.png]]

# Lecture 2.4 | Second-Order System ID: Connecting Frequency Domain Representations with Time Domain Waveforms

#learninggoals

- Motivate and Develop System Identification Techniques for Under-damped 2nd
  order systems.

### 2nd-order System Identification

(Will Concentrate on Underdamped Systems)

![[Pasted image 20230918140120.png]]

Suppose\
$$G_{a}(s) = \frac{\omega_{d}}{(s+\sigma)^{2} + \omega_{d}^{2}}$$

Poles of $G_{a}(s)$

Den: $(s + \sigma )^{2} + \omega_{d}^{2}= 0 \rightarrow (s+\sigma)^{2} =
-\omega_{d}^{2}, (s+\sigma) = \pm \sqrt{-\omega_{d}} = \pm j\omega_{d}$

$$s = -\sigma\pm\omega_{d}$$

![[Pasted image 20230918140728.png]]

Initial Condition Response: $y_{a}(t) = ?$

or an impulse response: $U(t) = \delta(t) \Longrightarrow u(s) =$ j

# Lecture 3.1 | Converting a Transfer Function into an Input Feed-forward State Space Representation

#learninggoals Exercise: Transfer function to StateSpace Representation Develop
techniques for converting between system representations. Create an input
feedforward state space representation. Example (Strictly Proper T>F.): Strictly
Proper <==> deg(Num) < deg(Den) Discuss how to handle a proper T.F.: Proper T.F.
<==> deg(Num) < deg(Den)
