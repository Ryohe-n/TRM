# 16450 (non-FIFO mode). FIFO mode provides two independent FIFOs for transmit and receive and is selected by the FIFO control register. The controller also includes a 16-bit programmable baud rate generator and an 8-bit scratch register, up to six "modem" control lines, and two internal DMA handshake lines that are used to indicate when the FIFOs are ready to transfer data to the CPU.


- Universal Asynchronous Receiver/Transmitter (UART)
The UARTs support a device clock of up to 204 MHz. Each symbol requires 16 clock cycles for proper sampling and processing of the input data stream. Thus, the maximum baud rate is 204/16
- 12.75 Mbps. Because 1 symbol = 1 bit, the data rate is 12.75 Mbps.
#### 10.12.1.1 Features
The features supported by the UARTs are as follows: Synchronization for the serial data stream with start and stop bits to transmit data to and from a data character
- Data integrity by attaching a parity bit to the data character
Support for word lengths from 5 to 8 bits, with an optional parity bit, and one or two stop bits Support for both 16450- and 16550-compatible modes. The default mode is 16450.
- Baud tolerance of ±2.7% (10 bits per character)
- DMA capable for both Tx and Rx

