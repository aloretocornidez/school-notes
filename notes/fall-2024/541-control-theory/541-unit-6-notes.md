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





























