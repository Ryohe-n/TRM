# 128 -bit data transfer interface on the system side

- Separate status word returned for each transmitted frame and up to 128-bit status word for
each received frame
- Preamble, SFD, and other control character insertion (in transmit path) and deletion (in
receive path).
- Programmable minimum Inter-Packet Gap (IPG) from 64-bit times to 224-bit times
In 10G operation, frames that do not follow the preamble and SFD patterns described in IEEE 802.3-2008, Clause 46 are dropped.
- Supports DIC (Deficit Idle Count) algorithm to maintain the average IPG gap of 12Bytes
between frames in XGMII mode
- Thirty-two-bit Cyclic Redundancy Check (CRC) generation for transmit frames and checking
for received frames. Programmable support for receive-side CRC stripping. CRC addition or replacement on transmit side controllable on a per-frame basis Padding in transmit side for short (less-than-64 byte long) frames received from application.
- Pad stripping on the receive side for short frames
- Programmable source address inclusion or replacement for Transmit frames
- Programmable frame length, supporting standard, or jumbo (extendable to 16 KB) Ethernet
frames
- Support for jumbo frames up to 9 KB expandable up to 16 KB

10G Ethernet Controller
- Truncation support for oversized frame reception and transmission at fixed thresholds of

