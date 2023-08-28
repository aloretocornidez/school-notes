# ECE 541 | Automatic Control

# Lecture 1.0 | Prerequisite Lecture
## Class Units
In a quick 'image' this is the structure of the class.
1. Modelling
2. Analysis
3. Controller Design

## Methods of Modelling
### Physics
- Mechanical
	- $F = ma$
- Electrical
	- $KVL$, $KCL$, $v_{l} = L \frac{di_l(t)}{dt}$, ELI, $i_c(t) = C \frac{dv_c(t)}{dt}$
- Electro-mechanical
	- Combining  mechanical and electrical, for example, a DC motor.

### Time Domain
We can generate the transfer function $G(s)$ by observing the system response.
- Peak Time $T_p$
- 1% settling time $T_s$
- Percent overshoot

### Frequency Domain
We can also generate the transfer function $G(s)$ from the measurements in the frequency domain using the Bode plots.



## Methods of Analysis
### Time Domain
Using $T_p$, $T_s$, and 1% settling time we can observe behaviours.

$T_p$ = peak time, P.O. = Percent overshoot, $T_s$ = settling time.

### Frequency Domain

Using the $\text{s-plane}$ you can make a controller using the Root locus

## Controller Design
How do we design the controller $D[s]$? How do we build/design/create $D[s]$

It may be fairly straightforward:
$$D[s] = \frac{K(s+z)}{(s+p)}$$

Or maybe we can use the Root Locus, or bode plot/frequency domain perspective.

### PID Controllers
With higher order controllers, (PID) Controllers you can still use Root Locus and Bode plot strategies.

We will have State Space strategies that measure the full state of the system or even have some unknown variables and generate observed/estimated values and feed them back.

Impact of a Controller on Transient and Stead-State Behavior.



# Lecture 1.1 | Modeling Basics
#date August 23rd, 2023
### Learning Goals
- Develop "a" state space representation for the mass spring damper system


### Modelling Approach
1. Define system & boundaries
2. Identify variables
	- Through
		- Current
		- Force
	- Across
		- Voltage
		- Velocity
3. Write equilibrium &/or compatibility equations.
	- KCL & $\sum f$'s (forces)
	- KVL & $\sum v$'s' (velocities)
4. Write physical relations between variables
5.  Substitute (2) & (4) into (3)

#### Example
**Mass Spring Damper SyLearningstem**

![[Pasted image 20230823141026.png]]

We are interested in the displacement of the mass, so we have to determine our origin.


**Variables of Interest**
- $x$ | Displacement / Position
- $x' = v$ | Velocity (Time Rate of Change)


**Freebody Diagram**


![[Pasted image 20230823141743.png]]

*Inertial Force* (A made up measurement) is equal to the force times acceleration.

**Equilibrium of forces**
Now we have all the forces pointing to the left equal 

$f_i + f_b + f_k =u$

$u$ | Applied Force

**Physical Relations**
$f_{i} = m x''$ | Inertial Force
$f_{b} = B x'$ | Damping Force
$f_{k} = k x$ | Spring Force

**System Dynamics Governing Equation**
$$M x'' + B x' + kx = u$$
$$M x(t)'' + B x(t)' + kx(t) = u$$

**Transfer Function**
If you neglect the initial conditions, you can laplace transform the equation to render the transfer function

$$U(s) = Ms^{2}X(s) + BsX(s) + kX(s)$$


You can factor out $X(s)$

$$U(s) = X(s)(Ms^{2} + Bs + k)$$

You can move variables to get the transfer function $G(s)$

$$G(s) = \frac{X(s)}{U(s)} = \frac{1}{Ms^{2} + Bs + k}$$

**State Space Representation**

![[Pasted image 20230823142900.png]]

$z$ | Displacement
$z'$ | Velocity
$\Gamma$ | is the scaling variable *aka* gain constant 
*Note:* $\Gamma_u$ is now the force that drives the mass.

$$\Gamma u(t) = Mz''(t) + Bz'(t)+ kz(t)$$

This is a second order differential equation.

If you have the system equation you can determine future system states.

![[Pasted image 20230823143121.png]]

