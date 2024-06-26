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
x_{1}(t) \\ 
x_{2}(t) 

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



# Lecture 1.4 | Three Mass System

#learninggoals:
- Develop equations of motion for a 3 mass system
- Create "a" State Space Representation for the 3 mass system

![[Pasted image 20230830141056.png]]

**Assign position variables.**


How many position variables are needed?

*(Which points can move independent of the others, if all of the other points are held fixed?)*

**4 Position variables**


**How many free body diagrams?**
We also need 4.

**Free Body Diagram  Mass #1**
![[Pasted image 20230830141706.png]]


Determine the forces that are present when $M_{1}$ moved to the positive direction. Identify and label the forces. Define the forces in terms of coefficients $(K_{i},B_{i}, M_{i})$, positions, velocities, and accelerations.

$$f_{k_{1}} = K_{1}Z(t)$$
$$f_{B_{1}} = B_{1}Z'(t)$$
$$f_{M_{i1}} = M_{1}Z''(t)$$
$$f_{k_{2}} = K_{2}(Z_{1}(t)- Z_{4}(t))$$
$$f_{k_{3}} = K_{3}(Z_{1}(t)- Z_{3}(t))$$

Now we need the sum of all forces:

![[Pasted image 20230830142715.png]]

$$M_{1} z_{1}''(t) + B_{1} z_{1}'(t) + K_{1}z_{1}(t) + K_{2}(z_{1}(t) - z_{4}(t)) + K_{3}(z_{1}(t) - z_{3}(t)) = U(t)$$

**Freebody Diagram Mass #2**

![[Pasted image 20230830143527.png]]


$$f_{i_{M_{2}}} = M_{2}z_{2}''(t)$$

$$f_{B{2}} = B_{2}(z_{2}'(t) - z_{4}'(t))$$


Now sum the forces:

$$M_{2}Z_{2}''(t) + B_{2}(z_{2}'(t) - z_{4}'(t)) = 0$$




**Freebody Diagram Mass #3**

![[Pasted image 20230830143921.png]]

Now, sum the forces:

$$\sum\limits f = f_{i}+ f_{B} + f_{K} + u_{3} = 0$$

$$M_{3}z_{3}''(t) + B_{3}z_{3}'(t) + K(z_{3}(t) -z_{1}(t)) + u_{3}(t) = 0$$



**Freebody Diagram Mass #4**

![[Pasted image 20230830144943.png]]


Sum the forces:
$$ f_{B_{2}} + f_{K_{2}} = 0$$


$$B_{2}(z_{4}' - z_{2}'(t)) + K_{2}(z_{4}(t) - z_{1}(t)) = 0$$



**System Order**

Add of the highest power derivative of each variable?

This is a 7th order system.





# Lecture 1.5 | Transfer Function from Block Diagram

### Learning Goals
- Derive the transfer function expression of a classical block diagram
- Review Approach to generate the equations of motion (mechanical system)
- Recap the 3-mass system derivation
- Discuss placing dynamic equations into "a" state space representation.



### Block Diagram Algebra

![[Pasted image 20230901140802.png]]

- Input Signal: $R(s)$
- Output Signal: $Y(s)$
- "Error" Signal: $E(s)$

### Closed-loop Transfer Functions:

Find $$T(s) = \frac{Y(s)}{R(s)}$$.

The output of the summing junction must equal the inputs of the summing junction:
$$E(s) = R(s) - H(s)Y(s)$$

Output signal:
$$Y(s) = G(s)E(s) = G(s) (R(s) - H(s) Y(s)) $$

$$Y(s) = G(s) R(s) - G(s) H(s) Y(s)$$

$$Y(s) (1 + G(s)H(s)) = G(s)R(s)$$

Assuming SISO (Single-Input, Single Output)

$$T(s) = \frac{Y(s)}{R(s)} = \frac{G(s)}{1 + G(s)H(s)}$$

Additional Block Diagram Configurations

![[Pasted image 20230901142045.png]]

Now:

$$T_{1}(s) = \frac{Y(s)}{R(s)} = \frac{G(s)}{1 + G(s) H(s)} = \frac{D(s)G_{p}(s)}{1+D(s)G_{p}(s)}$$


**Deriving Dynamic Equations  (Review of Mechanical Systems)**

- Sketch System
- Identify Variables
- Sketch freebody diagrams w/ forces identified
- Define forces (physical relationships), e.g., $f_{k_{3}} = K_{3}(z_{1}-z_{3})$
- Write equilibrium equations and substitute force relations.


### Creating A State Space Representation

![[Pasted image 20230901142923.png]]

$$x'(t) = Ax(t) + Bu(s)$$
$$y(t) = Cx(t) + Du(t)$$

