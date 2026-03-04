# 12 :8 0x0 PM_SLAVE_STATE: DEBUG STATUS : Power management slave FSM state. 7:3 0x0 PM_MASTER_STATE: DEBUG STATUS : Power management master FSM state. 2:0 0x0 PM_L1SUB_STATE: DEBUG STATUS : Power management L1 sub-states FSM state.

- PCIE_RP_PERFMUX_CONTROL_0
- Offset: 0x174
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0xxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000,0000)

- PCIe Root Port
- Bit
- Reset
- Description
0x0 PM_EN: 0 = OFF 1 = ON 7:0 0x0 PM_SEL: 0 = READ_CLIENTS 1 = WRITE_CLIENTS 2 = READ_WRITE_CLIENTS 3 = STATIC_PATTERN_1 4 = STATIC_PATTERN_2
- PCIE_RP_PERFMUX_TRIGGER_0
- Offset: 0x178
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 PM_STOP:
- STOP engine trigger
0x0 PM_START:
- START engine trigger
- PCIE_RP_APPL_FAULT_EN_L1_19_0
- Offset: 0x17c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 CFG_SAFETY_CORR_STATE_FAULT_EN:
- Enable for fault generation for the corresponding bit in
APPL_INTR_STATUS_L1_19.
- PCIE_RP_APPL_INTR_EN_L1_19_0

- PCIe Root Port
- Offset: 0x180
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 CFG_SAFETY_CORR_STATE_INT_EN:
- Enable for interrupt generation for the corresponding bit in
APPL_INTR_STATUS_L1_19.
- PCIE_RP_APPL_INTR_STATUS_L1_19_0
- Offset: 0x184
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 CFG_SAFETY_CORR_STATE:
- Status bit to indicate that there is an Error in safety correctable error
status.
- PCIE_RP_APPL_FAULT_EN_L1_20_0
- Offset: 0x188
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 IF_TIMEOUT_STATUS_FAULT_EN:
- Enable for interrupt generation for the corresponding bit in
APPL_INTR_STATUS_L1_20. 0x0 CFG_SAFETY_UNCORR_STATE_FAULT_EN:
- Enable for fault generation for the corresponding bit in
APPL_INTR_STATUS_L1_20.

- PCIe Root Port
- PCIE_RP_APPL_INTR_EN_L1_20_0
- Offset: 0x18c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 IF_TIMEOUT_STATUS_INT_EN:
- Enable for interrupt generation for the corresponding bit in
APPL_INTR_STATUS_L1_20. 0x0 CFG_SAFETY_UNCORR_STATE_INT_EN:
- Enable for interrupt generation for the corresponding bit in
APPL_INTR_STATUS_L1_20.
- PCIE_RP_APPL_INTR_STATUS_L1_20_0
- Offset: 0x190
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 IF_TIMEOUT_STATUS:
- Status bit to indicate that there is an Error and one of the interfaces has
timed out. 0x0 CFG_SAFETY_UNCORR_STATE:
- Status bit to indicate that there is an Error in Safety uncorrectable
status. === PCIE Secure Page Protected by CBB BLF ===
- PCIE_RP_SEC_AXI_PROT_0
- Base offset in APB device space (Separate 64kB page for SCR registers)

- PCIe Root Port
- Offset: 0x10000
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000011 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1,xxx1)
- Bit
- Reset
- Description
0x1 CFG_SECURE_AWPROT:
- This register bit drives axi_awprot[1] and wsb_ns on databackbone
interface. 0=Secure access 1=Non-secure access 0 = SECURE 1 = NONSECURE 0x1 CFG_SECURE_ARPROT:
- This register bit drives axi_arprot[1] and rsb_ns on databackbone
interface. 0=Secure access 1=Non-secure access 0 = SECURE 1 = NONSECURE
- PCIE_RP_SEC_SRIOV_CTRL_0
- PCIE Secure Register for NON MSI REQUSET ID to STREAM ID Mapping register
- Offset: 0x10004
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000240 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xx10,x100,0000)
- Bit
- Reset
- Description
0x1 MSI_USE_NONZERO_AWID:
- If set to 1, MSI request use 0x1 as AWID while other Posted requests use
0x0. Disabling this bit will have performance implications. 0x0 WAIT_MSI_RESP:
- If set to 1, Response tracker would wait for MSI response from DBB before
forwarding it to PCIe Core. Enabling this bit will have performance implications. 6:3 0x8 NUM_MSI_OUTSTANG_AXI: Number of MSI outstanding on AXI - Use cases are 8 and 1.

- PCIe Root Port
- Bit
- Reset
- Description
0x0 STRICT_P_ORDERING: Enable Strict Posted ordering on AXI. Default disabled. 0-> MSI only wait for all Posted Writes issued before MSI. 1-> MSI request wait for proceeding MSI responses. 0x0 MSI_REQID_2_STREAM_ID_ENABLE: Enable MSI Requester ID to Stream ID mapping, default disabled.
- When enabled Stream ID is mapped to MSI_STREAM_ID_TARGET[i] if the
received requester ID matches with the MSI_SOURCE_REQUESTER_ID<i> . 0x0 REQID_2_STREAM_ID_ENABLE:
- Enable Non-MSI Requester ID to Stream ID mapping, default disabled. It is
applicable for both Reads and Non MSI Writes.
- When enabled Stream ID is mapped to STREAM_ID_TARGET<i> if the
received requester ID matches with the SOURCE_REQUESTER_ID<i> .
- PCIE_RP_SEC_SOURCE_REQUESTER_ID_0
- PCIE Secure Register : REQUSETER ID to STREAM ID Mapping register (For Non MSI write and
- Read)
This is an array of 15 identical register entries; the register fields below apply to each entry. Full register list is: PCIE_RP_SEC_SOURCE_REQUESTER_ID_<i>, among which <i> belongs to {0, 1, 2, ... , 14}.
- Offset: 0x10008,..,0x10040
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

