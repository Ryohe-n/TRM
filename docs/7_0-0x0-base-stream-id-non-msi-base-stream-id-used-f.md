# 7 :0 0x0 BASE_STREAM_ID: Non MSI Base Stream ID : Used for both read and write channels.

- It is the default STREAM ID for read and write transactions in case there is
no match for received requester ID.
- PCIE_RP_SEC_MSI_SOURCE_REQUESTER_ID_0
- PCIE Secure Register : MSI REQUSETER ID to STREAM ID Mapping register
This is an array of 15 identical register entries; the register fields below apply to each entry.
- Full register list is: PCIE_RP_SEC_MSI_SOURCE_REQUESTER_ID_<i>, among which <i> belongs to
{0, 1, 2, ... , 14}.
- Offset: 0x10084,..,0x100bc
- Read/Write: R/W
- Parity Protection: N
- Shadow: N

- PCIe Root Port
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

