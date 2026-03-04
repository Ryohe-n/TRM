# 31 :0 0x0 TSS: Timestamp Seconds The value in this field is the seconds part of the update.

- When ADDSUB is reset, this field must be programmed with the seconds part
of the update value. When ADDSUB is set, this field must be programmed with the complement of the seconds part of the update value. For example, to subtract 2.000000001 seconds from the system time, the TSS field in the
- MAC_Timestamp_Seconds_Update register must be 0xFFFF_FFFE (that is,

