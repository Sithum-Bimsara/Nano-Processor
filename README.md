# NanoProcessor with Additional Features

## Overview

This project involves the development of a 4-bit processor capable of executing four distinct instructions. The processor is designed with additional features to enhance its capabilities and functionality.

## Objective

The main objective of this lab is to engineer a 4-bit processor with the following key components:

1. A 4-bit arithmetic unit capable of addition and subtraction of signed integers
2. An instruction decoder to activate the required processor components
3. K-way b-bit multiplexers or tri-state buses for data routing within the processor
4. bit Program Counter
5. Register Bank (8 4-bit registers)
6. Program ROM

The functionality of these components will be verified through simulation and real-world testing on a development board.

## Additional Features

The following additional features have been incorporated into the NanoProcessor:

1. Expanded instruction bus:
   - Increased from 12 to 13 bits to accommodate 4 new instructions
   - Now uses 3 bits to contain the instruction instead of 2

2. 2-bit multiplier:
   - Included to handle multiplication of two 2-bit values
   - Maximum potential output is a 4-bit value

3. 4-bit comparator:
   - Capable of comparing two 4-bit values
   - Output is directly given by 3 LEDs on the basys3 board

4. Demultiplexer (Reversed Multiplexer):
   - Used to choose where values from the 8 to 1 Multiplexers should go
   - Options include the comparator, Adder/Subtractor, or Multiplier

5. Additional 4-bit 2 to 1 multiplexer:
   - Used to select whether the value from the adder/subtractor unit or the 2-bit multiplier should be stored in the enabled register

## Instruction Set

The following table outlines the instruction set for the NanoProcessor:

| Instruction | Description | Format (13 bit) |
|-------------|-------------|-----------------|
| ADD Ra, Rb  | Add values in registers Ra and Rb and store the result in Ra | 0 0 0 Ra Ra Ra Rb Rb 0 0 0 0 |
| NEG R       | 2's complement of registers R | 0 0 1 R R R 0 0 0 0 0 0 0 |
| MOVI R, d   | Move immediate value d to register R | 0 1 0 R R R 0 0 0 d d d d |
| JZR R, d    | Jump if value in register R is 0 | 0 1 1 R R R 0 0 0 d d d d |
| MUL Ra, Rb  | Multiply 2 bit values in registers Ra and Rb and store the result in Ra | 1 0 0 Ra Ra Ra Rb Rb 0 0 0 0 |
| COM Ra, Rb  | Compare values in registers Ra and Rb and output whether it is equal, greater or lesser | 1 0 1 Ra Ra Ra Rb Rb 0 0 0 0 |
| DOUB R      | Doubles the value in register R | 1 1 0 R R R 0 0 0 0 0 0 0 |
| SUB Ra, Rb  | Subtract values in registers Ra and Rb and store the result in Ra | 1 1 1 Ra Ra Ra Rb Rb 0 0 0 0 |


## Images

### Timing Diagram for Nano Processor
![Timing Diagram for Nano Processor](https://github.com/SithumBimsara20030113/Nano-Processor/blob/main/Images/Timing%20%20Diagram%20%20for%20%20Nano%20%20Processor.png)
This timing diagram shows the clock signal, reset, zero flag, overflow flag, comparison flags (Equal, Greater, Lesser), and register values over time for the Nano Processor.

## Contributors

https://github.com/SithumBimsara20030113
https://github.com/pererabsdt
https://github.com/KaveeshaKapuruge
https://github.com/jayasinghesasmitha)
