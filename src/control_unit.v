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
    output reg [4:0] reg_addr
);
    always @(*) begin
        // Decode instruction and set control signals
        case (instruction[31:26]) // Opcode field
            6'b000000: begin // Example: ADD instruction
                alu_enable = 1'b1;
                reg_addr = instruction[25:21]; // Example: source register
            end
            default: begin
                alu_enable = 1'b0;
                reg_addr = 5'b0;
            end
        endcase
    end
endmodule