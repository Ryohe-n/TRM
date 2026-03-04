# 31 :24 0x0 Reserved_31_24: Reserved. 23:0 0x0 ABS: Average Bits per Slot This field contains the average transmitted bits per slot.

- If AV operation is enabled, this field is computed over number of slots,
programmed in the SLC field of MTL_TxQ(#i)_ETS_CONTROL register. The maximum value of this field is 0x6_4000 in 100 Mbps, 0x3E_8000 in 1000
- Mbps and 9C_4000 in 2500 Mbps mode respectively. When the DCB operation
is enabled for Queue, this field is computed over every 10 million bit times slot (4 ms in 2500 Mbps; 10 ms in 1000 Mbps; 100 ms in 100 Mbps). The maximum value is 0x989680.
- EQOS_EQOS_MTL_Q7_MTL_TXQ7_QUANTUM_WEIGHT_0
The Queue 7 idleSlopeCredit, Quantum or Weights register provides the average traffic transmitted in Queue 7.
- Offset: 0xed8
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

