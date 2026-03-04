# 3 :2 0x0 AUTO_CMD12_EN: 0 = DISABLE 1 = CMD12 2 = CMD23 3 = AUTO_CMD_AUTO_SEL 0x0 BLOCK_COUNT_EN: 0 = DISABLE 1 = ENABLE 0x0 DMA_EN: 0 = DISABLE 1 = ENABLE

- SDMMCA_RESPONSE_R0_R1_0
- Command Response Registers
- The Table below describes the mapping of command responses from the SD Bus to
this register for each response type. In the table, R[] refers to a bit range within the response data as transmitted on the SD Bus, REP[] refers to a bit range within the Response register. ------------------------------------------------------------------------------------------------------- | Kind of Response | Meaning of Response | Response Field | Response Register | |-----------------------------------------------------------------------------------------------------| |R1, R1b (normal response) | Card Status | R [39:8] | REP [31:0] | |R1b (Auto CMD12 response) | Card Status for Auto CMD12 | R [39:8] | REP [127:96] | |R1 (Auto CMD23 response) | Card Status for Auto CMD23 | R [39:8] | REP [127:96] | |R2 (CID, CSD register) | CID or CSD reg. incl. | R [127:8] | REP [119:0] | |R3 (OCR register) | OCR register for memory | R [39:8] | REP [31:0] | |R4 (OCR register) | OCR register for I/O etc | R [39:8] | REP [31:0] | |R5,R5b | SDIO response | R [39:8] | REP [31:0] | |R6 (Published RCA response) | New published RCA[31:16] etc | R [39:8] | REP [31:0] | -------------------------------------------------------------------------------------------------------
- Response Bit Definition for Each Response Type
In UHS-II mode, the response of CM-TRAN abort CCMD (4-byte) is stored in offset 13h-10h and the response of SD-TRAN abort CCMD (8-byte) is stored in offset 1Fh-18h
- Command Response [31:0] (R0) Register
------------------------------------------------------------------------------
- Offset: 0x10
- Read/Write: RO
- Parity Protection: N
- Shadow: N

- SDMMCA Registers
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