$$x(t) \in \mathbb{R}^{7 \times 1}, u(t) \in \mathbb{R}^{2 \times 1}$$

---
Define state variables.

![[Pasted image 20230901143401.png]]

$$u(t) = 
\begin{bmatrix}
u_{1}(t) \\ 
u_{2}(t)
\end{bmatrix}
=
\begin{bmatrix}
v_{1}(t) \\ 
v_{2}(t)
\end{bmatrix}$$

Output:
*Mass positions*
$$y(t) = 
\begin{bmatrix}
y_{1}(t) \\ 
y_{2}(t) \\ 
y_{3}(t)
\end{bmatrix}
=
\begin{bmatrix}
z_{1}(t) \\ 
z_{2}(t) \\ 
z_{3}(t)
\end{bmatrix}
=
\begin{bmatrix}
x_{1}(t) \\ 
x_{3}(t) \\ 
x_{5}(t) 
\end{bmatrix}
$$

$$y(t) \in \mathbb{R}^{3 \times 1}$$


$$x'(t) = 

% x'(t) | 7 x 1
\begin{bmatrix}

\end{bmatrix}
=

% A | 7 x 7
\begin{bmatrix}

\end{bmatrix}

% x(t) | 7 x 1
\begin{bmatrix}

\end{bmatrix}
+
% C | 3 x 1
\begin{bmatrix}

\end{bmatrix}
u(t)
$$


$$
y(t) = 

% C | 3 x 7
\begin{bmatrix}
\end{bmatrix}

% X
\begin{bmatrix}
\end{bmatrix}

+

% D | 3 x 2
\begin{bmatrix}
\end{bmatrix}

% u(t)

$$



What is the 2nd row of the dynamic equation?

$$x_{2}'(t) = z_{1}''(t) = ?$$

From Free body diagram # 1:

$$z_{1}''(t) = - \frac{B_{1}}{M_{1}} z_{1}'(t) - \frac{K_{1}}{M_{1}z_{1}(t)}- \frac{K_{2}}{M_{1}}z_{1}(t) + \frac{K_{2}}{M_{1}z_{4}(t)}- \frac{K_{3}}{M_{1}}z_{1}(t) + \frac{K_{3}}{M_{1}}z_{3} + \frac{1}{M_{1}}v(t)$$

Plug in other components:
$$z_{1}''(t) = - \frac{B_{1}}{M_{1}} x_{2}(t) - \frac{K_{1}}{M_{1}}x_{1}(t)- \frac{K_{2}}{M_{1}}x_{1}(t) + \frac{K_{2}}{M_{1}}x_{2}(t)- \frac{K_{3}}{M_{1}}x_{1}(t) + \frac{K_{3}}{M_{1}}x_{5}(t) + \frac{1}{M_{1}}u_{1}(t)$$




# Lecture 1.6 | Block Diagram Algebra

#learninggoals 
- Transfer Function from Block Diagram
- Representation Connections:
	- State Space
	- Block Diagram
	- Transfer Function
	- Differential Equations
- Develop D.C. Motor Governing Equations

![[Pasted image 20230906140632.png]]




### Transfer Function from Block Diagram
Find $T(s) = \frac{Y(S)}{R(s)}$


$$Y(s) = G_{2}(S) E_{2}(s)$$

First you want to start generating the output signals from the summing junctions.

How can one start?

Write equations in terms of $R(s)$ and $Y(s)$.



$$E_{2}(s) = R(s) + G_{1}E_{1}(s)$$

$$E_{1}(s) = R(s) - H_{2}Y(s) - H_{1}G_{1}E_{1}(s)$$


$$E_{1} + H_{1}G_{1}E_{1}(s) = R- H_{2}Y(s)$$


$$E_{1}(1  + H_{1}G_{1}) = R- H_{2}Y(s)$$


$$E_{1} = \frac{1}{1 + G_{1}H_{1}}R(s) - \frac{H_{2}}{1 + G_{1}H_{1}}Y(s)$$


$$E_{2}(s) = R(s) + \frac{G_{1}}{1 + G_{1}H_{1}}R(s) - \frac{G_{1}H_{2}}{1 + G_{1}H_{1}} Y(s)$$


$$Y(s) = G_{2}R(s) + \frac{G_{1}G_{2}}{1+G_{1}H_{1}}R(s) - \frac{G_{1}G_{2}H_{2}}{1 + G_{1}H_{1}} Y(s)$$

$$(1 + G_{1}H_{1}) Y(s) = (1 + G_{1}H_{1})G_{2}R(s) + G_{1}G_{2}R(s) - G_{1}G_{2}H_{2}Y(s)$$

