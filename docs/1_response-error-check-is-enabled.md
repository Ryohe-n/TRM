# 1 Response Error Check is enabled

- Response Type R1 / R5
- When response error check is enabled, this bit selects either R1 or R5 response
types. Two types of response check is supported: R1 for memory and R5 for SDIO.
- Error Statuses Checked in R1
- Bit31 OUT_OF_RANGE
- Bit30 ADDRESS_ERROR
- Bit29 BLOCK_LEN_ERROR
- Bit26 WP_VIOLATION
- Bit25 CARD_IS_LOCKED
- Bit23 COM_CRC_ERROR
- Bit21 CARD_ECC_FAILED
- Bit20 CC_ERROR
- Bit19 ERROR
- Response Flags Checked in R5
- Bit07 COM_CRC_ERROR
- Bit03 ERROR
- Bit01 FUNCTION_NUMBER
- Bit00 OUT_OF_RANGE

