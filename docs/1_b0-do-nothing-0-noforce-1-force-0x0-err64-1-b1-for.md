# 1 'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR64: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error from on- chip SRAM/Fifo from TX.DATA.MAC-TX.CCBUFFER.Parity 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE

- MACSEC_ERRCOLLATOR_ERRSLICE2_LATENTERR_STATUS_0
SW must write 1 to clear the fields of this register. Bits in this register continue to be logged independent of the value of LatentError_Enable register, to avoid silent dropping of errors.
- Offset: 0xf0a8
- Read/Write: R/W
- Parity Protection: Y

- MACsec Registers
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 ERR95: 1'b1 -> Error_95_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.BYPASS.LUT.ENTRY19.Parity was equal to 2'b00 or 2'b11. 1'b0 -> Error_95_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from
- RX.BYPASS.LUT.ENTRY19.Parity was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR94: 1'b1 -> Error_94_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.BYPASS.LUT.ENTRY18.Parity was equal to 2'b00 or 2'b11. 1'b0 -> Error_94_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from
- RX.BYPASS.LUT.ENTRY18.Parity was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR93: 1'b1 -> Error_93_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.BYPASS.LUT.ENTRY17.Parity was equal to 2'b00 or 2'b11. 1'b0 -> Error_93_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from
- RX.BYPASS.LUT.ENTRY17.Parity was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR92: 1'b1 -> Error_92_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.BYPASS.LUT.ENTRY16.Parity was equal to 2'b00 or 2'b11. 1'b0 -> Error_92_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from
- RX.BYPASS.LUT.ENTRY16.Parity was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR91: 1'b1 -> Error_91_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.BYPASS.LUT.ENTRY15.Parity was equal to 2'b00 or 2'b11. 1'b0 -> Error_91_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from
- RX.BYPASS.LUT.ENTRY15.Parity was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR90: 1'b1 -> Error_90_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.BYPASS.LUT.ENTRY14.Parity was equal to 2'b00 or 2'b11. 1'b0 -> Error_90_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from
- RX.BYPASS.LUT.ENTRY14.Parity was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR89: 1'b1 -> Error_89_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.BYPASS.LUT.ENTRY13.Parity was equal to 2'b00 or 2'b11. 1'b0 -> Error_89_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from
- RX.BYPASS.LUT.ENTRY13.Parity was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR88: 1'b1 -> Error_88_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.BYPASS.LUT.ENTRY12.Parity was equal to 2'b00 or 2'b11. 1'b0 -> Error_88_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from
- RX.BYPASS.LUT.ENTRY12.Parity was equal to 2'b01 or 2'b10, but no latent
error.

- MACsec Registers
- Bit
- Reset
- Description
0x0 ERR87: 1'b1 -> Error_87_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.BYPASS.LUT.ENTRY11.Parity was equal to 2'b00 or 2'b11. 1'b0 -> Error_87_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from
- RX.BYPASS.LUT.ENTRY11.Parity was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR86: 1'b1 -> Error_86_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.BYPASS.LUT.ENTRY10.Parity was equal to 2'b00 or 2'b11. 1'b0 -> Error_86_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from
- RX.BYPASS.LUT.ENTRY10.Parity was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR85: 1'b1 -> Error_85_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.BYPASS.LUT.ENTRY9.Parity was equal to 2'b00 or 2'b11. 1'b0 -> Error_85_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from
- RX.BYPASS.LUT.ENTRY9.Parity was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR84: 1'b1 -> Error_84_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.BYPASS.LUT.ENTRY8.Parity was equal to 2'b00 or 2'b11. 1'b0 -> Error_84_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from
- RX.BYPASS.LUT.ENTRY8.Parity was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR83: 1'b1 -> Error_83_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.BYPASS.LUT.ENTRY7.Parity was equal to 2'b00 or 2'b11. 1'b0 -> Error_83_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from
- RX.BYPASS.LUT.ENTRY7.Parity was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR82: 1'b1 -> Error_82_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.BYPASS.LUT.ENTRY6.Parity was equal to 2'b00 or 2'b11. 1'b0 -> Error_82_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from
- RX.BYPASS.LUT.ENTRY6.Parity was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR81: 1'b1 -> Error_81_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.BYPASS.LUT.ENTRY5.Parity was equal to 2'b00 or 2'b11. 1'b0 -> Error_81_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from
- RX.BYPASS.LUT.ENTRY5.Parity was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR80: 1'b1 -> Error_80_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.BYPASS.LUT.ENTRY4.Parity was equal to 2'b00 or 2'b11. 1'b0 -> Error_80_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from
- RX.BYPASS.LUT.ENTRY4.Parity was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR79: 1'b1 -> Error_79_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.BYPASS.LUT.ENTRY3.Parity was equal to 2'b00 or 2'b11. 1'b0 -> Error_79_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from
- RX.BYPASS.LUT.ENTRY3.Parity was equal to 2'b01 or 2'b10, but no latent
error.

- MACsec Registers
- Bit
- Reset
- Description
0x0 ERR78: 1'b1 -> Error_78_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.BYPASS.LUT.ENTRY2.Parity was equal to 2'b00 or 2'b11. 1'b0 -> Error_78_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from
- RX.BYPASS.LUT.ENTRY2.Parity was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR77: 1'b1 -> Error_77_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.BYPASS.LUT.ENTRY1.Parity was equal to 2'b00 or 2'b11. 1'b0 -> Error_77_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from
- RX.BYPASS.LUT.ENTRY1.Parity was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR76: 1'b1 -> Error_76_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.BYPASS.LUT.ENTRY0.Parity was equal to 2'b00 or 2'b11. 1'b0 -> Error_76_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from
- RX.BYPASS.LUT.ENTRY0.Parity was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR75: 1'b1 -> Error_75_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.BYPASS.LUT.Parity was equal to 2'b00 or 2'b11. 1'b0 -> Error_75_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.BYPASS.LUT.Parity was equal to 2'b01 or 2'b10, but no latent error. 0x0 ERR74: 1'b1 -> Error_74_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.KEYTABLE.HW.Parity was equal to 2'b00 or 2'b11. 1'b0 -> Error_74_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.KEYTABLE.HW.Parity was equal to 2'b01 or 2'b10, but no latent error. 0x0 ERR73: 1'b1 -> Error_73_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.KEYTABLE.SW.Parity was equal to 2'b00 or 2'b11. 1'b0 -> Error_73_pulse[1:0] for Parity Error from on-chip SRAM/Fifo from RX.KEYTABLE.SW.Parity was equal to 2'b01 or 2'b10, but no latent error. 0x0 ERR72: 1'b1 -> Error_72_pulse[1:0] for Register Parity Error from
- MACSEC.REGISTER.Parity.SECURE_RESET_registers was equal to 2'b00 or

