# 15 :0 0xffff COMMON_COUNTER:

- Rollover value of the Common Counter
- Complete timeout value = Prescaler Value x Common Counter Value
- Default Value = 16 x 65536 us = 1048 msec to 983 ms

- RCE Fabric Registers
- RCE_MN_DMA_P_I_ERR_EN_0
This register allows SW to enable Error Logging and Reporting per Error Type. Default value enables Error Logging and Reporting for each error type. If this bit is cleared then accesses with the corresponding error are ignored by the Error Monitor In general this register should not be updated by SW. The case where enabling/disabling is needed could be only for SW/Validation.
- Offset: 0x14200
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0000003f (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx11,1111)
- Bit
- Reset
- Description
0x1 EN_UNSUPPORTED_ERR: 1: Enable Error Reporting and Logging for Unsupported Access Error. 0: Disable Error Reporting and Logging for Unsupported Access Error. 0 = DISABLE 1 = ENABLE 0x1 EN_PWRDOWN_ERR: 1: Enable Error Reporting and Logging for PowerDown Error. 0: Disable Error Reporting and Logging for PowerDown Error. 0 = DISABLE 1 = ENABLE 0x1 EN_TIMEOUT_ERR: 1: Enable Error Reporting and Logging for Timeout Error. 0: Disable Error Reporting and Logging for Timeout Error. 0 = DISABLE 1 = ENABLE 0x1 EN_FIREWALL_ERR: 1: Enable Error Reporting and Logging for Firewall Error. 0: Disable Error Reporting and Logging for Firewall Error. 0 = DISABLE 1 = ENABLE 0x1 EN_DECODE_ERR: 1: Enable Error Reporting and Logging for Decode Error. 0: Disable Error Reporting and Logging for Decode Error. 0 = DISABLE 1 = ENABLE

- RCE Fabric Registers
- Bit
- Reset
- Description
0x1 EN_SLAVE_ERR: 1: Enable Error Reporting and Logging for Slave Error. 0: Disable Error Reporting and Logging for Slave Error. 0 = DISABLE 1 = ENABLE
- RCE_MN_DMA_P_I_ERR_FORCE_0
This register allows SW to Force Error Reporting per Error Type. When this error is set, then default bus values are used to populate the LOG_* registers (as there is no actual error access). This register can be used for SW development and also for ensuring that the reporting path from the Error Monitor to Error Notifier has not developed a permanent stuck at 0 fault.
- Offset: 0x14204
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 FORCE_UNSUPPORTED_ERR: 1:Force Error Reporting for Unsupported Access Error. 0:Do not Force Error Reporting for Unsupported Access Error. 0 = DISABLE_FORCE 1 = ENABLE_FORCE 0x0 FORCE_PWRDOWN_ERR: 1:Force Error Reporting for PowerDown Error. 0:Do not Force Error Reporting for PowerDown Error. 0 = DISABLE_FORCE 1 = ENABLE_FORCE 0x0 FORCE_TIMEOUT_ERR: 1:Force Error Reporting for Timeout Error. 0:Do not Force Error Reporting for Timeout Error. 0 = DISABLE_FORCE 1 = ENABLE_FORCE 0x0 FORCE_FIREWALL_ERR: 1:Force Error Reporting for Firewall Error. 0:Do not Force Error Reporting for Firewall Error. 0 = DISABLE_FORCE 1 = ENABLE_FORCE

- RCE Fabric Registers
- Bit
- Reset
- Description
0x0 FORCE_DECODE_ERR: 1:Force Error Reporting for Decode Error. 0:Do not Force Error Reporting for Decode Error 0 = DISABLE_FORCE 1 = ENABLE_FORCE 0x0 FORCE_SLAVE_ERR: 1:Force Error Reporting for Slave Error. 0:Do not Force Error Reporting for Slave Error. 0 = DISABLE_FORCE 1 = ENABLE_FORCE
- RCE_MN_DMA_P_I_ERR_STATUS_0
Stores the cumulative Error Status until SW clears the register. Subsequent Error Accesses will set additional error bits in this register, or overwrite the previous ones. For ex, if response 1 returns slave error, SLAVE_ERR will get set; response 2 returns decode error, DECODE_ERR will get set; response 3 returns firewall error, FIREWALL_ERR will get set. Responses 1, 2, 3 can be responses of multiple accesses, or responses of a mutibeat access. All fields of this registers are Write 1 to clear. SW should clear all bits of this register in a single write. Clearing this register will also clear the ERR_OVERFLOW_STATUS and LOG_ERR_STATUS register (if Error Logger is present).
- Offset: 0x14208
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 UNSUPPORTED_ERR:
- Unsupported Access Error. Attempt to access a slave through an
unsupported access. Error returned by Slave Node 0x0 PWRDOWN_ERR:
- PowerDown Error. Attempt to access a portion of the fabric that is powered
down. Error returned by a power disconnect block 0x0 TIMEOUT_ERR:
- Timeout Error. No response returned by slave. Can be due to slave being
clock gated, under reset, powered down or slave inability to respond for an internal slave issue.
- Error returned by Slave Node

