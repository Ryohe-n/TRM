# 5 :0 0x0 err_status2vi_vc15: [0] : PP fsm timeout error [1] : PH ECC single bit error [2] : Packet Payload CRC error [3] : Packet Payload is less than WC in PH [4] : PH one CRC error [5] : Embedded line CRC error

- NVCSI_STREAM_5_INTR_STATUS_0
- Offset: 0xe08a
- Byte Offset: 0x38228
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxx0,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 intr_stat_novc:
- Not VC related interrupt
0x0 intr_stat_vc15:
- VC15 event

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 intr_stat_vc14:
- VC14 event
0x0 intr_stat_vc13:
- VC13 event
0x0 intr_stat_vc12:
- VC12 event
0x0 intr_stat_vc11:
- VC11 event
0x0 intr_stat_vc10:
- VC10 event
0x0 intr_stat_vc9:
- VC9 event
0x0 intr_stat_vc8:
- VC8 event
0x0 intr_stat_vc7:
- VC7 event
0x0 intr_stat_vc6:
- VC6 event
0x0 intr_stat_vc5:
- VC5 event
0x0 intr_stat_vc4:
- VC4 event
0x0 intr_stat_vc3:
- VC3 event
0x0 intr_stat_vc2:
- VC2 event
0x0 intr_stat_vc1:
- VC1 event
0x0 intr_stat_vc0:
- VC0 event
- NVCSI_STREAM_5_INTR_STATUS_NOVC_0
- Offset: 0xe08b
- Byte Offset: 0x3822c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected

