///////////////////////////////////////////////////////////////////////////
// Filename      : processor_tb.v                                          //
// Project       : Processor Flow                                          //
// Author        : Nanosilica Tech                                        //
// Description   : This is the testbench for the processor module. It     //
//                 simulates a simple processor with an ALU, control unit, //
//                 and register file. Various instructions (ADD, SUB, OR,  //
//                 and default) are applied to verify the functionality    //
//                 of the processor. The testbench includes a clock signal //
//                 and reset, as well as monitors the instruction and      //
//                 result outputs.                                         //
// Date          : 18/02/2025                                             //
// Version       : v1.0                                                   //
// Copyright     : © Nanosilica Tech, 2025                                //
// License       : Open Source                                            //
///////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module processor_tb;
    // Declare signals for the testbench
    reg clk;
    reg reset;
    reg [31:0] instruction;
    wire [31:0] result;

    // Instantiate the processor
    processor uut (
        .clk(clk),
        .reset(reset),
        .instruction(instruction),
        .result(result)
    );

    // Generate clock signal
    always begin
        #5 clk = ~clk; // Toggle clock every 5ns
    end

    // Initial block for test sequence
    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        instruction = 32'b0;

        // Apply reset
        $display("Applying reset...");
        reset = 1;
        #10 reset = 0;

        // Test 1: Test with an ADD instruction (opcode = 6'b000000)
        $display("Applying ADD instruction...");
        instruction = 32'b000000_00000_00001_00000_00000000000; // ADD instruction (example)
        #10; // Wait for some time to observe the result

        // Test 2: Test with a SUB instruction (opcode = 6'b000001)
        $display("Applying SUB instruction...");
        instruction = 32'b000001_00000_00001_00000_00000000000; // SUB instruction (example)
        #10;

        // Test 3: Test with an OR instruction (opcode = 6'b000011)
        $display("Applying OR instruction...");
        instruction = 32'b000011_00000_00001_00000_00000000000; // OR instruction (example)
        #10;

        // Test 4: Test with no operation (default case)
        $display("Applying NO OPERATION (default case)...");
        instruction = 32'b111111_00000_00000_00000_00000000000; // Unknown opcode
        #10;

        // End of simulation
        $finish;
    end

    // Monitor changes in signals
    initial begin
        $monitor("Time = %0t, instruction = %b, result = %d", $time, instruction, result);
    end
endmodule
