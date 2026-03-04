# 24 :17 0x4 CPHY_INADJ_TRIO1_B: The SW override INADJ value.

- DISABLE
SW_SET_CPHY_INADJ_TRIO1_B: Enable SW override of the INADJ. 0 = DISABLE 1 = ENABLE 8:1 0x4 CPHY_INADJ_TRIO0_B: The SW override INADJ value.
- DISABLE
SW_SET_CPHY_INADJ_TRIO0_B: Enable SW override of the INADJ. 0 = DISABLE 1 = ENABLE
- NVCSI_PHY_3_NVCSI_CIL_B_CPHY_BIST_CTRL_0
- Offset: 0x10797
- Byte Offset: 0x41e5c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000)
- Bit
- Reset
- Description
0x0 STOP_BIST_TRIO1_B: Manually stop the B1 BIST, write 1 to stop the RX bist. 0x0 STOP_BIST_TRIO0_B: Manually stop the B0 BIST, write 1 to stop the RX bist. 0x0 TRIGGER_BIST_TRIO1_B:
- Trigger the trio B1 BIST, write 1 to trigger the RX bist, HW will clear it to 0
when the BIST is done, write 0 to this field is with no effect. 0x0 TRIGGER_BIST_TRIO0_B:
- Trigger the trio B0 BIST, write 1 to trigger the RX bist, HW will clear it to 0
when the BIST is done, write 0 to this field is with no effect.
- NVCSI_PHY_3_NVCSI_CIL_B_CPHY_BIST_STATUS_0_0
- Offset: 0x10798
- Byte Offset: 0x41e60
- Read/Write: RO
- Parity Protection: N

- NVCSI PHY Registers
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,0000,0000,0000,0000)
- Bit
- Reset
- Description

