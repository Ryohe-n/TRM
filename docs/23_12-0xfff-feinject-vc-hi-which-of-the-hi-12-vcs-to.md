# 23 :12 0xfff FEINJECT_VC_HI: which of the hi 12 VCs to inject FE on, bit 0 to 12 pos is VC number 4 to 16 11:0 0x0 FRAMEIDGEN_HI:

- Insert a sequential frame ID on each incoming frame for HI 12 VCs,
discard CSI frame ID field.
- VI_CSIMUX_CONFIG_FEINJECT_VC_0

- Video Input Registers
When using FEINJECT field of CONFIG_STREAM register, select which subset of VCs to inject an FE on. Injection only occurs if the VC is in frame. The default 0xF is to inject on all four VCs of a stream. Such a field does not exist for deinterleaved case since deinterleaved stream can only have one VC. The purpose of this register is to abort as few frames as possible should a frame require a particular VC need to terminate.
- Offset: 0x1115
- Byte Offset: 0x4454
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00ffffff (0bxxxx,xxxx,1111,1111,1111,1111,1111,1111)
- Bit
- Reset
- Description

