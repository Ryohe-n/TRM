# 19 :16 X nSI: Number of shared interrupts in this instance 15:12 X nDB: Number of doorbells in this instance 11:8 X nAS: Number of arbitrated semaphores in this instance 7:4 X nSS: Number of shared semaphores in this instance 3:0 X nSM: Number of shared mailboxes in this instance

- Shared Mailbox Registers
Shared mailboxes are placed 32 KiB apart, so that a pair is mapped in a 64 KiB page. The base for a given mailbox is SM{sm}BASE{sm} = HSP{inst}_BASE + 64 KiB + {sm} * 32 KiB.
- Note: Offset mentioned below is from SM{0}_BASE

- HSP Registers

