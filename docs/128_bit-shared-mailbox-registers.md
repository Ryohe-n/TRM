# 128 -bit Shared Mailbox Registers

##### 9.7.4.2.9 HSP_SHRD_MBOX_MBOX_{sm}_SHRD_MBOX_TYPE1_TAG
Offset: 0x40 + (sm * 0x8000) | Read/Write: R/W | Parity Protection: N | SCR Protection: SM_{sm} _REG_0 | Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- HSP Registers
- Bits
- Reset
- Description
- TAG: The bit acts as a Valid bit for the 128-bit mailbox. The mailbox is deemed
full when TAG = 1b and empty when TAG = 0b, with the status also reflected in corresponding interrupts. The producer writes TAG to 1b to signal the availability of a message, the consumer write TAG to 0b to signal that the message has been fully handled.
##### 9.7.4.2.10 HSP_SHRD_MBOX_MBOX_{sm}_SHRD_MBOX_TYPE1_DATA0
Offset: 0x48 + (sm * 0x8000) | Read/Write: R/W | Parity Protection: N | SCR Protection: SM_{sm} _REG_0 | Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bits
- Reset
- Description

