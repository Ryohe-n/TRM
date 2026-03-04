# 16 slots for multiple-stream composition, for example Blu-Ray content

- Eight clear rectangles
- Parameterized blender interface enables a variety of blending modes
- Color Filling the output surface with a programmable background color
#### 7.3.1.1 Use Cases
The VIC key use cases can be put into three main categories: Geometry Processing, 2D operations, and Video Post-processing operations.
##### 7.3.1.1.1 Geometry Processing for Lens Distortion Correction
VIC can perform lens distortion correction on fisheye sensors and other wide field-of-view lenses. VIC can also do stereo rectification on input stereo lens frames.
##### 7.3.1.1.2 2D Operations for UI Composition
VIC can do multi-surface composition and blending for a UI, so that VIC can be used instead of the GPU in some use cases.
##### 7.3.1.1.3 Camera Still and Video Capture
An example data flow diagram for camera use cases is referenced in the data flow diagram. Downscale and rotate still of video images for generating preview images. Crop, upscale, and rotate still of video images for digital zoom previews. Stabilize video by providing slight upscaling and cropping of an incoming video stream.

- Video Image Compositor (VIC)
**Figure 7.48 Camera Data Flow Diagram**
#### 7.3.1.2 Hardware Description
VIC hardware is composed of two parts: the Compositor and the LDC_TNR Geometry-transformer.
##### 7.3.1.2.1 Compositor
The Host Interface (THI) handles incoming methods from the Host Controller Bus and passes those methods to the embedded Falcon microcontroller, in addition to handling sync points. The Falcon Microcontroller is used for the host interaction (methods, context switches), controls the hardware via config space, and handles the interrupt from hardware logic. Some of the actions are:
- The AXI Frame Buffer Interface (AFBIF) handles memory read and write requests and returns
the data to the clients. The Fetch Control unit calculates the fetch region of the input surface and sends requests to the Surface Cache. The Surface Cache handles different input surface overfetch, does the internal pixel format conversion, and feeds the pixel data into the hardware pipeline.
- YUV chroma up-sampler, YUV -> RGB, Degamma, Gamut remap, Regamma, RGB -> YUV, and
- Chroma down sampler modules work together to handle different pixel formats and color
spaces. Y-scaler and X-scaler handles scale down or scale up between the input image surface and output image surface with programmable interpolation filter length. The Blender module blends all input surfaces with tile-by-tile scheme and 16 slot capabilities. SMEM works as one shared memory among submodules in Blender and LDC IP.
- Cadence detect, TNR DI statistics, and de-interlacer handle converting interlace video
content to the progressive video content via the advanced algorithm, legacy temporal noise reduction, and inverse telecine operation.

- Video Image Compositor (VIC)
##### 7.3.1.2.2 LDC/TNR3
- The LDC/TNR3 IP shares the same THI, Falcon, AFBIF, Surface Cache, and SMEM with the
Compositor. Some of the actions are:
- The NCFG module broadcasts all register configurations to all modules and kicks-off to the
hardware pipeline.
- The TileGen module handles tile64x16 vertical traversal, mask bitmap surface reading, and
TNR3 input surface fetching.
- The IPT module does on-the-fly control point calculations for the inverse perspective
transform mode. The PosGen module does position interpolation from sparse warp map to full warp map.
- The BBPF does bounding box calculations with the input position information from PosGen,
and sends the data fetch requests to Surface Cache.
- PixelGen and LSCALAR modules work together to do sub-pixel interpolation with high
throughput.
- The TNR3 module provides spatial bilateral filter and enhanced temporal noise reduction
filter.
- The OutGen module outputs pixel data into the external memory via three channels of DMA
for different pixel formats and memory layout. The PP module does xsobel filter and 4x4 box down sample output for rectification cases.
##### 7.3.1.2.3 Configurable Surface Cache Dimensions
VIC exposes a configurable logical cache line size to software for each input slot. Because the cache height and width dimensions is chosen independent of the surface data memory layout, the 256 bytes of data fetched into the surface cache entry may not be found in contiguous memory. For example, if a cache entry is programmed to logically represent 64x4 bytes of pixel data, and the source data is fetched from a pitch linear surface, then the data needs to be fetched from four non-contiguous 64-byte segments of memory. While a single cache line may now include data from as many as four non-contiguous segments of memory, the tag for each Surface Cache entry continues to point to the data located at the top left corner of the pixels contents within the cache line. The logical width and height of each surface cache entry can now represent pixel data in the following configurations: 1. 2. 3. 4. 5. 256x1 bytes 128x2 bytes 64x4 bytes 32x8 bytes 16x16 bytes

