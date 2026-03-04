# 31 :30 0x0 Reserved_31_30: Reserved. 29:25 0x0 ATSNS:

- Number of Auxiliary Timestamp Snapshots. This field indicates the number of
- Snapshots available in the FIFO. A value equal to the selected depth of FIFO (4, 8,
or 16) indicates that the Auxiliary Snapshot FIFO is full. These bits are cleared (to 00000) when the Auxiliary snapshot FIFO clear bit is set. This bit is valid only if the Add IEEE 1588 Auxiliary Snapshot option is selected. 0x0 ATSSTM:
- Auxiliary Timestamp Snapshot Trigger Missed. This bit is set when the Auxiliary
timestamp snapshot FIFO is full and external trigger was set. This indicates that the latest snapshot is not stored in the FIFO. This bit is valid only if the Add IEEE 1588 Auxiliary Snapshot option is selected. 23:20 0x0 Reserved_23_20: Reserved. 19:16 0x0 ATSSTN:
- Auxiliary Timestamp Snapshot Trigger Identifier. These bits identify the Auxiliary
trigger inputs for which the timestamp available in the Auxiliary Snapshot register is applicable. When more than one bit is set at the same time, it means that corresponding auxiliary triggers are sampled at the same clock. These bits are applicable only if the number of Auxiliary snapshots is more than one. One bit is assigned for each trigger as shown in the following list: - Bit 16: Auxiliary trigger 0 - Bit 17: Auxiliary trigger 1 - Bit 18: Auxiliary trigger 2 - Bit 19: Auxiliary trigger 3 The software can read this register to find the triggers that are set when the timestamp is taken. 0x0 TXTSC:
- Tx Timestamp Captured. When set, this bit indicates that a timestamp of the
current packet being transmitted by the MAC is available in
- MAC_TxTimestamp_Status_Seconds and
- MAC_TxTimestamp_Status_Nanoseconds registers. This bit is cleared on reading
(byte 3 or byte 0 in little or big endian mode respectively) the
- MAC_TxTimestamp_Status_Seconds register. When Tx Timestamp Status FIFO
depth selected is more than 1, this bit is set as long as Tx Timestamp status
- FIFO has Tx Timestamp status entries. It is cleared when Seconds field
corresponding to last entry is read (byte 3 or byte 0 in little or big endian mode respectively) from MAC_TxTimestamp_Status_Seconds register. Access restriction applies.This bit is cleared on reading (byte 3 or byte 0 in little or big endian mode respectively) the MAC_TxTimestamp_Status_Seconds register (or write to corresponding byte of MAC_Tx_Timestamp_Status_Seconds register when RCWE bit of MAC_CSR_SW_Ctrl register is set).

10G Ethernet Controller Core Registers cont'd 1
- Bit
- Reset
- Description

