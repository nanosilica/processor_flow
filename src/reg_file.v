///////////////////////////////////////////////////////////////////////////
// Filename      : reg_file.v                                             //
// Project       : <processor flow>                                       //
// Author        : <Nanosilica Tech>                                      //
// Description   : This Verilog module implements the register file for   //
//                 the processor. It reads data from the specified        //
//                 register (reg_addr) and outputs it to reg_data. The   //
//                 register file works in conjunction with the control   //
//                 unit and ALU.                                         //
// Date          : 18/02/2025                                             //
// Version       : v1.0                                                   //
// Copyright     : © Nanosilica Tech, 2025                                //
// License       : Open Source                                            //
///////////////////////////////////////////////////////////////////////////

module reg_file (
    input wire clk,
    input wire reset,
    input wire [4:0] addr,
    input wire [31:0] data_in,  // Data to be written into the register
    input wire we,  // Write enable signal
    input wire [31:0] alu_result,  // Add alu_result as an input
    output reg [31:0] data_out  // Output register value
);
    reg [31:0] registers [0:31]; // 32 registers, each 32 bits wide

    integer i; // Declare 'i' outside the always block (Verilog-2001 style)

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] <= 32'b0;  // Reset all registers
                $display("Resetting register %d to 0", i); // Debug message
            end
        end else if (we) begin
            registers[addr] <= alu_result;  // Write data to register
            $display("Writing %h to register %d", alu_result, addr);  // Debug message
        end
        data_out <= registers[addr]; // Read register data
    end
endmodule

