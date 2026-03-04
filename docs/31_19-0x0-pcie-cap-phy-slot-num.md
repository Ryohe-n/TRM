# 31 :19 0x0 PCIE_CAP_PHY_SLOT_NUM:

- Physical Slot Number. This field indicates the physical slot number attached to
this Port. This field must be hardware initialized to a value that assigns a slot number that is unique within the chassis, regardless of the form factor associated with the slot. This field must be initialized to zero for Ports connected to devices that are either integrated on the system board or integrated within the same silicon as the Switch device or Root Port. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R 0x0 PCIE_CAP_NO_CMD_CPL_SUPPORT:
- No Command Completed Support. When set, this bit indicates that this slot
does not generate software notification when an issued command is completed by the Hot-Plug Controller. This bit is only permitted to be set if the hot-plug capable Port is able to accept writes to all fields of the Slot Control register without delay between successive writes. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R 0x0 PCIE_CAP_ELECTROMECH_INTERLOCK:
- Electromechanical Interlock Present. When set, this bit indicates that an
Electromechanical Interlock is implemented on the chassis for this slot. Note:
- The access attributes of this field are as follows: - Wire: No access. - Dbi: if
(DBI_RO_WR_EN == 1) then R/W else R 16:15 0x0 PCIE_CAP_SLOT_POWER_LIMIT_SCALE:
- Slot Power Limit Scale. Specifies the scale used for the Slot Power Limit Value
(for more details, see Section 6.9 of PCI Express Base Specification). This register must be implemented if the Slot Implemented bit is set. Writes to this register also cause the Port to send the Set_Slot_Power_Limit Message. The default value prior to hardware/firmware initialization is 00b. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R 14:7 0x0 PCIE_CAP_SLOT_POWER_LIMIT_VALUE:
- Slot Power Limit Value. In combination with the Slot Power Limit Scale value,
specifies the upper limit on power supplied by the slot (for more detais, see Section 6.9 of PCI Express Base Specification) or by other means to the adapter.
- Power limit (in Watts) is calculated by multiplying the value in this field by the
value in the Slot Power Limit Scale field except when the Slot Power Limit Scale field equals 00b (1.0x) and Slot Power Limit Value exceeds EFh, the alternative encodings defined in Values: are used. Value F3h to FFh are Reserved for Slot
- Power Limit values above 300 W. This register must be implemented if the Slot
- Implemented bit is set. Writes to this register also cause the Port to send the
- Set_Slot_Power_Limit Message. The default value prior to hardware/firmware
initialization is 0000 0000b. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R 0x0 PCIE_CAP_HOT_PLUG_CAPABLE:
- Hot-Plug Capable. When set, this bit indicates that this slot is capable of
supporting hot-plug operations. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R 0x0 PCIE_CAP_HOT_PLUG_SURPRISE:
- Hot-Plug Surprise. When set, this bit indicates that an adapter present in this
slot might be removed from the system without any prior notification. This is a form factor specific capability. This bit is an indication to the operating system to allow for such removal without impacting continued software operation. Note:
- The access attributes of this field are as follows: - Wire: No access. - Dbi: if
(DBI_RO_WR_EN == 1) then R/W else R

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
0x0 PCIE_CAP_POWER_INDICATOR:
- Power Indicator Present. When set, this bit indicates that a Power Indicator is
electrically controlled by the chassis for this slot. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W else R 0x0 PCIE_CAP_ATTENTION_INDICATOR:
- Attention Indicator Present. When set, this bit indicates that an Attention
- Indicator is electrically controlled by the chassis. Note: The access attributes of
this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W else R 0x0 PCIE_CAP_MRL_SENSOR:
- MRL Sensor Present. When set, this bit indicates that an MRL Sensor is
implemented on the chassis for this slot. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R 0x0 PCIE_CAP_POWER_CONTROLLER:
- Power Controller Present. When set, this bit indicates that a software
programmable Power Controller is implemented for this slot/adapter (depending on form factor). Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R 0x0 PCIE_CAP_ATTENTION_INDICATOR_BUTTON:
- Attention Button Present. When set, this bit indicates that an Attention Button
for this slot is electrically controlled by the chassis. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
- PCIE_X<i>_RC_PF0_PCIE_CAP_SLOT_CONTROL_SLOT_STATUS_0
where <i> = 1, 4, 8. Description: This register controls and provides information about PCI Express Slot specific parameters.
- PCIE_X1_RC_PF0_PCIE_CAP_SLOT_CONTROL_SLOT_STATUS_0
- PCIE_X4_RC_PF0_PCIE_CAP_SLOT_CONTROL_SLOT_STATUS_0
- PCIE_X8_RC_PF0_PCIE_CAP_SLOT_CONTROL_SLOT_STATUS_0
- Offset: 0x88
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x004003c0 (0b0000,0000,0100,0000,00x0,0011,1100,0000)

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description

