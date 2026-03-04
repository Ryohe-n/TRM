# 0 = UNSET 1 = SET 0x0 MTU_CHECK_FAIL:

- MTU Check failed. The Incoming packet (from MAC to MACSEC) length is
greater than programmed MTU Length 0 = UNSET 1 = SET 0x0 AES_GCM_BUF_OVF:
- AES_GCM_BUF overflow occurred. Buffer overflow event should not get
triggered during normal course of operation. 0 = UNSET 1 = SET

- MACsec Registers
- Bit
- Reset
- Description
0x0 SC_AN_NOT_VALID:
- Invalid AN state of an SC. This state is reached when the incoming packet
from MAC to MACSEC maps to an SC where the current AN is not enabled or re-initialized 0 = UNSET 1 = SET 0x0 MAC_CRC_ERROR:
- CRC error is detected in the incoming frame from MAC to MACSEC

