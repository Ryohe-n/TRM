# 31 :0 0xdead0000 VALUE:

- Reflects the value on the error_<i>_user when error_<i>_pulse =
MissionError.
- Only the user signals corresponding to the first error_<i>_pulse
only will b elatched.Subsequent values will be dropped.
- The signals will get latched only when
ERRSLICE<n>_MISSIONERR_STATUS is CLEAR. IPs must tie off the unused bits of this signals to 0, if unused.
- MACSEC_ERRCOLLATOR_MISSIONERR_INDEX_0
- Offset: 0xf014
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000,0000)
- Bit
- Reset
- Description

