# Unit 6 Notes |

ECE 541: Automatic Control

## Exam 2

Process:

- Allowed
  - 2 sheets of notes
  - Table of laplace transforms
  - Calculator
  - Writing Instrument
- Not Allowed
  - No Textbook, No Class Notes, No Computer
  - No Cellphone, No Neighbor

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























