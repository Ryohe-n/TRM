# 32 -bit Block Count (SDMA System Address) Register

- When Host Version 4 Enable is set to 0 in the Host Control 2 register, SDMA
uses this register as system address in only 32-bit addressing mode. Auto CMD23 cannot be used with SDMA.
- When Host Version 4 Enable is set to 1, SDMA uses ADMA System Address
register (05Fh-058h) instead of using this register to support both 32-bit and 64bit addressing. This register is re-assigned to 32-bit Block Count and then SDMA may use Auto CMD23. (1) SDMA System Address (Host Version 4 Enable = 0) This register contains the system memory address for a SDMA transfer in 32bit addressing mode. When the Host Controller stops a SDMA transfer, this register shall point to the system address of the next contiguous data position. It can be accessed only if no transaction is executing (i.e., after a transaction has stopped). Reading this register during SDMA transfers may return an invalid value. The Host Driver shall initialize this register before starting a SDMA transaction. After SDMA has stopped, the next system address of the next contiguous data position can be read from this register. The SDMA transfer waits at the every boundary specified by the SDMA Buffer Boundary in the Block Size register. The Host Controller generates DMA Interrupt to request the Host Driver to update this register.
- The Host Driver sets the next system address
of the next data position to this register. When the most upper byte of this register (003h) is written, the Host Controller restarts the SDMA transfer. When restarting SDMA by setting Continue Request in the Block Gap
- Control register, the Host Controller
shall start at the next contiguous address stored here in the SDMA System Address register. ADMA does not use this register. (2) 32-bit Block Count (Host Version 4 Enable = 1)
- Host Controller Version 4.10 re-defines this register as 32-bit Block Count
(Refer to Section 1.15 in SD Host spec4.1 for more details about block count extension). In version 4.00, this register may be used

- SDMMCA Registers
as 32-bit block count only for Auto CMD23 to set the argument of the CMD23 while executing Auto CMD23.
- FFFF_FFFFh 4G - 1 block
... ... 0000_0002h 2 blocks 0000_0001h 1 block 0000_0000h Stop Count
- The Host Controller would decrement the block count of this register every
block transfer and data transfer stops when the count reaches zero. This register should be accessed only when no transaction is executing. Reading this register during data transfers may return invalid value.
- Offset: 0x0
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

