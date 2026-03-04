# 11 :0 0xfff COMMON_COUNTER:

- Rollover value of the Common Counter
- Complete timeout value = Prescaler Value x Common Counter Value
- Default Value = 16 x 4096 us = 65.536 msec to 61.440 msec
- RCE_SN_CPU_T_SLV_TIMEOUT_STATUS_0_0
This register indicates the timeout status in a slavenode.
- This bit is set immediately on a timeout of any access
As long as this bit is set, the slavenode will immediately send error response to an access. SW must write 1 to clear the value of this bit AFTER resetting the slave attached to this slavenode. Once cleared, the slavenode starts sending the accesses to the attached slave again.
- Offset: 0x18008
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 TMO: 0 = No timeout 1 = Access Timedout

- RCE Fabric Registers
- RCE_EN_CFG_INTERRUPT_ENABLE_0_0
This register contains Enable Bits per error maintained in the corresponding STATUS register. When a bit in STATUS register is set and its corresponding bit in this register is set, an interrupt is asserted from the Error Notifier block.
- Offset: 0x19000
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000)
- Bit
- Reset
- Description
0x0 ERR_EN_3: 1:Enable interrupt notification for XCE Master Node DMA_P_I Error 0:Disable interrupt notification for XCE Master Node DMA_P_I Error 0 = DISABLE 1 = ENABLE 0x0 ERR_EN_2: 1:Enable interrupt notification for XCE Master Node DMA_M_I Error 0:Disable interrupt notification for XCE Master Node DMA_M_I Error 0 = DISABLE 1 = ENABLE 0x0 ERR_EN_1: 1:Enable interrupt notification for XCE Master Node CPU_P_I Error 0:Disable interrupt notification for XCE Master Node CPU_P_I Error 0 = DISABLE 1 = ENABLE 0x0 ERR_EN_0: 1:Enable interrupt notification for XCE Master Node CPU_M_I Error 0:Disable interrupt notification for XCE Master Node CPU_M_I Error 0 = DISABLE 1 = ENABLE
- RCE_EN_CFG_FORCE_0_0
This register indicates the timeout status in a slavenode.
- This bit is set immediately on a timeout of any access
As long as this bit is set, the slavenode will immediately send error response to an access. SW must write 1 to clear the value of this bit AFTER resetting the slave attached to this slavenode. Once cleared, the slavenode starts sending the accesses to the attached slave again.

- RCE Fabric Registers
- Offset: 0x19020
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000)
- Bit
- Reset
- Description
0x0 FORCE_ERR_3: 1:Force assertion of Interrupt for XCE Master Node DMA_P_I when corresponding INTERRUPT_ENABLE bit is set 0:Do not force assertion of Interrupt for XCE Master Node DMA_P_I when corresponding INTERRUPT_ENABLE bit is set 0 = DISABLE_FORCE 1 = ENABLE_FORCE 0x0 FORCE_ERR_2: 1:Force assertion of Interrupt for XCE Master Node DMA_M_I when corresponding INTERRUPT_ENABLE bit is set 0:Do not force assertion of Interrupt for XCE Master Node DMA_M_I when corresponding INTERRUPT_ENABLE bit is set 0 = DISABLE_FORCE 1 = ENABLE_FORCE 0x0 FORCE_ERR_1: 1:Force assertion of Interrupt for XCE Master Node CPU_P_I when corresponding INTERRUPT_ENABLE bit is set 0:Do not force assertion of Interrupt for XCE Master Node CPU_P_I when corresponding INTERRUPT_ENABLE bit is set 0 = DISABLE_FORCE 1 = ENABLE_FORCE 0x0 FORCE_ERR_0: 1:Force assertion of Interrupt for XCE Master Node CPU_M_I when corresponding INTERRUPT_ENABLE bit is set 0:Do not force assertion of Interrupt for XCE Master Node CPU_M_I when corresponding INTERRUPT_ENABLE bit is set 0 = DISABLE_FORCE 1 = ENABLE_FORCE
- RCE_EN_CFG_STATUS_0_0
This register logs the raw status of the error from each Error Monitor block. Each Error Monitor detects inband errors in the response path of a XCE_master_node. When the corresponding bit in the INTERRUPT_ENABLE register is set, an interrupt will be asserted from the Error Notifier block.
- Offset: 0x19040
- Read/Write: RO

- RCE Fabric Registers
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000)
- Bit
- Reset
- Description
0x0 ERR_3: 1: XCE Master Node DMA_P_I has detected and logged an inband error in its response path 0: XCE Master Node DMA_P_I did not detect any error in its response path 0 = NO_ERR 1 = ERR 0x0 ERR_2: 1: XCE Master Node DMA_M_I has detected and logged an inband error in its response path 0: XCE Master Node DMA_M_I did not detect any error in its response path 0 = NO_ERR 1 = ERR 0x0 ERR_1: 1: XCE Master Node CPU_P_I has detected and logged an inband error in its response path 0: XCE Master Node CPU_P_I did not detect any error in its response path 0 = NO_ERR 1 = ERR 0x0 ERR_0: 1: XCE Master Node CPU_M_I has detected and logged an inband error in its response path 0: XCE Master Node CPU_M_I did not detect any error in its response path 0 = NO_ERR 1 = ERR
- RCE_EN_CFG_ADDR_INDEX_0_0
This register allows to index into the Address of the Error Monitor block. Writing 1 to a bit in this register will update ADDR_HI and ADDR_LOW register with the address from where additional error attributes can be triaged.
- Offset: 0x19060
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000)

- RCE Fabric Registers
- Bit
- Reset
- Description
0x0 ERR_3: 1:Update ADDR_HI and ADDR_LOW register with the address of the XCE Error Monitor for further traige. 0:Do Nothing 0 = NULL 1 = UPDATE_ADDR 0x0 ERR_2: 1:Update ADDR_HI and ADDR_LOW register with the address of the XCE Error Monitor for further traige. 0:Do Nothing 0 = NULL 1 = UPDATE_ADDR 0x0 ERR_1: 1:Update ADDR_HI and ADDR_LOW register with the address of the XCE Error Monitor for further traige. 0:Do Nothing 0 = NULL 1 = UPDATE_ADDR 0x0 ERR_0: 1:Update ADDR_HI and ADDR_LOW register with the address of the XCE Error Monitor for further traige. 0:Do Nothing 0 = NULL 1 = UPDATE_ADDR
- RCE_EN_CFG_ADDR_LOW_0
- Offset: 0x19080
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xXXXXXXXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description