- Video Image Compositor (VIC)
- When programming the logical cache height and width, the dimensions should be chosen to
minimize over-fetch based on the function for which the data is used (e.g., de-interlacing, scaling with various numbers of tap filters, etc.). The logical cache height should be chosen to be a multiple of the source surface memory layout height given the memory system fetch atom height, and similarly, the logical cache width should be chosen to be a multiple of the source surface memory layout width given the memory system fetch atom width. The table below summarizes these requirements.
- Table 7.54 Programmable Surface Cache Dimensions
- Logical cache-line
dimensions
- Buffer width
restriction
- Luma/Chroma height
restriction
- Cache width
(as programmed in
- ConfigStruct)
16Bx16
- Multiple of 16B
- Multiple of 16 lines
32Bx8
- Multiple of 32B
- Multiple of 8 lines
64Bx4
- Multiple of 64B
- Multiple of 4 lines
128Bx2
- Multiple of 128B
- Multiple of 2 lines
256Bx1
- Multiple of 256B
N/A For the VIC pre-process pass (noise reduction, motion adaptation values, cadence detection, etc.), the hardware has to fetch 16Bx16 sections of memory and the cache width is forced to 0 by the Falcon (only for the pre-process pass). Using pitch linear buffers for surfaces that require pre- processing is therefore strongly discouraged.
##### 7.3.1.2.4 Maximum Surface and Rectangle Size Support
VIC supports surface and rectangle sizes up to 16384x16384 pixels. All configurable surface width and height parameters, and configurable rectangle dimensions in the Fetch Control, Surface List, and Output Buffer, support up to 16384x16384 surfaces and rectangles. All related fields in the ConfigStruct and associated registers are 14 bits to support this.
#### 7.3.1.3 Pixel Format Conversion
##### 7.3.1.3.1 Memory Format Support
- The following memory formats are supported on input and output. Note that input and output
memory formats do not have to match. 1. 2. 3. 4.
- Pitch Linear
- Block Linear (16Bx2 kind with sector ordering)
64x8 byte Gob format with 16x2 byte sectors
- Contiguous 64B atoms are laid out as 32x2 byte blocks

- Video Image Compositor (VIC)
Note: Refer to the Pixel Memory Formats chapter for more details.
- The VIC Surface Cache supports the above memory formats on input when fetching pixel data
from memory. The VIC Output Buffer supports the above memory formats on input when reading background image data, when pre-processing inverse telecine data from memory, and on the output side when writing composited image data back to memory. Memory formats supported by VIC are enumerated as follows:
- Table 7.55 Memory Format Enumerations
- Surface Kind Enumeration
- Encoding (four bits)
- BLK_KIND_PITCH
0x0
- BLK_KIND_GENERIC_16Bx2_TEGRA
0x1 To fully support the Block Linear format, block height should be programmable to any one of the following set of enumerations.
- Table 7.56 Block Height Enumerations
- Block Height Enumeration
- Value
- Encoding (four bits, log2 encoding)
- ONE_GOB
- TWO_GOBS
- FOUR_GOBS
- EIGHT_GOBS
- SIXTEEN_GOBS
- THIRTYTWO_GOBS
##### 7.3.1.3.2 Pixel Format Support
The VIC pipeline supports a large number of pixel formats. The VIC pipeline accepts a surface of a given input pixel format and produces a given output pixel format. The following table lists all the pixel formats supported in VIC and any restrictions on their usage. The symbols in color conversion mode column describe the internal VIC representation of the format, (e.g., 1P_1C represents one plane with one component pixels, 2P_1+2C represents two planes, one plane with one component pixels, and a second plane with two component pixels).

- Video Image Compositor (VIC)
- Table 7.57 Pixel Format Support
- TNR/
- TNR2
- Pixel Format
- FOURCC
- Input
- Support
- Output
- Support
- Rotatio
n
- Scaling
- High Quality
- De-
interlacing T_A8 Y Y Y Y N N T_L8/ T_Y8/ T_YUV100 Y Y Y Y N N T_A4L4 Y Y Y Y N N T_L4A4 Y Y Y Y N N T_R8 Y Y Y Y N N T_A8L8 Y Y Y Y N N T_L8A8 Y Y Y Y N N T_L16 Y Y Y Y N N T_R8G8 Y Y Y Y N N T_G8R8 Y Y Y Y N N T_B5G6R5 Y Y Y Y N N T_R5G6B5 Y Y Y Y N N T_B6G5R5 Y Y Y Y N N T_R5G5B6 Y Y Y Y N N T_A1B5G5R5 Y Y Y Y N N T_A1R5G5B5 Y Y Y Y N N T_B5G5R5A1 Y Y Y Y N N T_R5G5B5A1 Y Y Y Y N N T_A5B5G5R1 Y Y Y Y N N T_A5R1G5B5 Y Y Y Y N N T_B5G5R1A5 Y Y Y Y N N T_R1G5B5A5 Y Y Y Y N N T_X1B5G5R5 Y Y Y Y N N T_X1R5G5B5 Y Y Y Y N N T_B5G5R5X1 Y Y Y Y N N T_R5G5B5X1 Y Y Y Y N N T_A4B4G4R4 Y Y Y Y N N

