# 9 :5 0x0 DefCarveOutID:

- RWCL:Default MC Carveout ID: Specifies the carveout ID for default
accesses. This field specifies the state output on ast_master_a[w,r]user[15,11] for requests that do not match a region. 0x0 DefSnoop: RWGL: Snoop: Specifies if default accesses snoop the Main CPU caches.
- This bit controls the state output on ast_master_a[w,r]user[8] for requests
that do not match a region. 1=Snoop request, 0=Do not snoop request 0 = DISABLE 1 = ENABLE 0x0 MatchErrCtl:
- RW:Match Error Control: Specifies how transactions that do not match a
region are handled. 0=Transactions that do no match a region are forwarded untranslated with the default attributes. 1=Transactions that do no match a region return a decode error on the AXI slave interface. 0 = NO_DECERR 1 = DECERR 0x0 Lock: RW1:Security lock: This bit prevents writes to all RWGL bits. 0 = FALSE 1 = TRUE
- APS_AST_ERROR_STATUS_0
- Offset: 0x4
- Read/Write: See table below
- Parity Protection: N
- SCR Protection: AST_GBL_SEC_CONTROL_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)

- AON Registers
- Bit
R/W
- Reset
- Description
- RO
0x0 Overflow:
- RO:Error Overflow: This bit is set to 1 by HW when
- AST_ERROR_STATUS[Valid]=1 (due to a previous error) and a new
DEC_ERR occurs.
- RO
0x0 VMIndxErr:
- RO:VM Index Error: This bit is set to 1 by HW when
- AST_ERROR_STATUS[Valid]=0 and when a DEC_ERR response is
returned because a disabled VMIndx was programmed.
- RW
0x0 Valid:
- RW:Error valid: This bit is set to 1 by HW when a DEC_ERR response
is returend. 1=Error Valid. Software can write this bit to 0 to clear the logged errors (Clears valid,overflow,error-address bits).
- APS_AST_ERROR_ADDR_LO_0
- Offset: 0x8
- Read/Write: RO
- Parity Protection: N
- SCR Protection: AST_GBL_SEC_CONTROL_0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

