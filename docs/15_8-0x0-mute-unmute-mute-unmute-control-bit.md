# 15 :8 0x0 MUTE_UNMUTE: Mute UnMute control bit.

- Eight bits for eight channels. bit[8]->ch0, bit[9]->ch1 ... bit[15]->ch7
- If PER_CHAN_CTRL_EN is DISABLE, all the channels use the same
- MUTE_UNMUTE control: ch0->MUTE_UNMUTE[0]
- If Software program this register, must be followed by
- VOLUME_SWITCH trigger to let Hardware know new volume
parameters ready.
- Hardware will take the new target volume (mute value or previous
unmute target volume) after finishing current frame
- If Software programs new target volume when system is under MUTE,
this bit will be set to UNMUTE by Hardware.
- Usually, this case is not allowed: Software programming both MUTE
and new target volume at the same time. But if it is by accident, system will go to MUTE. 0 = UNMUTE 255 = MUTE 0x0 CURVE_TYPE: curve type, 0 for POLYNOMIAL Curve, 1 for LINEAR RAMP curve
- Curve type switching cannot do on the fly
- Software reset or disable/enable is needed to switch between two
curves. 0 = POLYNOMIAL 1 = LINEAR_RAMP
- UNBIASED
ROUNDING_TYPE:
- Rounding option, 1 for unbiased rounding (RNE), 0 for biased rounding

