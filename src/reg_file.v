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
    output reg [31:0] data_out
);
    reg [31:0] registers [0:31]; // 32 registers, each 32 bits wide

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset all registers to 0
            integer i;
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] <= 32'b0;
            end
        end else begin
            // Output the register value
            data_out <= registers[addr];
        end
    end
endmodule