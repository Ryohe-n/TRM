# 4 :2:0 chroma downsampling

- Convert from 4:4:4 to 4:2:0
- Additional chroma overfetch added for this stage

- Display Controller
- Maximum line width: 5120
- Regional CRCs
Nine programmable regions with software-defined golden values. Used for safety features.
##### 7.5.1.4.4 Output
2Head1OR
- The DSC compressed or 4:2:0 packed output from two heads can be merged to output an
8K stream. (Note that DSC only supports 4:4:4). DSC bpp must be <=16bpp in this mode.
- Maximum raster active width in 2head1OR mode is 7680 (3840 per head)
- Raster Lock
- Internal locking
- Stereo phase lock
- Stall Lock
- Progressive output only
- No support for interlaced
- Stereo
- Frame Interleave
- Hardware-constructed Frame packed Stereo for HDMI
- Two programmable line interrupts (registers)
- Six programmable line semaphores (methods)
- Can also trigger interrupts
- DisplayPort 1.4a (No DP2.0 support)
- Up to 8 channel 48 kHz Audio
- RBR, HBR, HBR2, HBR3
- RGB444 and YUV444 6, 8, 10, 12 bpc (6 bpc is RGB only)
- YUV422 8, 10, 12 bpc
Maximum pclk over a single 4 lane HBR3 link without downspread, FEC, or DSC: - - - - - 1190 MHz at 16bpp (YUV 422) 1,190 MHz at 18bpp 1,080 MHz at 24bpp 864 MHz at 30bpp 720 MHz at 36bpp
- Two Generic info frames per head (likely used for VSC and static HDR)
-
- No native support for Dynamic HDR metadata
- Forward Error Correction (FEC)
- DSC transport
-
- PPS can be used as another generic info frame when not being used for DSC

- Display Controller
- DisplayPort Multistream (MST)
-
- Any combination of heads can be sent to any combination of SORs (provided there is
enough link bandwidth to support those streams)
- Dual-MST
- -
- Not supported with YUV 4:2:2 output format
- Not supported with FEC
eDP 1.4b
- PSR v1
- NLT
- NVSR
- Support for intermediate link rates (2.16, 2.43, 3.24, 4.32, 6.75 Gbps/lane)
- HDMI 2.0a and HDMI 1.4
Maximum pclk supported in non-FRL mode is as follows: 8bpc 10bpc 12bpc
- RGB / YUV 4:4:4

