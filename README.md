# Ripple Carry Adder (RCA) Verilog Implementation

This project implements a **Ripple Carry Adder (RCA)** in Verilog HDL.  
Different RCA designs are provided to demonstrate modular construction of wide adders from smaller blocks.

Test project for practicing Verilog personally.

##  Modules

### `full_adder.v`
- 1-bit Full Adder
- Inputs: `A, B, Cin`
- Outputs: `Sum, Cout`

### `rca_16.v`
- 16-bit Ripple Carry Adder
- Built from 16 instances of `full_adder`

### `rca_40.v`
- 40-bit Ripple Carry Adder
- Built from 40 instances of `full_adder`

### `rca16_80.v`
- 80-bit RCA
- Constructed by chaining five `rca_16b` modules

### `rca40_80.v`
- 80-bit RCA
- Constructed by chaining two `rca_40b` modules

##  Testbenches

- **tb_rca16_80.v**  
  Tests the `rca_80b_16` design with several cases (basic addition, max + 1, zero + carry, random large values).

- **tb_rca40_80.v**  
  Tests the `rca_80b_40` design with the same style of cases.

Each testbench prints results to the console using `$display`.

## ▶Simulation

You can run simulations using [Icarus Verilog] or other Verilog simulators (ModelSim, Vivado, etc.).
