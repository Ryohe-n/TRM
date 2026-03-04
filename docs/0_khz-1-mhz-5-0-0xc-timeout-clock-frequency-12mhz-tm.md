# 0 = KHZ 1 = MHZ 5:0 0xc TIMEOUT_CLOCK_FREQUENCY: 12MHz TMCLK is used in legacy SD/eMMC mode

- TMCLK freq value will be advertised based on UHS2_IF_EN and
- USE_TMCLK_FOR_DATA_TIMEOUT
- SDMMCA_CAPABILITIES_HIGHER_0
- Higher Capabilities Register
1.8V VDD2 Support This bit indicates that support of VDD2 on the Host System. 0b 1.8V VDD2 is not supported 1b 1.8V VDD2 is supported
- ADMA3_SUPPORT - ADMA3 Support
This bit indicates that support of ADMA3 on Host Controller. 0b ADMA3 is not supported 1b ADMA3 is supported
- Clock Multiplier
This field indicates clock multiplier value of programmable clock generator.
- Refer to Clock Control register. Setting 00h means that Host Controller
does not support programmable clock generator. 00h Clock Multiplier is Not Supported 01h Clock Multiplier M = 2 02h Clock Multiplier M = 3 ..... ......................
- Timer Count for Re-Tuning
0h Re-Tuning timer disabled 1h 1 seconds

- SDMMCA Registers
2h 2 seconds 3h 4 seconds . ...................... . ...................... nh 2**(n-1) seconds . ...................... . ......................
- Fh Get information from other source
- Driver Type D Support
This bit indicates support of Driver Type D for 1.8 Signaling. 1 Driver Type D is Supported 0 Driver Type D is Not Supported
- Driver Type C Support
This bit indicates support of Driver Type C for 1.8 Signaling. 1 Driver Type C is Supported 0 Driver Type C is Not Supported
- Driver Type A Support
This bit indicates support of Driver Type A for 1.8 Signaling. 1 Driver Type A is Supported 0 Driver Type A is Not Supported
- UHS2_SUPPORT - UHS-II Support (UHS-II only)
- This bit indicates whether Host Controller supports UHS-II. If this bit is set
to 1, 1.8V VDD2 Support shall be set to 1 (Host System shall support VDD2 power supply). 1 UHS-II is supported 0 UHS-II is not supported
- DDR50 Support

