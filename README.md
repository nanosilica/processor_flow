# Processor Flow

This project implements a top-level CPU design with various submodules in Verilog. The processor is composed of several components including the Arithmetic Logic Unit (ALU), Register File, and Control Unit. The project also contains testbenches for verifying the functionality of the processor.

## Directory Structure

![project_structure](https://github.com/user-attachments/assets/73f451ab-a7df-4241-b087-8115b8e351e4)


## Modules Overview

- **processor.v**: The top-level module that integrates the various components of the CPU.
- **alu.v**: The Arithmetic Logic Unit that performs arithmetic and logical operations.
- **reg_file.v**: The Register File that stores data for the processor.
- **control_unit.v**: The Control Unit that generates the control signals for the processor.

## Testbenches

- **tb_processor.v**: A testbench to verify the functionality of the `processor.v` module and ensure the processor behaves as expected.

## Documentation

Documentation for the project is available in the `docs/` folder, if applicable.

## Git Setup

The project is initialized as a Git repository. You can clone this repository and track changes using Git.
