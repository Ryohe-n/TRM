# 31 :24 0x6 IN_THRESH_4TH: (default: 6) Fourth Knee for the 5 gain segments, which is close to 0 dB (0dB to -127.5dB in 0.5dB step size) (After conversion Thresh -40 is provided as 40) 23:16 0x14 IN_THRESH_3RD: (default: 20) Third Knee for the 5 gain segments (0dB to -127.5dB in 0.5dB step size) (After conversion Thresh -40 is provided as 40) 15:8 0x50 IN_THRESH_2ND: (default: 80) Second Knee for the 5 gain segments (0dB to -127.5dB in 0.5dB step size) (After conversion Thresh -40 is provided as 40) 7:0 0x82 IN_THRESH_1ST: (default: 130) First Knee for the 5 gain segments, which is close to -127.5 dB (0dB to -127.5dB in 0.5dB step size) (After conversion Thresh -40 is provided as 40)

- MBDRC_OUT_THRESH_0
This is an array of three identical register entries; the register fields below apply to each entry.
- Offset: 0x74,..,0x7c
- Read/Write: RW
- Parity Protection: N
- Reset: 0x060d379b (0b0000,0110,0000,1101,0011,0111,1001,1011)
- Bit
- Reset
- Description

