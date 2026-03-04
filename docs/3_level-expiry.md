# 3 -level expiry

- Mailboxes
- For communication with other SoC masters
- Interrupt controller
- AVIC

- Programmable Computer-Vision Accelerator (PVA)
- Feature Category
- Features
- Feature Description
- ACTMON
- Activity Monitor x16
- PPM block
- Power management
- Local Buffering
- Scratchpad memory per VPU
3x 128 KB
- Scratchpad memory banking
3x 32 banks x 16-bit
- Safety
- ECC/parity for critical large
memories + parity for data and control + MISR (CRC check on AXI) for permanent faults
- Functional safety. Refer to the Safety Manual for
more details.
#### 8.2.1.6 Application Space Examples
PVA is intended for semi-dense or dense regular computation, even on small data sets, which need predictable run-times with low latency. PVA has built-in multi-dimensional addressing support, that facilitates iterative tasks that require addressing for: 2D: image geometry 3D: point cloud processing
- ROI processing: Volumetric integration
#### 8.2.1.7 CV-PVA Subsystem Top Level Integration
There is one PVA integrated in the CV subsystem. PVA is a Host Controller engine and the MMIO path allows communication or synchronization with other SoC masters.

