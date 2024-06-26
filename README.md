# Synchronous FIFO (First-In-First-Out) Buffer using Verilog

## Overview

A Synchronous FIFO (First-In-First-Out) buffer is a type of data storage that follows the FIFO principle, where the first data written into the buffer is the first data read out. This Verilog project implements a synchronous FIFO, which means the read and write operations are synchronized with a clock signal. This is particularly useful in digital systems where data needs to be temporarily stored and retrieved in the order it was received.

## Features

- **Parameterized Depth and Width**: The FIFO depth (number of storage locations) and width (bit-width of each storage location) are parameterizable.
- **Full and Empty Indicators**: Flags to indicate when the FIFO is full or empty.
- **Overflow and Underflow Protection**: Mechanisms to handle situations when more data is written to a full FIFO or read from an empty FIFO.
- **Synchronized Read and Write Operations**: Both operations are synchronized with the same clock signal, ensuring reliable data transfer.

## Module Description

### Parameters

- `DATA_WIDTH`: The width of the data bus.
- `FIFO_DEPTH`: The depth of the FIFO buffer (number of entries it can hold).

### Ports

- `clk`: Clock input signal for synchronizing operations.
- `reset`: Asynchronous reset signal.
- `write_en`: Write enable signal. When high, data is written to the FIFO.
- `read_en`: Read enable signal. When high, data is read from the FIFO.
- `data_in`: Data input bus.
- `data_out`: Data output bus.
- `full`: Full flag. Indicates the FIFO is full and cannot accept more data.
- `empty`: Empty flag. Indicates the FIFO is empty and no data can be read.

### Functionality

1. **Initialization**: Upon reset, the FIFO pointers and flags are initialized.
2. **Write Operation**: Data is written into the FIFO at the location pointed by the write pointer if the FIFO is not full.
3. **Read Operation**: Data is read from the FIFO from the location pointed by the read pointer if the FIFO is not empty.
4. **Pointer Management**: The write and read pointers are incremented upon write and read operations, respectively.
5. **Full and Empty Flags**: The flags are updated based on the current state of the FIFO to indicate its status.
