# Unit 6 Notes | Root Locus

### Exam 2 Material

- State Transition Matrix
- Sensitivity
- Performance Specs
- s-Plane poles
- Steady State Error
- Routh-Hurwitz Criterion




# Controller Design

## Root Locus
The Root Locus is a controller design technique.


What have we learned so far?
1. Modellng
    $$G(s) = \frac{s+10}{(S+1)(s+5)} = \frac{n(s)}{d(s)}$$


2. Design Specifications
    - Transient
        - Settling Time 
        - Peak Time 
        - Percent Overshoot
    - Steady State 
        - $e_{ss}$ (steady state error)

    - In the S-Plane:
        - The vertical line is the settling time, $T_s = 4\tau$
            - A bigger sigma magnitude is a faster settling time.
        - The Horizontal Line is the peak time, $T_p= \frac{\pi}{\omega_d}$
            - A bigger damped frequency is a smaller peak time.
        - The angle of the pole is the PO.
            - A larger $\zeta$ (closer to 1) 

    - System Type
        - Type 1: 1 pole at the origin
        - Type 2: 

3. Routh-Hurwitz
    - Range of K for stability.

What if we want/need all of these pieces to fit together?
    - Now we need to model the system and test for Performance, stability for the controller we design.



What are the dominant poles in a system?
    - The dominant poles in a system are the leftmost poles in the s-plane.

















# Lecture 
#lecture 
#learninggoals 
- Summary of Root Locus Rules
- Root Locus Quiz
- Continue with Root Locus Construction Rules: Rules 5 & 6
- Root Locus Examples ( Table 9.3 Dorf, DTL Unit 6 Module)
- Matlab tools 
```mat
sys=tf([1,3],[1,1,0])
rlocus(sys)
rlocfind(sys)
rltool(sys), sisotool
```




## Root Locus Construction Rules
1. Starting (k = 0) and ending ($k -> \infty$)
2. Real Axis segments on the root locus
	- Negative feedback:
		- odd number of poles and zeros to the right of the segment.
3. Asymptotic Behavior
	- Pole zero excess # P - # Z
	$$\phi_{a} = \frac{180}{p-z}(2l+1)$$
	$$\sigma_{a}= \frac{\sum\limits p_{i} \sum\limits z_{i}}{p-z}$$

4. Breakaway Re-ENtry Points on the Real Axis
	- $$|kG(s)H(s)| \Longrightarrow k = \frac{d(s)}{n(s)}$$
5. Imaginary Axis Crossing
	- $$\angle{G(s)H(s)} = -180\degree$$
6. Angles of Arrival and Departure
	- Arrival | Complex Zeros
	- Departure | Complex Poles



## Root Locus Quiz

1. Given the system below. Is $s=-1+j2$ on the root locus?

![[Pasted image 20231030141210.png]]



![[Pasted image 20231030141400.png]]


























