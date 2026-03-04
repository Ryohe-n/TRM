# 31 :0 0x0 ErrAddrHi:

- RO: Error Address high: When a DEC_ERR response is returned and
- AST_ERROR_STATUS[Valid]=0 the upper 32 bits of the error address are
latched into this register. This field is not updated if AST_ERROR_STATUS[Valid]=1.
- APS_AST_STREAMID_CTL_0
This is an array of 16 identical register entries; the register fields below apply to each entry.
- Offset: 0x20,..,0x5c
Read/Write: See table below.
- Parity Protection: N

- AON Registers
- SCR Protection: AST_HYP_SEC_CONTROL_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,0000,0000,xxxx,xxx0)
- Bit
- Reset
- Description