- NVCSI Stream5 Registers
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 intr_stat_ph_both_crc_err: packet header two CRC error for CPHY 0x0 intr_stat_ph_ecc_multi_bit_err: packet header muti bit ecc error for DPHY
- NVCSI_STREAM_5_INTR_STATUS_VC0_0
- Offset: 0xe08c
- Byte Offset: 0x38230
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 intr_stat_embedded_line_crc_err_vc0 0x0 intr_stat_ph_single_crc_err_vc0 0x0 intr_stat_pd_wc_short_err_vc0 0x0 intr_stat_pd_crc_err_vc0 0x0 intr_stat_ph_ecc_single_bit_err_vc0 0x0 intr_stat_ppfsm_timeout_vc0
- NVCSI_STREAM_5_INTR_STATUS_VC1_0
- Offset: 0xe08d
- Byte Offset: 0x38234
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 intr_stat_embedded_line_crc_err_vc1

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 intr_stat_ph_single_crc_err_vc1 0x0 intr_stat_pd_wc_short_err_vc1 0x0 intr_stat_pd_crc_err_vc1 0x0 intr_stat_ph_ecc_single_bit_err_vc1 0x0 intr_stat_ppfsm_timeout_vc1
- NVCSI_STREAM_5_INTR_STATUS_VC2_0
- Offset: 0xe08e
- Byte Offset: 0x38238
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 intr_stat_embedded_line_crc_err_vc2 0x0 intr_stat_ph_single_crc_err_vc2 0x0 intr_stat_pd_wc_short_err_vc2 0x0 intr_stat_pd_crc_err_vc2 0x0 intr_stat_ph_ecc_single_bit_err_vc2 0x0 intr_stat_ppfsm_timeout_vc2
- NVCSI_STREAM_5_INTR_STATUS_VC3_0
- Offset: 0xe08f
- Byte Offset: 0x3823c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 intr_stat_embedded_line_crc_err_vc3 0x0 intr_stat_ph_single_crc_err_vc3 0x0 intr_stat_pd_wc_short_err_vc3 0x0 intr_stat_pd_crc_err_vc3 0x0 intr_stat_ph_ecc_single_bit_err_vc3 0x0 intr_stat_ppfsm_timeout_vc3
- NVCSI_STREAM_5_INTR_STATUS_VC4_0
- Offset: 0xe090
- Byte Offset: 0x38240
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 intr_stat_embedded_line_crc_err_vc4 0x0 intr_stat_ph_single_crc_err_vc4 0x0 intr_stat_pd_wc_short_err_vc4 0x0 intr_stat_pd_crc_err_vc4 0x0 intr_stat_ph_ecc_single_bit_err_vc4 0x0 intr_stat_ppfsm_timeout_vc4
- NVCSI_STREAM_5_INTR_STATUS_VC5_0
- Offset: 0xe091
- Byte Offset: 0x38244
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 intr_stat_embedded_line_crc_err_vc5 0x0 intr_stat_ph_single_crc_err_vc5 0x0 intr_stat_pd_wc_short_err_vc5 0x0 intr_stat_pd_crc_err_vc5 0x0 intr_stat_ph_ecc_single_bit_err_vc5 0x0 intr_stat_ppfsm_timeout_vc5
- NVCSI_STREAM_5_INTR_STATUS_VC6_0
- Offset: 0xe092
- Byte Offset: 0x38248
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 intr_stat_embedded_line_crc_err_vc6 0x0 intr_stat_ph_single_crc_err_vc6 0x0 intr_stat_pd_wc_short_err_vc6 0x0 intr_stat_pd_crc_err_vc6 0x0 intr_stat_ph_ecc_single_bit_err_vc6 0x0 intr_stat_ppfsm_timeout_vc6
- NVCSI_STREAM_5_INTR_STATUS_VC7_0
- Offset: 0xe093
- Byte Offset: 0x3824c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 intr_stat_embedded_line_crc_err_vc7 0x0 intr_stat_ph_single_crc_err_vc7 0x0 intr_stat_pd_wc_short_err_vc7 0x0 intr_stat_pd_crc_err_vc7 0x0 intr_stat_ph_ecc_single_bit_err_vc7 0x0 intr_stat_ppfsm_timeout_vc7
- NVCSI_STREAM_5_INTR_STATUS_VC8_0
- Offset: 0xe094
- Byte Offset: 0x38250
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 intr_stat_embedded_line_crc_err_vc8 0x0 intr_stat_ph_single_crc_err_vc8 0x0 intr_stat_pd_wc_short_err_vc8 0x0 intr_stat_pd_crc_err_vc8 0x0 intr_stat_ph_ecc_single_bit_err_vc8 0x0 intr_stat_ppfsm_timeout_vc8
- NVCSI_STREAM_5_INTR_STATUS_VC9_0
- Offset: 0xe095
- Byte Offset: 0x38254
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 intr_stat_embedded_line_crc_err_vc9 0x0 intr_stat_ph_single_crc_err_vc9 0x0 intr_stat_pd_wc_short_err_vc9 0x0 intr_stat_pd_crc_err_vc9 0x0 intr_stat_ph_ecc_single_bit_err_vc9 0x0 intr_stat_ppfsm_timeout_vc9
- NVCSI_STREAM_5_INTR_STATUS_VC10_0
- Offset: 0xe096
- Byte Offset: 0x38258
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 intr_stat_embedded_line_crc_err_vc10 0x0 intr_stat_ph_single_crc_err_vc10 0x0 intr_stat_pd_wc_short_err_vc10 0x0 intr_stat_pd_crc_err_vc10 0x0 intr_stat_ph_ecc_single_bit_err_vc10 0x0 intr_stat_ppfsm_timeout_vc10
- NVCSI_STREAM_5_INTR_STATUS_VC11_0
- Offset: 0xe097
- Byte Offset: 0x3825c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 intr_stat_embedded_line_crc_err_vc11 0x0 intr_stat_ph_single_crc_err_vc11 0x0 intr_stat_pd_wc_short_err_vc11 0x0 intr_stat_pd_crc_err_vc11 0x0 intr_stat_ph_ecc_single_bit_err_vc11 0x0 intr_stat_ppfsm_timeout_vc11
- NVCSI_STREAM_5_INTR_STATUS_VC12_0
- Offset: 0xe098
- Byte Offset: 0x38260
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 intr_stat_embedded_line_crc_err_vc12 0x0 intr_stat_ph_single_crc_err_vc12 0x0 intr_stat_pd_wc_short_err_vc12 0x0 intr_stat_pd_crc_err_vc12 0x0 intr_stat_ph_ecc_single_bit_err_vc12 0x0 intr_stat_ppfsm_timeout_vc12
- NVCSI_STREAM_5_INTR_STATUS_VC13_0
- Offset: 0xe099
- Byte Offset: 0x38264
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 intr_stat_embedded_line_crc_err_vc13 0x0 intr_stat_ph_single_crc_err_vc13 0x0 intr_stat_pd_wc_short_err_vc13 0x0 intr_stat_pd_crc_err_vc13 0x0 intr_stat_ph_ecc_single_bit_err_vc13 0x0 intr_stat_ppfsm_timeout_vc13
- NVCSI_STREAM_5_INTR_STATUS_VC14_0
- Offset: 0xe09a
- Byte Offset: 0x38268
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 intr_stat_embedded_line_crc_err_vc14 0x0 intr_stat_ph_single_crc_err_vc14 0x0 intr_stat_pd_wc_short_err_vc14 0x0 intr_stat_pd_crc_err_vc14 0x0 intr_stat_ph_ecc_single_bit_err_vc14 0x0 intr_stat_ppfsm_timeout_vc14
- NVCSI_STREAM_5_INTR_STATUS_VC15_0
- Offset: 0xe09b
- Byte Offset: 0x3826c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 intr_stat_embedded_line_crc_err_vc15 0x0 intr_stat_ph_single_crc_err_vc15 0x0 intr_stat_pd_wc_short_err_vc15 0x0 intr_stat_pd_crc_err_vc15 0x0 intr_stat_ph_ecc_single_bit_err_vc15 0x0 intr_stat_ppfsm_timeout_vc15
- NVCSI_STREAM_5_INTR_MASK_NOVC_0
- Offset: 0xe09c
- Byte Offset: 0x38270
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 intr_mask_ph_both_crc_err: packet header two CRC error for CPHY 0x0 intr_mask_ph_ecc_multi_bit_err: packet header muti bit ecc error for DPHY
- NVCSI_STREAM_5_INTR_MASK_VC0_0
- Offset: 0xe09d
- Byte Offset: 0x38274
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 intr_mask_embedded_line_crc_err_vc0 0x0 intr_mask_ph_single_crc_err_vc0

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 intr_mask_pd_wc_short_err_vc0 0x0 intr_mask_pd_crc_err_vc0 0x0 intr_mask_ph_ecc_single_bit_err_vc0 0x0 intr_mask_ppfsm_timeout_vc0
- NVCSI_STREAM_5_INTR_MASK_VC1_0
- Offset: 0xe09e
- Byte Offset: 0x38278
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 intr_mask_embedded_line_crc_err_vc1 0x0 intr_mask_ph_single_crc_err_vc1 0x0 intr_mask_pd_wc_short_err_vc1 0x0 intr_mask_pd_crc_err_vc1 0x0 intr_mask_ph_ecc_single_bit_err_vc1 0x0 intr_mask_ppfsm_timeout_vc1
- NVCSI_STREAM_5_INTR_MASK_VC2_0
- Offset: 0xe09f
- Byte Offset: 0x3827c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 intr_mask_embedded_line_crc_err_vc2

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 intr_mask_ph_single_crc_err_vc2 0x0 intr_mask_pd_wc_short_err_vc2 0x0 intr_mask_pd_crc_err_vc2 0x0 intr_mask_ph_ecc_single_bit_err_vc2 0x0 intr_mask_ppfsm_timeout_vc2
- NVCSI_STREAM_5_INTR_MASK_VC3_0
- Offset: 0xe0a0
- Byte Offset: 0x38280
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 intr_mask_embedded_line_crc_err_vc3 0x0 intr_mask_ph_single_crc_err_vc3 0x0 intr_mask_pd_wc_short_err_vc3 0x0 intr_mask_pd_crc_err_vc3 0x0 intr_mask_ph_ecc_single_bit_err_vc3 0x0 intr_mask_ppfsm_timeout_vc3
- NVCSI_STREAM_5_INTR_MASK_VC4_0
- Offset: 0xe0a1
- Byte Offset: 0x38284
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 intr_mask_embedded_line_crc_err_vc4 0x0 intr_mask_ph_single_crc_err_vc4 0x0 intr_mask_pd_wc_short_err_vc4 0x0 intr_mask_pd_crc_err_vc4 0x0 intr_mask_ph_ecc_single_bit_err_vc4 0x0 intr_mask_ppfsm_timeout_vc4
- NVCSI_STREAM_5_INTR_MASK_VC5_0
- Offset: 0xe0a2
- Byte Offset: 0x38288
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 intr_mask_embedded_line_crc_err_vc5 0x0 intr_mask_ph_single_crc_err_vc5 0x0 intr_mask_pd_wc_short_err_vc5 0x0 intr_mask_pd_crc_err_vc5 0x0 intr_mask_ph_ecc_single_bit_err_vc5 0x0 intr_mask_ppfsm_timeout_vc5
- NVCSI_STREAM_5_INTR_MASK_VC6_0
- Offset: 0xe0a3
- Byte Offset: 0x3828c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 intr_mask_embedded_line_crc_err_vc6 0x0 intr_mask_ph_single_crc_err_vc6 0x0 intr_mask_pd_wc_short_err_vc6 0x0 intr_mask_pd_crc_err_vc6 0x0 intr_mask_ph_ecc_single_bit_err_vc6 0x0 intr_mask_ppfsm_timeout_vc6
- NVCSI_STREAM_5_INTR_MASK_VC7_0
- Offset: 0xe0a4
- Byte Offset: 0x38290
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 intr_mask_embedded_line_crc_err_vc7 0x0 intr_mask_ph_single_crc_err_vc7 0x0 intr_mask_pd_wc_short_err_vc7 0x0 intr_mask_pd_crc_err_vc7 0x0 intr_mask_ph_ecc_single_bit_err_vc7 0x0 intr_mask_ppfsm_timeout_vc7
- NVCSI_STREAM_5_INTR_MASK_VC8_0
- Offset: 0xe0a5
- Byte Offset: 0x38294
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 intr_mask_embedded_line_crc_err_vc8 0x0 intr_mask_ph_single_crc_err_vc8 0x0 intr_mask_pd_wc_short_err_vc8 0x0 intr_mask_pd_crc_err_vc8 0x0 intr_mask_ph_ecc_single_bit_err_vc8 0x0 intr_mask_ppfsm_timeout_vc8
- NVCSI_STREAM_5_INTR_MASK_VC9_0
- Offset: 0xe0a6
- Byte Offset: 0x38298
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 intr_mask_embedded_line_crc_err_vc9 0x0 intr_mask_ph_single_crc_err_vc9 0x0 intr_mask_pd_wc_short_err_vc9 0x0 intr_mask_pd_crc_err_vc9 0x0 intr_mask_ph_ecc_single_bit_err_vc9 0x0 intr_mask_ppfsm_timeout_vc9
- NVCSI_STREAM_5_INTR_MASK_VC10_0
- Offset: 0xe0a7
- Byte Offset: 0x3829c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 intr_mask_embedded_line_crc_err_vc10 0x0 intr_mask_ph_single_crc_err_vc10 0x0 intr_mask_pd_wc_short_err_vc10 0x0 intr_mask_pd_crc_err_vc10 0x0 intr_mask_ph_ecc_single_bit_err_vc10 0x0 intr_mask_ppfsm_timeout_vc10
- NVCSI_STREAM_5_INTR_MASK_VC11_0
- Offset: 0xe0a8
- Byte Offset: 0x382a0
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 intr_mask_embedded_line_crc_err_vc11 0x0 intr_mask_ph_single_crc_err_vc11 0x0 intr_mask_pd_wc_short_err_vc11 0x0 intr_mask_pd_crc_err_vc11 0x0 intr_mask_ph_ecc_single_bit_err_vc11 0x0 intr_mask_ppfsm_timeout_vc11
- NVCSI_STREAM_5_INTR_MASK_VC12_0
- Offset: 0xe0a9
- Byte Offset: 0x382a4
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 intr_mask_embedded_line_crc_err_vc12 0x0 intr_mask_ph_single_crc_err_vc12 0x0 intr_mask_pd_wc_short_err_vc12 0x0 intr_mask_pd_crc_err_vc12 0x0 intr_mask_ph_ecc_single_bit_err_vc12 0x0 intr_mask_ppfsm_timeout_vc12
- NVCSI_STREAM_5_INTR_MASK_VC13_0
- Offset: 0xe0aa
- Byte Offset: 0x382a8
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 intr_mask_embedded_line_crc_err_vc13 0x0 intr_mask_ph_single_crc_err_vc13 0x0 intr_mask_pd_wc_short_err_vc13 0x0 intr_mask_pd_crc_err_vc13 0x0 intr_mask_ph_ecc_single_bit_err_vc13 0x0 intr_mask_ppfsm_timeout_vc13
- NVCSI_STREAM_5_INTR_MASK_VC14_0
- Offset: 0xe0ab
- Byte Offset: 0x382ac
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 intr_mask_embedded_line_crc_err_vc14 0x0 intr_mask_ph_single_crc_err_vc14 0x0 intr_mask_pd_wc_short_err_vc14 0x0 intr_mask_pd_crc_err_vc14 0x0 intr_mask_ph_ecc_single_bit_err_vc14 0x0 intr_mask_ppfsm_timeout_vc14
- NVCSI_STREAM_5_INTR_MASK_VC15_0
- Offset: 0xe0ac
- Byte Offset: 0x382b0
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 intr_mask_embedded_line_crc_err_vc15 0x0 intr_mask_ph_single_crc_err_vc15 0x0 intr_mask_pd_wc_short_err_vc15 0x0 intr_mask_pd_crc_err_vc15 0x0 intr_mask_ph_ecc_single_bit_err_vc15 0x0 intr_mask_ppfsm_timeout_vc15
- NVCSI_STREAM_5_CORRECTABLE_ERR_INTR_STATUS_0
- Offset: 0xe0ad
- Byte Offset: 0x382b4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxx0,0000,0000,0000,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_stat_novc:
- Not VC related interrupt
0x0 err_intr_stat_vc15:
- VC15 event
0x0 err_intr_stat_vc14:
- VC14 event
0x0 err_intr_stat_vc13:
- VC13 event
0x0 err_intr_stat_vc12:
- VC12 event
0x0 err_intr_stat_vc11:
- VC11 event
0x0 err_intr_stat_vc10:
- VC10 event
0x0 err_intr_stat_vc9:
- VC9 event
0x0 err_intr_stat_vc8:
- VC8 event
0x0 err_intr_stat_vc7:
- VC7 event
0x0 err_intr_stat_vc6:
- VC6 event
0x0 err_intr_stat_vc5:
- VC5 event
0x0 err_intr_stat_vc4:
- VC4 event
0x0 err_intr_stat_vc3:
- VC3 event
0x0 err_intr_stat_vc2:
- VC2 event
0x0 err_intr_stat_vc1:
- VC1 event
0x0 err_intr_stat_vc0:
- VC0 event
- NVCSI_STREAM_5_CORRECTABLE_ERR_INTR_STATUS_NOVC_0
- Offset: 0xe0ae
- Byte Offset: 0x382b8
- Read/Write: R/W