- Video Image Compositor (VIC)
- TNR/
- TNR2
- Pixel Format
- FOURCC
- Input
- Support
- Output
- Support
- Rotatio
n
- Scaling
- High Quality
- De-
interlacing T_A4R4G4B4 Y Y Y Y N N T_B4G4R4A4 Y Y Y Y N N T_R4G4B4A4 Y Y Y Y N N T_A8B8G8R8 Y Y Y Y N N T_A8R8G8B8 Y Y Y Y N N T_B8G8R8A8 Y Y Y Y N N T_R8G8B8A8 Y Y Y Y N N T_X8B8G8R8 Y Y Y Y N N T_X8R8G8B8 Y Y Y Y N N T_B8G8R8X8 Y Y Y Y N N T_R8G8B8X8 Y Y Y Y N N T_A2B10G10R10 Y Y Y Y N N T_A2R10G10B10 Y Y Y Y N N T_B10G10R10A2 Y Y Y Y N N T_R10G10B10A2 Y Y Y Y N N T_A16B16G16R16 Y Y Y Y N N T_A4P4 Y N Y Y N N T_P4A4 Y N Y Y N N T_P8A8 Y N Y Y N N T_A8P8 Y N Y Y N N T_P8 Y N Y Y N N T_P1 Y N Y Y N N T_U8V8 Y Y Y Y N N T_V8U8 Y Y Y Y N N T_A8Y8U8V8 (AYUV444 packed) Y Y Y Y N N T_V8U8Y8A8 (AYUV444 packed) Y Y Y Y N N T_A16Y16U16V16 Y Y Y Y N N

- Video Image Compositor (VIC)
- TNR/
- TNR2
- Pixel Format
- FOURCC
- Input
- Support
- Output
- Support
- Rotatio
n
- Scaling
- High Quality
- De-
interlacing T_Y8_U8__Y8_V8 (YUV422 packed)
- YUY2/YUYV
Y Y Y Y Y Y T_Y8_V8__Y8_U8 (YUV422 packed)
- YVYU
Y Y Y Y N N T_U8_Y8__V8_Y8 (YUV422 packed)
- UYVY
Y Y Y Y Y Y T_V8_Y8__U8_Y8 (YUV422 packed) Y Y Y Y N N T_Y8___U8V8_N444 (YUV444 semi-planar) Y Y Y Y N N T_Y8___V8U8_N444 (YUV444 semi-planar) Y Y Y Y N N T_Y8___U8V8_N422 (YUV422 semi-planar) e.g., NV61 Y Y Y Y N N T_Y8___V8U8_N422 (YUV422 semi-planar) e.g., NV16 Y Y Y Y N N T_Y8___U8V8_N422R (YUV422R semi-planar) Y Y Y Y N N T_Y8___V8U8_N422R (YUV422R semi-planar) Y Y Y Y N N T_Y8___U8V8_N420 (YUV420 semi-planar) e.g., NV21 Y Y Y Y N N T_Y8___V8U8_N420 (YUV420 semi-planar) e.g., NV12 Y Y Y Y Y Y T_Y8__U8__V8_N444 (YUV444 planar)** e.g., YV24 Y Y Y Y N N T_Y8__U8__V8_N422 (YUV422 planar)** e.g., YV16 Y Y Y Y N N T_Y8__U8__V8_N422R (YUV422R planar) ** Y Y Y Y N N T_Y8__U8__V8_N420 (YUV420 planar) ** e.g., YV12 Y Y Y Y Y Y T_Y10___U10V10_N444 (YUV444 semi-planar) Y Y Y Y N N T_Y10___V10U10_N444 (YUV444 semi-planar) Y Y Y Y N N T_Y10___U10V10_N422 (YUV422 semi-planar) Y Y Y Y N N

