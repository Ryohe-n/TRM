# 31 :16 0x0 IO_LIMIT_UPPER: I/O Limit Upper 16 Bits. - If the I/O Limit register indicates support for 16-bit I/O address decoding, then this register is implemented as a read-only register which return zero when read. - If the I/O Limit register indicates support for 32- bit I/O addressing, then this register must be initialized by configuration software. - If 32-bit I/O address decoding is supported, this register specifies the upper 16 bits, corresponding to Address[31:16], of the 32-bit limit address, that specify the I/O address range. - See the PCI-to-PCI Bridge Architecture

- Specification for additional details). Note: The access attributes of this field are
as follows: - Wire: No access. - Dbi:
- SEC_STAT_IO_LIMIT_IO_BASE_REG.IO_DECODE ? RW : RO

