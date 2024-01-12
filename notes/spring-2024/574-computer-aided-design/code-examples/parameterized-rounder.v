`timescale 1ns / 1ps 

// Rounder Circuit with parameter mapping.
module testRounder (
  x, y
);
  input [15:0] x;
  output [15:0] y;

  RROUNDER #(.WIDTH(16)) ROUNDER_1(x,y);
endmodule


module ROUNDER #(.parameter WIDTH = 8)(A,R);
  input [WIDTH-1:0] A;
  output reg [WIDTH-1:0] R;
  
  always @(A) begin

    R <= A + A % 2;

  end

endmodule
