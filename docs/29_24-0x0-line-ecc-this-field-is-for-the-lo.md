# 29 :24 0x0 LINE_ECC: This field is for the long packet header ECC. 23:18 0x0 EOL_ECC: This field is for the EOL short packet ECC. 17:12 0x0 SOL_ECC: This field is for the SOL short packet ECC. 11:6 0x0 EOF_ECC: This field is for the EOF short packet ECC. 5:0 0x0 SOF_ECC:

- The TPG will not generate ECC for a packet. When using the TPG, SW
should set the PP to skip the ecc check. To verify the ecc logic for safety
- BIST, SW can write a pre-calculated ECC for the TPG, when use with this
mode, the TPG should generate a grescale pattern. This field is for the SOF short packet ECC.
- NVCSI_STREAM_5_TPG_PF_CRC_0
- Offset: 0xe0fb
- Byte Offset: 0x383ec
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,0000,0000,0000,0000)
- Bit
- Reset
- Description