- NVCSI Stream5 Registers
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 err_intr_stat_ph_both_crc_err: packet header two CRC error for CPHY 0x0 err_intr_stat_ph_ecc_multi_bit_err: packet header muti bit ecc error for DPHY
- NVCSI_STREAM_5_CORRECTABLE_ERR_INTR_STATUS_VC0_0
- Offset: 0xe0af
- Byte Offset: 0x382bc
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc0 0x0 err_intr_stat_ph_single_crc_err_vc0 0x0 err_intr_stat_pd_wc_short_err_vc0 0x0 err_intr_stat_pd_crc_err_vc0 0x0 err_intr_stat_ph_ecc_single_bit_err_vc0 0x0 err_intr_stat_ppfsm_timeout_vc0
- NVCSI_STREAM_5_CORRECTABLE_ERR_INTR_STATUS_VC1_0
- Offset: 0xe0b0
- Byte Offset: 0x382c0
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc1 0x0 err_intr_stat_ph_single_crc_err_vc1 0x0 err_intr_stat_pd_wc_short_err_vc1 0x0 err_intr_stat_pd_crc_err_vc1 0x0 err_intr_stat_ph_ecc_single_bit_err_vc1 0x0 err_intr_stat_ppfsm_timeout_vc1
- NVCSI_STREAM_5_CORRECTABLE_ERR_INTR_STATUS_VC2_0
- Offset: 0xe0b1
- Byte Offset: 0x382c4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc2 0x0 err_intr_stat_ph_single_crc_err_vc2 0x0 err_intr_stat_pd_wc_short_err_vc2 0x0 err_intr_stat_pd_crc_err_vc2 0x0 err_intr_stat_ph_ecc_single_bit_err_vc2 0x0 err_intr_stat_ppfsm_timeout_vc2
- NVCSI_STREAM_5_CORRECTABLE_ERR_INTR_STATUS_VC3_0
- Offset: 0xe0b2
- Byte Offset: 0x382c8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc3 0x0 err_intr_stat_ph_single_crc_err_vc3 0x0 err_intr_stat_pd_wc_short_err_vc3 0x0 err_intr_stat_pd_crc_err_vc3 0x0 err_intr_stat_ph_ecc_single_bit_err_vc3 0x0 err_intr_stat_ppfsm_timeout_vc3
- NVCSI_STREAM_5_CORRECTABLE_ERR_INTR_STATUS_VC4_0
- Offset: 0xe0b3
- Byte Offset: 0x382cc
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc4 0x0 err_intr_stat_ph_single_crc_err_vc4 0x0 err_intr_stat_pd_wc_short_err_vc4 0x0 err_intr_stat_pd_crc_err_vc4 0x0 err_intr_stat_ph_ecc_single_bit_err_vc4 0x0 err_intr_stat_ppfsm_timeout_vc4
- NVCSI_STREAM_5_CORRECTABLE_ERR_INTR_STATUS_VC5_0
- Offset: 0xe0b4
- Byte Offset: 0x382d0
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc5 0x0 err_intr_stat_ph_single_crc_err_vc5 0x0 err_intr_stat_pd_wc_short_err_vc5 0x0 err_intr_stat_pd_crc_err_vc5 0x0 err_intr_stat_ph_ecc_single_bit_err_vc5 0x0 err_intr_stat_ppfsm_timeout_vc5
- NVCSI_STREAM_5_CORRECTABLE_ERR_INTR_STATUS_VC6_0
- Offset: 0xe0b5
- Byte Offset: 0x382d4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc6 0x0 err_intr_stat_ph_single_crc_err_vc6 0x0 err_intr_stat_pd_wc_short_err_vc6 0x0 err_intr_stat_pd_crc_err_vc6 0x0 err_intr_stat_ph_ecc_single_bit_err_vc6 0x0 err_intr_stat_ppfsm_timeout_vc6
- NVCSI_STREAM_5_CORRECTABLE_ERR_INTR_STATUS_VC7_0
- Offset: 0xe0b6
- Byte Offset: 0x382d8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc7 0x0 err_intr_stat_ph_single_crc_err_vc7 0x0 err_intr_stat_pd_wc_short_err_vc7 0x0 err_intr_stat_pd_crc_err_vc7 0x0 err_intr_stat_ph_ecc_single_bit_err_vc7 0x0 err_intr_stat_ppfsm_timeout_vc7
- NVCSI_STREAM_5_CORRECTABLE_ERR_INTR_STATUS_VC8_0
- Offset: 0xe0b7
- Byte Offset: 0x382dc
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc8 0x0 err_intr_stat_ph_single_crc_err_vc8 0x0 err_intr_stat_pd_wc_short_err_vc8 0x0 err_intr_stat_pd_crc_err_vc8 0x0 err_intr_stat_ph_ecc_single_bit_err_vc8 0x0 err_intr_stat_ppfsm_timeout_vc8
- NVCSI_STREAM_5_CORRECTABLE_ERR_INTR_STATUS_VC9_0
- Offset: 0xe0b8
- Byte Offset: 0x382e0
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc9 0x0 err_intr_stat_ph_single_crc_err_vc9 0x0 err_intr_stat_pd_wc_short_err_vc9 0x0 err_intr_stat_pd_crc_err_vc9 0x0 err_intr_stat_ph_ecc_single_bit_err_vc9 0x0 err_intr_stat_ppfsm_timeout_vc9
- NVCSI_STREAM_5_CORRECTABLE_ERR_INTR_STATUS_VC10_0
- Offset: 0xe0b9
- Byte Offset: 0x382e4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc10 0x0 err_intr_stat_ph_single_crc_err_vc10 0x0 err_intr_stat_pd_wc_short_err_vc10 0x0 err_intr_stat_pd_crc_err_vc10 0x0 err_intr_stat_ph_ecc_single_bit_err_vc10 0x0 err_intr_stat_ppfsm_timeout_vc10
- NVCSI_STREAM_5_CORRECTABLE_ERR_INTR_STATUS_VC11_0
- Offset: 0xe0ba
- Byte Offset: 0x382e8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc11 0x0 err_intr_stat_ph_single_crc_err_vc11 0x0 err_intr_stat_pd_wc_short_err_vc11 0x0 err_intr_stat_pd_crc_err_vc11 0x0 err_intr_stat_ph_ecc_single_bit_err_vc11 0x0 err_intr_stat_ppfsm_timeout_vc11
- NVCSI_STREAM_5_CORRECTABLE_ERR_INTR_STATUS_VC12_0
- Offset: 0xe0bb
- Byte Offset: 0x382ec
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc12 0x0 err_intr_stat_ph_single_crc_err_vc12 0x0 err_intr_stat_pd_wc_short_err_vc12 0x0 err_intr_stat_pd_crc_err_vc12 0x0 err_intr_stat_ph_ecc_single_bit_err_vc12 0x0 err_intr_stat_ppfsm_timeout_vc12
- NVCSI_STREAM_5_CORRECTABLE_ERR_INTR_STATUS_VC13_0
- Offset: 0xe0bc
- Byte Offset: 0x382f0
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc13 0x0 err_intr_stat_ph_single_crc_err_vc13 0x0 err_intr_stat_pd_wc_short_err_vc13 0x0 err_intr_stat_pd_crc_err_vc13 0x0 err_intr_stat_ph_ecc_single_bit_err_vc13 0x0 err_intr_stat_ppfsm_timeout_vc13
- NVCSI_STREAM_5_CORRECTABLE_ERR_INTR_STATUS_VC14_0
- Offset: 0xe0bd
- Byte Offset: 0x382f4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc14 0x0 err_intr_stat_ph_single_crc_err_vc14 0x0 err_intr_stat_pd_wc_short_err_vc14 0x0 err_intr_stat_pd_crc_err_vc14 0x0 err_intr_stat_ph_ecc_single_bit_err_vc14 0x0 err_intr_stat_ppfsm_timeout_vc14
- NVCSI_STREAM_5_CORRECTABLE_ERR_INTR_STATUS_VC15_0
- Offset: 0xe0be
- Byte Offset: 0x382f8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc15 0x0 err_intr_stat_ph_single_crc_err_vc15 0x0 err_intr_stat_pd_wc_short_err_vc15 0x0 err_intr_stat_pd_crc_err_vc15 0x0 err_intr_stat_ph_ecc_single_bit_err_vc15 0x0 err_intr_stat_ppfsm_timeout_vc15
- NVCSI_STREAM_5_UNCORRECTABLE_ERR_INTR_STATUS_0
- Offset: 0xe0bf
- Byte Offset: 0x382fc
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxx0,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_novc:
- Not VC related interrupt
0x0 err_intr_stat_vc15:
- VC15 event
0x0 err_intr_stat_vc14:
- VC14 event
0x0 err_intr_stat_vc13:
- VC13 event
0x0 err_intr_stat_vc12:
- VC12 event
0x0 err_intr_stat_vc11:
- VC11 event
0x0 err_intr_stat_vc10:
- VC10 event
0x0 err_intr_stat_vc9:
- VC9 event
0x0 err_intr_stat_vc8:
- VC8 event
0x0 err_intr_stat_vc7:
- VC7 event

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_stat_vc6:
- VC6 event
0x0 err_intr_stat_vc5:
- VC5 event
0x0 err_intr_stat_vc4:
- VC4 event
0x0 err_intr_stat_vc3:
- VC3 event
0x0 err_intr_stat_vc2:
- VC2 event
0x0 err_intr_stat_vc1:
- VC1 event
0x0 err_intr_stat_vc0:
- VC0 event
- NVCSI_STREAM_5_UNCORRECTABLE_ERR_INTR_STATUS_NOVC_0
- Offset: 0xe0c0
- Byte Offset: 0x38300
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 err_intr_stat_ph_both_crc_err: packet header two CRC error for CPHY 0x0 err_intr_stat_ph_ecc_multi_bit_err: packet header muti bit ecc error for DPHY
- NVCSI_STREAM_5_UNCORRECTABLE_ERR_INTR_STATUS_VC0_0
- Offset: 0xe0c1
- Byte Offset: 0x38304
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected

