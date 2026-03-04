# 64 KiB Register Base does not contain "VM" due to backward compatibility.


- Host Controller Channel/Syncpt Registers
- The following are the Guest OS1/VM1 registers. ALL Guest OS<2..8>/VM<2:8> specific
registers are present in this section. The VM<x> registers are duplication of VM1 registers logically. Host Controller Channel/Syncpt Registers for Guest OS<x>/VM<x> - 64 KiB.
- HOST1X_THOST_CHANNEL_CH0_DMASTART_0
Host Controller channel-specific registers.
- DMASTART/DMASTART_HI
This register triggers a DMA fetch from the Push Buffer for channel, when the PUT register does not equal to the DMA GET register.
- DMAPUT/DMAPUT_HI
This register triggers a DMA fetch from the Push Buffer for this channel, when the PUT register does not equal to the GET register. This address is relative to the DMASTART base address. Does not support byte writes. All 4-byte data need to be programmed.
- DMAGET/DMAGET_HI
This register tracks the Push Buffer (PB) offset that the DMA engine has read up to. (incremented as entries are loaded from the channels command buffer into the FIFO). This address is relative to the DMASTART base address.
- DMAEND/DMAEND_HI
The boundary of illegal addresses (either end of push buffer or end of physical memory). This is designed to prevent DMA from prefetching illegal addresses. When DMA reaches this address before seeing a RESTART, it stops. This would be a software error condition.
- DMACTRL
DMA control register. DMAGETRST: Reset GET pointer to '0'. Useful for cleaning up crashed channels. DMAGET not updated instantly. It takes four cycles between programming of reset and valid dmaget. DMAGETINIT: Reset GET pointer to the value of DMAPUT when DMAGETRST is asserted. DMASTOP: Stop DMA from fetching on this channel.
- NOTE: a Command DMA channel needs to be enabled for PIO-gather to work!
- CMDFIFOSTAT
CMDFIFO_NUMEMPTY is the number of free slots available in the per-channel command FIFO. CMDFIFO_EMPTY indicates whether the command FIFO is empty or not. CMDFIFO_GATHER indicates whether GATHER is active.
- When a GATHER command issued via PIO, software must wait for the GATHER to be IDLE before

- Host Controller Channel/Syncpt Registers
issuing another command. (needed for PIO or polling for completion of a wait).
- CMDFIFODATA
Command buffer debug read. Reads the bottom of the command FIFO for all channels, including the register FIFO. Also display the current class and offset for a particular channel.
- CHANNELSTAT
Channel/ CMD Procesor Status. CHOUT_OFFSET: current or blocked offset of Channel/CMD Processor.
- CHOUT_CLASS: current or blocked class of Channel/CMD Processor
ILLEGAL_OPCODE: illegal Opcode Error. CTXSW_PENDING: current or blocked channel context acknowledgement pending. ILLEGAL_CLASS: illegal Class-ID Error. 1. 2. When there is unknown class-ID during Set Class Command. When there is unknown class-ID during Acquire Mlock Command. ILLEGAL_MLOCK: this indicates multiple error scenarios for MLOCK feature: 1. 2. 3. When Acquire-Mlock is followed by Set Class Command or not. When Acquire-Mlock is using same class ID used by Set Class command or not. When in MLOCK phase multiple Acquire-Mlock is encountered before 1st Release-Mlock. ILLEGAL STREAMID: This indicates illegal usage of StreamID on context of Virtualization. 1.
- When Channel Guest OS owner and StreamID value Guest OS owner is different, it indicates
that Guest OS owner of Channel is trying to do malicious Data copy from other Guest OS allocated SMMU StreamID/memory range. ILLEGAL_MLOCK_BUSY_TIMEOUT: illegal Mlock Busy Time-out.
- CHANNELCTRL
This register is used for controlling some channel related commands. CMDPROC_STOP: Stops issuing commands from the command FIFO. TEARDOWN: Reset command FIFO and release any locks it has in the arbiter.
- SYNCPT_PAYLOAD
This register holds Sync Point Base Payload value written via Class Writes.
- CMDPP ILLEGAL ACCESS INTR
Holds the Interrupt status for host CMD Pre-Processor Interrupts. The status is sticky and is PENDING until cleared (write 1 to INTSTATUS to clear). This can be used to generate Interrupt for below items. 1. 2.
- Illegal Opcode
- Illegal Class-ID

- Host Controller Channel/Syncpt Registers
3. 4. 5.
- Illegal MLOCK
- Illegal StreamID
- Illegal Time-Out/MLOCK Starvation
- CMDPP ILLEGAL ACCESS INTRMASK
Holds the Interrupt mask bits for host CDM Pre-Processor Interrupts. When the INTRMASK is ENABLED, the INT bit from INTRSTATUS contributes to the global Interrupt signal.
- SMMU STREAMID
Holds SMMU Context StreamID value to be used for Virtual to Physical Address Translation.
- MLOCK BUSY TIMEOUT COUNTER
Mlock Busy Time-out Counter is by default disabled. Program Non-Zero value (no 0xffff_ffff) to enable starvation time-out counter. This counter indicates how long channel can wait before generating a starvation Interrupt.
- TZ-PROTECTED
Channel RSB_NS Register. This register converts a SMMU RSB-NS bit to RSB-Secure. It is by default TrustZone protected, only TrustZone CPU can write and read it. By default this register value is all "1," i.e. RSB-Nonsecure. To convert a channel RSB-SECURED, write "0" to channel[N] register bit.
- CHANNEL_SPARE
- Channel Spare Register
- Offset: 0x40000
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,00xx)
- Bit
- Reset
- Description

