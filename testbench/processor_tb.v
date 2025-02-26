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

module processor_tb;
    reg clk;
    reg reset;
    reg [31:0] instruction;
    wire [31:0] result;
    wire [31:0] data_out;  // Register file output (data read from register)
    wire [4:0] addr;   // Register address
    wire we;               // Write enable signal

    // Instantiate the processor (which already contains the reg_file instance)
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

        // Dump VCD file for waveform analysis
        $dumpfile("processor_waveform_1a.vcd");
        $dumpvars(0, processor_tb);

        // Test 1: Test with a write operation to register 1
        $display("Writing to register 1...");
        instruction = 32'b00000000000000010000000000000001;  // Example: ADD instruction with destination register 1
        #10;  // Wait for some time to observe the result

        // Test 2: Test reading from register 1
        $display("Reading from register 1...");
        instruction = 32'b00000000000000010000000000000010;  // Example: another instruction (could be a different operation)
        #10;  // Wait for some time to observe the result

        // Test 2: SUB operation (opcode: 000001)
        $display("Test 2: SUB operation...");
        instruction = 32'b00000100000000010000000000000001;  // SUB instruction
        #10;  // Wait for some time to observe the result

        // Test 3: AND operation (opcode: 000010)
        $display("Test 3: AND operation...");
        instruction = 32'b00001000000000010000000000000001;  // AND instruction
        #10;  // Wait for some time to observe the result

        // Test 4: OR operation (opcode: 000011)
        $display("Test 4: OR operation...");
        instruction = 32'b00001100000000010000000000000001;  // OR instruction
        #10;  // Wait for some time to observe the result

        // End of simulation
        $finish;
    end

    // Monitor changes in signals (Watch `addr`, `we`, and `result`)
    initial begin
        $monitor("Time = %0t, reg_addr = %b, we = %b, result = %h", 
                  $time, addr, we, result);
    end
endmodule


