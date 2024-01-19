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
other outputs within the module. `signed` is a key word that can be used to
identify signed and unsigned numbers in a piece of hardware.

### Test Benches

- inputs are reg
- outputs are wire
- the modules are called
- set up the clock in an always block.
- provide inputs so that you cna analyze them.

## Finite State Machine

An FSM is a way to describe a system

They are the most common way to model digital systems.

Typically, FSMs are expressed using states and transition conditions that must
be met to transition between states.

In circuits, you Typically have a system that performs some function, so a
'state register' is usually implemented in the hardware as well.

## Critical Path

Input b; Output x; when b = 1, turn on for three cycles

In this case, there are four states in the finite state machine (FSM).

- off: off
  - x = 0
- On1
  - x = 1
- on2
  - x = 1
- on3
  - x = 1

| s1  | s0  | b   | n1  | n0  | x   |
| --- | --- | --- | --- | --- | --- |
| 0   | 0   | 0   | 0   | 0   | 0   |
| 0   | 0   | 1   | 0   | 1   | 0   |
| 0   | 1   | 0   | 1   | 0   | 1   |
| 0   | 1   | 1   | 1   | 0   | 1   |
| 1   | 0   | 1   | 1   | 1   | 1   |
| 1   | 0   | 0   | 1   | 1   | 1   |
| 1   | 1   | 1   | 0   | 0   | 1   |
| 1   | 1   | 0   | 0   | 0   | 1   |

![](./attachments/Pasted image 20240119092637.png)

### Sequential Logic Design Process

Create an FSM for a timing verification component that has three inputs
`CStart`, `CEnd`, and `ErrorRst`, and one output `Error`. In a correctly
functioning system, whenever the `CStart` input becomes 1, two cycles later the
`CEnd` signal should become 1 for exactly 1 cycle. The timing verification
controller should assert the output `Error` to 1 whenever this behavior is NOT
observed. The controller will continue to assert the output `Error` to 1 until
the `ErrorRst` input becomes 1, after which the controller should again monitor
the `CStart` and `CEnd` inputs.

Inputs: `CStart`, `CEnd`, `ErrorRst` Output: `Error`

![Sequential Logic Design Process Solution](./attachments/Pasted image
20240119094042.png)





