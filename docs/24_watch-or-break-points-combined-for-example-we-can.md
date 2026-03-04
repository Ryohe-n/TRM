# 24 watch or break points (combined, for example we can configure them into 18 watch points (VMEM read/write) and six break points (PC).

- Software break points (unlimited), program contents substituted with SWBRK instruction,
upon execution of which, VPU is forced to enter debug state.
- Cross-trigger input/output, to optionally allow other processors enter/exit debug to cause
VPU to enter/exit debug, and vice versa.
##### 8.2.2.2.4 Error Handling
VPU has the following features to detect various errors, mostly to help with software development and debug:
- Illegal instruction detection
- Scalar divide by zero error
- Floating point invalid outcome
Each error source is configurable whether to error-halt in the ERR_HNDL_CFG register. When an error occurs, an interrupt is sent to the Safety and Event Control (SEC) block in PVA top level, where the interrupts are optionally forwarded to Vectored Interrupt Controller (VIC) then to the Cortex- R5. Cortex-R5 and/or SEC can optionally forward error events to system-level error collator. The VPU instruction set allows a register dump assembly sequence to be run, to first save scalar register file, then some scalar registers are over-written to save the rest of the architecture registers.

- Programmable Computer-Vision Accelerator (PVA)
##### 8.2.2.2.5 Computation Capabilities
As VPS is an embedded processor subsystem architected for computer vision applications, the following are considered the key computation capabilities. Common operations: For common binary (2-input-1-output) operations like add, subtract, min, max, bitwise and logical, AND, OR, etc., and unary (1-input-1-output) operations like negate, bitwise and logical, NOT, etc. The VPU delivers full vector width utilization (16 x 32-bit, 32 x 16-bit, 64 x 8-bit) in the inner loop. Filtering: Filtering is the key function in image processing and front end of computer vision. VPS delivers full MAC utilization in the filtering inner loop with 16-bit data and 16-bit coefficients. This means 64 multiply-adds per cycle (two vector slots x two term dot-product x 16 half-word lanes). For 8-bit data and 8-bit coefficients, VPU should deliver 128 multiply-adds per cycle (two vector slots x two term dot-product x 32-byte lanes). Interpolated lookup: Interpolated lookup is often used to accelerate various transcendental functions and whatever functions that can be pre-computed at linear spaced points and run-time interpolated. The VPU delivers 3/32 cycles per point throughput for 16-bit input/output. Basically, it takes two bit-extract operations and a blend operation with concurrent 32-way parallel table lookup, to implement interpolated lookup. Histogram: Histogram is a common function in computer vision. VPU delivers 1/8 cycle per 32-bit data point, 1/16 cycle per 16-bit data point, of weighted histogram throughput. Furthermore, with the weighted histogram itself taking one load + one store, there is sufficient memory and vector math slots to implement with the same throughput 2D histogram. FFT: Fast Fourier Transform (FFT) is a basic digital signal processing function, and is often used for radar processing, acceleration of large filtering problems, and for various frequency analysis applications. The VPU does not exceed 1.5 cycles/point for 32-bit data,16-bit twiddle factor, 1024- point FFT. Sorting: Sorting is a basic and versatile compute vision function, and is often used for key/feature matching, for ranking and selection of many outcomes. The VPU does not exceed three cycles/ point for 32-bit data, 1024-point sorting. Floating point: Some floating-point workload is expected in embedded vision applications, for Structure from Motion or Sparse Bundle Adjustment. The VPU supports floating point operations in the scalar unit, achieving peak performance of 1.6 GFLOPs, or 1.6 billion floating point operations per second.
- Function
- Test Case
- Test Configuration
- Innerloop Performance
- Common op
stim/array_add1 16-bit addition 1/32 cycles per pixel (cyc/ pix)
- Filtering 16-bit
stim/filter5 3x3 kernel, 16-bit filtering, kernel rounded up to 3x4 6/32 cyc/pix

- Programmable Computer-Vision Accelerator (PVA)
- Function
- Test Case
- Test Configuration
- Innerloop Performance
- Filtering 8-bit
stim/filter_8b 3x3 kernel, 8-bit filtering, kernel rounded up to 4x4 8/64 cyc/pix
- Interpolated
lookup 16-bit
- ISA_special_math_
tests 16-bit reciprocal 7/32 cyc/pix
- Histogram 16-
bit histogram/ double_histogram 32-way short lookup 2/32 cyc/pix
- Histogram 32-
bit histogram/ double_histogram 16-way int lookup 2/16 cyc/pix
- FFT 32-bit
- Host_fft_batch_int

