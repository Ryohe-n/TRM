# 64 -bit RGB:

- R16_G16_B16_A16_NVBIAS, R16_G16_B16_A16
- FP16 RGB

- Display Controller
- RF16_GF16_BF16_AF16
Packed YUV 422:
- Y8_U8__Y8_V8_N422, U8_Y8__V8_Y8_N422
Semi-Planar 8bpc:
- Y8___U8V8_N444, Y8___U8V8_N422, Y8___V8U8_N420
Semi-Planar 10bpc:
- Y10___U10V10_N444, Y10___U10V10_N422, Y10___V10U10_N420
Semi-Planar 12bpc:
- Y12___U12V12_N444, Y12___U12V12_N422, Y12___V12U12_N420
Planar 8bpc:
- Y8___U8___V8_N444, Y8___U8___V8_N420
- No support for 10bpc or 12bpc planar
YUV surfaces have the following restrictions:
- Surfaces with chroma subsampling must have an even number of pixels/lines in the
direction of subsampling. When 90/270 rotation is enabled, all YUV surfaces must have even height. When 90/270 rotation is not enabled, all YUV surfaces must have even width.
- Isochronous Memory Hub
- Unified Mempool and Display fetch arbitration=1380 KB
- Fetch Metering
- Mempool Drain metering
- Horizontal and vertical-flipped scan direction
- Rotation
- BLx8 fetch pattern used for rotation
Rotation is supported on all windows.
- No more than one window using the I8 or YUV surface formats can be rotated (90/270
degrees) at any given time
- Pitch surface support
- Block Linear surface support
NVDisplay fetches BLx4 and uses XBAR_RAW addressing.
- VPR-capable read-only client

