# 19 :16 Y 0x0 _NONE_ SYNCEP:

- Period between synchronization format in
exponential notation, a periodic synchronization message is sent when TSC[10+SYNCEP] toggles from 1 to 0. Note that all bits below the selected bit also transition from 1 to 0 at the same time Y 0x0 _NONE_ RES:
- Reserved bit inserted in all synchronization
messages. Y 0x0 _NONE_ HALT_NO_JUMP:
- Allows to halt TSC TN without stopping
reference to avoid jump at the end of Halt period.
- If HALT_NO_JUMP=1, future sync msgs are
ignored until reset is asserted. 0 = DISABLE 1 = ENABLE Y 0x0 _NONE_ DISABLE_PERIODIC:
- Disable the sending of periodic messages,
software can still force the sending of synchronization messages via the SYNC bit. 0 = DISABLE 1 = ENABLE N 0x0 _NONE_ SYNC:
- Force one synchronization message at each
write of this bit to 1, the value returned is always 0 Y 0x0 0x1 EN:
- Enable the distribution network

