# 15 :8 0x0 StreamID:

- This specifies the StreamID output when the VMIndx field is
programmed to N in a region control register. N is the STREAMID_CTL register number. 0x0 Enable: VM Index Enable. When this bit is set StreamID[N] can be selected by the VMIndx N. 0 = VM Index disabled. 1 = VM Index enabled. 0 = DISABLE 1 = ENABLE
- APS_AST_REGION_0_SLAVE_BASE_LO_0
- Offset: 0x100
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: APS_AST_SCR_AST_REG_0_SEC_CONTROL_0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,xxxx,xxxx,xxx0)
- Bit
R/W Attribute
- Reset
- Description

