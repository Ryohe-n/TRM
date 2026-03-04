# 3 'b111 in the attribute field indicate an Integrated Descriptor. The address of the Integrated Descriptor is pointed to by ADMA3 Integrated System Address Register (090h). The Integrated Descriptor entries point to Partial Descriptors location in the System Memory. Each Partial Descriptor is a Command + ADMA Descriptor pair.

- Command Descriptor has ACT2 = 0 and ACT0 = 1. The command descriptor is programmed
with the Block Size and the block Count Value and the Command Mode Value. The ADMA Descriptor is similar to the ADMA2 descriptor. 2. 3. 4. 5.
**Figure 10.144 Block Diagram of ADMA3**

- SDMMC Controller Functional Description
#### 10.10.2.11 Register Access
SDMMC uses a 32-bit APB Slave interface for register access from the Control Plane. SDMMC has 64 KB register address space even though the Host spec defines only 512B register space. The spec defined registers are in first 512B space of AMAP allocated and remaining space is used for vendor specific registers which could be pad/IO brick control registers, CQE registers, etc.
- Table 10.84 Address Space for the SDMMC Controllers
- Controller
- Offsets
- SDMMC1

