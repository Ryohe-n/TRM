# 0 by Hardware as an ack that the configuration has been switched to the new one

- During Write - The field does not matter, only a Write Access to this field to
generate a trigger pulse
- During Read - The field indicates whether duration parameters switch
clearing has happened or not
- The purpose of putting these three switch bits in one register is for the case
of Software wants to do switching for all the three parameters (volume, duration, and coefficients) at the same time.
- Software just programs the three bits and write this register, Hardware will
take the new set of volume, duration, and coefficient simultaneously when proceed new frame samples.
- There is interdependent between this and coefficient switch, which means
- Software cannot issue this switch until both coefficient switch and duration
switch are cleared 0 = CLEAR 1 = SET
- MVC_INIT_VOL_0
Register array of 8 entries.
- Offset: 0xb0,..,0xcc
- Read/Write: RW
- Parity Protection: N
- Reset: 0x00800000 (0b0000,0000,1000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

