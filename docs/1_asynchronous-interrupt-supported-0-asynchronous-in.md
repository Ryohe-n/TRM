# 1 Asynchronous Interrupt Supported 0 Asynchronous Interrupt Not Supported

- SYSTEM_BUS_64BIT_SUPPORT - 64-bit System Bus Support for V3
- Meaning of this bit is different depends on Versions
Host Controller Version 3.00 and Ver4.10 use this bit as 64-bit System Address support for V3 mode. Host Controller Version 4.00 uses this bit as 64-bit System Address support for both V3 and V4 modes. SDMA cannot be used in 64-bit Addressing in Version 3 mode. If this bit is set to 1, 64-bit ADMA2 with using 96-bit Descriptor may be enabled as follows: In case of Host Controller Version 3, 64-bit ADMA2 is enabled by DMA Select =11b in the Host Control 1 register. In case of Host Controller Version 4, 64-bit ADMA2 for Version 3 is enabled by setting Host Version 4 Enable =0 and DMA Select = 11b. 1 64-bit System Address for V3 is Supported 0 64-bit System Address for V3 is not Supported
- SYSTEM_BUS_64BIT_SUPPORT_V4 - 64-bit System Bus Support for V4
- This bit is added from Version 4.10. Setting 1 to this bit indicates that the
- Host Controller supports 64-bit System Addressing of Version 4 mode
- When this bit is set to 1, full or a part of 64-bit address should be used to
decode Host Controller Registers so that Host Controller Registers can be placed above system memory area. 64-bit address decode of Host Controller Registers is effective regardless of setting to 64bit Addressing in Host Control 2. If this bit is set to 1, 64-bit DMA Addressing for Version 4 is enabled by setting Host Version 4
- Enable =1,