*Solve for the highest power derivative in the differential equation (in this case, solve for $z''(t)$, subtract and divide by **M**)*

$$z''(t) = - \frac{B}{M} z'(t) - \frac{K}{M} z(t) + \frac{\Gamma}{M} u(t)$$

We are seeking to obtain **two coupled** first order differential equations.

We can make two equations by using the setting the first one to the lowest derivative and then the next function equal to the derivative of the first equation. This can be extended to the amount of derivatives that are present in the system. 
$$x_{1}(t) = z(t)$$
$$x_{2}(t) = z'(t)$$.

Now we need an equation for both of the state variables in terms of the state variables and the input. (In terms of $x_{1}(t)$, $x_{2}(t), u(t)$)

Finding $x_{1}'(t)$:

$$x_{1}'(t) = \frac{d}{dt}(z(t))$$
$$x_{1}'(t) = z'(t)$$
$$x_{1}'(t) = x_{2}(t)$$


Finding $x_{2}'(t)$:

$$x_{2}'(t) = \frac{d}{dt}(z'(t))$$
$$x_{2}'(t) = - \frac{B}{M} z'(t) - \frac{K}{M} z(t) + \frac{\Gamma}{M} u(t)$$

Now we have two equations:
$$x_{1}'(t) = x_{2}(t)$$
$$x_{2}'(t) = - \frac{B}{M} z'(t) - \frac{K}{M} z(t) + \frac{\Gamma}{M} u(t)$$

Replace all $z$ terms with $x$ terms.

$$ x_{2}'(t) = - \frac{B}{M} x_{2}'(t) - \frac{K}{M} x_{1}(t) + \frac{\Gamma}{M} u(t)$$

Now we get the final two equations:
$$x_{1}'(t) = x_{2}(t)$$
$$ x_{2}'(t) = - \frac{B}{M} x_{2}'(t) - \frac{K}{M} x_{1}(t) + \frac{\Gamma}{M} u(t)$$


And now we can create the state space representation of the system:
$$
\begin{bmatrix}
x_{1}'(t) \\ x_{2}'(t)
\end{bmatrix}
=
%Begin A
\begin{bmatrix}
0 && 1  \\ 
-\frac{K}{M} && -\frac{B}{M}
\end{bmatrix}
%End A

\begin{bmatrix}
x_{1}(t) \\ x_{2}(t)
\end{bmatrix} 
+

% Begin B
\begin{bmatrix}
0  \\ \frac{\Gamma}{M}
\end{bmatrix}
% End B
u(t)
$$


Let's assume than output for this system is the position of the mass.

**Output Equation**

$$y(t) = z(t) = x_{1}(t)$$

$$\therefore y(t) = 

\begin{bmatrix}
1 && 0
\end{bmatrix}
\begin{bmatrix}
x_{1}(t) \\ 
x_{2}(t)
\end{bmatrix}

+
% Direct Feedthrough
\begin{bmatrix} 
0
\end{bmatrix}
% End Direct-feedthough
u(t)
$$


**General Form of State Space Representation:**
#equation

$$x'(t) = Ax(t) + Bu(t)$$
$$y(t) = Cx(t) + Du(t)$$

Where

$$A \in \mathbb{R}, B \in \mathbb{R}$$
$$C \in \mathbb{R}, D \in \mathbb{R}$$


**All Integrator Block Diagram**

2 State Variable Components $(x_{1}(t) ,x_{2}(t))$


![[Pasted image 20230823145027.png]]







# Lecture 1.2 | State Space Representation
#date August 25th, 2023
## Learning Goals 
- Activity Quiz
- Challenge Problem
- Introduce Linear State Space Representation
- Find a S.S> for a Mass-Spring-Damper (MSD) System (Pairs: Problem Solver, Lister)
- All-Integrator Block Diagram of MSD
- Sketch a block diagram in s-Domain
- Discuss the Bode Plot for the MSD System --> need $G[s]$


### Activity Quiz
Since Wednesday,
1. Went Swimming? --> Viscous Damping $B$
2. Filled Water Bottle? --> 1 L 1000G = 1 kg
3. Disassemble a Pen? Spring Constant, $k$




### Challenge Problem

Find the state equations for:

$$2z''(t) + \left(\frac{1}{4}\right)z'(t) + 6z(t) = 20u(t)$$

**Attempt**
$$x_{1}(t) = z'(t)$$
$$x_{2}(t) = z(t)$$
*End Attempt*



Solution: Since the system is a second order equation, you need to look for 2 state equations.

$$z''(t) = x_{1}'(t) \Rightarrow x_{1}(t) = z'(t)$$
$$x_{2}'(t) = z'(t) \Rightarrow x_{2}(t) = z(t)$$


Re-ordering the differential equation lets us plug in our $x_{1}(t)$ into the system equation.
$$z''(t) = x_{1}'(t) = \frac{-1}{8}z'(t) - 3z(t) + 10u(t)$$


We then find $x_{1}'(t)$ in terms of $u(t)$ and $x(t)$
$$x_{1}'(t) = -\frac{1}{8}x_{1}(t) - 3x_{2}(t) + 10u(t)$$

Then we can plug in $x_{2}(t)$ to the equation we just found for $x_{1}(t)$ to get the second equation.
$$x_{2}'(t) = z'(t) = x_1(t)$$

$$x_{2}'(t) = x_{1}(t)$$

#explanation
> **How did we obtain the above state variables?**

> We know we need 2 state variables since we are starting with a second-order differential equation. One of those state variables can be defined by realizing that the first derivative of that state variable component needs to equal the highest derivative in the differential equation.


$$\therefore \text{Let } x_{1}'(t) = z''(t)$$
$$\Rightarrow x_{1}(t) = z'(t)$$

Now we need a second state variable's first derivative to equal $z'(t)$. 
$$\therefore \text{Let } x_{2}'(t) = z'(t)$$
$$\Rightarrow x_{2}(t) = z(t)$$

Now, we can write down the 2 first-order differential equations.
First:
$$z''(t) = - \frac{1}{8}z'(t) - 3 z(t) + 10 u(t)$$
$$x_{1}'(t) = - \frac{1}{8}x_{1}(t) - 3 x_{2}(t) +10 u(t)$$

Second:
*We need an $x_{2}'(t)$ equation written in terms of $x_{1}(t), x_{2}(t), u(t)$.*
$$x_{2}'(t) = z'(t) = x_{1}(t)$$
$$\therefore x_{2}'(t) = x_{1}(t)$$


### Linear State Space Representation
(Useful for `MATLAB` simulation and analysis)

Dynamic Equations
$$\dot{x}(t) = Ax(t) + Bu(t)$$

Output Equations
$$y(t) = Cx(t) + Du(t)$$

Where,
$$x \in \mathbb{R}^{n}, u \in \mathbb{R}^{m}, y \in \mathbb{R}^{r}$$



Unpacking the State Space representation when $n = 2, m = 1, r = 1$.

$$
\begin{bmatrix} 
\dot{x}_{1}(t)  \\ 
\dot{x}_{2}(t)
\end{bmatrix}

=

\begin{bmatrix}
a_{11} && a_{12}  \\ 
a_{21} && a_{22}
\end{bmatrix}
\begin{bmatrix}
x_{1}(t)  \\ 
x_{2}(t)
\end{bmatrix}
+ 
\begin{bmatrix}
b_{11} \\ 
b_{21}
\end{bmatrix}
u(t)
$$

System Matrix | $A \in \mathbb{R}^{n \times n}$
Input Matrix | $B \in \mathbb{R}^{n \times m}$


$$
y(t) = 
\begin{bmatrix}
c_{11} && c_{12}
\end{bmatrix}
\begin{bmatrix}
x_{1}(t)  \\ 
x_{2}(t)
\end{bmatrix}

+
\begin{bmatrix}
d_{11}
\end{bmatrix}
u(t)
$$

Output Matrix | $C \in \mathbb{R}^{n \times n}$
Direct Feedthrough Matrix | $D \in \mathbb{R}^{r \times m}$


Now with the system set up:
$$x'{1}(t)= a_{11}x_{1}(t) + a_{12}x_{2}(t) + b_{11}u(t)$$

$$x'_{2}(t) = a_{21}x_{1}(t) + a_{22}x_{2}(t) + b_{21}u(t)$$