- NVCSI Stream5 Registers
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc0 0x0 err_intr_stat_ph_single_crc_err_vc0 0x0 err_intr_stat_pd_wc_short_err_vc0 0x0 err_intr_stat_pd_crc_err_vc0 0x0 err_intr_stat_ph_ecc_single_bit_err_vc0 0x0 err_intr_stat_ppfsm_timeout_vc0
- NVCSI_STREAM_5_UNCORRECTABLE_ERR_INTR_STATUS_VC1_0
- Offset: 0xe0c2
- Byte Offset: 0x38308
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc1 0x0 err_intr_stat_ph_single_crc_err_vc1 0x0 err_intr_stat_pd_wc_short_err_vc1 0x0 err_intr_stat_pd_crc_err_vc1 0x0 err_intr_stat_ph_ecc_single_bit_err_vc1 0x0 err_intr_stat_ppfsm_timeout_vc1
- NVCSI_STREAM_5_UNCORRECTABLE_ERR_INTR_STATUS_VC2_0
- Offset: 0xe0c3
- Byte Offset: 0x3830c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected

- NVCSI Stream5 Registers
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc2 0x0 err_intr_stat_ph_single_crc_err_vc2 0x0 err_intr_stat_pd_wc_short_err_vc2 0x0 err_intr_stat_pd_crc_err_vc2 0x0 err_intr_stat_ph_ecc_single_bit_err_vc2 0x0 err_intr_stat_ppfsm_timeout_vc2
- NVCSI_STREAM_5_UNCORRECTABLE_ERR_INTR_STATUS_VC3_0
- Offset: 0xe0c4
- Byte Offset: 0x38310
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc3 0x0 err_intr_stat_ph_single_crc_err_vc3 0x0 err_intr_stat_pd_wc_short_err_vc3 0x0 err_intr_stat_pd_crc_err_vc3 0x0 err_intr_stat_ph_ecc_single_bit_err_vc3 0x0 err_intr_stat_ppfsm_timeout_vc3
- NVCSI_STREAM_5_UNCORRECTABLE_ERR_INTR_STATUS_VC4_0
- Offset: 0xe0c5
- Byte Offset: 0x38314
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected

- NVCSI Stream5 Registers
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc4 0x0 err_intr_stat_ph_single_crc_err_vc4 0x0 err_intr_stat_pd_wc_short_err_vc4 0x0 err_intr_stat_pd_crc_err_vc4 0x0 err_intr_stat_ph_ecc_single_bit_err_vc4 0x0 err_intr_stat_ppfsm_timeout_vc4
- NVCSI_STREAM_5_UNCORRECTABLE_ERR_INTR_STATUS_VC5_0
- Offset: 0xe0c6
- Byte Offset: 0x38318
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc5 0x0 err_intr_stat_ph_single_crc_err_vc5 0x0 err_intr_stat_pd_wc_short_err_vc5 0x0 err_intr_stat_pd_crc_err_vc5 0x0 err_intr_stat_ph_ecc_single_bit_err_vc5 0x0 err_intr_stat_ppfsm_timeout_vc5
- NVCSI_STREAM_5_UNCORRECTABLE_ERR_INTR_STATUS_VC6_0
- Offset: 0xe0c7
- Byte Offset: 0x3831c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected

- NVCSI Stream5 Registers
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc6 0x0 err_intr_stat_ph_single_crc_err_vc6 0x0 err_intr_stat_pd_wc_short_err_vc6 0x0 err_intr_stat_pd_crc_err_vc6 0x0 err_intr_stat_ph_ecc_single_bit_err_vc6 0x0 err_intr_stat_ppfsm_timeout_vc6
- NVCSI_STREAM_5_UNCORRECTABLE_ERR_INTR_STATUS_VC7_0
- Offset: 0xe0c8
- Byte Offset: 0x38320
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc7 0x0 err_intr_stat_ph_single_crc_err_vc7 0x0 err_intr_stat_pd_wc_short_err_vc7 0x0 err_intr_stat_pd_crc_err_vc7 0x0 err_intr_stat_ph_ecc_single_bit_err_vc7 0x0 err_intr_stat_ppfsm_timeout_vc7
- NVCSI_STREAM_5_UNCORRECTABLE_ERR_INTR_STATUS_VC8_0
- Offset: 0xe0c9
- Byte Offset: 0x38324
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected

- NVCSI Stream5 Registers
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc8 0x0 err_intr_stat_ph_single_crc_err_vc8 0x0 err_intr_stat_pd_wc_short_err_vc8 0x0 err_intr_stat_pd_crc_err_vc8 0x0 err_intr_stat_ph_ecc_single_bit_err_vc8 0x0 err_intr_stat_ppfsm_timeout_vc8
- NVCSI_STREAM_5_UNCORRECTABLE_ERR_INTR_STATUS_VC9_0
- Offset: 0xe0ca
- Byte Offset: 0x38328
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc9 0x0 err_intr_stat_ph_single_crc_err_vc9 0x0 err_intr_stat_pd_wc_short_err_vc9 0x0 err_intr_stat_pd_crc_err_vc9 0x0 err_intr_stat_ph_ecc_single_bit_err_vc9 0x0 err_intr_stat_ppfsm_timeout_vc9
- NVCSI_STREAM_5_UNCORRECTABLE_ERR_INTR_STATUS_VC10_0
- Offset: 0xe0cb
- Byte Offset: 0x3832c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected

- NVCSI Stream5 Registers
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc10 0x0 err_intr_stat_ph_single_crc_err_vc10 0x0 err_intr_stat_pd_wc_short_err_vc10 0x0 err_intr_stat_pd_crc_err_vc10 0x0 err_intr_stat_ph_ecc_single_bit_err_vc10 0x0 err_intr_stat_ppfsm_timeout_vc10
- NVCSI_STREAM_5_UNCORRECTABLE_ERR_INTR_STATUS_VC11_0
- Offset: 0xe0cc
- Byte Offset: 0x38330
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc11 0x0 err_intr_stat_ph_single_crc_err_vc11 0x0 err_intr_stat_pd_wc_short_err_vc11 0x0 err_intr_stat_pd_crc_err_vc11 0x0 err_intr_stat_ph_ecc_single_bit_err_vc11 0x0 err_intr_stat_ppfsm_timeout_vc11
- NVCSI_STREAM_5_UNCORRECTABLE_ERR_INTR_STATUS_VC12_0
- Offset: 0xe0cd
- Byte Offset: 0x38334
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected

- NVCSI Stream5 Registers
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc12 0x0 err_intr_stat_ph_single_crc_err_vc12 0x0 err_intr_stat_pd_wc_short_err_vc12 0x0 err_intr_stat_pd_crc_err_vc12 0x0 err_intr_stat_ph_ecc_single_bit_err_vc12 0x0 err_intr_stat_ppfsm_timeout_vc12
- NVCSI_STREAM_5_UNCORRECTABLE_ERR_INTR_STATUS_VC13_0
- Offset: 0xe0ce
- Byte Offset: 0x38338
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc13 0x0 err_intr_stat_ph_single_crc_err_vc13 0x0 err_intr_stat_pd_wc_short_err_vc13 0x0 err_intr_stat_pd_crc_err_vc13 0x0 err_intr_stat_ph_ecc_single_bit_err_vc13 0x0 err_intr_stat_ppfsm_timeout_vc13
- NVCSI_STREAM_5_UNCORRECTABLE_ERR_INTR_STATUS_VC14_0
- Offset: 0xe0cf
- Byte Offset: 0x3833c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected

- NVCSI Stream5 Registers
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc14 0x0 err_intr_stat_ph_single_crc_err_vc14 0x0 err_intr_stat_pd_wc_short_err_vc14 0x0 err_intr_stat_pd_crc_err_vc14 0x0 err_intr_stat_ph_ecc_single_bit_err_vc14 0x0 err_intr_stat_ppfsm_timeout_vc14
- NVCSI_STREAM_5_UNCORRECTABLE_ERR_INTR_STATUS_VC15_0
- Offset: 0xe0d0
- Byte Offset: 0x38340
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_stat_embedded_line_crc_err_vc15 0x0 err_intr_stat_ph_single_crc_err_vc15 0x0 err_intr_stat_pd_wc_short_err_vc15 0x0 err_intr_stat_pd_crc_err_vc15 0x0 err_intr_stat_ph_ecc_single_bit_err_vc15 0x0 err_intr_stat_ppfsm_timeout_vc15
- NVCSI_STREAM_5_ERR_INTR_MASK_NOVC_0
- Offset: 0xe0d1
- Byte Offset: 0x38344
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected

- NVCSI Stream5 Registers
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 err_intr_mask_ph_both_crc_err: packet header two CRC error for CPHY 0x0 err_intr_mask_ph_ecc_multi_bit_err: packet header muti bit ecc error for DPHY
- NVCSI_STREAM_5_ERR_INTR_MASK_VC0_0
- Offset: 0xe0d2
- Byte Offset: 0x38348
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_mask_embedded_line_crc_err_vc0 0x0 err_intr_mask_ph_single_crc_err_vc0 0x0 err_intr_mask_pd_wc_short_err_vc0 0x0 err_intr_mask_pd_crc_err_vc0 0x0 err_intr_mask_ph_ecc_single_bit_err_vc0 0x0 err_intr_mask_ppfsm_timeout_vc0
- NVCSI_STREAM_5_ERR_INTR_MASK_VC1_0
- Offset: 0xe0d3
- Byte Offset: 0x3834c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_mask_embedded_line_crc_err_vc1

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_mask_ph_single_crc_err_vc1 0x0 err_intr_mask_pd_wc_short_err_vc1 0x0 err_intr_mask_pd_crc_err_vc1 0x0 err_intr_mask_ph_ecc_single_bit_err_vc1 0x0 err_intr_mask_ppfsm_timeout_vc1
- NVCSI_STREAM_5_ERR_INTR_MASK_VC2_0
- Offset: 0xe0d4
- Byte Offset: 0x38350
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_mask_embedded_line_crc_err_vc2 0x0 err_intr_mask_ph_single_crc_err_vc2 0x0 err_intr_mask_pd_wc_short_err_vc2 0x0 err_intr_mask_pd_crc_err_vc2 0x0 err_intr_mask_ph_ecc_single_bit_err_vc2 0x0 err_intr_mask_ppfsm_timeout_vc2
- NVCSI_STREAM_5_ERR_INTR_MASK_VC3_0
- Offset: 0xe0d5
- Byte Offset: 0x38354
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_mask_embedded_line_crc_err_vc3 0x0 err_intr_mask_ph_single_crc_err_vc3 0x0 err_intr_mask_pd_wc_short_err_vc3 0x0 err_intr_mask_pd_crc_err_vc3 0x0 err_intr_mask_ph_ecc_single_bit_err_vc3 0x0 err_intr_mask_ppfsm_timeout_vc3
- NVCSI_STREAM_5_ERR_INTR_MASK_VC4_0
- Offset: 0xe0d6
- Byte Offset: 0x38358
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_mask_embedded_line_crc_err_vc4 0x0 err_intr_mask_ph_single_crc_err_vc4 0x0 err_intr_mask_pd_wc_short_err_vc4 0x0 err_intr_mask_pd_crc_err_vc4 0x0 err_intr_mask_ph_ecc_single_bit_err_vc4 0x0 err_intr_mask_ppfsm_timeout_vc4
- NVCSI_STREAM_5_ERR_INTR_MASK_VC5_0
- Offset: 0xe0d7
- Byte Offset: 0x3835c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_mask_embedded_line_crc_err_vc5 0x0 err_intr_mask_ph_single_crc_err_vc5 0x0 err_intr_mask_pd_wc_short_err_vc5 0x0 err_intr_mask_pd_crc_err_vc5 0x0 err_intr_mask_ph_ecc_single_bit_err_vc5 0x0 err_intr_mask_ppfsm_timeout_vc5
- NVCSI_STREAM_5_ERR_INTR_MASK_VC6_0
- Offset: 0xe0d8
- Byte Offset: 0x38360
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_mask_embedded_line_crc_err_vc6 0x0 err_intr_mask_ph_single_crc_err_vc6 0x0 err_intr_mask_pd_wc_short_err_vc6 0x0 err_intr_mask_pd_crc_err_vc6 0x0 err_intr_mask_ph_ecc_single_bit_err_vc6 0x0 err_intr_mask_ppfsm_timeout_vc6
- NVCSI_STREAM_5_ERR_INTR_MASK_VC7_0
- Offset: 0xe0d9
- Byte Offset: 0x38364
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_mask_embedded_line_crc_err_vc7 0x0 err_intr_mask_ph_single_crc_err_vc7 0x0 err_intr_mask_pd_wc_short_err_vc7 0x0 err_intr_mask_pd_crc_err_vc7 0x0 err_intr_mask_ph_ecc_single_bit_err_vc7 0x0 err_intr_mask_ppfsm_timeout_vc7
- NVCSI_STREAM_5_ERR_INTR_MASK_VC8_0
- Offset: 0xe0da
- Byte Offset: 0x38368
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_mask_embedded_line_crc_err_vc8 0x0 err_intr_mask_ph_single_crc_err_vc8 0x0 err_intr_mask_pd_wc_short_err_vc8 0x0 err_intr_mask_pd_crc_err_vc8 0x0 err_intr_mask_ph_ecc_single_bit_err_vc8 0x0 err_intr_mask_ppfsm_timeout_vc8
- NVCSI_STREAM_5_ERR_INTR_MASK_VC9_0
- Offset: 0xe0db
- Byte Offset: 0x3836c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_mask_embedded_line_crc_err_vc9 0x0 err_intr_mask_ph_single_crc_err_vc9 0x0 err_intr_mask_pd_wc_short_err_vc9 0x0 err_intr_mask_pd_crc_err_vc9 0x0 err_intr_mask_ph_ecc_single_bit_err_vc9 0x0 err_intr_mask_ppfsm_timeout_vc9
- NVCSI_STREAM_5_ERR_INTR_MASK_VC10_0
- Offset: 0xe0dc
- Byte Offset: 0x38370
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_mask_embedded_line_crc_err_vc10 0x0 err_intr_mask_ph_single_crc_err_vc10 0x0 err_intr_mask_pd_wc_short_err_vc10 0x0 err_intr_mask_pd_crc_err_vc10 0x0 err_intr_mask_ph_ecc_single_bit_err_vc10 0x0 err_intr_mask_ppfsm_timeout_vc10
- NVCSI_STREAM_5_ERR_INTR_MASK_VC11_0
- Offset: 0xe0dd
- Byte Offset: 0x38374
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_mask_embedded_line_crc_err_vc11 0x0 err_intr_mask_ph_single_crc_err_vc11 0x0 err_intr_mask_pd_wc_short_err_vc11 0x0 err_intr_mask_pd_crc_err_vc11 0x0 err_intr_mask_ph_ecc_single_bit_err_vc11 0x0 err_intr_mask_ppfsm_timeout_vc11
- NVCSI_STREAM_5_ERR_INTR_MASK_VC12_0
- Offset: 0xe0de
- Byte Offset: 0x38378
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_mask_embedded_line_crc_err_vc12 0x0 err_intr_mask_ph_single_crc_err_vc12 0x0 err_intr_mask_pd_wc_short_err_vc12 0x0 err_intr_mask_pd_crc_err_vc12 0x0 err_intr_mask_ph_ecc_single_bit_err_vc12 0x0 err_intr_mask_ppfsm_timeout_vc12
- NVCSI_STREAM_5_ERR_INTR_MASK_VC13_0
- Offset: 0xe0df
- Byte Offset: 0x3837c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_mask_embedded_line_crc_err_vc13 0x0 err_intr_mask_ph_single_crc_err_vc13 0x0 err_intr_mask_pd_wc_short_err_vc13 0x0 err_intr_mask_pd_crc_err_vc13 0x0 err_intr_mask_ph_ecc_single_bit_err_vc13 0x0 err_intr_mask_ppfsm_timeout_vc13
- NVCSI_STREAM_5_ERR_INTR_MASK_VC14_0
- Offset: 0xe0e0
- Byte Offset: 0x38380
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_mask_embedded_line_crc_err_vc14 0x0 err_intr_mask_ph_single_crc_err_vc14 0x0 err_intr_mask_pd_wc_short_err_vc14 0x0 err_intr_mask_pd_crc_err_vc14 0x0 err_intr_mask_ph_ecc_single_bit_err_vc14 0x0 err_intr_mask_ppfsm_timeout_vc14
- NVCSI_STREAM_5_ERR_INTR_MASK_VC15_0
- Offset: 0xe0e1
- Byte Offset: 0x38384
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_mask_embedded_line_crc_err_vc15 0x0 err_intr_mask_ph_single_crc_err_vc15 0x0 err_intr_mask_pd_wc_short_err_vc15 0x0 err_intr_mask_pd_crc_err_vc15 0x0 err_intr_mask_ph_ecc_single_bit_err_vc15 0x0 err_intr_mask_ppfsm_timeout_vc15
- NVCSI_STREAM_5_ERR_INTR_TYPE_NOVC_0
- Offset: 0xe0e2
- Byte Offset: 0x38388
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 err_intr_type_ph_both_crc_err: packet header two CRC error for CPHY 0x0 err_intr_type_ph_ecc_multi_bit_err: packet header muti bit ecc error for DPHY
- NVCSI_STREAM_5_ERR_INTR_TYPE_VC0_0
- Offset: 0xe0e3
- Byte Offset: 0x3838c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_type_embedded_line_crc_err_vc0 0x0 err_intr_type_ph_single_crc_err_vc0

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_type_pd_wc_short_err_vc0 0x0 err_intr_type_pd_crc_err_vc0 0x0 err_intr_type_ph_ecc_single_bit_err_vc0 0x0 err_intr_type_ppfsm_timeout_vc0
- NVCSI_STREAM_5_ERR_INTR_TYPE_VC1_0
- Offset: 0xe0e4
- Byte Offset: 0x38390
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_type_embedded_line_crc_err_vc1 0x0 err_intr_type_ph_single_crc_err_vc1 0x0 err_intr_type_pd_wc_short_err_vc1 0x0 err_intr_type_pd_crc_err_vc1 0x0 err_intr_type_ph_ecc_single_bit_err_vc1 0x0 err_intr_type_ppfsm_timeout_vc1
- NVCSI_STREAM_5_ERR_INTR_TYPE_VC2_0
- Offset: 0xe0e5
- Byte Offset: 0x38394
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_type_embedded_line_crc_err_vc2

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_type_ph_single_crc_err_vc2 0x0 err_intr_type_pd_wc_short_err_vc2 0x0 err_intr_type_pd_crc_err_vc2 0x0 err_intr_type_ph_ecc_single_bit_err_vc2 0x0 err_intr_type_ppfsm_timeout_vc2
- NVCSI_STREAM_5_ERR_INTR_TYPE_VC3_0
- Offset: 0xe0e6
- Byte Offset: 0x38398
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_type_embedded_line_crc_err_vc3 0x0 err_intr_type_ph_single_crc_err_vc3 0x0 err_intr_type_pd_wc_short_err_vc3 0x0 err_intr_type_pd_crc_err_vc3 0x0 err_intr_type_ph_ecc_single_bit_err_vc3 0x0 err_intr_type_ppfsm_timeout_vc3
- NVCSI_STREAM_5_ERR_INTR_TYPE_VC4_0
- Offset: 0xe0e7
- Byte Offset: 0x3839c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_type_embedded_line_crc_err_vc4 0x0 err_intr_type_ph_single_crc_err_vc4 0x0 err_intr_type_pd_wc_short_err_vc4 0x0 err_intr_type_pd_crc_err_vc4 0x0 err_intr_type_ph_ecc_single_bit_err_vc4 0x0 err_intr_type_ppfsm_timeout_vc4
- NVCSI_STREAM_5_ERR_INTR_TYPE_VC5_0
- Offset: 0xe0e8
- Byte Offset: 0x383a0
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_type_embedded_line_crc_err_vc5 0x0 err_intr_type_ph_single_crc_err_vc5 0x0 err_intr_type_pd_wc_short_err_vc5 0x0 err_intr_type_pd_crc_err_vc5 0x0 err_intr_type_ph_ecc_single_bit_err_vc5 0x0 err_intr_type_ppfsm_timeout_vc5
- NVCSI_STREAM_5_ERR_INTR_TYPE_VC6_0
- Offset: 0xe0e9
- Byte Offset: 0x383a4
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_type_embedded_line_crc_err_vc6 0x0 err_intr_type_ph_single_crc_err_vc6 0x0 err_intr_type_pd_wc_short_err_vc6 0x0 err_intr_type_pd_crc_err_vc6 0x0 err_intr_type_ph_ecc_single_bit_err_vc6 0x0 err_intr_type_ppfsm_timeout_vc6
- NVCSI_STREAM_5_ERR_INTR_TYPE_VC7_0
- Offset: 0xe0ea
- Byte Offset: 0x383a8
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_type_embedded_line_crc_err_vc7 0x0 err_intr_type_ph_single_crc_err_vc7 0x0 err_intr_type_pd_wc_short_err_vc7 0x0 err_intr_type_pd_crc_err_vc7 0x0 err_intr_type_ph_ecc_single_bit_err_vc7 0x0 err_intr_type_ppfsm_timeout_vc7
- NVCSI_STREAM_5_ERR_INTR_TYPE_VC8_0
- Offset: 0xe0eb
- Byte Offset: 0x383ac
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_type_embedded_line_crc_err_vc8 0x0 err_intr_type_ph_single_crc_err_vc8 0x0 err_intr_type_pd_wc_short_err_vc8 0x0 err_intr_type_pd_crc_err_vc8 0x0 err_intr_type_ph_ecc_single_bit_err_vc8 0x0 err_intr_type_ppfsm_timeout_vc8
- NVCSI_STREAM_5_ERR_INTR_TYPE_VC9_0
- Offset: 0xe0ec
- Byte Offset: 0x383b0
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_type_embedded_line_crc_err_vc9 0x0 err_intr_type_ph_single_crc_err_vc9 0x0 err_intr_type_pd_wc_short_err_vc9 0x0 err_intr_type_pd_crc_err_vc9 0x0 err_intr_type_ph_ecc_single_bit_err_vc9 0x0 err_intr_type_ppfsm_timeout_vc9
- NVCSI_STREAM_5_ERR_INTR_TYPE_VC10_0
- Offset: 0xe0ed
- Byte Offset: 0x383b4
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_type_embedded_line_crc_err_vc10 0x0 err_intr_type_ph_single_crc_err_vc10 0x0 err_intr_type_pd_wc_short_err_vc10 0x0 err_intr_type_pd_crc_err_vc10 0x0 err_intr_type_ph_ecc_single_bit_err_vc10 0x0 err_intr_type_ppfsm_timeout_vc10
- NVCSI_STREAM_5_ERR_INTR_TYPE_VC11_0
- Offset: 0xe0ee
- Byte Offset: 0x383b8
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_type_embedded_line_crc_err_vc11 0x0 err_intr_type_ph_single_crc_err_vc11 0x0 err_intr_type_pd_wc_short_err_vc11 0x0 err_intr_type_pd_crc_err_vc11 0x0 err_intr_type_ph_ecc_single_bit_err_vc11 0x0 err_intr_type_ppfsm_timeout_vc11
- NVCSI_STREAM_5_ERR_INTR_TYPE_VC12_0
- Offset: 0xe0ef
- Byte Offset: 0x383bc
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_type_embedded_line_crc_err_vc12 0x0 err_intr_type_ph_single_crc_err_vc12 0x0 err_intr_type_pd_wc_short_err_vc12 0x0 err_intr_type_pd_crc_err_vc12 0x0 err_intr_type_ph_ecc_single_bit_err_vc12 0x0 err_intr_type_ppfsm_timeout_vc12
- NVCSI_STREAM_5_ERR_INTR_TYPE_VC13_0
- Offset: 0xe0f0
- Byte Offset: 0x383c0
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_type_embedded_line_crc_err_vc13 0x0 err_intr_type_ph_single_crc_err_vc13 0x0 err_intr_type_pd_wc_short_err_vc13 0x0 err_intr_type_pd_crc_err_vc13 0x0 err_intr_type_ph_ecc_single_bit_err_vc13 0x0 err_intr_type_ppfsm_timeout_vc13
- NVCSI_STREAM_5_ERR_INTR_TYPE_VC14_0
- Offset: 0xe0f1
- Byte Offset: 0x383c4
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
0x0 err_intr_type_embedded_line_crc_err_vc14 0x0 err_intr_type_ph_single_crc_err_vc14 0x0 err_intr_type_pd_wc_short_err_vc14 0x0 err_intr_type_pd_crc_err_vc14 0x0 err_intr_type_ph_ecc_single_bit_err_vc14 0x0 err_intr_type_ppfsm_timeout_vc14
- NVCSI_STREAM_5_ERR_INTR_TYPE_VC15_0
- Offset: 0xe0f2
- Byte Offset: 0x383c8
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 err_intr_type_embedded_line_crc_err_vc15 0x0 err_intr_type_ph_single_crc_err_vc15 0x0 err_intr_type_pd_wc_short_err_vc15 0x0 err_intr_type_pd_crc_err_vc15 0x0 err_intr_type_ph_ecc_single_bit_err_vc15 0x0 err_intr_type_ppfsm_timeout_vc15
- NVCSI_STREAM_5_TPG_ENABLE_0
- Offset: 0xe0f3
- Byte Offset: 0x383cc
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0b0xxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
- DISABLE
TPG_ENABLE:
- Enable the TPG path

