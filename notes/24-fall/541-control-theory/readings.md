# Automatic Control | ECE 541 Reading Assignments





# Homework 1 Readings
Reading Assignment
- Shinners: Ch.1 - 3
- Doyle, Francis, Tannenbaum: Ch. 1 & 2



## Doyle, Francis, Tannenbaum | Ch. 1 & 2

### Controller Design Process
1. Study the system to be controlled and decide what types of sensors and actuators will be used and where they will be placed.
2. Model the resulting system to be controlled.
3. Simplify the model if necessary so that it is tractable.
4. Analyze the resulting model; determine its properties.
5. Decide on performance specifications.
6. Decide on the type of controller to be used.
7. Design a controller to meet the specs, if possible; if not, modify the specs or generalize the type of controller sought.
8. Simulate the resulting controlled system, either on a computer or in a pilot plant.
9. Repeat from step 1 if necessary.
10. Choose hardware and software and implement the controller.
11. Tune the controller on-line of necessary.







### Different types of Object Models
1. Real physical system: the one "out there."
2. Ideal Physical model: obtained by systematically decomposing the real physical systems into ideal building blocks; composed of resistors, masses, beams, kilns, isotropic media, Newtonian fluids, electrons, and so on.
3. Ideal mathematical model: obtained by applying natural laws to the ideal phsyical model; composed of nonlinear partial differential equations, and so on.
4. Reduced mathematical model: obtained from the ideal mathematical model by linearization, lumping, and so on; usually a transfer function.

No mathematical system can precisely model a real physical system; there is always uncertainty. A "leap of faith" will always be required on the part of the engineer. This cannot be eliminated, but it can be made more manageable with the use of effective modeling, analysis, and design techniques.

**Basic Plant model in the DFT textbook**

Where:
$y$ is the output
$u$ is the input
$P$ is the nominal *Transfer Function*

The model of uncertainty comes in two forms: 
$n$: unknown noise or disturbance
$\Delta$ unknown plant perturbation

$$y = (P + \Delta) u + n$$

### Single-Loop Feedback System

![[Pasted image 20230827111731.png]]



$r$: reference or command input
$e$: tracking error
$u$: control signal, controller output
$d$: plant disturbance
$y$: plant output
$n$: sensor noise


































