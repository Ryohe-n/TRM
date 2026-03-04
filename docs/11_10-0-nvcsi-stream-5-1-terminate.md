# 11 :10 0: NVCSI stream 5 1: TERMINATE

- Host1x Injection Path
To support validation of VI, it may be valuable to run a software-defined test pattern generator. CSIMUX enables this with the addition of an 'injection' path from Host1x, in which software can synthesize CSI-to-VI packets and inject them into VI as if they came directly from a CSI stream. Such packets are injected as close to the top of the VI pipeline as possible, allowing even de- interleaver logic to be tested. The injected packet source corresponding CSI[AB|CD|EF| GH]_SECURE_ENABLE as VPR flag. The injection pathway is designed to be able to synthesize any logical pattern of CSI packets down any sequence of streams, which can be used to test functionality that current sensors are unable to produce. The injection pathway can also synthesize error cases, enabling the validation of both software and hardware error handling. The constraint that the Host1x interface presents is that throughput through this interface is very limited; for that reason, testing timing-driven test cases can be validated only in limited circumstances using the injection path. (Use of the switch, accumulate, and stall options can allow certain small back-to-back sequences to be injected.) The injection interface is a set of staging registers that mirror the CSI-to-VI packet specification, along with an injection trigger register that sends a packet down one or more streams. This register set is specified below.
- Table 7.17 CSIMUX Packet Injection Registers
- Register
- Field
- Bit
s
- Rese
t
- Description
- VI_CSIMUX_INJEC
T_DATA_0
- PPC4_PXL0

