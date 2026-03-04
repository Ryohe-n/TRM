# 31 :0 0x0 LLP_HIGH: Higher 32 bits of the address of the linked list transfer list in local memory.

- Used in linked list mode only. Updated by the DMA to point to the next
element in the transfer list as elements are consumed. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W
#### 10.5.5.2 PCIe Root Port
NOTE:

- PCIe Root Port
There are 11 instances for each of the registers as listed, one for each of the PCIe module instances, namely C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, and C10.
- For the base addresses of these different register instances, please refer to the System
Address Map. NOTE:
- The binary “x” is turned to “0” for the Reset and PROD hex value. Hence, in some cases, a
mismatch occurs between the displayed hexadecimal and binary value. A bit Reset value as “x” or “Undefined” actually means that the bit could be either “0” or “1” after Reset, whereas a bit PROD value as “x” or “Don’t-care” means that either “0” or “1” can be written to the bit by software Initialization.
- PCIE_RP_APPL_PINMUX_0
- Offset: 0x0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00003880 (0bxxxx,xxxx,xxxx,xxxx,xx11,1000,1x00,0000)
- Bit
R/W
- Reset
- Description
- RW
0x0 CLKREQ_OUT_OVERRIDE:
- If CLKREQ_OUT_OVERRIDE_EN=1 This value will be used to
override PEX_CLKREQ_O_N output to PAD
- RW
0x0 CLKREQ_OUT_OVERRIDE_EN:
- Override Enable for PEX_CLKREQ_O_N output to PAD
- RO
0x0 CORE_CLK_REQ_N:
- HW Generated CLKREQ_N. This value will be driven on
PEX_CLKREQ_O_N if CLKREQ_OUT_OVERRIDE_EN=0.
- RO
0x1 PEX_RST_I_N:
- PEX_RST input from PAD. To be used in EP mode to reset the
controller by SW based interrupt APPL_INTR_EN_L0.PEX_RST.
- RW
0x0 CLK_OUTPUT_IN_OVERRIDE:
- If CLK_OUTPUT_IN_OVERRIDE_EN=1, This value will be used to
override PEX_REFCLK_OE_N output to PAD
- RW
0x0 CLK_OUTPUT_IN_OVERRIDE_EN: Override Enable for PEX_REFCLK_OE_N output enable to PAD. This bit can be used for Always enable/disable REFCLK output.
- RW
0x0 CLKREQ_OVERRIDE:
- If CLKREQ_OVERRIDE_EN=1, This value will be used to override
PEX_CLKREQ_I_N input from PAD to controller.
- RW
0x0 CLKREQ_OVERRIDE_EN:
- Override Enable for PEX_CLKREQ_I_N input from PAD

- PCIe Root Port
- Bit
R/W
- Reset
- Description
- RO
0x0 PEX_CLKREQ_I_N:
- PEX_CLKREQ_N input from PAD. CLKREQ_OVERRIDE_EN has no
effect on this bit.
- RW
0x0 PEX_RST_O_N:
- PEX_RST output to PAD. To be used in RC mode to control the
reset of link partner.
- PCIE_RP_APPL_CTRL_0
- Offset: 0x4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00449000 (0bxxxx,x000,0100,x100,1001,00x0,000x,xxxx)
- PROD: 0x00000040 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x1xx,xxxx)
- Bit
R/W
- Reset
- PROD
- Description