- Video Image Compositor (VIC)
- TNR/
- TNR2
- Pixel Format
- FOURCC
- Input
- Support
- Output
- Support
- Rotatio
n
- Scaling
- High Quality
- De-
interlacing T_Y10___V10U10_N422 (YUV422 semi-planar) Y Y Y Y N N T_Y10___U10V10_N422R (YUV422R semi-planar) Y Y Y Y N N T_Y10___V10U10_N422R (YUV422R semi-planar) Y Y Y Y N N T_Y10___U10V10_N420 (YUV420 semi-planar) Y Y Y Y N N T_Y10___V10U10_N420 (YUV420 semi-planar) Y Y Y Y N Y T_Y10__U10__V10_N444 (YUV444 planar)** Y Y Y Y N N T_Y10__U10__V10_N422 (YUV422 planar)** Y Y Y Y N N T_Y10__U10__V10_N422R (YUV422R planar) ** Y Y Y Y N N T_Y10__U10__V10_N420 (YUV420 planar) ** Y Y Y Y N Y T_Y12___U12V12_N444 (YUV444 semi-planar) Y Y Y Y N N T_Y12___V12U12_N444 (YUV444 semi-planar) Y Y Y Y N N T_Y12___U12V12_N422 (YUV422 semi-planar) Y Y Y Y N N T_Y12___V12U12_N422 (YUV422 semi-planar) Y Y Y Y N N T_Y12___U12V12_N422R (YUV422R semi-planar) Y Y Y Y N N T_Y12___V12U12_N422R (YUV422R semi-planar) Y Y Y Y N N T_Y12___U12V12_N420 (YUV420 semi-planar) Y Y Y Y N N T_Y12___V12U12_N420 (YUV420 semi-planar) Y Y Y Y N Y*** T_Y12__U12__V12_N444 (YUV444 planar)** Y Y Y Y N N T_Y12__U12__V12_N422 (YUV422 planar)** Y Y Y Y N N

- Video Image Compositor (VIC)
- TNR/
- TNR2
- Pixel Format
- FOURCC
- Input
- Support
- Output
- Support
- Rotatio
n
- Scaling
- High Quality
- De-
interlacing T_Y12__U12__V12_N422R (YUV422R planar) ** Y Y Y Y N N
- DiSi1 de-interlacing only works on NV24 surfaces and field-based variants of NV12, YV12, YUY2,
and UYVY formats (with each field stored in a separate surface).
- * VIC has support for three independent surface pointers for each of the input slots and output
surfaces, one each for luma, chroma-u, and chroma-v.
- ** 12-bit YUV pixel formats are supported for the TNR pass with only read/write support with no
increase in the internal pipeline width. The pixels therefore are truncated to 10-bit precision before and after processing.
- ** 12-bit YUV pixel formats for the composition pass are processed using the existing 14-bit
fractional precision pipeline. This means it does not accurately de-gamma these higher precision pixel formats. In the color format, the notation called "A:B:C" is used to describe how often U and V are sampled relative to Y. 444 (4:4:4) means no down sampling of the chroma channels. 422 (4:2:2) means 2:1 horizontal down sampling, with no vertical down sampling. Every scan line contains four Y samples for every two U and V sample pairs. 420 (4:2:0) means 2:1 horizontal down sampling, with 2:1 vertical down sampling. R refers to rotated. 422 by default means horizontal down sampling; while 422R means vertical down sampling. Instead of the chroma being shared between two horizontally adjacent luma components, it's shared between two vertically adjacent luma components. Note: VIC does not support 24-bit color formats, either RGB or YUV.
##### 7.3.1.3.3 Pixel Format Conversion
Color conversion (CC) and proc-amp are implemented using a matrix multiplication on every pixel. The matrix only changes when the surfaces changes. Current chain of operations:
- Proc-amp + Output CC (4x3 matrix)
- Clamping (optional soft clamping, two control entry)
1. 2. The 4x3 matrix values are specified in the MatrixStruct as S12.8 values. In addition, the result of the matrix multiplication is right shifted by r_shift. To allow for highest accuracy, r_shift should always be as high as possible without losing any range in the other coefficients. Note that the constant offsets (c03, c13, c23) are S12.8 and are not affected by r_shift.

- Video Image Compositor (VIC)
Soft clamping defines a piece-wise linear function consisting of three pieces. The control entries define the area of soft clamping, i.e., for the values a and b we get the following pseudo-code: if (v < -a) v' = 0 else if (-a <= v < a) v' = (v+a)/2 else if (a <= v < b) v' = v else if (b <= v < (2-b)) v' = (v+b)/2 else if ((2-b) <= v) v' = 1 When converting between pixel formats with components of varying bit width, bit replication is used for expanding component bit widths, and truncation is used for reducing component bit widths. Note: Dithering and un-dithering is not supported.
- Handling Sub-sampled Chroma Formats
- The chroma location for pixel formats with sub-sampled chroma can be specified using the
- ChromaLocHoriz and ChromaLocVert parameters in the VIC config structure. Each of these
parameters can take values 0, 1, or 2 representing a chroma location as listed in the table below.
- Table 7.58 Example Chroma Location
- ChromaLoc
- Chroma Position
- Co-sited with even luma values
- Mid-way between even and odd luma values
- Co-sited with odd luma values
- Table 7.59 Example ChromaLoc Values
- Format
- ChromaLocHoriz
- ChromaLocVert
- Comment