- RCE Fabric Registers
- Bit
- Reset
- Description
0x0 FIREWALL_ERR:
- Firewall Error. Attempt to access a region which is firewalled using Address
- Range Firewall or Block Level Firewall. Error returned from Firewall Block and
Slave Node. 0x0 DECODE_ERR:
- Decode Error. Attempt to access an address hole or Reserved region of
memory. Error returned from fabric decoders or AXI Slave 0x0 SLAVE_ERR:
- Slave Error. Slave being accessed responded with an error. Further accesses
to the Unit may be needed for complete triage)
- Slave could return an error for various cases : Unsupported access, clamp
setting when power gated, register level firewall(SCR), address hole within the slave, etc
- RCE_MN_DMA_P_I_ERR_OVERFLOW_STATUS_0
Bits in this register get updated if the corresponding bit in ERR_STATUS is already set. This indicates that a pluratiy of an error type occured before SW got a chance to clear the corresponding bit in ERR_STATUS register For ex, if response 1 returns slave error, SLAVE_ERR will get set in ERR_STATUS; response 2 returns slave error again, then the OVERFLOW_SLAVE_ERR bit in this register will also get set. Responses 1, 2 can be responses of multiple accesses, or responses of a mutibeat access. Bits of this register get cleared when the corresponding bit in ERR_STATUS register is cleared.
- Offset: 0x1420c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 OVERFLOW_UNSUPPORTED_ERR:
- Unsupported Access Error Overflow. Attempt to access a slave through an
unsupported access. Error returned by Slave Node 0x0 OVERFLOW_PWRDOWN_ERR:
- PowerDown Error Overflow. Attempt to access a portion of the fabric that is
powered down. Error returned by a power disconnect block 0x0 OVERFLOW_TIMEOUT_ERR:
- Timeout Error. No response returned by slave. Can be due to slave being
clock gated, under reset, powered down or slave inability to respond for an internal slave issue
- Error returned by Slave Node

- RCE Fabric Registers
- Bit
- Reset
- Description
0x0 OVERFLOW_FIREWALL_ERR:
- Firewall Error Overflow. Attempt to access a region which is firewalled using
Address Range Firewall or Block Level Firewall. Error returned from Firewall Block and Slave Node. 0x0 OVERFLOW_DECODE_ERR:
- Decode Error Overflow. Attempt to access an address hole or Reserved
region of memory. Error returned from fabric decoders or AXI Slave 0x0 OVERFLOW_SLAVE_ERR:
- Slave Error Overflow. Slave being accessed responded with an error. Further
accesses to the Unit may be needed for complete triage)
- Slave could return an error for various cases : Unsupported access, clamp
setting when power gated, register level firewall(SCR), address hole within the slave, etc
- RCE_MN_DMA_P_I_LOG_ERR_STATUS_0
This 1-hot register stores the first error sampled by the error monitor and gets cleared when the corresponding bit in ERR_STATUS register is cleared This register exists only when Error Monitor is built with the Error Logger. Write accesses to this register return error.
- Offset: 0x14300
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x000000XX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description
X UNSUPPORTED_ERR:
- Unsupported Access Error. Attempt to access a slave through an
unsupported access. Error returned by Slave Node X PWRDOWN_ERR:
- PowerDown Error. Attempt to access a portion of the fabric that is powered
down. Error returned by a power disconnect block X TIMEOUT_ERR:
- Timeout Error. No response returned by slave. Can be due to slave being
clock gated, under reset, powered down or slave inability to respond for an internal slave issue.
- Error returned by Slave Node
X FIREWALL_ERR:
- Firewall Error. Attempt to access a region which is firewalled using Address
- Range Firewall or Block Level Firewall. Error returned from Firewall Block and
Slave Node.

- RCE Fabric Registers
- Bit
- Reset
- Description
X DECODE_ERR:
- Decode Error. Attempt to access an address hole or Reserved region of
memory. Error returned from fabric decoders or AXI Slave X SLAVE_ERR:
- Slave Error. Slave being accessed responded with an error. Further accesses
to the Unit may be needed for complete triage)
- Slave could return an error for various cases : Unsupported access, clamp
setting when power gated, register level firewall(SCR), address hole within the slave, etc
- RCE_MN_DMA_P_I_LOG_ADDR_LOW_0
This register stores the lower 32 bit of the Address for the access which returned the error This register exists only when Error Monitor is built with the Error Logger. Write accesses to this register return error.
- Offset: 0x14304
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xXXXXXXXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description

