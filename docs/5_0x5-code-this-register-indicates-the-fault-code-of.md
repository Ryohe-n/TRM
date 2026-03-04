# 5 : 0x5 CODE: This register indicates the fault code of the error line based on the value of MISSIONERR_INDEX Register. This can be used by a fault handling agent to triage an error without requiring device-specific code. The possible values of this field are: 6'd0 : None 6'd1 : Parity Error on internal data path 6'd2 : ECC SEC Error on internal data path 6'd3 : ECC DED Error on internal data path 6'd4 : Comparator Error 6'd5 : Register Parity Error 6'd6 : Parity Error from on-chip SRAM/FIFO 6'd7 : ECC SEC Error from on-chip SRAM/FIFO 6'd8 : ECC DED Error from on-chip SRAM/FIFO 6'd9 : Clock Monitor Error 6'd10 : Voltage Error 6'd11 : Temperature Error 6'd12 : CRC Error on internal data path 6'd16 : Software Corrected Error 6'd17 : Software Uncorrected Error 6'd18 : Software Generic Error 6'd20 : ECC SED Error on internal data path 6'd21 : ECC SED Error from on-chip SRAM/FIFO 6'd32 : Other Hardware Corrected Error 6'd33 : Other Hardware Uncorrected Error All other values : Reserved.

- FSI_HSM_ERROR_COLLATOR_CURRENT_COUNTER_VALUE_0
- Offset: 0x100c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxx0,0000,0000)
- Bit
- Reset
- Description

