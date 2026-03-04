# 13 :8 0x0 WR_COUNT: 0x0 = 0 outstanding request 0x1 = 1 outstanding request 0x2 = 2 outstanding requests ... 0x3F = 127 outstanding requests 5:0 0x0 RD_COUNT: 0x0 = 0 outstanding request 0x1 = 1 outstanding request 0x2 = 2 outstanding requests ... 0x3F = 127 outstanding requests

- RCE_SN_CPU_T_SLV_TIMEOUT_CFG_0
- This register is used to configure the Slave Timeout
Slave timeout starts on arrival of ARVALID/AWVALID and is implemented per transaction through the slave node.
- Timeout for each transaction is made up of {Prescaler, Common Counter}

- RCE Fabric Registers
Slave timeout detects cases where the Slave does not respond when it is not enabled or (under reset, clock gated, or powered down) or due to a functional bug.
- Offset: 0x18004
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x80f00fff (0b1xxx,xxxx,1111,xxxx,xxxx,1111,1111,1111)
- Bit
- Reset
- Description
0x1 EN: 0 : Disable Timeout 1 : Enable Timeout 0 = DISABLE 1 = ENABLE 23:20 0xf PRESCALER: Each Outstanding access has an independent Prescaler for timeout.
- This register decides the value of prescaler

