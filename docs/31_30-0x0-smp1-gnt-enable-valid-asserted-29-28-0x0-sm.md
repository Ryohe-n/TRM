# 31 :30 0x0 smp1_gnt_enable/valid/asserted 29:28 0x0 smp0_gnt_enable/valid/asserted 25:16 0x0 dbell_enable/valid/asserted 15:8 0x0 mbox_full_enable/valid/asserted 7:0 0x0 mbox_empty_enable/valid/asserted

##### 9.7.4.2.1 HSP_INT{i}_IE_0
This is an array of eight identical register entries. This array controls the routing of interrupt {i}, a bit mask indicating which of the internal interrupts is propagated to external interrupt {i}, {i} in [0:nSI-1].
- ExternalInterrupts[i] = |(IE{i} & InternalInterrupts}
See the Format of the IE{i} and IR Interrupt Registers table for the organization of the register fields.
- Offset: 0x100..0x11f | Read/Write: R/W | SCR Protection: SCR_C0_REG_0 | Reset: 0x00000000

- HSP Registers
##### 9.7.4.2.2 HSP_INT_IV_0
This register contains the currently asserted shared interrupts, ExternalInterrupts. Each bit of IV is mapped to the corresponding shared interrupt.
- Offset: 0x300 | Read/Write: RO | SCR Protection: SCR_C0_REG_0 | Reset: 0x00000000
##### 9.7.4.2.3 HSP_INT_IR_0
This register indicates the currently asserted internal interrupts, InternalInterrupts. See the Format of the IE{i} and IR Interrupt Registers table for the organization of the register fields.
- Offset: 0x304 | Read/Write: RO | SCR Protection: SCR_C0_REG_0 | Reset: 0x000000ff
##### 9.7.4.2.4 HSP_INT_HSP_CLK_OVR_0
Offset: 0x30c | Read/Write: R/W | Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 hsp_clk_ovr_on
##### 9.7.4.2.5 HSP_INT_DIMENSIONING_0
Offset: 0x380 | Read/Write: RO | Reset: 0x000XXXXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description

