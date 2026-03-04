# 31 :0 0x0 MastBase: RWRL: Region Master Base Address: This field specifies bits 63:32 of the Base address for the region on the AXI Master interface. The Output address is generated using the following equation. OutputAddress[63:12]= (InputAddress[63:12] & Mask[N]) | (MastBase[N] & !Mask[N]).

- APS_AST_REGION_7_CONTROL_0
- Offset: 0x1f8
Read/Write: See table below.
- Parity Protection: N
- SCR Protection: AST_REG_7_SEC_CONTROL_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,0000,0xxx,xx00,000x,x0x0)

- AO-DMA Registers
- Bit
- Reset
- Description
0x0 Physical: RWGL: Specifies how the StreamID is selected for a region match. 0 = VMIndx is used to select the StreamID 1 = PhysStreamID is used 18:15 0x0 VMIndex:
- RWRL: Specifies the VM Index used to select the Stream ID when
- Physical=0

