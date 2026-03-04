# 0 = BIASED 1 = UNBIASED

- MVC_SWITCH_0
- Offset: 0xac
- Read/Write: RW
- Parity Protection: N
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)

- Master Volume Control (MVC) Registers
- Bit
- Reset
- Description
- CLEAR
VOLUME_SWITCH:
- Software should use a write to this register - to prompt the Hardware to
start using a new set of volume for the volume related parameters (TARGET_VOL AND MUTE_UNMUTE) 1 bits for eight channels. Hardware will detect which channel has new target and do volume ramping
- After Software programming new TARGET_VOL or changing MUTE_UNMUTE
status, Software needs to program this field to let Hardware know new volume is ready for using.
- Hardware does this switch as soon as its done processing the current frame
- This bit will remain 1(SET) till the switch hasn't happened, and is cleared to 0
by Hardware as an ack that the configuration has been switched to the new one.
- During Write - The field does not matter, only a Write Access to this field to
generate a trigger pulse
- During Read - The field indicates whether polynomial coefficients switch
clearing has happened or not 0 = CLEAR 1 = SET
- CLEAR
COEFF_SWITCH:
- Software should use a write to this register - to prompt the Hardware to
start using a new set of configuration for the polynomial coefficients
- After Software programming new polynomial coefficients, Software needs to
program this field to let Hardware know new volume is ready for using.
- Hardware does this switch as soon as its done processing the current frame
- This bit will remain 1(SET) till the switch hasn't happened, and is cleared to 0
by Hardware as an ack that the configuration has been switched to the new one
- During Write - The field does not matter, only a Write Access to this field to
generate a trigger pulse
- During Read - The field indicates whether polynomial coefficients switch
clearing has happened or not there is interdependent between this and duration switch, which means Software cannot issue this switch until both coefficient switch and duration switch are cleared 0 = CLEAR 1 = SET

- Master Volume Control (MVC) Registers
- Bit
- Reset
- Description
- CLEAR
DURATION_SWITCH:
- Software should use a write to this register - to prompt the Hardware to
start using a new set of configuration for the duration related parameters (DURATION, DURATION_INV, POLY_N1 AND POLY_N2)
- After Software programming new duration parameters, Software needs to
program this field to let Hardware know new volume is ready for using.
- Hardware does this switch as soon as its done processing the current frame
- This bit will remain 1(SET) until the switch hasn't happened, and is cleared to

