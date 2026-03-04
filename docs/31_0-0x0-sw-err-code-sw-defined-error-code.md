# 31 :0 0x0 SW_ERR_CODE: SW Defined Error Code.

- Bits from this register connect to the IPs Error Collator
err_<x>_user[31:0] signal.
- VI_CFG_SW_ERR_ASSERT_0
- Offset: 0x1035
- Byte Offset: 0x40d4
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 SW_ERR_ASSERT:
- When written with value 1'b1, this self clearing bit generates a pulse of 1
clock cycle from the unit.
- This pulse is dual_rail_converted by the IP {bit,~bit} and connected to the
- Error Collator err_x
- VI_CFG_USER_DEFINED_UNCORRECTED_ERR_TRIGGER_0
- Error Diagnose
- Offset: 0x1036
- Byte Offset: 0x40d8
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- Video Input Registers
- Bit
- Reset
- Description
0x0 UNCORRECTED_ERR5:
- When written with value 1, this self clearing bit generates a pulse of 1 clock
cycle.
- This pulse is dual_rail_converted by the IP {bit,~bit} and connected to the
Error Collator USER_DEFINED_UNCORRECTED_ERR5. 0x0 UNCORRECTED_ERR4:
- When written with value 1, this self clearing bit generates a pulse of 1 clock
cycle.
- This pulse is dual_rail_converted by the IP {bit,~bit} and connected to the
Error Collator USER_DEFINED_UNCORRECTED_ERR4. 0x0 UNCORRECTED_ERR3:
- When written with value 1, this self clearing bit generates a pulse of 1 clock
cycle.
- This pulse is dual_rail_converted by the IP {bit,~bit} and connected to the
Error Collator USER_DEFINED_UNCORRECTED_ERR3. 0x0 UNCORRECTED_ERR2:
- When written with value 1, this self clearing bit generates a pulse of 1 clock
cycle.
- This pulse is dual_rail_converted by the IP {bit,~bit} and connected to the
Error Collator USER_DEFINED_UNCORRECTED_ERR2. 0x0 UNCORRECTED_ERR1:
- When written with value 1, this self clearing bit generates a pulse of 1 clock
cycle.
- This pulse is dual_rail_converted by the IP {bit,~bit} and connected to the
Error Collator USER_DEFINED_UNCORRECTED_ERR1. 0x0 UNCORRECTED_ERR0:
- When written with value 1, this self clearing bit generates a pulse of 1 clock
cycle.
- This pulse is dual_rail_converted by the IP {bit,~bit} and connected to the
Error Collator USER_DEFINED_UNCORRECTED_ERR0.
- VI_CFG_USER_DEFINED_CORRECTED_ERR_TRIGGER_0
- Offset: 0x1037
- Byte Offset: 0x40dc
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 CORRECTED_ERR5:
- When written with value 1, this self clearing bit generates a pulse of 1 clock
cycle.
- This pulse is dual_rail_converted by the IP {bit,~bit} and connected to the
Error Collator USER_DEFINED_CORRECTED_ERR5.

- Video Input Registers
- Bit
- Reset
- Description
0x0 CORRECTED_ERR4:
- When written with value 1, this self clearing bit generates a pulse of 1 clock
cycle.
- This pulse is dual_rail_converted by the IP {bit,~bit} and connected to the
Error Collator USER_DEFINED_CORRECTED_ERR4. 0x0 CORRECTED_ERR3:
- When written with value 1, this self clearing bit generates a pulse of 1 clock
cycle.
- This pulse is dual_rail_converted by the IP {bit,~bit} and connected to the
Error Collator USER_DEFINED_CORRECTED_ERR3. 0x0 CORRECTED_ERR2:
- When written with value 1, this self clearing bit generates a pulse of 1 clock
cycle.
- This pulse is dual_rail_converted by the IP {bit,~bit} and connected to the
Error Collator USER_DEFINED_CORRECTED_ERR2. 0x0 CORRECTED_ERR1:
- When written with value 1, this self clearing bit generates a pulse of 1 clock
cycle.
- This pulse is dual_rail_converted by the IP {bit,~bit} and connected to the
Error Collator USER_DEFINED_CORRECTED_ERR1. 0x0 CORRECTED_ERR0:
- When written with value 1, this self clearing bit generates a pulse of 1 clock
cycle.
- This pulse is dual_rail_converted by the IP {bit,~bit} and connected to the
Error Collator USER_DEFINED_CORRECTED_ERR0.
- VI_CFG_VI_CHANSEL_PARITY_ERR_STATUS1_0
- Error Logging
- Offset: 0x1038
- Byte Offset: 0x40e0
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 CH31_ERR: Hot code channel ID to indicate if VI chansel 31 ecounters a parity error. 0x0 CH30_ERR: Hot code channel ID to indicate if VI chansel 30 ecounters a parity error. 0x0 CH29_ERR: Hot code channel ID to indicate if VI chansel 29 ecounters a parity error.

