///////////////////////////////////////////////////////////////////////////
// Filename      : <processor.v>                                          //
// Project       : <processor flow>                                       //
// Author        : <Nanosilica Tech>                                      //
// Description   : This Verilog module implements a simple processor      //
//                 where the control unit decodes the instruction and     //
//                 generates control signals (alu_enable, reg_addr).      //
//                 The register file reads data from the specified        //
//                 register (reg_addr) and outputs it to reg_data.        //
//                 The ALU performs an operation on the inputs (reg_data  //
//                 and immediate value) based on the opcode and           //
//                 produces the alu_result, which is assigned to the      //
//                 result output of the processor.                        //
// Date          : 18/02/2025                                             //
// Version       : v1.0                                                   //
// Copyright     : © Nanosilica Tech, 2025                                //
// License       : Open Source                                            //
///////////////////////////////////////////////////////////////////////////


module processor (
    input wire clk,
    input wire reset,
    input wire [31:0] instruction,
    output wire [31:0] result
);
    // Internal wires and registers
    wire [31:0] alu_result;
    wire [31:0] reg_data;
    wire [4:0] reg_addr;
    wire alu_enable;

    // Instantiate ALU
    alu alu_instance (
        .a(reg_data),
        .b(instruction[15:0]), // Example: using immediate value from instruction
        .opcode(instruction[31:26]), // Example: opcode from instruction
        .result(alu_result)
    );

    // Instantiate Register File
    reg_file reg_file_instance (
        .clk(clk),
        .reset(reset),
        .addr(reg_addr),
        .data_out(reg_data)
    );

    // Instantiate Control Unit
    control_unit control_unit_instance (
        .instruction(instruction),
        .alu_enable(alu_enable),
        .reg_addr(reg_addr)
    );

    // Assign final result (example)
    assign result = alu_result;

endmodule