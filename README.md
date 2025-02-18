Project Setup

processor_flow/
├── src/
│   ├── processor.v             # Main top-level CPU file
│   ├── alu.v                   # Arithmetic Logic Unit
│   ├── reg_file.v              # Register File
│   ├── control_unit.v          # Control Unit
│   └── ...                     # Other Verilog modules
├── testbench/
│   ├── tb_processor.v          # Testbench for the processor
│   └── ...                     # Other testbenches
├── docs/                       # Documentation (if any)
├── README.md                   # Project overview
└── .git/                       # Git repository (after initialization)