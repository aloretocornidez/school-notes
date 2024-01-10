# Homework 2 | ECE 541
Name: Alan Manuel Loreto Cornídez

## Question 1
![[Pasted image 20230916161712.png]]

First, find $\frac{\partial f}{\partial \theta}$ and $\frac{\partial f}{\partial u}$

$$\frac{\partial f}{\partial \theta} = cos(\theta)$$

$$\frac{\partial f}{\partial u} = 1$$

Now we can calculate $u_{0}$ for each different given $\theta_{0}$ by plugging each given $\theta_{0}$ into the equation $0 = sin(\theta_{0}) + u_{0}$.

**Part A** $\theta_{a} = 0$ 
$$0 = sin(0) + u_{b}$$
Solving gives: $$u_{a} = 0$$

**Part B** $\theta_{b} = \frac{\pi}{4}$ 
$$0 = sin(\frac{\pi}{4}) + u_{b}$$
Solving gives: $$u_{b} = - \frac{\sqrt{2}}{2}$$

**Part C** $\theta_{c} = \pi$ 
$$0 = sin(0) + u_{c}$$
Solving gives: $$u_{c} = 0$$


Now, plug each $\theta_{0}$ and $u_{0}$ in to $\frac{\partial f}{\partial \theta}$ and $\frac{\partial f}{\partial u}$ to get the coefficients of each part of the linearized system.
$$(\Delta \theta)' = a \Delta \theta(t) + b \Delta u(t)$$

**Part A** $\theta_{a} = 0$, $u_{a} = 0$

$$\frac{\partial f}{\partial \theta} = cos(\theta_{a}) = cos(0) = 1$$
$$\frac{\partial f}{\partial u} = 1$$
Therefore, $$a = 1$$ and $$b = 1$$

Plug in:
$$(\Delta \theta)' = a \Delta \theta(t) + b \Delta u(t)$$

The final answer is:
$$(\Delta \theta)' = 1 \Delta \theta(t) + 1 \Delta u(t)$$


**Part B** $\theta_{b} = \frac{\pi}{4}$ , $u_{b} = - \frac{\sqrt{2}}{2}$


$$\frac{\partial f}{\partial \theta} = cos(\theta_{a}) = cos\left(\frac{\pi}{4}\right) = \frac{\sqrt{2}}{2}$$
$$\frac{\partial f}{\partial u} = 1$$
Therefore, 
$$a = \frac{\sqrt{2}}{2}$$ and
$$b = - \frac{\sqrt{2}}{2}$$

Plug in:
$$(\Delta \theta)' = a \Delta \theta(t) + b \Delta u(t)$$

The final answer is:
$$(\Delta \theta)' = \frac{\sqrt{2}}{2} \Delta \theta(t) - \frac{\sqrt{2}}{1} \Delta u(t)$$

**Part C** $\theta_{c} = \pi$, $u_{c} = 0$

$$\frac{\partial f}{\partial \theta} = cos(\theta_{c}) = cos(\pi) = -1$$
$$\frac{\partial f}{\partial u} = 1$$
Therefore, 
$$a = -1$$
and
$$b = 1$$

Plug in:
$$(\Delta \theta)' = a \Delta \theta(t) + b \Delta u(t)$$

The final answer is:
$$(\Delta \theta)' = -1 \Delta \theta(t) + 1 \Delta u(t)$$




## Question 2 
Find the transfer function between $R(s)$ and $Y(s)$ in the given block diagram.

![[Pasted image 20230916165354.png]]



## Question 3 


## Question 4 


## Question 5