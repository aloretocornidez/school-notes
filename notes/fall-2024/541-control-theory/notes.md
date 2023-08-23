# ECE 541 | Automatic Control

# Unit 0 | Pre-Requisite Lecture
## Announcements | August 28th, 2023
- Passport Assignment Due Monday 08/28/2023
- Prerequisite Quiz Due Wednesday 09/06/2023
- Homework 1 Due Monday 09/11/2023
	- Submit work on D2L assignments
	- Submit answers on D2L quizes.

# Class Units
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



### Series LRC Circuit





# Unit 1
### Announcements | August 23rd, 2023
- Homework 1 | Due 09/11/2023

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
**Mass Spring Damper System**

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

$$G(s) = X\frac{s}{U(s)} = \frac{1}{Ms^{2} + Bs + k}$$

**State Space Representation**

![[Pasted image 20230823142900.png]]

$z$ | Displacement
$z'$ | Velocity
*Note:* $\gamma_u$ is now the 

$$\gamma u(t) = Mz''(t) + Bz'(t)+ kz(t)$$

This is a second order differential equation.

If you have the system equation you can determine future system states.

![[Pasted image 20230823143121.png]]

*Solve for the highest power derivative in the differential equation (in this case, solve for $z''(t)$*)

$$z''(t) = - \frac{B}{M} z'(t) - \frac{K}{M} z(t) + \frac{\Gamma}{M} u(t)$$

We are seeking to obtain **two** **coupled** first order differential equations.

Let $x_{1}(t) = z(t)$ and $x_{2}(t) = z'(t)$.

Now we need an equation for both of the state variables in terms of the state variables ($x_{1}(t)$, $x_{2}(t)$) and the input ($u(t)$)

Finding $x_{1}(t)$:

$$x_{1}(t) = \frac{d}{dt}(z(t)) = z'(t) = x_{2}(t)$$


Finding $x_{2}(t)$:

$$x_{2}(t) = \frac{d}{dt}(z'(t)) = z''(t) =  - \frac{B}{M} z'(t) - \frac{K}{M} z(t) + \frac{\Gamma}{M} u(t)$$

Replace $z$ with $x$

$$ x_{2}(t) = - \frac{B}{M} x_{2}'(t) - \frac{K}{M} x_{1}(t) + \frac{\Gamma}{M} u(t)$$

$$
\begin{bmatrix}
x_{1}'(t) \\ x_{2}'(t)'
\end{bmatrix}
=
%Begin A
\begin{bmatrix}
0 && 1  \\ 
-\frac{K}{M} && -\frac{B}{M}
\end{bmatrix}
%End A

\begin{bmatrix}
x_{1}(t) \\ x_{2}(t)'
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

$$y(t) = X(t) = x_{1}(t)$$

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

$$x'(t) = Ax(t) + Bu(t)$$
$$y(t) = Cx(t) + Du(t)$$

Where

$$A \in \mathbb{R}, B \in \mathbb{R}$$
$$C \in \mathbb{R}, D \in \mathbb{R}$$


**All Integrator Block Diagram**

2 State Variable Components $(x_{1}(t) ,x_{2}(t))$


![[Pasted image 20230823145027.png]]































