$$y(t) = c_{11}x_{1}(t) + c_{12}x_{2}(t) + d_{11}u(t)$$


### Application
Find a state space representation for the Mass-Spring-Damper System.

![[Pasted image 20230825143410.png]]

$$Mz''(t) + Bz'(t) + kz(t) = \Gamma u(t)$$

Now, let $$x_{1}(t) = z(t)$$ and $$x_{2}(t) = z'(t)$$

**Find A & B**


$$A = 
\begin{pmatrix}0 && 1 \\ 
\frac{-k}{m} && \frac{-b}{m}
\end{pmatrix}


$$

Output Matrix

Let $y(t) = z(t)$.

$$y(t) =
\begin{bmatrix}
1 && 0 
\end{bmatrix}

\begin{bmatrix}
x_{1}(t)  \\ 
x_{2}(t)
\end{bmatrix}

+

\begin{bmatrix}
0
\end{bmatrix}
u(t)$$


### Size of the State Space Matrices 
Suppose you are given a system that has:
- 20 state variable components
- 3 inputs
- 2 outputs

Find **A, B, C, D**

A is 20 x 20
B is 20 x 3
C is 2 x 20
D is 2 x 3

### All Integrator Block Diagram
Diagram:

![[Pasted image 20230825144617.png]]

Note: The output of an integrator is a state variable component.

Application: MSD System

![[Pasted image 20230825145011.png]]







































































# Lecture 1.3 | Generating Transfer Functions

#todo Fill out the notes from the first 20 minutes of class.











### All-Integrator Block Diagram
![[Pasted image 20230828142356.png]]


Create a frequency domain block
![[Pasted image 20230828142449.png]]



$$W(s) = \frac{\Gamma}{M} U(s) - \frac{K}{M}X(s) - \frac{B_{1}}{M} X_{2}(s)$$

$$X_{2}(s) = \frac{1}{s} W(s)$$

$$X(s) = \frac{1}{s}X_{2}(s) = \frac{1}{s}\left(\frac{1}{s}W(s)\right) = \frac{1}{s^{2}}W(s)$$

$$\Rightarrow W(s) = s^{2} X(s) $$

$$X_{2}(s) = sX(s)$$

$$\therefore s^{2}X(s) = \frac{\Gamma}{M}U(s) - \frac{K}{M}X(s) - \frac{B_{1}}{M}sX(s)$$

Now combine all terms:

$$\left(s^{2}+ \frac{B_{1}}{M}s + \frac{K}{M}\right)X(s) = \frac{\Gamma}{M} U(s)$$

$$G(s) = X\frac{s}{U(s)} = \frac{\frac{\Gamma}{M}}{s^{2}+ \frac{B_{2}}{M}s + \frac{K}{M}}$$


### Transfer Function from the State Space Representation

Given the state space representation:
![[Pasted image 20230828143242.png]]

You can generate the differential equation like this:
![[Pasted image 20230828143252.png]]


Now you can laplace transform the differential equation.

$$\mathbb{L}\{\bar{x}'(t)\} = \mathbb{L}\{A\bar{x}(t) + B u(t)\}$$


$$\mathbb{L}\{\bar{x}'(t)\} = \mathbb{L}\{A\bar{x}'(t)\} + \mathbb{L}\{B u(t)\}$$

$$s X(s) - \bar{x}(o^{-}) = A \mathbb{L}\{\bar{x}(t)\} +  B\mathbb{L}\{u(t)\}$$

Where $I$ is the identity matrix $n \times n$. 

$$(sI - A) \bar{X}(s) = \bar{x}(0^{-}) + B U(s)$$


Now we can re-write the Laplace transform of the state vector 
$$\Rightarrow \bar{X}(s) = (sI - A)^{-1}\bar{x}(0^{-}) + (sI - A)^{-1}B\bar{U}(s)$$



Output Equation: 
$$\mathbb{L} \{y(t)\} = \mathbb{{L}} \{C\bar{x}(t) + D \bar{u}(t)\}$$



#### General Form of the Transfer Function from State Space Representation

$$Y(s) = [C(sI - A)^{-1}B = D]U(s)$$