- Video Input Registers
- Bit
- Reset
- Description
0x0 CH28_ERR: Hot code channel ID to indicate if VI chansel 28 ecounters a parity error. 0x0 CH27_ERR: Hot code channel ID to indicate if VI chansel 27 ecounters a parity error. 0x0 CH26_ERR: Hot code channel ID to indicate if VI chansel 26 ecounters a parity error. 0x0 CH25_ERR: Hot code channel ID to indicate if VI chansel 25 ecounters a parity error. 0x0 CH24_ERR: Hot code channel ID to indicate if VI chansel 24 ecounters a parity error. 0x0 CH23_ERR: Hot code channel ID to indicate if VI chansel 23 ecounters a parity error. 0x0 CH22_ERR: Hot code channel ID to indicate if VI chansel 22 ecounters a parity error. 0x0 CH21_ERR: Hot code channel ID to indicate if VI chansel 21 ecounters a parity error. 0x0 CH20_ERR: Hot code channel ID to indicate if VI chansel 20 ecounters a parity error. 0x0 CH19_ERR: Hot code channel ID to indicate if VI chansel 19 ecounters a parity error. 0x0 CH18_ERR: Hot code channel ID to indicate if VI chansel 18 ecounters a parity error. 0x0 CH17_ERR: Hot code channel ID to indicate if VI chansel 17 ecounters a parity error. 0x0 CH16_ERR: Hot code channel ID to indicate if VI chansel 16 ecounters a parity error. 0x0 CH15_ERR: Hot code channel ID to indicate if VI chansel 15 ecounters a parity error. 0x0 CH14_ERR: Hot code channel ID to indicate if VI chansel 14 ecounters a parity error. 0x0 CH13_ERR: Hot code channel ID to indicate if VI chansel 13 ecounters a parity error. 0x0 CH12_ERR: Hot code channel ID to indicate if VI chansel 12 ecounters a parity error. 0x0 CH11_ERR: Hot code channel ID to indicate if VI chansel 11 ecounters a parity error. 0x0 CH10_ERR: Hot code channel ID to indicate if VI chansel 10 ecounters a parity error. 0x0 CH9_ERR: Hot code channel ID to indicate if VI chansel 9 ecounters a parity error.

- Video Input Registers
- Bit
- Reset
- Description
0x0 CH8_ERR: Hot code channel ID to indicate if VI chansel 8 ecounters a parity error. 0x0 CH7_ERR: Hot code channel ID to indicate if VI chansel 7 ecounters a parity error. 0x0 CH6_ERR: Hot code channel ID to indicate if VI chansel 6 ecounters a parity error. 0x0 CH5_ERR: Hot code channel ID to indicate if VI chansel 5 ecounters a parity error. 0x0 CH4_ERR: Hot code channel ID to indicate if VI chansel 4 ecounters a parity error. 0x0 CH3_ERR: Hot code channel ID to indicate if VI chansel 3 ecounters a parity error. 0x0 CH2_ERR: Hot code channel ID to indicate if VI chansel 2 ecounters a parity error. 0x0 CH1_ERR: Hot code channel ID to indicate if VI chansel 1 ecounters a parity error. 0x0 CH0_ERR: Hot code channel ID to indicate if VI chansel 0 ecounters a parity error.
- VI_CFG_VI_CHANSEL_PARITY_ERR_STATUS2_0
- Offset: 0x1039
- Byte Offset: 0x40e4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000)
- Bit
- Reset
- Description
0x0 CH35_ERR: Hot code channel ID to indicate if VI chansel 35 ecounters a parity error. 0x0 CH34_ERR: Hot code channel ID to indicate if VI chansel 34 ecounters a parity error. 0x0 CH33_ERR: Hot code channel ID to indicate if VI chansel 33 ecounters a parity error. 0x0 CH32_ERR: Hot code channel ID to indicate if VI chansel 32 ecounters a parity error.

- Video Input Registers
- VI_CFG_PERFMON_SW_1_0
- Offset: 0x103a
- Byte Offset: 0x40e8
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

