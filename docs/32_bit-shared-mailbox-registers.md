# 32 -bit Shared Mailbox Registers

##### 9.7.4.2.6 HSP_SHRD_MBOX_MBOX_{sm}_SHRD_MBOX_0
Software-controlled mailbox registers. There are eight shared mailbox registers, where {sm} = 0 through 7. Offset: 0x0 + (sm * 0x8000) | Read/Write: R/W | SCR Protection: SM_{sm}_REG_0 | Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
- TAG: This bit acts as a Valid bit for the mailbox. The mailbox is deemed full
when TAG = 1b and empty when TAG = 0b, with the status also reflected in corresponding interrupts. The producer writes TAG to 1b to signal the availability of a message; the consumer writes TAG to 0b to signal that the message has been fully handled. 30:0
- DATA: Value exchanged between producer and consumer. No hardware
semantic.
##### 9.7.4.2.7 HSP_SHRD_MBOX_MBOX_{sm}_SHRD_MBOX_FULL_INT_IE_0
Offset: 0x4 + (sm * 0x8000) | Read/Write: R/W | Parity Protection: N | SCR Protection: SM_{sm} _REG_0 | Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
0x1
- ENABLE: Mailbox full interrupt enable
##### 9.7.4.2.8 HSP_SHRD_MBOX_MBOX_{sm}_SHRD_MBOX_EMPTY_INT_IE_0
Offset: 0x8 + (sm * 0x8000) | Read/Write: R/W | Parity Protection: N | SCR Protection: SM_{sm} _REG_0 | Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
0x1
- ENABLE: Mailbox empty interrupt enable