$$(1+G_{1}H_{1}+ G_{1}G_{2}H_{2}) Y(s) = (G_{2}+ G_{1}G_{2}H_{1}+ G_{1}G_{2})R(s)$$

$$T(s) = \frac{Y(s)}{R(s)} = \frac{G_{2}+ G_{1}G_{2}H_{1}+ G_{1}G_{2}}{1+G_{1}H_{1}+ G_{1}G_{2}H_{2}}$$





### Connections between different methods

How to convert between different domains.

**State Space**

$$
x'(t) = 
\begin{bmatrix}
-1 && 2 \\ 
0 && -3
\end{bmatrix}
x(t) + 
\begin{bmatrix}
0 \\ 
1
\end{bmatrix}
$$

$$y(t) = \begin{bmatrix}4 && 5\end{bmatrix} x(t)$$

The #formula to convert between state space and transfer functions.
$$G(s) = C(sI--A)^{-1}B$$


---

**Block Diagram**

(All-Integrator Block Diagram)


*In the time domain:*
![[Pasted image 20230906142711.png]]


*In the frequency domain:*
![[Pasted image 20230906144610.png]]



### Mason's Gain

$$G(s) = C(sI--A)^{-1}B + D$$

We need to find paths and loops to find $G(s)$.

Paths & Loops

**Paths**
$$P_{1}(s) = \frac{8}{s^{2}}$$

$$P_{2}(S) = \frac{5}{s} $$


**Loops**

$$l_{1}(s) = \frac{-3}{s}$$

$$l_{2}(s)= \frac{-1}{s}$$


**Determinant Expression**


Find the sum of the loops
$$\sum\limits loops  = l_{1}+ l_{2}$$

Form pairwise produces of non-touching loops.
$$\sum\limits \text{Product of non-touching pairs of loops)} = l_{1}l_{2}$$

The sum of non-touching triples.
$$\sum\limits \text{Non touching triples}$$

The sum of non-touching quads.
$$\sum\limits \text{Non touching quads}$$

