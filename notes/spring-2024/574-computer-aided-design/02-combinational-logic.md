# Data Path Components

Data components that data passes through that determine what happens to your
data.

Examples of some basic datapath components: Verilog code demo. #TODO: Code shall
be posted by Dr. Adegbija.

- 2x4 decoder
- 4-bit register
- shift register

## Verilog Review

`always @(posedge clk)` is used to synchronize actions on every clock cycle.
`{din, I[3:1]}` is the concatenate operator. `=` is blocking assignment is used
for intermediate values, this is used when variable values are dependent on
other outputs within the module.
`signed` is a key word that can be used to identify signed and unsigned numbers in a piece of hardware.

### Test Benches

- inputs are reg 
- outputs are wire 
- the modules are called 
- set up the clock in an always block. 
- provide inputs so that you cna analyze them.


## Finite State Machine

An FSM is a way to describe a system

They are the most common way to model digital systems.

Typically, FSMs are expressed using states and transition conditions that must be met to transition between states.


In circuits, you Typically have a system that performs some function, so a 'state register' is usually implemented in the hardware as well.

## Critical Path 











