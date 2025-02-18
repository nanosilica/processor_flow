///////////////////////////////////////////////////////////////////////////
// Filename      : alu.v                                                 //
// Project       : <processor flow>                                       //
// Author        : <Nanosilica Tech>                                      //
// Description   : This Verilog module implements the Arithmetic Logic    //
//                 Unit (ALU) for the processor. The ALU performs         //
//                 arithmetic and logical operations on the inputs,      //
//                 based on the provided opcode, and produces the        //
//                 result as the output (alu_result). This module is     //
//                 instantiated in the processor module (processor.v).   //
// Date          : 18/02/2025                                             //
// Version       : v1.0                                                   //
// Copyright     : © Nanosilica Tech, 2025                                //
// License       : Open Source                                            //
///////////////////////////////////////////////////////////////////////////


module alu (
    input wire [31:0] a,
    input wire [31:0] b,
    input wire [5:0] opcode,
    output reg [31:0] result
);
    always @(*) begin
        case (opcode)
            6'b000000: result = a + b; // this opcode performs ADD
            6'b000001: result = a - b; // this opcode performs SUB
            6'b000010: result = a & b; // this opcode performs AND
            6'b000011: result = a | b; // this opcode performs OR
            default: result = 32'b0;  // this opcode performs Default case
        endcase
    end
endmodule