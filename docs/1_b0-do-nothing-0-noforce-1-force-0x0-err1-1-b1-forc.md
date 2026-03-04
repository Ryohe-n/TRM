# 1 'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR1: 1'b1 -> Force Assertion of Latent Error Reporting for Register Parity Error from NV_ETHER_QOS_VIRTUAL_APB 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR0: 1'b1 -> Force Assertion of Latent Error Reporting for Register Parity Error from NV_ETHER_QOS_err_collator 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE

- ETHER_QOS_ERRCOLLATOR_ERRSLICE0_LATENTERR_STATUS_0
SW must write 1 to clear the fields of this register. Bits in this register continue to be logged independent of the value of LatentError_Enable register, to avoid silent dropping of errors.
- Offset: 0xf048
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000)
- Bit
- Reset
- Description
0x0 ERR3: 1'b1 -> Error_3_pulse[1:0] for Other Uncorrected Error from DWC_ether_qos was equal to 2'b00 or 2'b11. 1'b0 -> Error_3_pulse[1:0] for Other Uncorrected Error from DWC_ether_qos was equal to 2'b01 or 2'b10, but no latent error. 0x0 ERR2: 1'b1 -> Error_2_pulse[1:0] for Other Corrected Error from DWC_ether_qos was equal to 2'b00 or 2'b11. 1'b0 -> Error_2_pulse[1:0] for Other Corrected Error from DWC_ether_qos was equal to 2'b01 or 2'b10, but no latent error. 0x0 ERR1: 1'b1 -> Error_1_pulse[1:0] for Register Parity Error from NV_ETHER_QOS_VIRTUAL_APB was equal to 2'b00 or 2'b11. 1'b0 -> Error_1_pulse[1:0] for Register Parity Error from
- NV_ETHER_QOS_VIRTUAL_APB was equal to 2'b01 or 2'b10, but no latent
error.

1G Ethernet Controller QoS Registers
- Bit
- Reset
- Description
0x0 ERR0: 1'b1 -> Error_0_pulse[1:0] for Register Parity Error from NV_ETHER_QOS_err_collator was equal to 2'b00 or 2'b11. 1'b0 -> Error_0_pulse[1:0] for Register Parity Error from
- NV_ETHER_QOS_err_collator was equal to 2'b01 or 2'b10, but no latent
error.
- ETHER_QOS_ERRCOLLATOR_ERRSLICE0_COUNTER_RELOAD_0
- Offset: 0xf050
- Read/Write: WO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000)
- Bit
- Reset
- Description
0x0 ERR3: 1'b1 -> Reload Error Counter for Other Uncorrected Error from
- DWC_ether_qos

