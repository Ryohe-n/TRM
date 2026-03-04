# 1 = Enable firewall checks for read accesses through the firewall. 0 = Disable firewall checks for read accesses through the firewall. 0 = DISABLE 1 = ENABLE 5:0 0x0 OWNER:

- Master with MSTRID=OWNER can update the ARF registers, as long as the
ARF_LCK bit is not set. No other Master is allowed to update the settings.
- Reset value of 0x0 allows Masters which can drive AWPROT[1]=0 to update
the ARF registers.
- RCE_FIREWALL_ARF_31_SIZE_0
- Offset: 0x303f4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,00xx)

- RCE Fabric Registers
- Bit
- Reset
- Description

