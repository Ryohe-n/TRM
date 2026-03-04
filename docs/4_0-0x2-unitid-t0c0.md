# 4 :0 0x2 UNITID_T0C0:

- Upstream FPCI Unit ID for controller 0. HyperTransport, upstream FPCI
request
- HDA_CFG_REVID_0
- CFG_REVID register
- Offset: 0x1a0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00001004 (0bxxxx,xxxx,xxxx,00xx,xx01,00xx,xxx0,01xx)

- HDA Registers
- Bit
R/W
- Reset
- Description
- RO
0x0 DEV2SM_NONISO_REQUEST_PEND: This is to tell if there is a non ISO request pending. 0 = NO 1 = YES
- RO
0x0 DEV2SM_ISO_REQUEST_PEND: This is to tell if there is an ISO request pending. 0 = NO 1 = YES 13:12
- RW
0x1 STRAP_CPU_MODE: MCP: mode to send MSI. Can have it programmable. 0 = NB_INTEL 1 = NB_AMD 2 = AMD 3 = TMTA
- RW
0x0 CFG_REVID_WRITE_ENABLE:
- MCP: the enable to override the revision ID. Can have it
programmable 0 = CLEAR 1 = SET
- RW
0x0 CFG_REVID_OVERRIDE:
- MCP: a way to override the current revision ID. Can have it
programmable 0 = DISABLE 1 = ENABLE
- RO
0x0 DEV2LEG_NONCOH_REQUEST_PEND:
- MCP: Tells the leg block that we have a non coherent
request pending. 0 = NO 1 = YES
- RO
0x0 DEV2LEG_COH_REQUEST_PEND:
- MCP comment: Tells the leg block that we have a coherent
request pending 0 = NO 1 = YES
- RW
0x1 SM2DEV_FPCI_TIMEOUT_EN:
- FPCI timeout enable bit for Controller

