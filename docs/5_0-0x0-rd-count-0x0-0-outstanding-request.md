# 5 :0 0x0 RD_COUNT: 0x0 = 0 outstanding request 0x1 = 1 outstanding request 0x2 = 2 outstanding requests ... 0x3F = 127 outstanding requests

- RCE_MN_CPU_P_I_MASK_ERR_RESP_0
This register can be used to mask error responses to the initiating master. For Virtualization scenarios, this register allows to hide the error response from a Guest OS which, for ex, may have made an access to a resource not owned by it. Hyperviser uses the interrupt reporting due to this error and handle the error, for ex, by resetting the Guest OS.
- Offset: 0x12004
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 ERD: 0 : Error Responses flow as is and are not masked 1 : Error Responses are masked as OKAY Responses 0 = DISABLE 1 = ENABLE
- RCE_MN_CPU_P_I_MST_TIMEOUT_CFG_0
This register is used to configure the Master Timeout. Master timeout starts on arrival of ARVALID/AWVALID and is implemented per transaction through the master node. Timeout for each transaction is made up of {Prescaler, Common Counter}. Master timeout detects transactions lost in the fabric and cases where the Master does not send complete requests or does not accept response.
- Offset: 0x12100
- Read/Write: R/W
- Parity Protection: N

- RCE Fabric Registers
- Shadow: N
- SCR Protection: 0
- Reset: 0x80f0ffff (0b1xxx,xxxx,1111,xxxx,1111,1111,1111,1111)
- Bit
- Reset
- Description
0x1 EN: 0 : Disable Timeout 1 : Enable Timeout 0 = DISABLE 1 = ENABLE 23:20 0xf PRESCALER: Each Outstanding access has an independent Prescaler for timeout.
- This register decides the value of prescaler

