# 31 :0 0x0 CRCNVLDHI:

- Ingress INPKTS_CRC_NOTVALID Counter, Upper 32-bits
- MACSEC_CONTROL0_0
- MACSEC Control Register 0
- Offset: 0xd000
- Read/Write: R/W
- Parity Protection: N

- MACsec Registers
- Shadow: N
- SCR Protection: 0
- Reset: 0x00500000 (0bxxxx,xxx0,0101,0xx0,xxxx,xxxx,xxxx,0xx0)
- Bit
- Reset
- Description
0x0 TX_LKP_MISS_NON_SECURE_INTR:
- When TX look up miss event occurs, hw will assert secure/non-secure
intr based on this bit. Reset_Domain: Secure_Reset. 0 = SECURE_INTR 1 = NON_SECURE_INTR 0x0 RX_LKP_MISS_NON_SECURE_INTR:
- When RX look up miss event occurs, hw will assert secure/non-secure
intr based on this bit. Reset_Domain: Secure_Reset. 0 = SECURE_INTR 1 = NON_SECURE_INTR 22:21 0x2 VALIDATE_FRAMES:
- MACSEC Receive Frame Validate control
Reset_Domain: Secure_Reset. 0 = DISABLED :ICV check is disabled. SecTag and ICV fields are removed from the frame before forwarding it to the next module 1 = CHECK :ICV check is done. And the InPktsInValid counter is updated based on ICV check result. 2 = STRICT :ICV check is done. If ICV check fails, the frame is dropped (CRC of the frame is corrupted) and InPktsNotValid counter is updated. 0x1 RX_REPLAY_PROT_EN:
- MACSEC Receive Frame Replay Protection enable control
Reset_Domain: Secure_Reset. 0 = DISABLE :Disable Replay Protection 1 = ENABLE :Enable Replay Protection 0x0 RX_LOOKUP_MISS:
- MACSEC Receive: Select an action for Bypass LookUP tables miss (No
matching entry found in the Bypass LUT). This bit is applicable only for
- Bypass LuT and not SC index LuT
Reset_Domain: Secure_Reset. 0 = DROP :Corrupt the packet on bypass tables lookup miss 1 = BYPASS :Bypass the packet on bypass tables lookup miss 0x0 RX_ENB:
- MACSEC Receive Controller enable bit. Bypasses the MACSEC RX
controller Reset_Domain: Secure_Reset. 0 = DISABLE :Bypasses MACSEC Receive Controller 1 = ENABLE :Enables MACSEC Receive Controller 0x0 TX_LOOKUP_MISS:
- MACSEC Transmit: Select an action for LookUP tables miss (No
matching entry found in both Bypass and SC-Index LUTs). Reset_Domain: Secure_Reset. 0 = DROP :Corrupt the packet on tables lookup miss 1 = BYPASS :Bypass the packet on tables lookup miss

- MACsec Registers
- Bit
- Reset
- Description
0x0 TX_ENB:
- MACSEC Transmit Controller enable bit. Bypasses the MACSEC TX
controller Reset_Domain: Secure_Reset. 0 = DISABLE :Disables MACSEC Transmit Controller 1 = ENABLE :Enables MACSEC Transmit Controller
- MACSEC_LUT_CONFIG_0
- Indirect Addressing access: Register controls for programming the LookUP tables
- Offset: 0xd004
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0xxx,xx00,xxxx,x000,xxxx,xxxx,xxx0,0000)
- Bit
- Reset
- Description
0x0 UPDATE:
- LookUP Table Configuration Update control
- SW has to trigger by writing Logic 1 to the UPDATE field after
programming DATA and other config fields.
- Poll for the value to become Logic0 to ensure the operation is
complete. 0 = DONE :Update operation is done or No update operation is initiated 1 = START :Start the Update operation 0x0 CTLR_SEL:
- MACSEC Controller selection (Transmit or Receiver)

