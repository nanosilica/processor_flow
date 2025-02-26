///////////////////////////////////////////////////////////////////////////
// Filename      : control_unit.v                                         //
// Project       : <processor flow>                                       //
// Author        : <Nanosilica Tech>                                      //
// Description   : This Verilog module implements the control unit        //
//                 of the processor. The control unit decodes the        //
//                 instruction and generates control signals such as     //
//                 alu_enable and reg_addr, which are used by the ALU    //
//                 and register file.                                     //
// Date          : 18/02/2025                                             //
// Version       : v1.0                                                   //
// Copyright     : © Nanosilica Tech, 2025                                //
// License       : Open Source                                            //
///////////////////////////////////////////////////////////////////////////


module control_unit (
    input wire [31:0] instruction,
    output reg alu_enable,
    output reg [4:0] addr,
    output reg we  // Write Enable signal
);

    always @(*) begin
        case (instruction[31:26])  // OpCode field
            6'b000000: begin // ADD instruction
                alu_enable = 1'b1;
                addr = instruction[15:11]; // Destination register (rd)
                we = 1'b1; // Enable writing to register
            end
            6'b000001: begin // SUB instruction
                alu_enable = 1'b1;
                addr = instruction[15:11]; 
                we = 1'b1; // Enable writing to register
            end
            6'b000010: begin // AND instruction
                alu_enable = 1'b1;
                addr = instruction[15:11];
                we = 1'b1; // Enable writing to register
            end
            6'b000011: begin // OR instruction
                alu_enable = 1'b1;
                addr = instruction[15:11];
                we = 1'b1; // Enable writing to register
            end
            default: begin
                alu_enable = 1'b0;
                addr = 5'b0;
                we = 1'b0; // No writing to register in default case
            end
        endcase
    end
endmodule