The sum of non-touching 5's.
$$\sum\limits \text{Non touching 5's}$$

and then you keep going.....

You need to alternate signs, +1, -, +, -

Now, our final Delta $\Delta$ is:
$$\Delta = 1 - (l_{1}+l_{2}) + (l_{1}l_{2})$$

$$\Delta = 1 - \left(\frac{-3}{s}\right)- \left(\frac{-1}{s}\right) + \left(\frac{-3}{s}\right) \left(\frac{-1}{s}\right)  $$

This expression goes in the denominator.



### Co-Factors

$\Delta_{i}$ is defined as what remains connected in the determinant expression after removing the $i^{th}$ path. Removing the $i^{th}$ path can disconnect or break loops.

Removing the blue path:
$$\Delta_{1} = 1 - (l_{1}+l_{2}) + l_{1}l_{2} = 1$$

Removing the yellow path:
$$\Delta_{2} = 1 - (l_{1}+l_{2}) + l_{1}l_{2} = 1 - \frac{-1}{s} = 1 + \frac{1}{s}$$


Now we get: 

$$T(s) = \frac{Y(s)}{U(s)} = \frac{P_{1}\Delta_{1} + P_{2}\Delta_{2}}{\Delta}$$


$$\frac{\frac{8}{s^{2}}+ \frac{5s+5}{s^{2}}}{1 + \frac{4}{s}+ \frac{3}{s^{2}}}$$

$$T(s) = \frac{5s+13}{s^{2}+4s+3}$$































































# Lecture 1.7 | Representation Connections (Wrap-Up)
**Topics:** Mason's Gain and DC Motor Modelling


#learninggoals 
- Finish Representation Connections:
	- Mason's Gain Example
	- State Space (S.S.) --> Transfer Function (T.F.)
	- Transfer Function (T.F.) --> Differential Equation (D.E.)


## Representation Connections
![[Pasted image 20230908140236.png]]


### Mason's Gain

 ![[Pasted image 20230908140601.png]] 

$$P_{i} = i^{th} \text{ path}$$

$$l_{i}= i^{th}\text{ loop}$$
$$\Delta = 1 - \sum\limits(\text{loops}) + \sum\limits(\text{Product of non touching pairs}) - \sum\limits(\text{Product of non touching triples}) + \sum\limits(\text{Product of non touching quads}) - \sum\limits(\text{Product of non touching 5's})$$

$$\Delta_{i} = i^{th} \text{ Co-factor (Remaining terms in in } \Delta \text{ after removing } i^{th} \text{ path.}$$

Transfer Function is then:
$$T = \frac{\sum\limits P_{i}\Delta_{i}}{\Delta}$$


![[Pasted image 20230908140809.png]]


### State Space to Transfer Function

![[Pasted image 20230908141858.png]]


Recall: 
$$G(s) = C(sI - A)^{-1}B+D$$

$$A = \begin{bmatrix}
-1 && 2  \\ 
0 && -3
\end{bmatrix}$$

$$B = \begin{bmatrix}0 \\ 1 \end{bmatrix}$$

$$C = \begin{bmatrix}4 && 5\end{bmatrix}$$
$$D = 0$$

Therefore:

$$G(s) = 
\begin{bmatrix}4&&5\end{bmatrix}
\begin{bmatrix}s+1 && -2 \\ 0 && s+3\end{bmatrix}^{-1}
\begin{bmatrix}0 \\ 1\end{bmatrix} + \begin{bmatrix}0\end{bmatrix}
$$

Continuing:
$$G(s) = 
\begin{bmatrix}4&&5\end{bmatrix}
\frac{1}{\Delta_{T}}
\begin{bmatrix}s+3 && -2 \\ 0 && s+1\end{bmatrix}^{-1}
\begin{bmatrix}0 \\ 1\end{bmatrix}
$$

Now:

$$G(s) - 
\begin{bmatrix}4 && 5\end{bmatrix}
\begin{bmatrix}2  \\ s+1\end{bmatrix} \frac{1}{\Delta_{T}}
=

\frac{s(4)+5(s+1)}{s^{2}+4s+3} 
=
\frac{8+5(s+1)}{s^{2}+ 4s+ 3}
$$


Finally: 

$$G(s) = \frac{5s+13}{s^{2}+4s+3}$$


### Transfer Function to Differential Equation

$$G(s) = \frac{Y(s)}{U(s)} = \frac{5s+13}{s^{2}+4s+3}$$

Cross Multiply:

$$ Y(s)(s^{2}+4s+3) = U(s) (5s+13) $$

Inverse Laplace transform:

$$y''(t) + 4y'(t) + 3y(t) = 5u'(t)+ 13u(t)$$







### Schematic (Electro -Mechanical System)

Motor and Rotating Shaft

![[Pasted image 20230908142905.png]]




$$G(s) = \frac{\Theta(s)}{V(s)}$$


$$-v(t) + R_{a}i_{a}(t) + L_{a} \frac{d i_{a}(t)}{dt} + v_{b}(t) = 0$$

Where: 
Applied Voltage: $-v(t)$
Armature resistance: $R_{a}$
Armature current: $i_{a}(t)$
Armature Inductance: $L_{a}$
Back EMF: $v_{b}(t)$

What is back EMF?
Back EMF: $v_{b}(t) = K_{b}\omega(t) = k_{m}\frac{d\theta(t)}{dt}$

Back proportionality constant: $K_{b}$
Motor Constant: $K_{m}$

#todo 


![[Pasted image 20230908144207.png]]



**Mechanical Side Equation:**
![[Pasted image 20230908143649.png]]

Note: Torque is analogous to force.

$$\tau_{m}= \tau_{i}+ \tau_{b}$$

Motor torque, inertial torque, and rotational damping torque

**Physical Relations**
**Motor Torque**: $\tau_{m} =K_{m}i_{a}$
Motor constant: $K_{m}$
Armature current: $i_{a}$

Note: Motor torque is proportional to armature current.


**Inertial Torque:**
![[Pasted image 20230908144404.png]]


![[Pasted image 20230908144159.png]]

**Damping Torque:**
![[Pasted image 20230908144224.png]]


**Equilibrium Equation (From mechanical side, see above): **

![[Pasted image 20230908144248.png]]

Now that we have the differential equation, let's Laplace transform the equation to simplify calculation:
![[Pasted image 20230908144445.png]]

Divide by $K_{m}$

![[Pasted image 20230908144458.png]]

Plug that into the electrical side of the LT equation

![[Pasted image 20230908144513.png]]

Which yields: 
![[Pasted image 20230908144527.png]]

Now we can do some algebra to render the equations:

![[Pasted image 20230908144541.png]]

![[Pasted image 20230908144608.png]]

And render the final equation: 

![[Pasted image 20230908144618.png]]




## Time Constants (In DC Motor Dynamics)

Mechanical Time Constant: $sJ + B$
J is rotational inertia, B is the damping.

Convert to time contant form $(\tau s + 1)$

We can factor out the B

![[Pasted image 20230908144928.png]]

For the electrical system, the same kind of thought process applies

![[Pasted image 20230908144958.png]]


![[Pasted image 20230908145023.png]]


Electrical is much faster than mechanical time constants:
![[Pasted image 20230908145032.png]]


Basically, we say, set the inductance to zero:
![[Pasted image 20230908145049.png]]


Which gives a second order system (instead of the higher order system:
#todo fill out the rest of the notes from the lecture note slides .




