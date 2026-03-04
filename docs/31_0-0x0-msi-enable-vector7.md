# 31 :0 0x0 MSI_ENABLE_VECTOR7:

- Each vector register corresponds to the enable bit for 32 of the possible 256
MSI vectors.
- ENABLE VECTOR0 corresponds to enable bits for MSI vectors 31-0. Vector7
corresponds to enable bits for MSI vectors 255-223. When an upstream MSI is sent, the bit corresponding to the MSI vector is set to 1 by hardware if the corresponding enable bit is 1.
- HDA_CONFIGURATION_0
- Configuration
- Offset: 0x180
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x800e8e40 (0b1xxx,xxxx,xxxx,111x,10xx,111x,0100,0000)
- Bit
R/W
- Reset
- Description
- RW
0x1 CLKEN_OVERRIDE: This can override the clock enable in case of malfunction.
- RW
0x1 PW_NO_DEVSEL_ERR_CYA:
- Setting this would enable fix for when we don't detect DECERR
due to no DEVSEL for DS PWs only.
- RO
0x1 INITIATOR_READ_IDLE:
- This read-only bit provides status reads on AFI upstream. A value
of 1b indicates there are no outstanding reads to initiator.
- RO
0x1 INITIATOR_WRITE_IDLE:
- This read-only bit provides status writes on AFI upstream. A value
of 1b indicates there are no outstanding writes to initiator.
- RW
0x1 WDATA_LEAD_CYA:
- Used to en(dis)able the handling of write data ahead of requests
on IPFS AXI target
- RW
0x0 WR_INTRLV_CYA:
- Used to en(dis)able the handling of interleaved write requests on
- IPFS AXI target
- RO
0x1 TARGET_READ_IDLE:
- This read-only bit provides status reads to IPFS target. A value of
1b indicates there are no outstanding reads to downstream FPCI.

- HDA Registers
- Bit
R/W
- Reset
- Description
- RO
0x1 TARGET_WRITE_IDLE:
- This read-only bit provides status writes to IPFS target. A value of
1b indicates there are no outstanding writes to downstream FPCI.
- RO
0x1 MSI_VEC_EMPTY:
- This read-only bit provides status on whether MSI Vector registers
have any active bits valid or not
- RW
0x0 UFPCI_MSIAW: MSI After Write ordering rule. 1 = Whenever MSI is ready assert the interrupt 0 = Default behavior, apply MSIAW ordering rule
- RW
0x1 UFPCI_PWPASSPW:
- Input to upstream FPCI

