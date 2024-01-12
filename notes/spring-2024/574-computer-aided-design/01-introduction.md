# ECE 574 | Lecture 1

[Presentation](https://piazza.com/class_profile/get_resource/lr5bhk2semh5k9/lr5s5l9a9165gr)

### Moore's Law

> Doubling of IC capacity every 18 months.

### Increasing Abstraction

Higher abstraction levels simplify designer effort. High level synthesis allows
us to describe systems in ways that are closer to human understanding.

### Combinational Logic Design Process. | Truth Tables to Gates

Design a ROUNDER circuit with a 3-bit input A (represented as three inputs A2,
A1, A0) and a 3-bit output R (represented as three outputs R2, R1, R0) where the
output of the circuit is the input value A rounded up to the nearest multiple
of 2. For example, if the input A is 5 `101`, the output R will be 6 `110`. If
the input A is equal to 7 `111`, then the output should e 0 `000`. Draw the
truth table and provide the Boolean equation for each of the three outputs.

[Gray Code](https://en.wikipedia.org/wiki/Gray_code): The difference between any
two values is just one bit.

| A2  | A1  | A0  | R2  | R1  | R0  |
| --- | --- | --- | --- | --- | --- |
| 0   | 0   | 0   | 0   | 0   | 0   |
| 0   | 0   | 1   | 0   | 1   | 0   |
| 0   | 1   | 0   | 0   | 1   | 0   |
| 0   | 1   | 1   | 1   | 0   | 0   |
| 1   | 0   | 0   | 1   | 0   | 0   |
| 1   | 0   | 1   | 1   | 1   | 0   |
| 1   | 0   | 0   | 1   | 1   | 0   |
| 1   | 1   | 1   | 0   | 0   | 0   |

$$
\begin{bmatrix} && 00 && 01 && 11 && 10 \\ 0 && 0 && 0 && 1 && 0 \\ 1 && 1 &&
1 && 0 &&1 \\ \end{bmatrix}
$$

R2 = A2' A1 A0 + A2 A1' + A2 A0'

R1 = A1' A0 + A1 A0'

// TODO: Add the code that is posted for this class, behavioral vs structural
code.

```vhdl
module WhatIsThis(I1, I0, En, D3, D2, D1, D0);

    input I1, I0, En;
    output reg D3, D2, D1, D0;

    always @(I1, I0, En)
    begin

       // Insert behavior here.

    end

    end
endmodule
```




### Parameterized Circuits
[Parameterized ROUNDER](./code-examples/parameterized-rounder.v) 

