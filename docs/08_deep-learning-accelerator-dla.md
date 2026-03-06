# 8 Deep Learning Accelerator (DLA)

## 8.1 Deep Learning Accelerator (DLA)
### 8.1.1 Overview
- The NVIDIA Deep Learning Accelerator (NVDLA) is a fixed function engine used to accelerate
inference operations on convolution neural networks (CNNs). NVDLA is designed to do full hardware acceleration of convolutional neural network. NVDLA supports various layers such as convolution, deconvolution, fully-connected, activation, pooling, local response normalization, and fully connected layers. NVDLA is primarily used for the Advanced Driver Assistant System (ADAS) in the SoC. As one stage of the CV pipeline, NVDLA receives Region of Interest (ROIs) from Programmable Computer-Vision Accelerator (PVA) and/or Image Signal Processor (ISP) and detects cars, pedestrians, traffic signals, and bicycles. The primary use-cases for NVDLA are:
- Internal NVIDIA DNN models, like NVDriveNet
- External automotive and embedded customer DNN models
- Academic DNN models, like AlexNet, GoogleNet, and ResNet
Visit the NVDLA Open Source Project (nvdla.org) for additional information on deep learning, convolution neural networks, and accelerating deep learning inference operations.

- Deep Learning Accelerator (DLA)
**Figure 8.1 DLA Block Diagram**
#### 8.1.1.1 Relevant Chapters in the TRM
- Clock Controller and Reset (CAR)
- Design for Debugging (DFD)
- Host Controller
- Hardware Safety Manager (HSM)
- Pixel Memory Format
#### 8.1.1.2 Glossary
- Term
- Description
- Accumulated sum
Output of ACCU unit. Accumulated sum is the sum of one or more partial sums.

- Deep Learning Accelerator (DLA)
- Term
- Description
- ATOMIC_M
- The size in bytes of one atom in 2D surfaces. The dimensions of one atom are 1x1xATOMIC_M
where ATOMIC_M is 32Bytes.
- ATOM
The basic unit in feature cube. Its dimension is 1x1xATOMIC MBytes.
- ATOMIC_C
Convolution only. The number of elements in one atomic operation in the convolution pipeline. 64 for INT8 by default.
- ATOMIC_CS
- The number of elements in one atomic operation in convolution pipeline in channel
dimension. 128 for INT8 by default.
- ATOMIC_K
The number of kernels in one kernel group.
- BDMA
Bridge DMA. BDMA transform data from CVSRAM to MC and vice versa.
- CARB
- Cbuf Arbiter, a module instanced in CPIPE
- CBB
Control backbone. A system control data path that connected to NVDLA.
- CDMA
Convolution DMA. Responsible for load image/weight/feature data to convolution pipeline.
- CFGDMA
ConfigDMA, a sub-unit responsible for configuring registers of sub-units. The value of registers is from UB or MC.
- CNN
Convolutional Neural Networks. Consists of multiple layers, including convolution layer, pooling layer, normalization layer, etc.
- CPIPE
- Convolution pipeline which contains sub-units CBUF, CSC, CMAC, and CACC. One NVDLA IP can
contain multiple CPIPEs.
- CPP
- Short for CPIPE
- CV
- Computer Vision
- CW
- Compressed Weight
- Data cube
All input feature data and pixel data can be viewed as a 3-dimension cube marked as W x H x C.
- DBB
Data backbone. The NoC and external memory system that NVDLA connects to.
- DC
- Direct Convolution mode
- DFD
- Design For Debug
- DLA
- Same as NVDLA
- DWP
Depth-wise processor. A functional sub-unit inside Rubik to process depth-wise convolution and direction convolution. Only FP16 is supported in DWP.
- Element
The basic unit of each data type involved in NVDLA computing. For pixel format, one element refers to a component of pixel.
- ES
- Engine scheduler, one sub-unit of GP
- Feature data
The output data of hardware layer. Feature data is generated from one hardware layer and can be used as input data for the next hardware layer. HOG data and pixel data which is used in the first layer of a CNN are not feature data.
- GROUP_SIZE
The channel number of one kernel group, only used by group convolution.

- Deep Learning Accelerator (DLA)
- Term
- Description
- GOB
Group of Blocks. A structure of mapping blocks in block linear format.
- GP
- Graph processor, a sub-unit responsible for schedule different engines to achieve certain
function.
- HOG
- Histogram of Oriented Gradients
- HW-layer
One complete hardware process. It starts with a set of register configurations with an enable field. When it is complete, it triggers one interrupt.
- HSM
Hardware Safety Manager. HSM is a sub-module inside Safety and Camera Engine (SCE) cluster. Its main purpose is to monitor error signals from different modules and signal a safety MCU external to the SoC when such an error happens. K
- The kernel number of convolutions
- KC
Kernel Cube. Includes weights: ATOMIC_C*ATOMIC_K*R*S elements.
- LIC
Legacy Interrupt Controller. A central interrupt controller for summarizing general interrupts from interrupt source engines, managing interrupt type and priorities, and forwarding to CPUs.
- MAC CELL
- Basic schedule unit in CONV_MAC. Contains 64 MUL/ADDER (multiply then add) for INT8
- NCHW
- Alias of M-planar format. NCHW refers to Batch-Channel-Height-Width
- NVDLA
- NVIDIA Deep Learning Accelerator
- OP_ATOMIC_M
- The size of basic unit of SDP_OPRDMA corresponding to the ATOMIC_M of SDP
P
- Output height of the convolution
- Partial sum
Output of MAC CELL. Usually the partial result of a convolution.
- PDP
Planar data processor. A functional sub-unit in SDP.
- Planar
The method of representing pixel colors with several bit-planes of RAM.
- PVA
- Programmable Vision Accelerator
Q
- Output width of the convolution
- RDMA
- Read DMA. Instanced in SDP/CDP/PDP/RUBIK engines and responsible for load input data from
external memory (either MC or CVSRAM).
- ROI
Region Of Interest. Refers to a rectangle of image or an entire image. ROI can be sent by PVA or Camera. R/S The height/width of a convolution kernel respectively.
- Rubik
- Data operation processor. A functional sub-unit in the NVDLA engine to support data layout
transformation. It also contains DWP.
- SDP
Single data processor. A functional sub-unit in NVDLA engine.
- SDP-X
- One processing unit in the SDP pipeline: a total of two SDP-Xs in one SDP pipe
- Slice cube
A part of a data cube. For a W x H x C cube, a slice refers to a W x 1 x C sub-cube.
- SP
Sparsity Pattern. The metadata for compressed weight.

- DLA Functional Description
- Term
- Description
- Stripe length
- The number of output elements within one stripe operation. Its value varies in different
convolution modes of CPIPE and DWP.
- Surface cube
A part of a data cube. For a W x H x C cube, a surface refers to a W x H x 16 sub-cube for int16/ fp16 or W x H x 32 sub-cube for int8.
- THI
Tegra Host Interface. An interface module between Host Controller and Falcon.
- UBUF
Unified buffer. An internal buffer unit in NVDLA2.0.
- WDMA
- Write DMA. Instanced in SDP/CDP/PDP/RUBIK engines and responsible for write output data to
external memory (either MC or CVSRAM). 3D convolution/ pool Convolution/pool that uses a filter that has extra dimension compared to 2D convolution/pool.
### 8.1.2 DLA Functional Description
#### 8.1.2.1 Data Formats
The NVDLA engine supports various types of CNN layers such as the convolution layer, pooling layer, ReLU layer, and LRN layer. To improve performance, the NVDLA engine applies some options like weight compression and multi-batch mode. To support these layers, the NVDLA engine uses specified input and output data formats. There are two main types of input formats: weight data and activation data. The weight formats include the branches below:
- Weight for direct convolution
- Weight for image input
- Weight for deconvolution
- Weight for Tiny-CK
Two additional options for weight formats:
- Channel post-extension for image input mode
- Sparse compressing
The activation formats supported by the NVDLA engine include:
- Feature data format

- DLA Functional Description
- Pixel format: Region of Interest (ROI) input
The output formats supported by the NVDLA engine include:
- Feature data format
M-planar format (NCHW) The NVDLA engine fetches the auxiliary formats below from the external memory:
- SDP OP data
A channel extension refers to a set of mapping rules for both the weight data and the activation data to fit with the accelerator. It includes:
- Channel pre-extension for image input mode
- Channel post-extension for image input mode
- The channel post-extension for the image input mode is an option for performance. Hardware
handles all the channel extensions on the feature/pixel data, while software handles the channel extension to the weight data accordingly. All data formats are mapped in the memory with a particular set of rules.
#### 8.1.2.2 Precision Conversion
The NVDLA supports three types of data precision.
- UINT8
- INT8
- FP16
1. 2. 3. For actual use scenarios, a mixed-precision model may be required(different layers have different precision types); or for a given precision input image, it may be desirable to process with another precision. Note that FP16 performance is significantly lower than INT8 performance and so should be avoided on NVDLA. In order to satisfy those needs, NVDLA supports precision conversion in two sub-units:
- CDMA (Code Division Multiple Access, see below)
- SDP (Super Data Processor, see below)
The detailed precision conversion combinations are listed in table below:

- DLA Functional Description
- Comment
- Working
- Mode
- Pipeline
- Conver
sion
- Module
- Outpu
t precisi on
- Input
precisi on (U)INT8 (U)INT8
- Feature
convoluti on
- Convoluti
on+SDP
- SDP
- CMAC input is (U)INT8 (feature)*INT8 (weight) then output
higher precision INT.
- SDP internal pipeline is FP19, it is responsible to convert FP19
to output (U)INT8. All the four possible combinations are supported.
- FP16/
(U)INT8
- FP16
- Feature
- Convoluti
on
- DWP
- NA
- When implementing DC on DWP, both input and output of DWP
are FP16.
- When implementing depthwise on DWP, the input feature data
type can be (U)INT8/FP16 and the output data type must be FP16.
- UINT16
(U)INT8 image convoluti on
- Convoluti
on+SDP
- CDMA
+SDP
- CDMA converts (U)INT16 to (U)INT8 (sign has to be kept); CMAC
is working on (U)INT8*INT8 then output higher precision INT.
- SDP internal pipeline is FP19, it is responsible to convert FP19
to output (U)INT8.
- From I/O perspective, all the four combinations are supported,
however, CDMA supports two conversions (U16->U8, I16->I8) only. (U)INT1
- FP16
image convoluti on
- FCDMA+S
- DP
- DWP
- FCDMA
+SDP
- DWP
There are two ways to support this use scenario: a) Process by (U)INT8 Realized by FCDMA+SDP by one hardware layer:
- FCDMA convert the (U)INT16 to (U)INT8 then do convolution by
- CMAC, after that, the data send to SDP with FP19 format and
- SDP produces the FP16;
b) Process by FP16: Realized by two hardware layers (HWLs):
- HWL0: FCDMA+SDP - FCDMA fetches the (U)INT16 to CBUF;
SDP read those data then write to UB with FP16.
- HWL1: DWP - DWP makes the FP16 data from UB then do
image convolution.
- FP16
- FP16
image convoluti on
- FCDMA+S
- DP
- DWP
- NA
Realized by two HWLs:
- HWL0: FCDMA+SDP - FCDMA fetches the FP16 to CBUF, SDP
read those data then write to UB with FP16.
- HWL1: DWP - DWP takes the FP16 data from UB then do image
convolution and produces FP1.
- FP16
(U)INT8 image convoluti on
- FCDMA+S
- DP
- DWP
- FCDMA+S
- DP
- SDP
There are two ways to realize it: a) Process by FP16: Realized by three HWLs:
- HWL0: FCDMA+SDP - FCDMA fetches the FP16 to CBUF, SDP
read those data then write to UB with FP16.
- HWL1: DWP - DWP takes the FP16 data from UB then do image
convolution and produces FP16.
- HWL2: FCDMA+SDP - FCDMA fetches the FP16 to CBUF, SDP
takes those data from CBUF and convert to (U)INT8. b) Process by INT8: Requires two HWLs:
- HWL0: FCDMA+SDP - FCDMA fetches the FP16 image to CBUF,
SDP read them and convert to (U)INT8 then write back to CB.
- HWL1: CPP - CSC read (U)INT8 numbers and write back does
convolution then output (U)INT8 by SDP.

- DLA Functional Description
- Comment
- Working
- Mode
- Pipeline
- Conver
sion
- Module
- Outpu
t precisi on
- Input
precisi on (U)INT8
- FP16
- Image
convoluti on
- FCDMA+S
- DP
- DWP
- SDP
Requires three layers:
- HWL0: FCDMA (img)+SDP - FCDMA fetches image data, do pre-
extension then write back to CBUF. SDP treats it as a feature cube then does precision conversion and output FP16.
- HWL1: SDP takes the FP16 as input, set IMAGE_ENABLE and
append dummy 0s at the end of each channel to actually output feature cube (C will be enlarged to 16).
- HWL2: DWP takes the 0s appended cube in, process with FP16
precision. (U)INT8
- FP16
- Feature
- Convoluti
on
- Convoluti
on+SDP
- SDP
- CMAC input is (U)INT8 (feature) * INT8(weight) then output
FP19 to SDP.
- SDP internal pipeline is FP19, it is responsible to convert FP19
to output FP16 (U)INT8 (U)INT8 pooling
- SDP(PDP)
- SDP
- SDP takes (U)INT8 as input. After operated by PDP, the PDP can
output (U)INT8 to CB/UB/MC.
- SDP internal pipeline is FP19, it can be converted from FP19 to
output (U)INT8 or just input (U)INT16 into PDP. All the four combinations are supported. (U)INT8
- INT16
pooling
- SDP(PDP)
- SDP
- SDP takes (U)INT8 as input. After operated by PDP, the PDP can
output (U)INT16 to CB/UB/MC.
- SDP internal pipeline is FP19, it can be converted from FP19 to
output (U)INT16 or just (U)INT16 input into PDP. (U)INT8
- FP16
pooling
- SDP(PDP)
- SDP
- SDP takes (U)INT8 as input. After operated by PDP, the PDP can
output FP16 to CB/UB/MC.
- SDP internal pipeline is FP19, it can be converted from FP19 to
output FP16 or just input FP16 into PDP.
- FP16
- FP16
pooling
- SDP(PDP)
- SDP
- SDP takes FP16 as input. After operated by PDP, the PDP can
output FP16 to CB/UB/MC.
- SDP internal pipeline is FP19, it can be converted from FP19 to
output FP16 or just input FP16 into PDP (U)INT8 (U)INT8
- LRN/
conversio n
- SDP
- SDP
SDP takes (U)INT8 as input then convert to FP19 to process.
- SDP internal pipeline is FP19, it is responsible to convert FP19
to output (U)INT8. All the four combinations are supported.
- FP16
- FP16
- LRN/
conversio n
- SDP
- SDP
- SDP takes FP16 as input then convert to higher precision FP to
process.
- SDP output convertor responsible for convert higher precision
FP to FP16. (U)INT8
- FP16
- LRN/
conversio n
- SDP
- SDP
SDP takes (U)INT8 as input then convert to FP19.
- SDP internal pipeline is FP19, it is responsible to convert FP19
to FP16.
- FP16
(U)INT8
- LRN/
conversio n
- SDP
- SDP
SDP pipeline works in FP pipe, convert to (U)INT8 before output.

- DLA Functional Description
#### 8.1.2.3 Floating Point Support
NVDLA supports four floating point encodings:
- FP16
- FP17
- FP19
- FP32
##### 8.1.2.3.1 INF/NaN/Denormalized/Rounding/Zero Handling
This section describes NVDLA how to support floating point in data-path.
- Infinity
Infinity is that exponent bits are all 1 and fraction bits are all 0 . When sign bit is 0, the number is positive infinity. When sign bit is 1, the number is negative infinity.
- There won't be any INF output from any NVDLA sub-module. If saturation happens, NVDLA will
output the maximum representable (+/-65504 for FP16, 127/-128 for INT8). NVDLA provides input to the INF counting register and output saturation to the counting register to report INF/Saturation so that software is able to know the precision loss. Weight does not supported INF because it is configured by software.
- NaN
The NVDLA does not generate NaN since the infinity values are not involved in any operation, but it supports NaN propagation. If the input data has NaN, any result related to the NaN operand is NaN. The DLA provides a register field to flush NaN to zeros. If the register is set, all input NaNs are treated as a zero value in the float point data path and the output data cube does not have any NaN. Otherwise, the input NaNs propagate to the output. The DLA also provides input/output NaN counting registers that summarize the total NaN number in the input/output data cube. The counting registers are updated when the layer is done. When completed interrupts arrive, the firmware polls the NaN counting registers to figure out whether the input/output data cubes have any NaN value.
- Denormalized Value
The NVDLA supports denormalized values for both input and output. The denormalized value is handled by following the IEEE754 standard.

- DLA Functional Description
Only the FP16 input is promoted to a higher precision data type (FP17/FP19/FP32). Those data types have higher dynamic range and finer precision even without the denormalize value. Before writing back to memory, data is converted to the fp16 rounding/saturation with a denormalized value.
- Rounding
The NVDLA supports Rounding to Nearest (or RN) in calculations except in the case of overflow. If the result exceeds the maximum normal value, it is clipped to the maximum normalized value.
- Zero
For arithmetic operations except RUBIK, NVDLA follows the IEEE754 standard.
#### 8.1.2.4 Feature Data Format
The NVDLA engine maintains a private data format for all supported hardware layers. The data format is called the feature data format and is generated only by the NVDLA engine itself. All elements of the feature data for a layer are organized as a 3D data cube. The three dimensions are width (W), height (H) and channel size (C). The memory mapping rules are as follows:
- Adds data into the end of the channel if the original data is not ATOMIC_M(32 for DLA2.0)
byte aligned in the C direction. (The attached data must be 0 and +0 when it's U/INT8 and
- FP16 respectively)
Splits the data cube into 1x1xATOMIC_M byte small atom cubes.
- Reorders atom cubes by progressively scanning the data cube. Scanning order: W(line) -> H
(height) -> C (channel). Maps all atom cubes into memory by a scanning sequence. Maps all atom cubes in the same line compactly.
- Atom cube mapping at the line boundary and/or the surface boundary can be either
adjacently or not compactly, but they are always 32-byte aligned. In conclusion, mapping in memory follows the pitch linear format. The order is C’ (32 byte) ->W -> H -> C (surfaces). Here C’ changes fastest and C changes slowest. The Packed Feature Data figure illustrates the feature data mapped compactly into small cubes. If the line or surface of the small cubes is not mapped compactly, it is called unpacked. Refer to the Unpacked Feature Data figure below. The line stride and surface stride of the feature data always align to 32 bytes. The start address has the same alignment as well. This is a mandatory requirement.

- DLA Functional Description
**Figure 8.2 Packed Feature Data**
**Figure 8.3 Unpacked Feature Data**

- DLA Functional Description
A 1x1xC feature data cube can be line-packed and surface-packed. NVDLA should send continuous transactions when surf_stride=line_stride=ATOMIC_M (or OP_ATOMIC_M) to save bandwidth because the length of one read quest can be larger.
#### 8.1.2.5 M-planar Format
M-planar format (NCHW) is an individual format for the NVDLA to communicate with other engines like CPU, GPU, PVA, etc. The calculation-related pipeline, like convolution pipeline, cannot handle this format directly. A dedicated sub-unit in RUBIK is used to do conversion between M-planar and feature data cube. The M-planar format data contains multiple pitch linear memory surfaces (planes). Every surface has the same parameters as width, height, line stride, planar stride. The number of surfaces is corresponding to the channel size of the feature data cube format. The data type residing in these surfaces is one of INT8, UINT8, and FP16. NVDLA requires that the start address and line stride of M-planar format is 32-byte aligned.
#### 8.1.2.6 Pixel Format
The NVDLA engine supports pixel data for the Region of Interest (ROI). The pixel data comes from a part of, or the whole image. The pixel formats are listed in the Pixel Formats and Valid Setting table. Refer to the Pixel Memory Formats chapter for more details. The NVDLA engine supports both pitch linear and block linear for all pixel formats. The height of the GOB is programmable from 1 to 32. When the NVDLA takes an image as input data, there are some limits to the configuration. Channel size. The valid channel size highly depends on each format. Refer to the table below. Input precision. The input precision highly depends on pixel each format. Refer to the table below. DMA logic turns unsigned integer value to signed integer value automatically.
- For any limit on precision conversion, refer to precision conversion table in Precision
Conversion. Line stride of pitch linear is aligned to 64 bytes. The start address of block linear aligns to 256 bytes (half GOB).
- For block linear image, it may have redundant data between 256-byte aligned address and
the first element, w_offset and h_offset are used to indicate how many redundant data are, and the unit of offset is a pixel. w_offset & h_offset are only available for block linear. The value range for h_offset is 0~7..
- Both w_offset and h_offset must be set as 0 for pitch linear

- DLA Functional Description
- Table 8.1 Pixel Formats and Valid Setting
- Format Name
# of planar
- Valid Channel Size
- Setting
- Valid W Offset Range
(only for block linear)
- Precision
T_R8 0~31
- UINT8
T_R10 0~15
- UINT16
T_R12 0~15
- UINT16
T_R16 0~15
- UINT16
T_R16_I 0~15
- INT16
T_R16_F 0~15
- FP16
T_A16B16G16R16 0~3
- UINT16
T_X16B16G16R16 0~3
- UINT16
T_A16B16G16R16_F 0~3
- FP16
T_A16Y16U16V16 0~3
- UINT16
T_V16U16Y16A16 0~3
- UINT16
T_A16Y16U16V16_F 0~3
- FP16
T_A8B8G8R8 0~7
- UINT8
T_A8R8G8B8 0~7
- UINT8
T_B8G8R8A8 0~7
- UINT8
T_R8G8B8A8 0~7
- UINT8
T_X8B8G8R8 0~7
- UINT8
T_X8R8G8B8 0~7
- UINT8
T_B8G8R8X8 0~7
- UINT8
T_R8G8B8X8 0~7
- UINT8
T_A8Y8U8V8 0~7
- UINT8
T_V8U8Y8A8 0~7
- UINT8
T_Y8___U8V8_N444 0~31
- UINT8
T_Y8___V8U8_N444 0~31
- UINT8
T_Y10___U10V10_N444 0~15
- UINT16
T_Y10___V10U10_N444 0~15
- UINT16
T_Y12___U12V12_N444 0~15
- UINT16
T_Y12___V12U12_N444 0~15
- UINT16

- DLA Functional Description
- Format Name
# of planar
- Valid Channel Size
- Setting
- Valid W Offset Range
(only for block linear)
- Precision
T_Y16___U16V16_N444 0~15
- UINT16
T_Y16___V16U16_N444 0~15
- UINT16
#### 8.1.2.7 How to Locate a ROI
An ROI can start by any pixel in an image and the NVDLA must support it. Hardware has a limitation of memory access that requests each address to align to 32 bytes. Therefore, the NVDLA provides a way to cross the gap between them. For pitch linear, the firmware gives the nearest 32 byte aligned address and X offset. For block linear, the firmware gives the nearest 256 byte aligned address and both X and Y offset. The fetch granularity for the block linear is half a block.
#### 8.1.2.8 Weight Format
Unlike pixel data or feature data, weight data is generated before the convolution operation and the
- NVDLA engine never changes them during the operation. Software maps the weight data with
property rules to fit with the calculation sequence in the NVDLA. The original weight data has four dimensions: width, height, channel, and number of kernels. They can construct as a group of 3D data cubes. One data cube is called a kernel. The NVDLA engine supports multiple basic formats of weight data for different operation modes:
- Weight for direct convolution
- Weight for image input
- Weight for deconvolution
- Weight for Tiny-CK
1. 2. 3. 4. There are some mandatory requirements for certain formats:
- Channel pre-extension for image input
Set split for deconvolution. 1. 2. Two additional options for weight formats:
- Channel post-extension for image-in convolution
- Sparse compressing
1. 2.
- Table 8.2 Weight Formats and Options
- Weight Types
- Sparse Compression Option
- Post-Extension Option
- Weight for DC
- Support
- NOT support
- Weight for image input
- Support
- Support

- DLA Functional Description
- Weight Types
- Sparse Compression Option
- Post-Extension Option
- Weight for deconvolution
- Support
- NOT support
- Weight for Tiny-CK
- Support
- NOT support
**Figure 8.4 Original Weight Data**
##### 8.1.2.8.1 Basic Weight for Direct Convolution
- The Basic Weight for direct convolution is the most basic and common weight format. Other
weight formats all extend from this format. The mapping rules of uncompressed weight for direct convolution are: Distribute the kernels into groups. One group has ATOMIC_K kernels. The last group can have fewer kernels. Each kernel group might have multiple KCs (kernel cubes), each KC has ATOMIC_C*ATOMIC_K*R*S elements of weight.
- Divide each kernel to 1x1xATOMIC_C-Bytes small cubes. For int8, the small cube is ATOMIC_C
elements each. Append 0 if the channel size is not divisible by ATOMIC_C(64). After division, all weights are stored in 1x1xATOMIC_C small cubes. Scan the 1x1xATOMIC_C small cubes in a KC with ATOMIC_C->ATOMIC_K->S->R sequence.
- Map the kernel cubes serially. Append any 0s between kernel cube boundaries to make KC
64B aligned. The start address of each kernel group is aligned to 64Bytes as well. The diagram below shows how weights map for direct convolution.

- DLA Functional Description
**Figure 8.5 Weight Mapping for Direct Convolution**
**Figure 8.6 Mapping Example with RxS=3x3**

- DLA Functional Description
##### 8.1.2.8.2 Basic Weight for Image Input
Weight mapping for the image input is similar to weight for direct convolution. The main difference is that the image weight needs an additional channel extension step ahead of the mapping steps for direct convolution weight. The channel pre-extension for image weight is a mandatory requirement, while channel post-extension is an option to improve performance. The channel pre-extension for image weight is different from the channel extension for Winograd convolution. The key idea of per-extension is to turn all weights in the same line to a single channel. The Weight Set Split for Deconvolution figure illustrates an int16 image input whose channel size is 3.
**Figure 8.7 Channel Extension for Image Weight**
The channel pre-extension is the first step for image weight. Then all extended kernels follow the same steps of weight for direct convolution. That is, software must do group and channel distribution after the channel extension.

- DLA Functional Description
##### 8.1.2.8.3 Weight Channel Post-extension for Image Input
Weight channel post-extension is an option to enhance MAC efficiency when channel size is less than 64 (ATOMIC_C). It is available for image input mode only. The key idea of channel post- extension is to combine multiple neighbor lines to saving efficiency. It allows two-line (C_pre-ext <=32) or four-line (C_pre-ext<=16) combination. Software should use four-line to improve CMAC utilization if C_pre-ext <16. Both two and four parameters are available. For image post-extension weight surface, neighbored lines should be separated. For 2-line post-extension, line0 should be stored in low-32B, and line1 should be stored in high-32B. For 4-line post-extension, line0 should be stored in low-16B of first 32B, line1 in high-16B of first 32B, line2 in low-16B of second 32B, and line3 in high-16B of second 32B. If this option is enabled, NVDLA manages to post-extend input image data in CSC sub-units wile software needs to adjust weight mapping order. The channel post-extension is done after pre- extension. The figure below shows a case when the parameter is 2.
**Figure 8.8 Weight Channel Post-Extension (parameter = 2)**
The flow of pre-extension, post-extension, mapping, and compression option for image weight:
- Do pre-extension
- Do post-extension
- Remap weight data
Do weight compression. Some tips for post-extension: Channel post-extension supports (U)INT8. Channel post-extension only support 2-line and 4-line. If weight height is not divisible by two (2-lines) or four (4-lines), append 0s.

- DLA Functional Description
##### 8.1.2.8.4 Basic Weight for Deconvolution
Deconvolution is the opposite operation of convolution. Refer to the Deconvolution section for more details. In the DLA architecture deconvolution is a software feature. From a hardware perspective, it consists of a series of convolution layers and a contract layer running on the RUBIK unit.
- The number of convolution layers to support one deconvolution layer is (deconv_x_stride *
deconv_y_stride). So, we need to separate the original weight map into multiple weight maps. This step is called weight split. Before weight split, we have one extra step to do. Unlike convolution, channel size of input feature cube does not match with weight channel but weight kernel. We need to transpose Channel and Kernel of original weight data. Suppose original parameters are: After set split, we will have (deconv_x_stride * deconv_y_stride) sets of weight kernels as well as convolution layer number. Each set has K kernels. And size of one kernel is: The figure below shows how to do a weight split to one kernel.

- DLA Functional Description
**Figure 8.9 Weight Set Split for Deconvolution**
In the case above, finally we have four sets of weight kernels. The following steps to map weights for deconvolution are similar to direct convolution: Distribute each set of kernels into groups. Each group contains ATOMIC_K kernels. Divide each kernel to atomic cubes. Append 0 if channel size is not divisible by ATOMIC_C. After division, all weights are stored in 1x1xC' small cubes, where C' is 32 bytes.
- Scan the 1x1xC' small cubes in a group with C'->K->S->R->C sequence. Map them compactly
as a scanning sequence. Map the weight groups serially. Append any 0s between group boundaries. Append 0s at end of all mapped weight to align to 32 bytes.
- The figure below shows how weight maps inside one kernel group. Note the reversed order of
kernel mapping comparing to the Channel Extension for Image Weight figure.

- DLA Functional Description
**Figure 8.10 Weight Mapping for Deconvolution Inside One Group**
##### 8.1.2.8.5 Weight for Group Convolution
Weight for group convolution is an option to enhance MAC efficiency when GROUP_SIZE is less than ATOMIC_C. It is available for feature input mode only. Weights for group convolution mode are divided into kernel groups. One kernel group has ATOMIC_K kernels, the last kernel group can have fewer kernels. ATOMIC_K kernels are packed into ATOMIC_K/GROUP_SIZE kernels, as shown in the diagram below. The scan order is: ATOMIC_C->group_size->R*S->KG

- DLA Functional Description
**Figure 8.11 Weight Mapping for Group Convolution, GROUP_SIZE=8,INT8**
**Figure 8.12 Weight Mapping for Group Convolution, GROUP_SIZE=8,INT8(ATOMIC_C-**
>group_size->R*S)

- DLA Functional Description
##### 8.1.2.8.6 Weight Compression
- To reduce the bandwidth and power consumption on the memory interface, the NVDLA engine
supports the weight sparse compression option. All four weight formats which compose of weight for DC, weight for the image as input, weight for image post extension, and weight for group convolution, can support sparse compression. The sparse algorithm uses sparsity patterns to indicate which weight elements are zero or not. There are five kinds of patterns in total: 4:0/4:1/4:2/4:3/4:4. The definition of sparsity patterns (SP) in MC/UB may be different from what is in CBUF, which means that WCDMA may need to convert the SP before writing into CBUF. They are described in the table below:
- Table 8.3 Sparsity Pattern in MC/UB and CBUF
Sparsity patterns of one kernel cube compose a sparsity pattern group, or sparsity pattern. SPs reside in a dedicated memory surface. 0 values can be removed from the original weight memory surface, which is called compressed weight (CW). The total size of the CW surface is defined in registers which are configurable by software. The steps of weight compression are: Use four bits of SP to indicate four elements, no matter what the precision is. Compress weight KC by KC. Assembly of bits for one KC is called SP. The bits in SP are stored as little-endian.
- Align one KC SP to 64-byte. Align the SP surface to 64-byte by adding 0 bits in the end
Remove all 0 weights in original surface and pack them compactly. Align one KC CW to 64-byte. Align the CW surface to 64-byte by adding 0s in the end. Store SP and CW into two separated memory surfaces in MC/UB.

- DLA Functional Description
##### 8.1.2.8.7 Weight for Tiny-CK
- The weight format of C=64/64+ && K=32 is just as same as deconvolution, but the format of
weight for ARS=2 is different from deconvolution, it's scan order within one KC is ATOMIC_M->R*S- >ATOMIC_K, the diagram below is an example with RxS=3x3:
##### 8.1.2.8.8 Weight for FP16 DC
Software configures the weight into the data format below. The weight is divided into multiple kernel groups and each kernel group has 32 kernels. The same position of the different kernel is in the neighbor address of UB/MC. For example, the (0,0,0) of kernel 1 and (0,0,0) of kernel 2 is adjacent in UB/MC. Besides, the start address of weight data of different kernel groups is aligned into 64B. The weight data of a kernel group is tightly arranged in the UB/MC.

- DLA Functional Description
##### 8.1.2.8.9 Weight for FP16 Depthwise
For the algorithm of depthwise, the channel of each kernel must be 1 and the ATOMIC_K is 16. The start address should be 64B aligned.
#### 8.1.2.9 Falcon
A NVIDIA proprietary Falcon microcontroller is embedded in the NVDLA engine. Falcon takes care of host interactions including:
- Class write: Falcon responses for translating driver configurations into NVDLA internal
register configurations. Register read and write: Falcon forwards register accessing to NVDLA internal registers. Context switches. It also is responsible for error handling, and sending interrupts and fault reports to external units. The SoC memory system interfaces with client engines via AXI compatible protocol. FALCON core and DMAs in NVDLA_CORE adopt GPU FB-like interface for memory accessing. A bus interface module named AFBIF is used for protocol conversion.

- DLA Functional Description
**Figure 8.13 Falcon Block Diagram**
- Table 8.4 NVDLA Falcon Parameters
- Feature
- Value
- DMEM size
64KB
- IMEM size
32KB
- PC size (IMEM tag size)
16MB
- CSB size
16MB
- PRIV address space size
18bit
- Falcon core version
- Falcon6
- High secure Falcon
- No
- Light secure Falcon
- Yes (tied to NO secure when embedded)
- Debug PRIV interface needed
- No (jtag2falcon is removed in Falcon)
- Security coprocessor needed
- No
- FBIF needed
- No
- AFBIF needed
- Yes
- AFBIF AXI wdata bit width
- AFBIF AXI rdata bit width

- DLA Functional Description
#### 8.1.2.10 Convolution Operations
Convolution is the core function in the NVDLA and there are several convolutional operations, such as direct convolution, De-convolution, 3D convolution, and so on.
##### 8.1.2.10.1 Direct Convolution
For the convolution pipeline, it always has two parts of the input. One is input activation data, the other is weight data. The output of convolution operation is also a 3D data cube. An example of input parameters:
- Size of feature data cube: WxHxC
- Size of one weight kernel: SxRxC
- Total kernel number: K
- Zero padding size: LP stands for the left boundary, RP stands for the right boundary, TP
stands for the top boundary, BP stands for the bottom boundary.
- Convolution stride: SX stands for the stride in the X dimension, SY in the Y dimension
- Dilation: DX in X dimension, DY in the Y dimension
- Size of output data cube: W'xH'xC'
**Figure 8.14 Convolution Operation**
##### 8.1.2.10.2 Atomic Operation
The atomic operation is the basic step of direct convolution. In one atomic operation, each MAC cell caches one 1x1xATOMIC_C weight cubes from an individual weight kernel. ATOMIC_K MAC cells cache weights from ATOMIC_K kernels (int8). One 1x1xATOMIC_C atomic cube of feature data shares by all MAC cells. The output of each MAC cell is called partial sum. This operation takes one cycle to finish the calculation and gets the ATOMIC_K partial sums. Partial sums are sent to convolution accumulator module for further calculation.

- DLA Functional Description
##### 8.1.2.10.3 Stripe Operation
A stripe operation combines a group of atomic operations from several convolutions. During one stripe operation, the weight data in the MAC cell array is unchanged. The partial sums in one stripe operation cannot be added together. The maximum length of the stripe operation for deconvolution is 80 (is 64+16). The figure below shows an example of a stripe operation which contains two atomic operations. The padding size is 0 in this case.

- DLA Functional Description
##### 8.1.2.10.4 Block Operation
Block operation is a higher level to stripe operations. During block linear, each kernel in the kernel group uses RxSxATOMIC_C weight elements. A small cube of input feature data shifts properly, to guarantee that the results can add together across stripe operations.

- DLA Functional Description
##### 8.1.2.10.5 Channel Operation
Channel operation is an even higher-level operation. It includes (C+ATOMIC_C-1)/ATOMIC_C block operations. The block operations in one channel operation are similar, except the coordinate of channel direction is different.

- DLA Functional Description
##### 8.1.2.10.6 Group Operation
Group operation is a higher-level operation than channel operation. It includes ceil((dataout_height
- dataout_width) / stripe_size) channel operations. After a group operation, the output data
composes a P x Q x K' output surface. Here K' refers to kernel size in a kernel group.
##### 8.1.2.10.7 Output Sequence
The sequence mentioned in each operation is mainly for input feature data and weight data, but not the output sequence. The output data sequence is quite simple. It follows the order of C'(ATOMIC_K)->W->H->K. The output order of direct convolution is consistent with feature memory mapping order.
##### 8.1.2.10.8 Deconvolution
In NVDLA architecture, deconvolution is achieved by a convolution HWL and a RUBIK. Deconvolution is also known as Transposed Convolution. From a hardware perspective, a software deconvolution layer consists of a serial convolution layer and a contract layer supported by the RUBIK unit.

- DLA Functional Description
##### 8.1.2.10.9 Dilation
Dilation is an option that enlarges the kernel in R and S dimensions with zero values. This function is enabled by software according to the algorithm.
##### 8.1.2.10.10 Convolution with Image Input
- NVDLA supports convolution with image data. Here image data could be a part or whole image
surface. However, NVDLA can support it for a convolution operation. DC and deconvolution layers cannot use pixel formats as input. Besides, the multi-batch option is not supported for image input.
##### 8.1.2.10.11 Multi-Batch Mode
- The NVDLA engine also supports multi-batch to enhance the performance and reduce the
bandwidth for DC, especially FC (fully-connected) layers that the output of one FC layer is a 1x1xC data cube. This means all weights in one FC layer are used only once and performance is bound at weight fetching. In multi-batch mode weights can be reused for multiple times and MAC utilization can be increased.
#### 8.1.2.11 Convolution Working Modes for Convolution
There are three working modes of CPIPEs for the convolution layer: CONV_N mode, CONV_K mode, and CONV_P mode. Some CPIPEs can be disabled and others can be enabled in all three modes. The first enabled CPIPE must be CPIPE0 and all the CPIPEs enabled must be contiguous. Software is responsible for deciding how many CPIPEs are enabled. The relationship between BROADCAST/ NON-BROADCAST and convolution mode is depicted below.
- Conv_mode
- FCDMA
- WCDMA
- SDP(PDP)/SDP_OP
- Group conv
- Non-Broadcast (split-C)
- Non-Broadcast (split_K)
split_C
- Conv_p
- Non-Broadcast (Separate)
- Broadcast (share)
- Seperate
- Conv_N
- Non-Broadcast (split_H)
- Broadcast (share)
split_H
- Conv_K
- Broadcast (share)
- Non-Broadcast (split_K)
split_C, if (online mode) share, if (offline mode)
- Not defined(invalid)
- Broadcast (Share)
- Broadcast (Share)
- Share
Separate means that two CPIPEs each have their own cube.
- Share means two CPIPEs use same cube
- Split_K means the cube is divided according to the kernel direction
- Split_C means the cube is divided according to the channel direction

- DLA Functional Description
- Split_H means the cube is divided according to the height direction
##### 8.1.2.11.1 CONV_N Mode
In this mode, the output cube is divided into CPIPE_NUM partitions in the Height direction. Each
- CPIPE produces one part of the output cube. Some data in input data cube may be used by
multiple CPIPEs. So, the output of current layer may be written to neighbor CPIPES. The destination can be CBUF, UBUF, or MC.
##### 8.1.2.11.2 CONV_K Mode
In this mode, the output cube is divided into CPIPE_NUM partitions in the Channel direction. Each CPIPE produces one partition of the output cube. The input data cube is shared by all CPIPE_NUM CPIPEs. However, they use different weight kernels.
##### 8.1.2.11.3 CONV_P Mode
CONV_P (Parallel) mode is very similar to CONV_N mode. The only difference is that in In CONV_P mode, the BP/TP/LP/RP size, width, and height must be the same for each CPIPE.
##### 8.1.2.11.4 Group Convolution
NVDLA2.0 supports group convolution only with feature inputs, besides, C must be equal to K, and C must be multiple of GROUP_SIZE.
##### 8.1.2.11.5 Structured Sparsity Convolution
Structured sparsity convolution is very like the DC except that there is a special restriction for its weights, and the restriction is “No more than two non-zeros for every four weight coefficients in C dimension.” We can leverage this restriction to save weight load bandwidth, moreover, we can get a 2x performance boost.
##### 8.1.2.11.6 Tiny-CK Convolution
Tiny-CK convolution stands for the convolution operation whose C or K is less or equal 32.
#### 8.1.2.12 CDMA
For all of CPIPEs, there is one Code Division Multiple Access (CDMA) unit which consists of two sub-logic: the left one serves CPIPE0 and the right one serves CPIPE1 (Assuming CPIPE_NUM=2). It reads feature and weight data from UBUF or MCIF and writes to CBUF. The supported input formats are listed below. All of them can be in UBUF or MC which is specified by internal registers.

- DLA Functional Description
- Pixel data
feature data
- Uncompressed weight
- SP
- CW
- CDMA also decompress the compressed weight and write decompressed weight to CBUF. Pixel
data and feature data share one read client channel to MCIF or UBIF. Uncompressed/compressed weight, SP and CW shares one read client channel to MCIF or UBIF. Convolution DMA sends read requests only. All requests sent by FCDMA are 32-byte aligned, and all requests sent by WCDMA are 64-byte aligned, the start address in CB for weight is 64B aligned as well.
#### 8.1.2.13 Convolution Pipeline (CPIPE)
- There are total CPIPE_NUM*ATOMIC_C*ATOMIC_K MACs in NVDLA 2.0. These MACs are divided into
- CPIPE_NUM CPIPEs and each CPIPE contains ATOMIC_C*ATOMIC_K MACs in CMAC. For the later
sections, we will use INT8 as an example (ATIMOC_K/C are 32/32) to facilitate description.
- One CPIPE also contains CBUF, CSC, CACC, and SDP. CBUF stores feature and weight data. CSC
reads feature and weight from CBUF and feeds them to CMAC. These CPIPEs work independently except that the result of the current CPIPE may be written to neighbor CPIPEs. Three different kinds of operations can be performed in CPIPE. 1. 2. 3.
- Pooling
- Convolution
- SDP stands alone
The write arbitration logics to CBUF are instanced in CARB, and the write arbitration logic to SDP is instanced in SDP. The interrupt is generated by SDP.
- Within CPIPE, there are three OP_ENs (CPP/CACC/SDP) to be configured by software, to save
verification effort, the order of configuring OP_ENs is fixed. Software must ENABLE SDP first, then enable CACC, then CPP. There are multiple pipeline stages in the convolution pipeline, the OP_EN programming sequence has to be in reverse order. Software must enable CACC before enabling CPP because the protocol used between CSC and CACC is valid-credit, the protocol used between CSC and CMAC is valid- only.

- DLA Functional Description
#### 8.1.2.14 Super Data Processor
- Super Data Processor (SDP) is responsible for element-wise operations (ADD, SUB, MAX, MIN,
PROD), activation (ReLU, PReLU, Sigmoid, Tanh, etc), Pooling, and normalizations (LRN, Full-channel normalization, Full-tensor normalization, Batch Normalization, Scale, etc.). From a functional point of view, SDP supports functional layers below:
- Eltwise Layer – MAX/MIN/SUM/PROD operations are supported
- Batch Normalization
- Scale Layer
- Bias Layer
- ReLU, Clamped ReLU
- PReLU
- Precision conversion
- EQL mode
- LRN Layer (Local Response Normalization)
- Normalization Layer
- LUT based activations (e.g., Sigmoid, eLU, TanH, etc.)
- Precision conversion
- Pooling Layer
- Clip_bottom, Clip_up
- Layer Name
- Network
- Hardware Functional Unit
- LRN Layer
AlexNet, GoogLeNet, etc.
- SSU+LUT+MUL
- Normalization Layer
- SSD
- SSU+LUT+MUL
- Eltwise Layer
ResNet, etc.
- OP or MUL
- Batch Normalization Layer
ResNet, etc.
- OP + MUL
- Scale Layer
- ResNet, DriveNet_v7_Apollo, DenseNet,
etc.
- MUL
- Bias Layer
DriveNet_v7_Apollo, etc.
- OP
- ReLU
AlexNet, GoogLeNet, ResNet, etc.
- CLIP
- Clamped ReLU
DriveNet, etc.
- CLAMP
- PReLU
ResNet, etc.
- MUL
- LUT based activation
RNN, LSTM, etc.
- LUT+SPIN_SUM
- SoftMax
AlexNet, GoogLeNet, ResNet, etc.
- LUT+SPIN+MUL
- Pooling
AlexNet, GoogLeNet, ResNet, etc.
- PDP + MUL (if average pooling)

- DLA Functional Description
##### 8.1.2.14.1 PDP
Planar Data Processor (PDP) is a sub-unit of SDP which is designed to handle pooling layer with max/min/mean pooling methods supported. Several neighboring input elements within a width x height plane will send to a non-linear function to compute one output element.
#### 8.1.2.15 Unified Buffer
The Unified Buffer (UBUF) is a tightly coupled local memory inside Deep Learning Accelerator (DLA). The UBUF memory is composed of four banks of SRAM. Each bank has one read port and one write port. The entry size is 64-Byte. The entry number in a bank is configurable and current number is 4096. UBUF is deployed with two read ports and two write ports, each is 64-Byte of width. The UBUF access address should be always 64-Byte aligned. Banks are selected by address[7:6].
- For read access, the minimum unit is an ATOMIC_M. For write access, the minimum unit is an
- ATOMIC_M, there is a strobe to indicate the write portion in an entry. The lower ATOMIC_M
bytes and higher ATOMIC_M bytes in one entry can be read or write separately by two different clients in one cycle. If bytes in one ATOMIC_M are read and written simultaneously in one cycle, the read data is unpredictable. So software has to make sure there is no overlap between surfaces.
##### 8.1.2.15.1 UBIF
- UBUF communicates with DLA components through two Unified-Buffer-Interfaces (UBIFs). Each
UBIF takes two read ports and two write ports of UBUF and serves several clients. Interfaces between UBUF and UBIF, UBIF and clients, are all in 64-Byte width. Client to UBIF request should not cross the 256-Byte boundary and the start address and size should always be ATOMIC_M aligned. Since the address alignment of client-> UBIF request and UBIF-> UBUF request are different, UBIF is responsible to generate strobes for client requests according to request address and size for UBUF access.
#### 8.1.2.16 Bridge DMA
- Bridge DMA (BDMA) is an engine that moves data from memory to memory. The BDMA source and
destination memory can be either UB or DBB. If there is overlap between source and destination memory range, the behavior is undefined.
- The BDMA interface is 64-Byte in width. The BDMA to memory request address is always
- ATOMIC_M aligned. The maximum memory request size of BDMA is
MEM_PREFERED_ACCESS_SIZE. Maximum throughput of BDMA is 64-Byte per cycle.

- DLA Functional Description
#### 8.1.2.17 RUBIK
- The RUBIK module is similar to BDMA. It transforms data mapping format without any data
calculation. RUBIK interface is 64-Byte in width. The RUBIK to memory request address is always
- ATOMIC_M aligned. Maximum throughput of RUBIK is 64-Byte per cycle. The maximum memory
request size is MEM_PREFERED_ACCESS_SIZE. RUBIK has four working modes: 1. 2. 3. 4. contract data cube split feature data cube into multi-planar formats merge multi-planar formats to data cube shrink a series of feature cubes in 2D feature format to one feature data cube
**Figure 8.15 RUBIK Diagram**
##### 8.1.2.17.1 Contract Mode
A software deconvolution layer uses several hardware layers or two phases. Phase 1 generates results via the convolution pipeline. Phase 2 is the contract mode by RUBIK. Normally, a software deconvolution layer has deconvolution x stride and y stride that are greater than 1, and with these strides, the output of the Phase 1 hardware layer is a channel-extended data cube. The contract mode in RUBIK transforms the mapping format to de-extend the cube.

- DLA Functional Description
**Figure 8.16 Contract Mode in RUBIK**
##### 8.1.2.17.2 Split and Merge Mode
Split and merge are two opposite operation modes in RUBIK. Split transforms a data cube into M- planar formats (NCHW). The number of planes is equal to channel size. Merge transforms a serial of planars to a feature data cube. RUBIK supports (U)INT8 and FP16 data formats. Each planar contains only one channel data or single element. The line stride, surface stride and planar stride of all planars (M-planar) shall be 0 or align to 32-Byte.
**Figure 8.17 Split and Merge Modes in RUBIK**

- DLA Functional Description
- Shrink Mode in Rubik
Shrink operation transforms a series of feature cubes in 2D feature format to one feature data cube. The transform is shown in the figure below. It's used to squeeze out the redundant data in channel direction of input cubes. For example, when CBUF is too small to store kernels of one kernel group, split-K may be used in software and shrink mode can be used to merge output data cubes.
##### 8.1.2.17.3 Concat Mode in Rubik
Concat mode concatenates two feature cubes of 2D feature format to one feature data cube. These two feature cubes have same width, height, and data precision. The dummy data after the valid data in the first cube is dropped. The operation is shown in the figure below. The first cube's channel size is M bytes. The second cube's channel size is N bytes. The valid range of M is M>0 and N>=0. M and N can be larger than 32 Bytes. The space in the last surface after valid data shall be filled with zero when writing to output cube.

- DLA Functional Description
##### 8.1.2.17.4 DWP for Depthwise Convolution in Rubik
- NVDLA2.0 implemented dedicated hardware sub-unit (depthwise processor, DWP) to support
depth-wise convolution. DWP shares the memory ports of Rubik. The depthwise layers with below parameters are supported. When performing depthwise convolution, the input feature can be int8, uint8 or FP16, precision of weight has to be FP16. The precision of output feature of DWP is FP16. kernel_size
- Stride
- Pad
3x3 0/1 3x3 0/1 5x5 0/2 5x5 0/2

- DLA Functional Description
##### 8.1.2.17.5 DWP for Direct Convolution in Rubik
- DWP also supports direct convolution. The convolution layers with below parameters are
supported. When performing direct convolution in DWP, the precision of input feature, output feature and weight must be FP16. kernel_size
- Stride
- Pad
R <=32 S <= 32 [1,32] [0,31]
#### 8.1.2.18 GP and CFGDMA
Graph processor (GP) and Config DMA (CFGDMA) cooperates together to schedule hardware layers on sub-units. Each sub-unit reports its state (programmed, enabled, completed etc.) and layers index it depends on for the currently programmed layer to GP. GP can enable the engine as soon as all the dependencies for currently programmed layer are resolved. CFGDMA is under the control of GP. It fetches configuration of each layer and programs the sub- units.
##### 8.1.2.18.1 Sub-Units
The table below lists all the sub-units in NVDLA. Other columns are for CSB registers, dedicated hardware layer which contains OP_EN register, and interrupts to GLB.
- Table 8.5 NVDLA Sub-units
- Sub-Unit
- CSB Registers
- OP_EN
- Interrupt to GLB
- FALCON
Y (Not accessible by CSB_MASTER) N -
- CSB_MASTER
N N -
- CINFO0
N N -
- CINFO1
N N -
- CBUF0
N N -
- CBUF1
N N -
- CARB0
N N -
- CARB1
N N -
- CPIPE_CTRL
N N cpipe
- BDMA
Y Y bdma
- RUBIK
Y Y rubik

- DLA Functional Description
- Sub-Unit
- CSB Registers
- OP_EN
- Interrupt to GLB
- MCIF0
Y N -
- MCIF1
Y N -
- UBIF0
Y N -
- UBIF1
Y N -
- UBUF
N N -
- GLB
Y N -
- SDP_OP_RDMA0
Y Y -
- SDP_OP_RDMA1
Y Y -
- FCDMA
Y Y cdma_data
- WCDMA
Y Y cdma_wt
- SDP0
Y Y -
- SDP1
Y Y -
- CPP0
Y Y -
- CPP1
Y Y -
- CACC0
Y Y -
- CACC1
Y Y -
- CMAC0
N N -
- CMAC1
N N -
- GP
Y Y
- See GP->GLB
- CFGDMA
Y Y slot_done, slot_available
#### 8.1.2.19 Interface Between UBIF/MCIF and their Clients
The data bus width is XXIF_BUS_WIDTH on the interfaces between UBIF/MCIF and their clients. The request size should be multiple of ATOMIC_M. The maximum request sizes between clients and
- UBIF/MCIF are defined as MEM_PREFERED_ACCESS_SIZE. It's better for sub-units to send
- MEM_PREFERED_ACCESS_SIZE size requests to MCIF and UBIF as much as possible because of
performance. The request can't cross boundary of MEM_PREFERED_ACCESS_SIZE. If the request crosses 64Bytes boundary, UBIF or MCIF will split them into 64-Byte or 32-Byte requests and each request doesn't cross boundary of MEM_PREFERED_ACCESS_SIZE. Valid-ready protocol is used. For the alignment of request address:
- Request address is aligned to 32B

- DLA Functional Description
- Request size is multiple of 32B
- No strobe signals for write
- Mask signals for read return data
#### 8.1.2.20 Interrupts of Sub-Units
CPIPE safety error interrupt is triggered when di/dt (rate of change of current) is enabled and the result is a mismatch between MAC Cells. This interrupt is sent to GLB only. Other interrupts must be sent to GLB or GP in the order of programming hardware layers. The interrupt of one layer can't be sent to GLB or GP before the interrupt of previous layer in one sub- unit. (This is guaranteed by each sub-unit hardware). When one sub-unit (except WCDMA) triggers an interrupt, it has to guarantee the memory and status registers have been updated. The CPIPE done interrupt can't rise before FCDMA interrupt and WCDMA interrupt.
#### 8.1.2.21 Layer Switch
During layer switch, if there is data dependency between the current layer and previous layer, op_en can be only set by software when write response done (wrd) is received and the interrupt is triggered. In this case, Falcon needs about 140 cycles to handle the interrupt. If there is no data dependency, the switch can be performed when op_en is set and write done (wd) is received. In this case, the op_en bit can be set earlier before interrupt. Because there is no bit indicating whether there is data dependency or not, hardware has to use the conservative method of checking both write response done is received and op_en is set before switch. To save the time on interrupt handler, a register SWITCH_MODE is added to some sub-units: 1'b0 (FAST_SWITCH): switch and start execute next layer when write done and op_en is set 1'b1 (SAFE_SWITCH): switch and start execute next layer when write response done and op_en is set
- For units which supports configurable switch mode, if there's data dependency between the
current layer and next layer, set the SWITCH_MODE of the current layer to SAFE_SWITCH. Otherwise, set SWITCH_MODE of the current layer to FAST_SWITCH for better performance. Software can always set the OP_EN of the next layer to 1 despite the interrupt status of current layer. For units that don't support configurable switch mode, they adopt FAST_SWITCH mode and software has to take care of the OP_EN setting accordingly. The switch mode requirement for each engine is listed below:
- Engine
- Safe Switch
- Fast Switch
- SDP
- Yes
- Yes
- Rubik, DWP, cfgdma
- No
- Yes

- DLA Functional Description
- Engine
- Safe Switch
- Fast Switch
- GP, BDMA*
- Yes
- No
- Note that BDMA is a little bit tricky since it has two-switch behavior:
1.
- Slots switch within group: We use fast switch, however, if there are src_ram_type change
between slots, we'll wait for one slot done then switch to another group. This is to avoid an out-of-order data response which may cause functional error.
- Group to group switch: Always switch to another group when write_ack triggered (safe
switch) to save design effort on the interrupt out-of-order handling. 2.
#### 8.1.2.22 Latency Buffers
- The formula to calculate the size of latency buffer is Latency*throughput = Latency*min
(in_throughtput, out_throughput). in_throughtput is the input data size per cycle of the datapath. out_throughput is the capability of data processing in datapath. In MaxP (emcclk is 800 MHz) use cases, the read latency of MCIF0 or MCIF1 is 1600 cycles and the read bandwidth of MCIF0 or MCIF1 is 22GB/s. For UB, latency of UB is 16 cycles and in_throughput is 64GB/s. The size of latency buffer in sub-units are listed below. MC latency is used to calculate the size of latency buffers. The design has to make the size configurable. The latency buffers are located and managed in sub-units, not in UBIF or MCIF.
- Table 8.6 Size of Latency Buffers
- Sub-Unit
- Size
- Latency*Throughput (Byte)
- Comment
- RUBIK
74KB
- MC: 1600*min(22, 32)*2*1.08
- RUBIK is connected to both MCIF0
and MCIF1.
- BDMA
37KB
- MC: 1600*min(22, 64)*1.08
- SDP_OP_RDMA0
37KB
- MC: 1600*min(22, 32)*1.08
- SDP_OP_RDMA1
37KB
- MC: 1600*min(22, 32)*1.08
- WCDMA SP
29.5KB
- MC: 1600*8*1.08*2*1.08
- First 1.08 is the typical frequency in
GHz.
- WCDMA_SP is connected to both
MCIF0 and MCIF1.
- WCDMA CW
74KB
- MC: 1600*min(22, 64)*2*1.08
- WCDMA_CW is connected to both
MCIF0 and MCIF1.

- Programmable Computer-Vision Accelerator (PVA)
## 8.2 Programmable Computer-Vision Accelerator
(PVA)
### 8.2.1 Overview
The Programmable Vision Accelerator (PVA) is an application-specific instruction vector processor that targets computer-vision, Advanced Driver Assistance Systems (ADAS), autonomous driving, along with virtual and mixed reality applications. These are some key areas where PVA capabilities are a good match for algorithmic domains that need to have a predictable processing capability, at low power and low latency. PVA is a critical component of the Computer Vision (CV) subsystem which also contains an ISP engine, the CPU, GPU, and hardware accelerators like NVDLA (NVIDIA's Deep Learning Accelerator), VIC (for LDC), and NVENC (for optical flow). A PVA cluster has the following components:
- Two Vector Processing Units (VPU)
- Two DMA Controllers
A Cortex-R5 based control subsystem A dedicated 1 MiB RAM L2 Buffer
#### 8.2.1.1 Vector Processing Unit
Each Vector Processing Unit (VPU) has a vector core, an instruction cache, and an access to three vector data memories (3 x 128 KiB). The VPU has a single instruction stream with Very Long Instruction Word (VLIW) slots for both scalar and vector instructions. Vector instructions provide bulk of the processing power while scalar instructions are used for parameter preparation and conditional operation.
#### 8.2.1.2 Decoupled Lookup Unit (DLUT)
To offload VPU from processing parallel table lookup with replication, PVA added a decoupled table lookup unit that interacts with VPU to offer higher throughput lookup operations with minimal memory bank conflicts. The DLUT can operate concurrently and in parallel with the VPU process pipeline.
#### 8.2.1.3 DMA Controller
Each DMA has the following features:

- Programmable Computer-Vision Accelerator (PVA)
5-dimensional addressing (block width, block height, and three outer iteration dimensions that can be mapped to horizontal block stepping, vertical block stepping, and depth stepping) A pool of 64 DMA descriptors 16 independent hardware engines (channels) 32 hardware and software events to trigger the DMA channels. Hardware events are driven from local VPU events and DMA channels. Software events can be initiated by the local Cortex-R5 core.
- Circular addressing on both external memory and local memory
- Software sequencing (Software linked descriptors)
- Hardware sequencing for fetching and storing frame data
#### 8.2.1.4 Cortex-R5 Subsystem
A Cortex®-R5 RISC CPU core configures, controls, and monitors VPU and DMA tasks that are needed for PVA functions. The Cortex-R5 processor runs an RTOS and interacts with host CPU and other CV system engines including ISP, hardware accelerators (NVENC), GPU, and NVDLA. The Cortex-R5 subsystem includes an instruction cache, a data cache, and tightly coupled memory (TCM). The subsystem also has other peripheral blocks that are mapped to the PVA cluster address space. These blocks include: A mailbox for asynchronous communications with other PVA control back-bone (CBB) masters A host controller synchronization block A central safety and event controller for error and event aggregation/generation A Network-on-Chip (NoC) for interconnect access An interrupt controller for internal and external interrupts with a global timestamp control A set of general purpose watchdog timers A debug block to handle DFD A local power management block for handling clock and reset control. The block is placed in PVA for local reset and clock gating control for some PVA units.

- Programmable Computer-Vision Accelerator (PVA)
**Figure 8.18 PVA Block Diagram**
#### 8.2.1.5 Feature List
- Feature Category
- Features
- Feature Description
- Vector Processor
- Two VPUs + Two VMEMs
- Main vector engine for PVA cluster
- DLUT
- Two DLUT units
- Decoupled Lookup Unit
- Control and Monitor
- Processor
- Cortex-R5 + TCM
- For scheduling, safety control, and scalar operations
- DMA
- Two DMA engines
- To move data between VMEMs, TCM, MMIO, CVNAS,
and memory controller (MC)
- Local interface
- Local data backbone interconnect
512/256/64-bit for data
- Local MMIO interconnect
32 bit for control
- Cluster Clients
- Security SCRs
- NV Security
- Watchdog Timers
3-level expiry
- Mailboxes
- For communication with other SoC masters
- Interrupt controller
- AVIC

- Programmable Computer-Vision Accelerator (PVA)
- Feature Category
- Features
- Feature Description
- ACTMON
- Activity Monitor x16
- PPM block
- Power management
- Local Buffering
- Scratchpad memory per VPU
3x 128 KB
- Scratchpad memory banking
3x 32 banks x 16-bit
- Safety
- ECC/parity for critical large
memories + parity for data and control + MISR (CRC check on AXI) for permanent faults
- Functional safety. Refer to the Safety Manual for
more details.
#### 8.2.1.6 Application Space Examples
PVA is intended for semi-dense or dense regular computation, even on small data sets, which need predictable run-times with low latency. PVA has built-in multi-dimensional addressing support, that facilitates iterative tasks that require addressing for: 2D: image geometry 3D: point cloud processing
- ROI processing: Volumetric integration
#### 8.2.1.7 CV-PVA Subsystem Top Level Integration
There is one PVA integrated in the CV subsystem. PVA is a Host Controller engine and the MMIO path allows communication or synchronization with other SoC masters.
### 8.2.2 PVA Functional Description
#### 8.2.2.1 PVA Interconnect
PVA has MMIO control interconnect and data backbone interconnect. The interconnect has the following features:
- Transaction Timeout for each target
- Error reporting
- Parity protection for control registers
- Safety error detection and reporting
- Read interleaving
- WRAP to INCR conversion for MC1

- Programmable Computer-Vision Accelerator (PVA)
#### 8.2.2.2 PVA Boot Sequence
PVA goes through the same boot sequence after any of CV rail gating, PVA power gating, or PVA reset. All PVA configuration registers are contained in PVA cluster and upon reset all contents assume default values. The bootloader needs to reprogram all required configuration space as described below. After the boot-load process, the PVA Cortex-R5 runs the PVA image.
##### 8.2.2.2.1 Vector Processor Subsystem Description
The VPU core is a vector SIMD VLIW DSP optimized for computer vision. It fetches instructions through the I-cache and accesses data through the vector memory (VMEM). Major components inside the VPU core are:
- Processor front end: including config/status interface and PC control
- Scalar register file
- Vector register file
- Scalar unit: with two scalar ALUs
- Vector unit: with two vector ALUs
- Memory unit: with three load/store units and address generators
The VPU instruction format is seven-way VLIW, consisting:
- Two scalar operation slots
- Two vector operation slots
- Three memory slots
Each instruction is encoded in 32-bits, and the instruction encoding supports variable-length instructions, thus each execution packet contains between one and seven 32-bit words. The compressed instruction stream is decompressed to full seven instructions per packet and dispatched to the scalar, vector, and memory units. The front end of the processor includes an interface to the instruction cache, 2-level hardware loops, and the fetch/decode stages of the processor pipeline.
- Scalar Unit
The scalar unit supports conventional scalar RISC instruction set. There is a 32-entry, 32-bit, scalar register file. The scalar unit supports two scalar operations per cycle. 32-bit integer/fixed-point as well as 32-bit floating point Add, Sub, Mul, and MAdd operations are supported. Other floating-point operations are emulated in software.

- Programmable Computer-Vision Accelerator (PVA)
- Vector Unit
The vector unit supports various vector processing instructions. There is a 32-entry, 384-bit, vector register file. The vector unit supports two vector operations per cycle. Vector Register File (VRF), processing, and load/store instructions have notion of lane partitioning according to data type. The following data types are supported:
- Word, VRF, and processing as eight lanes x 48-bit, load/store as eight lanes x 32-bit
- Half-word, VRF, and processing as 16 lanes x 24-bit, load/store as 16 lanes x 16-bit
- Byte, VRF, and processing as 32 lanes x 12-bit, load/store as 32 lanes x 8-bit
Various arithmetic/logic operations are implemented in the vector unit. In addition to conventional arithmetic/logic operations. Only integer/fixed-point operations are supported.
- Load/Store Unit
The load/store unit supports up to three load/store instructions. Word, half-word, byte, and some type promotion/demotion are supported. For load (and not for store), both signed/unsigned flavors are supported. Source and destination can be single scalar register, double scalar register, single vector register, or double vector register. Quad-vector-register store is also available to facilitate key filtering benchmarks. Load/store unit also supports various data distributions. In general, memory transactions from load/store instructions should be executed in order through memory dependency checking and dynamic stalling. The VPU has a rich set of load/store features, and for some features it is not feasible to implement the dependency checking. Scalar load/store instructions as well as consecutive-location vector load/store are included in the dependency checking, so they are guaranteed to execute in order. Transposing load/store, parallel table lookup, parallel histogram, and vector addressed stores are excluded from the checking, so they are not guaranteed to execute in order.
##### 8.2.2.2.2 Clock Gating Requirements
The PVA Cortex-R5 software can enable/disable the Vector Processor Subsystem (VPS) clock via the power management unit at the PVA Cluster level. VPS contains second level clock gating (SLCG) that, when enabled, automatically gates off VPU clock to most of VPU and VMEM.
##### 8.2.2.2.3 Design for Test and Debug
- Debug Features
- The VPU has a CoreSight/APB-based debug interface that's hooked up to system-level JTAG
interface and is accessible through JTAG or through CPU software. The VPU debug features are: Enter/exit debug state.

- Programmable Computer-Vision Accelerator (PVA)
- Read program memory
- Invalidate I-cache. Debug writing program memory is implemented by writing to system
memory then invalidates I-cache, which drives I-cache to refetch from system memory. Read/write VMEM.
- Directly feed instruction word to be executed
Read/write processor registers, including PC, scalar/vector register file, hardware loop control registers, predicate register file, and again config register file (through injection of instruction sequence to store the relevant register into VMEM then reading VMEM).
- Read/write GPO, read GPI (through injection of instruction sequence)
- Read/write PC (through injection of instruction sequence)
- Read/write Shadow Execution State (SES) register. The VPU execution state (active, WFE_R5,
- WFE_GPI, error-halted, or halted) before transitioning into debug state is saved in this
register. It is read/write accessible by debug software via OCD_LD/OCD_ST instructions, and can be changed to drive VPU to a different state after exiting the debug state.
- Single step execution
24 watch or break points (combined, for example we can configure them into 18 watch points (VMEM read/write) and six break points (PC).
- Software break points (unlimited), program contents substituted with SWBRK instruction,
upon execution of which, VPU is forced to enter debug state.
- Cross-trigger input/output, to optionally allow other processors enter/exit debug to cause
VPU to enter/exit debug, and vice versa.
##### 8.2.2.2.4 Error Handling
VPU has the following features to detect various errors, mostly to help with software development and debug:
- Illegal instruction detection
- Scalar divide by zero error
- Floating point invalid outcome
Each error source is configurable whether to error-halt in the ERR_HNDL_CFG register. When an error occurs, an interrupt is sent to the Safety and Event Control (SEC) block in PVA top level, where the interrupts are optionally forwarded to Vectored Interrupt Controller (VIC) then to the Cortex- R5. Cortex-R5 and/or SEC can optionally forward error events to system-level error collator. The VPU instruction set allows a register dump assembly sequence to be run, to first save scalar register file, then some scalar registers are over-written to save the rest of the architecture registers.

- Programmable Computer-Vision Accelerator (PVA)
##### 8.2.2.2.5 Computation Capabilities
As VPS is an embedded processor subsystem architected for computer vision applications, the following are considered the key computation capabilities. Common operations: For common binary (2-input-1-output) operations like add, subtract, min, max, bitwise and logical, AND, OR, etc., and unary (1-input-1-output) operations like negate, bitwise and logical, NOT, etc. The VPU delivers full vector width utilization (16 x 32-bit, 32 x 16-bit, 64 x 8-bit) in the inner loop. Filtering: Filtering is the key function in image processing and front end of computer vision. VPS delivers full MAC utilization in the filtering inner loop with 16-bit data and 16-bit coefficients. This means 64 multiply-adds per cycle (two vector slots x two term dot-product x 16 half-word lanes). For 8-bit data and 8-bit coefficients, VPU should deliver 128 multiply-adds per cycle (two vector slots x two term dot-product x 32-byte lanes). Interpolated lookup: Interpolated lookup is often used to accelerate various transcendental functions and whatever functions that can be pre-computed at linear spaced points and run-time interpolated. The VPU delivers 3/32 cycles per point throughput for 16-bit input/output. Basically, it takes two bit-extract operations and a blend operation with concurrent 32-way parallel table lookup, to implement interpolated lookup. Histogram: Histogram is a common function in computer vision. VPU delivers 1/8 cycle per 32-bit data point, 1/16 cycle per 16-bit data point, of weighted histogram throughput. Furthermore, with the weighted histogram itself taking one load + one store, there is sufficient memory and vector math slots to implement with the same throughput 2D histogram. FFT: Fast Fourier Transform (FFT) is a basic digital signal processing function, and is often used for radar processing, acceleration of large filtering problems, and for various frequency analysis applications. The VPU does not exceed 1.5 cycles/point for 32-bit data,16-bit twiddle factor, 1024- point FFT. Sorting: Sorting is a basic and versatile compute vision function, and is often used for key/feature matching, for ranking and selection of many outcomes. The VPU does not exceed three cycles/ point for 32-bit data, 1024-point sorting. Floating point: Some floating-point workload is expected in embedded vision applications, for Structure from Motion or Sparse Bundle Adjustment. The VPU supports floating point operations in the scalar unit, achieving peak performance of 1.6 GFLOPs, or 1.6 billion floating point operations per second.
- Function
- Test Case
- Test Configuration
- Innerloop Performance
- Common op
stim/array_add1 16-bit addition 1/32 cycles per pixel (cyc/ pix)
- Filtering 16-bit
stim/filter5 3x3 kernel, 16-bit filtering, kernel rounded up to 3x4 6/32 cyc/pix

- Programmable Computer-Vision Accelerator (PVA)
- Function
- Test Case
- Test Configuration
- Innerloop Performance
- Filtering 8-bit
stim/filter_8b 3x3 kernel, 8-bit filtering, kernel rounded up to 4x4 8/64 cyc/pix
- Interpolated
lookup 16-bit
- ISA_special_math_
tests 16-bit reciprocal 7/32 cyc/pix
- Histogram 16-
bit histogram/ double_histogram 32-way short lookup 2/32 cyc/pix
- Histogram 32-
bit histogram/ double_histogram 16-way int lookup 2/16 cyc/pix
- FFT 32-bit
- Host_fft_batch_int
1024 complex 32-bit data points, 16-bit twiddle factor
##### 8.2.2.2.6 Instruction Cache
- The VPU Instruction Cache (I-cache) supplies instruction data to the VPU when requested,
requests missing instruction data from system memory, and maintains temporary instruction storage for the VPU. It also implements the prefetch command to reduce cache misses, as well as the invalidation command as needed for error correction and debug. The following table captures the characteristics of the I-cache.
- Table 8.7 I-cache Characteristics
- Characteristic
- Configuration
- Capacity
16 KB
- Associativity
- Two way
- Instruction width
256 bit
- Instruction alignment
256 bit
- Block size
128 bytes
- Replacement policy
- Least Recently Used (LRU)
- Write policy
- None (I-cache read only)

- Programmable Computer-Vision Accelerator (PVA)
- Characteristic
- Configuration
- Hit under miss (nonblocking, if/when VPU
requests another instruction word that's available, go ahead and return hit)
- No, fetch interface is in-order, so after a miss, if following fetch request
hits, it's not possible to indicate so.
- Miss under miss (if/when VPU requests
another instruction word that's unavailable, request for that cache line as well)
- Yes (request/ready pipelining allows following fetch request to be
conveyed, and if it's a miss involving another cache line, request can be sent out as well)
- Hit latency
- Two cycles
- Prefetch (software request to fetch cache
lines ahead of execution)
- Yes, up to full cache in single Cortex-R5/VPU interaction. Depending on
outstanding transaction allocation may request in batches
- Prefetch request from Cortex-R5 and VPU
- Yes, it has separate config register entries for concurrency
- Prefetch and fetch concurrency
- Yes, giving fetch higher priority
- ECC single error correction
- Yes, corrected on the fly and sent back to VPU
- ECC single/double error detection
- Yes. Single error is corrected but is not written back to cache, single
error handling software should invalidate cache line to initiates refetch when the line is requested.
- Invalidation from Cortex-R5
- Yes, configurable address range
- Invalidation from VPU
- Yes, configurable address range
##### 8.2.2.2.7 Vector Memory
VPU vector memory (VMEM) contains three superbanks of memory and arbitration logic to support various load/store accesses from VPU and external client, which includes DMA. VMEM houses local data memory for VPU to access so it can implement various image processing and computer vision algorithms efficiently. VMEM supports various complex memory access functionality for VPU, including transposition, table lookup, histogram, vector addressed stores. It also supports accesses from outside-VPS hosts like DMA and Cortex-R5, to allow data exchange with Cortex-R5 and other system-level components.
- VMEM includes VMEM Interface (I/F) arbitration block and three VMEM superbanks as shown
below.

- Programmable Computer-Vision Accelerator (PVA)
**Figure 8.19 VMEM Block Diagram**
- VMEM Superbanks
- The three memory superbanks appear as three memory regions in the VPU memory map,
differentiated by high address bits to allow programmers to allocate, based on memory footprint and bandwidth needs. Typically, one memory region is assigned to time-share between VPU and DMA, and the two remaining regions are accessed only by VPU so can be 100% allocated to load/ store instructions. It's also possible to use two regions to ping/pong between DMA and VPU, and to allocate only one region 100% to load/store. Each superbank has 64 KB of capacity. Each superbank consists of 32 banks of 2 KB (16-bit wide) RAMs. Each of the 32 memory banks are independently addressable per clock cycle. This enables a rich set of access patterns:
- Read/write one byte on any byte alignment
- Read/write one 16-bit half-word on any half-word alignment
- Read/write one 32-bit word on any word alignment
- Read/write 8 or 16 consecutive 32-bit words from any half-word alignment
- Read/write 16, 24, or 32 consecutive 16-bit half-words from any half-word alignment

- Programmable Computer-Vision Accelerator (PVA)
Read/write 32 or 64 consecutive 8-bit bytes from any half-word alignment (starting odd byte is not supported and is forcefully aligned to an even byte, and generates an error interrupt to
- Cortex-R5)
- Read/write 8 or 16 words with 16K+1-word offset, useful for column-wise access of 32-bit
array
- Read/write 16 or 32 half-words with 32K+1-half-word offset, useful for column-wise access
of 16-bit array
- Read/write 32 bytes with 64K+2-byte offset, useful for column-wise access of 8-bit array
Read/write independent memory rows in each 16-bit bank, leveraged by parallel table lookup, parallel histogram, and vector addressed store
- Table Lookup
- VMEM Superbanks support parallel table lookup with the following data element size and
parallelism combinations:
- For byte element size, 1/2/4/8/16/32 ways of parallelism
- For half-word (16-bit) element size, 1/2/4/8/16/32 ways of parallelism
- For word (32-bit) element size, 1/2/4/8/16 ways of parallelism
The VPU sends a table base address (512-bit or 64-byte aligned) and an index vector to the VMEM
- Interface. The VPU also sends along addressing mode (to convey that it's a table lookup
transaction), element size and parallelism as sideband signals. The first K elements of the index vector are consumed for K-way lookup; the rest are ignored.
##### 8.2.2.2.8 Histogram
VMEM Superbanks support parallel histogram with the following data element size and parallelism combinations:
- There is no byte element size support
- For half-word (16-bit) element size, 1/2/4/8/16/32 ways of parallelism
- For word (32-bit) element size, 1/2/4/8/16 ways of parallelism
The VPU sends a histogram base address (512-bit or 64-byte aligned), an index vector and an update vector to the VMEM Interface. The VPU also sends along addressing mode (to convey that it's a histogram transaction), element size and parallelism as sideband signals. Compared to conventional/normal histogram, VPU parallel histogram feature implements weighted histogram (by allowing an update vector to be added instead of only incrementing by one), and supports bin value read-back, which is useful in certain applications.

- Programmable Computer-Vision Accelerator (PVA)
##### 8.2.2.2.9 Vector Addressed Store
- VMEM Superbanks support vector addressed store, which is also called reverse lookup, since
instead of reading back indexed entries, data is written to the indexed entries. We support the maximal parallelism, 32 half-word and 16-word configurations.
#### 8.2.2.3 DLUT Description
DLUT supports parallel lookup with one common table, DLUT also supports one configuration of contention free lookup/interpolation most helpful in accelerating target CV workloads. DLUT also supports table reformatting needed to bridge between DMA and DLUT or VPU lookup operations. Table reformatting by DLUT can offload VPU processing cycles with higher performance and lower power.
#### 8.2.2.4 DLUT Features
- The DLUT shall provide these functionalities
1D/2D lookup from one common table, with conflict detection/resolution 1D/2D lookup from parallel tables, inherently conflict-free Optional integer only or fixed-point integer + fraction indices, via configurable number of fractional bits
- Optional 1D/2D post-lookup interpolation
1D lookup with linear interpolation 2D lookup with bilinear interpolation
- Out-of-range sentinel return value
- Out-of-range predicate off output write
- Configurable X/Y offset to translate between global coordinates and local coordinates
- Table reformatting as a separate operation mode
- Indices can be unsigned 16-bit, or 32-bit (each X or Y in case of 2D lookup)
Table entries (and output) can be 8-bit, 16-bit, or 32-bit, signed or unsigned, and entry data type is independent of index data type 2D lookup and interpolation with indices automatically generated by DLUT, limited to Word indices and Halfword table entries
#### 8.2.2.5 DMA Unit Description
PVA DMA is a data and tile movement engine that is programmed for data transfer from anywhere to everywhere in the PVA cluster/MC subsystem space. The DMA maintains a high level of system

- Programmable Computer-Vision Accelerator (PVA)
efficiency on the external memory interface bus to DRAM, CVNAS, SysRAM, and VIDMEM (dGPU memory). The DMA maximizes the throughput and minimize the transfer time on the bus.
##### 8.2.2.5.1 DMA Features
- Table 8.8 List of Supported Features in DMA Hardware
- Feature
- Benefit
- Multi-dimensional addressing
- Five dimensions
- Linked List
- To reduce programming overhead and to reduced latency of
software interaction
- Channel Arbitration
- Supports Weighted RR arbitration
- Boundary handling (constant, repeat)
- Reduce VPU workload
- Software sequencer
- Flexibility
- DMA MISR (Func. Safety)
- Permanent fault detection and Software BIST
2D and Circular buffer aware
- Buffer management
- Hardware event-based DMA
- For triggers and sequencing
- Block Linear Support
- Raw format
- Outstanding requests
272 for reads and 128 for writes
- True completion
- Maintains Order
The DMA block exists as a sub-IP component in PVA, one per VPU. Since the first instance of PVA has two VPU's, there are two instances of the DMA per PVA. Each of these instances brings out a master port. Hence at the boundary of DMA, there is one AXI 256-bit master port (data) and one AXI 32-bit slave port (control and configuration). The diagram below shows the CV cluster with two PVAs and two DMAs in one PVA.
- The CCPLEX core in the SoC serves as a task sequencer (operates at the frame or sub-frame
boundary) and launch frame level algorithms. Cortex-R5 and VPU firmware sequencing should be used to implement various dynamic/static data transfer scenarios with little regularity. Both Cortex-R5 and VPU have a low latency path to program the DMA. The Cortex-R5 sets up the DMA descriptors at the beginning of a task and starts the VPU. Most of the time and for regular processing, it is the VPU that triggers the DMA and synchronize with DMA transfers at a tile level. The VPU triggers the DMA to copy next data tiles into VMEM (or copy previous processed tiles from VMEM to outside) while it is working on the current tile. In some cases, the VPU needs to copy data from a run-time computed address. In this case, the VPU configures the DMA descriptors to collect data from a region with a newly computed address.

- Programmable Computer-Vision Accelerator (PVA)
##### 8.2.2.5.2 DMA Description
- The DMA block has four main components: DMA Channel Control, DMA AXI Control, DMA VMEM
Control, and DMA Configuration. DMA Channel Control:
- DMA has 16 channels and each channel controller (DMA engine) is responsible for processing
descriptors via a DMA descriptor processor block per channel.
- DMA has 64 descriptors stored in a RAM and each descriptor has 64 Bytes of information to
capture the attributes of:
- Source/destination address
- Trigger control
- Pad control per channel
- Buffer control
5-dimensional addressing control
- Transfer mode control
5D (five dimensions) tile transfer engine per channel
- Address and boundary padding control per channel
- Burst control per channel
- DMA channel scheduler
- MISR control block
- - -
- Accelerated PVA Software functional BIST
- Covers permanent faults for functional safety (mainly for VPU and DMA)
- Certifies the health of VPU at a programmable interval
- Channel Arbitration
- -
- Source and Destination Arbitration
- SRAM request Arbitration
DMA AXI Control is Responsible for AXI Transactions:
- Queuing and buffering
- AXI Muxing/De-muxing
- MISR updates on the AXI interface
- Outstanding request control
- Configurable Surface Transfer format (Block Linear or Pitch Linear)
DMA VMEM Control Block is Responsible for Issuing SRAM Transactions:
- Read Write arbitration
- Pad and boundary Control (Constant or extended padding values)
DMA Configuration Block to Configure:

- Programmable Computer-Vision Accelerator (PVA)
- Global registers
- Channel registers
- Interrupt handling
- Error and Safety control
- Performance Monitors
- Descriptor RAM
#### 8.2.2.6 PVA_PROC: Cortex-R5 Subsystem
The PVA_PROC (Cortex-R5 subsystem) consists of one Cortex-R5F processor with double precision floating point processor, its associated TCMs (ATCM and BTCM) and associated I-cache/D-cache.
- PVA_PROC also connects to a vectored interrupt controller (PL192 ARM or AVIC). Cortex-R5
subsystem also shares PVA cluster peripheral including timers, mailboxes, and debug logic.
##### 8.2.2.6.1 Cortex-R5 Configuration
The Cortex-R5 is configured with the following features:
- ARMv7-R ISA
- Instruction cache and data cache of 16 KB each
128 KB of SRAM attached to BTCM0 as one bank
- ATCM base address set to 0
- Init Low Vectors
- Floating Point
##### 8.2.2.6.2 Power Management
The whole CV cluster can be rail gated or each PVA cluster can be power gated separately. There is no inner cluster power gating. For the current PVA generation, VPS0 and VPS1 partitions can't be power gated separately by Cortex-R5 or from external control. The power processor (BPMP) is responsible for any frequency settings for PVA and it is the BPMP responsibility for CV voltage scaling. BPMP is also responsible for all power up and power down sequence.
##### 8.2.2.6.3 HSP
Hardware Synchronization Primitives (HSP) has different hardware synchronization primitives as detailed in the following table.
- Primitive
- Count
- Description
- SM (mail box)
To support a single writer/single reader model.
- SS (Shared Semaphores)
- Used as flags for producer/consumer

- Programmable Computer-Vision Accelerator (PVA)
- Primitive
- Count
- Description
nSI (Shared interrupt)
- Can be used to map 16 mailbox interrupts
- Doorbells
- PVA has no doorbells
##### 8.2.2.6.4 Mailboxes
PVA cluster can use mailboxes to implement inter-processor communication (IPC) or unidirectional communication with CPU cores and other SoC masters. The PVA cluster instances one HSP module to communicate asynchronously with CPU and other engines. There are eight mailboxes in PVA. Each mailbox is one 32 bits register with two associated interrupts to implement the software handshake. The two interrupts per mailbox are for empty and full flags that are directly under software control. The full interrupt is the MSB of the register, called the TAG bit and the empty interrupt is the inversion of the TAG bit. The messaging in mailboxes is defined by software convention where the producer of the mailbox may get interrupted on mailbox empty and then write data with TAG set to 1 into the mailbox to trigger the full interrupt. On the other hand, the consumer of the mailbox may get interrupted on mailbox full, read the data and then write to the mailbox register with TAG field set to 0 to complete the handshake. Polling is an alternative solution and can be used by either the producer or the consumer. Each mailbox has an SCR to allow for secure access. HSP SCRs are located in first page of SM: PVA0/1_HSP_SM0_BASE. Shared mailboxes are 32 KB apart and a pair is mapped in a 64 KB page.
- The base for a given mailbox is SMx_BASEx = HSP_PVA{0/1}_BASE + 64 KB
{ PVA0/1_HSP_COMMON} + x * 32 KB.
##### 8.2.2.6.5 Shared Semaphores
There are four shared semaphores which are registers with associated set/clear addresses to allow easy manipulation of individual bits inside them, i.e., without the need for a RMW operation. Shared semaphores are accessed by either PVA-R5 or outside masters (including CCPLEX). Software must statically allocate the ownership of individual semaphores for correct operation. The shared semaphores are formed by three registers, each 32-bits wide: A read/write register showing the current value of the semaphore
- Two read/write registers to set and clear individual semaphore bits
##### 8.2.2.6.6 Shared Interrupts
Shared interrupts are located in the common register space and there are five shared interrupts that can be used to map the 16 mailbox interrupts.

- Programmable Computer-Vision Accelerator (PVA)
#### 8.2.2.7 Timers
The following table and diagram show the configuration of timers and the block diagram of timers in PVA.
- Parameter
- Value
- Number of NV_timers (nT)
- Number of watchdogs (nW)
- Interrupt routing
- Disabled
- Number of shared interrupts exposed
- Each one of the timers has a 29-bit count and can be programmed to generate one pulse or
periodic reference pulses. The timing reference clock for each of the timers can be the 1 MHz reference, TSC or OSC clk. Upon enable, the timer loads the timer present trigger value into its counter and starts decrementing at the rate it was selected. When the counter present value reaches zero, a pulse is generated. In case the periodic interrupt mode is enabled, the timer reloads the PTV value and start decrementing again. The pulse from the timer is translated into an interrupt to AVIC/Cortex-R5. Each NV timer has one associated interrupt, which is set when the down counter reaches 0. For 1 MHz reference, the timer has a range between 1 µs and 537 sec. Each NV timer can optionally be halted during debug.
- The TKE block contains four NV timers and one watchdog timer. There are also few common
registers and SCR registers.

- System Components
9. System Components
## 8.0 GT/s equalization. - Case B: When Operating port is Upstream port
and Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It contains the value captured from Lane 0 during Link
- Equalization. - Case C: When Operating port is Upstream port and
- Crosslink Supported bit is 1, Field is not used or affected by the current
- Link Equalization. Field value will be used if a future crosslink negotiation
switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: DSP || USP &&
- PCIE_CAP_CROSS_LINK_SUPPORT ? (if (DBI_RO_WR_EN == 1) then R/W
(sticky) else R(sticky)) : ROS

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
11:8
- RW
0x5 USP_TX_PRESET0:
- Upstream Port 8.0 GT/s Transmitter Preset 0. The write value is gated
with the PCIE_CAP_CROSS_LINK_SUPPORT field of
- LINK_CAPABILITIES2_REG. Field contains the Transmitter preset 0 value
sent or received during 8.0 GT/s Link Equalization. - Case A: When
- Operating port is Downstream port and whether the Crosslink is
supported or not, this field representss the value sent on Lane 0 during
## 8.0 GT/s equalization. - Case B: When Operating port is Upstream port
and Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It contains the value captured from Lane 0 during Link
- Equalization. - Case C: When Operating port is Upstream port and
- Crosslink Supported bit is 1, Field is not used or affected by the current
- Link Equalization. Field value will be used if a future crosslink negotiation
switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: DSP || USP &&
- PCIE_CAP_CROSS_LINK_SUPPORT ? (if (DBI_RO_WR_EN == 1) then R/W
(sticky) else R(sticky)) : ROS
- RO
0x0 RSVDP_7: Reserved for future use. 6:4
- RW
0x7 DSP_RX_PRESET_HINT0:
- Downstream Port 8.0 GT/s Receiver Preset Hint 0. Receiver preset hint 0
value that may be used as a suggested setting for 8.0 GT/s receiver equalization by this Port when the Port is operating as a Downstream
- Port. This field is ignored when the Port is operating as an Upstream
- Port. For an Upstream Port if Crosslink Supported is 0b, this field is
- RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this
field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) 3:0
- RW
0x5 DSP_TX_PRESET0:
- Downstream Port 8.0 GT/s Transmitter Preset 0. Transmitter preset 0
value used for 8.0 GT/s equalization by this Port when the Port is operating as a Downstream Port. This field is ignored when the Port is operating as an Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
- PCIE_X4_RC_PF0_SPCIE_CAP_SPCIE_CAP_OFF_0CH_REG_0
- PCIE_X8_RC_PF0_SPCIE_CAP_SPCIE_CAP_OFF_0CH_REG_0
- Reset: 0x75757575 (0b0111,0101,0111,0101,0111,0101,0111,0101)
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
- RO
0x0 RSVDP_31: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
30:28
- RW
0x7 USP_RX_PRESET_HINT1:
- Upstream Port 8.0 GT/s Receiver Preset Hint 1. The write value is gated
with the PCIE_CAP_CROSS_LINK_SUPPORT field of
- LINK_CAPABILITIES2_REG. Field contains the Receiver preset hint 1 value
sent or received during 8.0 GT/s Link Equalization. - Case A: When
- Operating port is Downstream port and whether the Crosslink is
supported or not, this field representss the value sent on Lane 0 during
## 8.0 GT/s equalization. - Case B: When Operating port is Upstream port
and Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It contains the value captured from Lane 0 during Link
- Equalization. - Case C: When Operating port is Upstream port and
- Crosslink Supported bit is 1, Field is not used or affected by the current
- Link Equalization. Field value will be used if a future crosslink negotiation
switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: DSP || USP &&
- PCIE_CAP_CROSS_LINK_SUPPORT ? (if (DBI_RO_WR_EN == 1) then R/W
(sticky) else R(sticky)) : ROS 27:24
- RW
0x5 USP_TX_PRESET1:
- Upstream Port 8.0 GT/s Transmitter Preset 1. The write value is gated
with the PCIE_CAP_CROSS_LINK_SUPPORT field of
- LINK_CAPABILITIES2_REG. Field contains the Transmitter preset 1 value
sent or received during 8.0 GT/s Link Equalization. - Case A: When
- Operating port is Downstream port and whether the Crosslink is
supported or not, this field representss the value sent on Lane 0 during
## 8.0 GT/s equalization. - Case B: When Operating port is Upstream port
and Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It contains the value captured from Lane 0 during Link
- Equalization. - Case C: When Operating port is Upstream port and
- Crosslink Supported bit is 1, Field is not used or affected by the current
- Link Equalization. Field value will be used if a future crosslink negotiation
switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: DSP || USP &&
- PCIE_CAP_CROSS_LINK_SUPPORT ? (if (DBI_RO_WR_EN == 1) then R/W
(sticky) else R(sticky)) : ROS
- RO
0x0 RSVDP_23: Reserved for future use. 22:20
- RW
0x7 DSP_RX_PRESET_HINT1:
- Downstream Port 8.0 GT/s Receiver Preset Hint 1. Receiver preset hint 1
value that may be used as a suggested setting for 8.0 GT/s receiver equalization by this Port when the Port is operating as a Downstream
- Port. This field is ignored when the Port is operating as an Upstream
- Port. For an Upstream Port if Crosslink Supported is 0b, this field is
- RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this
field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) 19:16
- RW
0x5 DSP_TX_PRESET1:
- Downstream Port 8.0 GT/s Transmitter Preset 1. Transmitter preset 1
value used for 8.0 GT/s equalization by this Port when the Port is operating as a Downstream Port. This field is ignored when the Port is operating as an Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
- RO
0x0 RSVDP_15: Reserved for future use. 14:12
- RW
0x7 USP_RX_PRESET_HINT0:
- Upstream Port 8.0 GT/s Receiver Preset Hint 0. The write value is gated
with the PCIE_CAP_CROSS_LINK_SUPPORT field of
- LINK_CAPABILITIES2_REG. Field contains the Receiver preset hint 0 value
sent or received during 8.0 GT/s Link Equalization. - Case A: When
- Operating port is Downstream port and whether the Crosslink is
supported or not, this field representss the value sent on Lane 0 during
## 8.0 GT/s equalization. - Case B: When Operating port is Upstream port
and Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It contains the value captured from Lane 0 during Link
- Equalization. - Case C: When Operating port is Upstream port and
- Crosslink Supported bit is 1, Field is not used or affected by the current
- Link Equalization. Field value will be used if a future crosslink negotiation
switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: DSP || USP &&
- PCIE_CAP_CROSS_LINK_SUPPORT ? (if (DBI_RO_WR_EN == 1) then R/W
(sticky) else R(sticky)) : ROS 11:8
- RW
0x5 USP_TX_PRESET0:
- Upstream Port 8.0 GT/s Transmitter Preset 0. The write value is gated
with the PCIE_CAP_CROSS_LINK_SUPPORT field of
- LINK_CAPABILITIES2_REG. Field contains the Transmitter preset 0 value
sent or received during 8.0 GT/s Link Equalization. - Case A: When
- Operating port is Downstream port and whether the Crosslink is
supported or not, this field representss the value sent on Lane 0 during
## 8.0 GT/s equalization. - Case B: When Operating port is Upstream port
and Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It contains the value captured from Lane 0 during Link
- Equalization. - Case C: When Operating port is Upstream port and
- Crosslink Supported bit is 1, Field is not used or affected by the current
- Link Equalization. Field value will be used if a future crosslink negotiation
switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: DSP || USP &&
- PCIE_CAP_CROSS_LINK_SUPPORT ? (if (DBI_RO_WR_EN == 1) then R/W
(sticky) else R(sticky)) : ROS
- RO
0x0 RSVDP_7: Reserved for future use. 6:4
- RW
0x7 DSP_RX_PRESET_HINT0:
- Downstream Port 8.0 GT/s Receiver Preset Hint 0. Receiver preset hint 0
value that may be used as a suggested setting for 8.0 GT/s receiver equalization by this Port when the Port is operating as a Downstream
- Port. This field is ignored when the Port is operating as an Upstream
- Port. For an Upstream Port if Crosslink Supported is 0b, this field is
- RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this
field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
3:0
- RW
0x5 DSP_TX_PRESET0:
- Downstream Port 8.0 GT/s Transmitter Preset 0. Transmitter preset 0
value used for 8.0 GT/s equalization by this Port when the Port is operating as a Downstream Port. This field is ignored when the Port is operating as an Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
- PCIE_X<i>_RC_PF0_PL16G_CAP_PL16G_EXT_CAP_HDR_REG_0
where <i> = 1, 4, 8. Description: Physical Layer 16.0 GT/s Extended Capability Header provides information about Capability ID, Version, and next offset.
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_PL16G_CAP_PL16G_EXT_CAP_HDR_REG_0
- Offset: 0x158
- Reset: 0x17c10026 (0b0001,0111,1100,0001,0000,0000,0010,0110)
- Bit
- Reset
- Description
31:20 0x17c NEXT_OFFSET:
- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space,
this offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greater than 0FFh. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 19:16 0x1 CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. This bit depends on the version of the specification. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
15:0 0x26 EXTENDED_CAP_ID:
- PCI Express Extended Capability ID. This field is a PCI-SIG defined ID number
that indicates the nature and format of the Extended Capability. The Extended
- Capability ID for the Physical Layer 16.0 GT/s Capability is 0026h. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X4_RC_PF0_PL16G_CAP_PL16G_EXT_CAP_HDR_REG_0
- Offset: 0x168
- Reset: 0x18c10026 (0b0001,1000,1100,0001,0000,0000,0010,0110)
- Bit
- Reset
- Description
31:20 0x18c NEXT_OFFSET:
- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space,
this offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greater than 0FFh. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 19:16 0x1 CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. This bit depends on the version of the specification. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 15:0 0x26 EXTENDED_CAP_ID:
- PCI Express Extended Capability ID. This field is a PCI-SIG defined ID number
that indicates the nature and format of the Extended Capability. The Extended
- Capability ID for the Physical Layer 16.0 GT/s Capability is 0026h. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X8_RC_PF0_PL16G_CAP_PL16G_EXT_CAP_HDR_REG_0
- Offset: 0x168
- Reset: 0x19010026 (0b0001,1001,0000,0001,0000,0000,0010,0110)
- Bit
- Reset
- Description
31:20 0x190 NEXT_OFFSET:
- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space,
this offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greater than 0FFh. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
19:16 0x1 CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. This bit depends on the version of the specification. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 15:0 0x26 EXTENDED_CAP_ID:
- PCI Express Extended Capability ID. This field is a PCI-SIG defined ID number
that indicates the nature and format of the Extended Capability. The Extended
- Capability ID for the Physical Layer 16.0 GT/s Capability is 0026h. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<j>_RC_PF0_SPCIE_CAP_SPCIE_CAP_OFF_10H_REG_0
where <j> = 4, 8.
- PCIE_X4_RC_PF0_SPCIE_CAP_SPCIE_CAP_OFF_10H_REG_0
- PCIE_X8_RC_PF0_SPCIE_CAP_SPCIE_CAP_OFF_10H_REG_0
Description: The function of this register is dependent on your actual configuration. - Gen3: LEC or RSVD depending on the value of CX_NL. - Gen4: LEC or LEC2 or RSVD depending on the value of CX_NL. This register provides Transmitter Preset and Receiver Preset Hint for Downstream Port and Upstream Port.
- Offset: 0x158
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x75757575 (0b0111,0101,0111,0101,0111,0101,0111,0101)
- Bit
R/W
- Reset
- Description
- RO
0x0 RSVDP_31: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
30:28
- RW
0x7 USP_RX_PRESET_HINT3:
- Upstream Port 8.0 GT/s Receiver Preset Hint3. The write value is gated
with the PCIE_CAP_CROSS_LINK_SUPPORT field of
- LINK_CAPABILITIES2_REG. Field contains the Receiver preset hint 3 value
sent or received during 8.0 GT/s Link Equalization. - Case A: When
- Operating port is Downstream port and whether the Crosslink is
supported or not, this field representss the value sent on Lane 0 during
## 8.0 GT/s equalization. - Case B: When Operating port is Upstream port
and Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It contains the value captured from Lane 0 during Link
- Equalization. - Case C: When Operating port is Upstream port and
- Crosslink Supported bit is 1, Field is not used or affected by the current
- Link Equalization. Field value will be used if a future crosslink negotiation
switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: DSP || USP &&
- PCIE_CAP_CROSS_LINK_SUPPORT ? (if (DBI_RO_WR_EN == 1) then R/W
(sticky) else R(sticky)) : ROS 27:24
- RW
0x5 USP_TX_PRESET3:
- Upstream Port 8.0 GT/s Transmitter Preset3. The write value is gated
with the PCIE_CAP_CROSS_LINK_SUPPORT field of
- LINK_CAPABILITIES2_REG. Field contains the Transmitter preset 3 value
sent or received during 8.0 GT/s Link Equalization. - Case A: When
- Operating port is Downstream port and whether the Crosslink is
supported or not, this field representss the value sent on Lane 0 during
## 8.0 GT/s equalization. - Case B: When Operating port is Upstream port
and Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It contains the value captured from Lane 0 during Link
- Equalization. - Case C: When Operating port is Upstream port and
- Crosslink Supported bit is 1, Field is not used or affected by the current
- Link Equalization. Field value will be used if a future crosslink negotiation
switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: DSP || USP &&
- PCIE_CAP_CROSS_LINK_SUPPORT ? (if (DBI_RO_WR_EN == 1) then R/W
(sticky) else R(sticky)) : ROS
- RO
0x0 RSVDP_23: Reserved for future use. 22:20
- RW
0x7 DSP_RX_PRESET_HINT3:
- Downstream Port 8.0 GT/s Receiver Preset Hint3. Receiver preset hint 3
value that may be used as a suggested setting for 8.0 GT/s receiver equalization by this Port when the Port is operating as a Downstream
- Port. This field is ignored when the Port is operating as an Upstream
- Port. For an Upstream Port if Crosslink Supported is 0b, this field is
- RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this
field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) 19:16
- RW
0x5 DSP_TX_PRESET3:
- Downstream Port 8.0 GT/s Transmitter Preset3. Transmitter preset 3
value used for 8.0 GT/s equalization by this Port when the Port is operating as a Downstream Port. This field is ignored when the Port is operating as an Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
- RO
0x0 RSVDP_15: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
14:12
- RW
0x7 USP_RX_PRESET_HINT2:
- Upstream Port 8.0 GT/s Receiver Preset Hint2. The write value is gated
with the PCIE_CAP_CROSS_LINK_SUPPORT field of
- LINK_CAPABILITIES2_REG. Field contains the Receiver preset hint 2 value
sent or received during 8.0 GT/s Link Equalization. - Case A: When
- Operating port is Downstream port and whether the Crosslink is
supported or not, this field representss the value sent on Lane 0 during
## 8.0 GT/s equalization. - Case B: When Operating port is Upstream port
and Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It contains the value captured from Lane 0 during Link
- Equalization. - Case C: When Operating port is Upstream port and
- Crosslink Supported bit is 1, Field is not used or affected by the current
- Link Equalization. Field value will be used if a future crosslink negotiation
switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: DSP || USP &&
- PCIE_CAP_CROSS_LINK_SUPPORT ? (if (DBI_RO_WR_EN == 1) then R/W
(sticky) else R(sticky)) : ROS 11:8
- RW
0x5 USP_TX_PRESET2:
- Upstream Port 8.0 GT/s Transmitter Preset2. The write value is gated
with the PCIE_CAP_CROSS_LINK_SUPPORT field of
- LINK_CAPABILITIES2_REG. Field contains the Transmitter preset 2 value
sent or received during 8.0 GT/s Link Equalization. - Case A: When
- Operating port is Downstream port and whether the Crosslink is
supported or not, this field representss the value sent on Lane 0 during
## 8.0 GT/s equalization. - Case B: When Operating port is Upstream port
and Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It contains the value captured from Lane 0 during Link
- Equalization. - Case C: When Operating port is Upstream port and
- Crosslink Supported bit is 1, Field is not used or affected by the current
- Link Equalization. Field value will be used if a future crosslink negotiation
switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: DSP || USP &&
- PCIE_CAP_CROSS_LINK_SUPPORT ? (if (DBI_RO_WR_EN == 1) then R/W
(sticky) else R(sticky)) : ROS
- RO
0x0 RSVDP_7: Reserved for future use. 6:4
- RW
0x7 DSP_RX_PRESET_HINT2:
- Downstream Port 8.0 GT/s Receiver Preset Hint2. Receiver preset hint 2
value that may be used as a suggested setting for 8.0 GT/s receiver equalization by this Port when the Port is operating as a Downstream
- Port. This field is ignored when the Port is operating as an Upstream
- Port. For an Upstream Port if Crosslink Supported is 0b, this field is
- RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this
field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) 3:0
- RW
0x5 DSP_TX_PRESET2:
- Downstream Port 8.0 GT/s Transmitter Preset2. Transmitter preset 2
value used for 8.0 GT/s equalization by this Port when the Port is operating as a Downstream Port. This field is ignored when the Port is operating as an Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)

- PCIe x1/x4/x8 Root Complex
- PCIE_X8_RC_PF0_SPCIE_CAP_SPCIE_CAP_OFF_14H_REG_0
Description: The function of this register is dependent on your actual configuration. - Gen3: LEC or RSVD depending on the value of CX_NL. - Gen4: LEC or LEC2 or RSVD depending on the value of CX_NL. This register provides Transmitter Preset and Receiver Preset Hint for Downstream Port and Upstream Port.
- Offset: 0x15c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x75757575 (0b0111,0101,0111,0101,0111,0101,0111,0101)
- Bit
R/W
- Reset
- Description
- RO
0x0 RSVDP_31: Reserved for future use. 30:28
- RW
0x7 USP_RX_PRESET_HINT5:
- Upstream Port 8.0 GT/s Receiver Preset Hint5. The write value is gated
with the PCIE_CAP_CROSS_LINK_SUPPORT field of
- LINK_CAPABILITIES2_REG. Field contains the Receiver preset hint 5 value
sent or received during 8.0 GT/s Link Equalization. - Case A: When
- Operating port is Downstream port and whether the Crosslink is
supported or not, this field representss the value sent on Lane 0 during
## 8.0 GT/s equalization. - Case B: When Operating port is Upstream port
and Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It contains the value captured from Lane 0 during Link
- Equalization. - Case C: When Operating port is Upstream port and
- Crosslink Supported bit is 1, Field is not used or affected by the current
- Link Equalization. Field value will be used if a future crosslink negotiation
switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: DSP || USP &&
- PCIE_CAP_CROSS_LINK_SUPPORT ? (if (DBI_RO_WR_EN == 1) then R/W
(sticky) else R(sticky)) : ROS 27:24
- RW
0x5 USP_TX_PRESET5:
- Upstream Port 8.0 GT/s Transmitter Preset5. The write value is gated
with the PCIE_CAP_CROSS_LINK_SUPPORT field of
- LINK_CAPABILITIES2_REG. Field contains the Transmitter preset 5 value
sent or received during 8.0 GT/s Link Equalization. - Case A: When
- Operating port is Downstream port and whether the Crosslink is
supported or not, this field representss the value sent on Lane 0 during
## 8.0 GT/s equalization. - Case B: When Operating port is Upstream port
and Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It contains the value captured from Lane 0 during Link
- Equalization. - Case C: When Operating port is Upstream port and
- Crosslink Supported bit is 1, Field is not used or affected by the current
- Link Equalization. Field value will be used if a future crosslink negotiation
switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: DSP || USP &&
- PCIE_CAP_CROSS_LINK_SUPPORT ? (if (DBI_RO_WR_EN == 1) then R/W
(sticky) else R(sticky)) : ROS

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RO
0x0 RSVDP_23: Reserved for future use. 22:20
- RW
0x7 DSP_RX_PRESET_HINT5:
- Downstream Port 8.0 GT/s Receiver Preset Hint5. Receiver preset hint 5
value that may be used as a suggested setting for 8.0 GT/s receiver equalization by this Port when the Port is operating as a Downstream
- Port. This field is ignored when the Port is operating as an Upstream
- Port. For an Upstream Port if Crosslink Supported is 0b, this field is
- RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this
field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) 19:16
- RW
0x5 DSP_TX_PRESET5:
- Downstream Port 8.0 GT/s Transmitter Preset5. Transmitter preset 5
value used for 8.0 GT/s equalization by this Port when the Port is operating as a Downstream Port. This field is ignored when the Port is operating as an Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
- RO
0x0 RSVDP_15: Reserved for future use. 14:12
- RW
0x7 USP_RX_PRESET_HINT4:
- Upstream Port 8.0 GT/s Receiver Preset Hint4. The write value is gated
with the PCIE_CAP_CROSS_LINK_SUPPORT field of
- LINK_CAPABILITIES2_REG. Field contains the Receiver preset hint 4 value
sent or received during 8.0 GT/s Link Equalization. - Case A: When
- Operating port is Downstream port and whether the Crosslink is
supported or not, this field representss the value sent on Lane 0 during
## 8.0 GT/s equalization. - Case B: When Operating port is Upstream port
and Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It contains the value captured from Lane 0 during Link
- Equalization. - Case C: When Operating port is Upstream port and
- Crosslink Supported bit is 1, Field is not used or affected by the current
- Link Equalization. Field value will be used if a future crosslink negotiation
switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: DSP || USP &&
- PCIE_CAP_CROSS_LINK_SUPPORT ? (if (DBI_RO_WR_EN == 1) then R/W
(sticky) else R(sticky)) : ROS 11:8
- RW
0x5 USP_TX_PRESET4:
- Upstream Port 8.0 GT/s Transmitter Preset4. The write value is gated
with the PCIE_CAP_CROSS_LINK_SUPPORT field of
- LINK_CAPABILITIES2_REG. Field contains the Transmitter preset 4 value
sent or received during 8.0 GT/s Link Equalization. - Case A: When
- Operating port is Downstream port and whether the Crosslink is
supported or not, this field representss the value sent on Lane 0 during
## 8.0 GT/s equalization. - Case B: When Operating port is Upstream port
and Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It contains the value captured from Lane 0 during Link
- Equalization. - Case C: When Operating port is Upstream port and
- Crosslink Supported bit is 1, Field is not used or affected by the current
- Link Equalization. Field value will be used if a future crosslink negotiation
switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: DSP || USP &&
- PCIE_CAP_CROSS_LINK_SUPPORT ? (if (DBI_RO_WR_EN == 1) then R/W
(sticky) else R(sticky)) : ROS

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RO
0x0 RSVDP_7: Reserved for future use. 6:4
- RW
0x7 DSP_RX_PRESET_HINT4:
- Downstream Port 8.0 GT/s Receiver Preset Hint4. Receiver preset hint 4
value that may be used as a suggested setting for 8.0 GT/s receiver equalization by this Port when the Port is operating as a Downstream
- Port. This field is ignored when the Port is operating as an Upstream
- Port. For an Upstream Port if Crosslink Supported is 0b, this field is
- RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this
field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) 3:0
- RW
0x5 DSP_TX_PRESET4:
- Downstream Port 8.0 GT/s Transmitter Preset4. Transmitter preset 4
value used for 8.0 GT/s equalization by this Port when the Port is operating as a Downstream Port. This field is ignored when the Port is operating as an Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
- PCIE_X8_RC_PF0_SPCIE_CAP_SPCIE_CAP_OFF_18H_REG_0
Description: The function of this register is dependent on your actual configuration. - Gen3: LEC or RSVD depending on the value of CX_NL. - Gen4: LEC or LEC2 or RSVD depending on the value of CX_NL. This register provides Transmitter Preset and Receiver Preset Hint for Downstream Port and Upstream Port.
- Offset: 0x160
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x75757575 (0b0111,0101,0111,0101,0111,0101,0111,0101)
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
- RO
0x0 RSVDP_31: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
30:28
- RW
0x7 USP_RX_PRESET_HINT7:
- Upstream Port 8.0 GT/s Receiver Preset Hint7. The write value is gated
with the PCIE_CAP_CROSS_LINK_SUPPORT field of
- LINK_CAPABILITIES2_REG. Field contains the Receiver preset hint 7 value
sent or received during 8.0 GT/s Link Equalization. - Case A: When
- Operating port is Downstream port and whether the Crosslink is
supported or not, this field representss the value sent on Lane 0 during
## 8.0 GT/s equalization. - Case B: When Operating port is Upstream port
and Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It contains the value captured from Lane 0 during Link
- Equalization. - Case C: When Operating port is Upstream port and
- Crosslink Supported bit is 1, Field is not used or affected by the current
- Link Equalization. Field value will be used if a future crosslink negotiation
switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: DSP || USP &&
- PCIE_CAP_CROSS_LINK_SUPPORT ? (if (DBI_RO_WR_EN == 1) then R/W
(sticky) else R(sticky)) : ROS 27:24
- RW
0x5 USP_TX_PRESET7:
- Upstream Port 8.0 GT/s Transmitter Preset7. The write value is gated
with the PCIE_CAP_CROSS_LINK_SUPPORT field of
- LINK_CAPABILITIES2_REG. Field contains the Transmitter preset 7 value
sent or received during 8.0 GT/s Link Equalization. - Case A: When
- Operating port is Downstream port and whether the Crosslink is
supported or not, this field representss the value sent on Lane 0 during
## 8.0 GT/s equalization. - Case B: When Operating port is Upstream port
and Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It contains the value captured from Lane 0 during Link
- Equalization. - Case C: When Operating port is Upstream port and
- Crosslink Supported bit is 1, Field is not used or affected by the current
- Link Equalization. Field value will be used if a future crosslink negotiation
switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: DSP || USP &&
- PCIE_CAP_CROSS_LINK_SUPPORT ? (if (DBI_RO_WR_EN == 1) then R/W
(sticky) else R(sticky)) : ROS
- RO
0x0 RSVDP_23: Reserved for future use. 22:20
- RW
0x7 DSP_RX_PRESET_HINT7:
- Downstream Port 8.0 GT/s Receiver Preset Hint7. Receiver preset hint 7
value that may be used as a suggested setting for 8.0 GT/s receiver equalization by this Port when the Port is operating as a Downstream
- Port. This field is ignored when the Port is operating as an Upstream
- Port. For an Upstream Port if Crosslink Supported is 0b, this field is
- RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this
field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) 19:16
- RW
0x5 DSP_TX_PRESET7:
- Downstream Port 8.0 GT/s Transmitter Preset7. Transmitter preset 7
value used for 8.0 GT/s equalization by this Port when the Port is operating as a Downstream Port. This field is ignored when the Port is operating as an Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
- RO
0x0 RSVDP_15: Reserved for future use. 14:12
- RW
0x7 USP_RX_PRESET_HINT6:
- Upstream Port 8.0 GT/s Receiver Preset Hint6. The write value is gated
with the PCIE_CAP_CROSS_LINK_SUPPORT field of
- LINK_CAPABILITIES2_REG. Field contains the Receiver preset hint 6 value
sent or received during 8.0 GT/s Link Equalization. - Case A: When
- Operating port is Downstream port and whether the Crosslink is
supported or not, this field representss the value sent on Lane 0 during
## 8.0 GT/s equalization. - Case B: When Operating port is Upstream port
and Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It contains the value captured from Lane 0 during Link
- Equalization. - Case C: When Operating port is Upstream port and
- Crosslink Supported bit is 1, Field is not used or affected by the current
- Link Equalization. Field value will be used if a future crosslink negotiation
switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: DSP || USP &&
- PCIE_CAP_CROSS_LINK_SUPPORT ? (if (DBI_RO_WR_EN == 1) then R/W
(sticky) else R(sticky)) : ROS 11:8
- RW
0x5 USP_TX_PRESET6:
- Upstream Port 8.0 GT/s Transmitter Preset6. The write value is gated
with the PCIE_CAP_CROSS_LINK_SUPPORT field of
- LINK_CAPABILITIES2_REG. Field contains the Transmitter preset 6 value
sent or received during 8.0 GT/s Link Equalization. - Case A: When
- Operating port is Downstream port and whether the Crosslink is
supported or not, this field representss the value sent on Lane 0 during
## 8.0 GT/s equalization. - Case B: When Operating port is Upstream port
and Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It contains the value captured from Lane 0 during Link
- Equalization. - Case C: When Operating port is Upstream port and
- Crosslink Supported bit is 1, Field is not used or affected by the current
- Link Equalization. Field value will be used if a future crosslink negotiation
switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: DSP || USP &&
- PCIE_CAP_CROSS_LINK_SUPPORT ? (if (DBI_RO_WR_EN == 1) then R/W
(sticky) else R(sticky)) : ROS
- RO
0x0 RSVDP_7: Reserved for future use. 6:4
- RW
0x7 DSP_RX_PRESET_HINT6:
- Downstream Port 8.0 GT/s Receiver Preset Hint6. Receiver preset hint 6
value that may be used as a suggested setting for 8.0 GT/s receiver equalization by this Port when the Port is operating as a Downstream
- Port. This field is ignored when the Port is operating as an Upstream
- Port. For an Upstream Port if Crosslink Supported is 0b, this field is
- RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this
field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
3:0
- RW
0x5 DSP_TX_PRESET6:
- Downstream Port 8.0 GT/s Transmitter Preset6. Transmitter preset 6
value used for 8.0 GT/s equalization by this Port when the Port is operating as a Downstream Port. This field is ignored when the Port is operating as an Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
- PCIE_X<i>_RC_PF0_PL16G_CAP_PL16G_CAPABILITY_REG_0
where <i> = 1, 4, 8. Description: This register is reserved for the future update.
- PCIE_X1_RC_PF0_PL16G_CAP_PL16G_CAPABILITY_REG_0
- Offset: 0x15c
- PCIE_X4_RC_PF0_PL16G_CAP_PL16G_CAPABILITY_REG_0
- Offset: 0x16c
- PCIE_X8_RC_PF0_PL16G_CAP_PL16G_CAPABILITY_REG_0
- Offset: 0x16c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 RSVDP_0: Reserved for future use.
- PCIE_X<i>_RC_PF0_PL16G_CAP_PL16G_CONTROL_REG_0
where <i> = 1, 4, 8.

- PCIe x1/x4/x8 Root Complex
Description: This register is reserved for the future update.
- PCIE_X1_RC_PF0_PL16G_CAP_PL16G_CONTROL_REG_0
- Offset: 0x160
- PCIE_X4_RC_PF0_PL16G_CAP_PL16G_CONTROL_REG_0
- Offset: 0x170
- PCIE_X8_RC_PF0_PL16G_CAP_PL16G_CONTROL_REG_0
- Offset: 0x170
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 RSVDP_0: Reserved for future use.
- PCIE_X<i>_RC_PF0_PL16G_CAP_PL16G_STATUS_REG_0
where <i> = 1, 4, 8. Description: 16.0 GT/s Status Register provides status of equalization of 16.0 GT/s speed.
- PCIE_X1_RC_PF0_PL16G_CAP_PL16G_STATUS_REG_0
- Offset: 0x164
- PCIE_X4_RC_PF0_PL16G_CAP_PL16G_STATUS_REG_0
- Offset: 0x174
- PCIE_X8_RC_PF0_PL16G_CAP_PL16G_STATUS_REG_0
- Offset: 0x174
- Read/Write: See table below
- Parity Protection: N
- Shadow: N

- PCIe x1/x4/x8 Root Complex
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:5
- RO
0x0 RSVDP_5: Reserved for future use.
- RW
0x0 LINK_EQ_16G_REQ:
- Link Equalization Request 16.0GT/s. For a Multi-Function
- Upstream Port, this bit must be implemented in Function 0 and
RsvdZ in other Functions.
- RO
0x0 EQ_16G_CPL_P3:
- Equalization 16.0GT/s Phase 3 Successful. For a Multi-Function
- Upstream Port, this bit must be implemented in Function 0 and
RsvdZ in other Functions. Note: This register field is sticky.
- RO
0x0 EQ_16G_CPL_P2:
- Equalization 16.0GT/s Phase 2 Successful. For a Multi-Function
- Upstream Port, this bit must be implemented in Function 0 and
RsvdZ in other Functions. Note: This register field is sticky.
- RO
0x0 EQ_16G_CPL_P1:
- Equalization 16.0GT/s Phase 1 Successful. For a Multi-Function
- Upstream Port, this bit must be implemented in Function 0 and
RsvdZ in other Functions. Note: This register field is sticky.
- RO
0x0 EQ_16G_CPL:
- Equalization 16.0GT/s Complete. For a Multi-Function Upstream
- Port, this bit must be implemented in Function 0 and RsvdZ in
other Functions. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PL16G_CAP_PL16G_LC_DPAR_STATUS_REG_0
where <i> = 1, 4, 8. Description: The Local Data Parity Mismatch Status register is a 32-bit vector where each bit indicates if the local receiver detected a Data Parity mismatch on the Lane with the corresponding Lane number. This Lane number is the default Lane number which is invariant to Link width and Lane reversal negotiation that occurs during Link training.
- PCIE_X1_RC_PF0_PL16G_CAP_PL16G_LC_DPAR_STATUS_REG_0
- Offset: 0x168
- PCIE_X4_RC_PF0_PL16G_CAP_PL16G_LC_DPAR_STATUS_REG_0
- Offset: 0x178
- PCIE_X8_RC_PF0_PL16G_CAP_PL16G_LC_DPAR_STATUS_REG_0
- Offset: 0x178

- PCIe x1/x4/x8 Root Complex
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:1
- RO
0x0 RSVDP_LC_DPAR_STATUS: Reserved for future use.
- RW
0x0 LC_DPAR_STATUS:
- Local Data Parity Mismatch Status. Each bit indicates if the
corresponding Lane detected a Data Parity mismatch. A value of 1b indicates that a mismatch was detected on the corresponding Lane
- Number. The default value of each bit is 0b. For Ports that are
narrower than 32 Lanes, the unused upper bits [31: MaximumLink Width] are RsvdZ.
- PCIE_X<i>_RC_PF0_PL16G_CAP_PL16G_FIRST_RETIMER_DPAR_STATUS_REG_0
where <i> = 1, 4, 8. Description: The First Retimer Data Parity Status register is a 32-bit vector where each bit indicates if the first Retimer of a Path detected a Data Parity mismatch on the Lane with the corresponding Lane number. This Lane number is the default Lane number which is invariant to Link width and Lane reversal negotiation that occurs during Link training.
- PCIE_X1_RC_PF0_PL16G_CAP_PL16G_FIRST_RETIMER_DPAR_STATUS_REG_0
- Offset: 0x16c
- PCIE_X4_RC_PF0_PL16G_CAP_PL16G_FIRST_RETIMER_DPAR_STATUS_REG_0
- Offset: 0x17c
- PCIE_X8_RC_PF0_PL16G_CAP_PL16G_FIRST_RETIMER_DPAR_STATUS_REG_0
- Offset: 0x17c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
31:1
- RO
0x0 RSVDP_FIRST_RETIMER_DPAR_STATUS: Reserved for future use.
- RW
0x0 FIRST_RETIMER_DPAR_STATUS:
- First Retimer Data Parity Mismatch Status. Each bit indicates if the
corresponding Lane detected a Data Parity mismatch. A value of 1b indicates that a mismatch was detected on the corresponding Lane
- Number. The default value of each bit is 0b. The value of this field is
undefined when no Retimers are present. For Ports that are narrower than 32 Lanes, the unused upper bits [31: Maximum Link Width] are RsvdZ.
- PCIE_X<i>_RC_PF0_PL16G_CAP_PL16G_SECOND_RETIMER_DPAR_STATUS_REG_0
where <i> = 1, 4, 8. Description: The Second Retimer Data Parity Status register is a 32-bit vector where each bit indicates if the second Retimer of a Path detected a Data Parity mismatch on the Lane with the corresponding Lane number. This Lane number is the default Lane number which is invariant to Link width and Lane reversal negotiation that occurs during Link training.
- PCIE_X1_RC_PF0_PL16G_CAP_PL16G_SECOND_RETIMER_DPAR_STATUS_REG_0
- Offset: 0x170
- PCIE_X4_RC_PF0_PL16G_CAP_PL16G_SECOND_RETIMER_DPAR_STATUS_REG_0
- Offset: 0x180
- PCIE_X8_RC_PF0_PL16G_CAP_PL16G_SECOND_RETIMER_DPAR_STATUS_REG_0
- Offset: 0x180
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Rese
t
- Description
31:1
- RO
0x0 RSVDP_SECOND_RETIMER_DPAR_STATUS: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Rese
t
- Description
- RW
0x0 SECOND_RETIMER_DPAR_STATUS:
- Second Retimer Data Parity Mismatch Status. Each bit indicates if the corresponding Lane
detected a Data Parity mismatch. A value of 1b indicates that a mismatch was detected on the corresponding Lane Number. The default value of each bit is 0b. The value of this field is undefined when no Retimers are present or only one Retimer is present. For Ports that are narrower than 32 Lanes, the unused upper bits [31: Maximum Link Width] are RsvdZ.
- PCIE_X<i>_RC_PF0_PL16G_CAP_PL16G_CAP_OFF_20H_REG_0
where <i> = 1, 4, 8. Description: This Equalization Control register consists of control fields required for Lane 0-3 16.0 GT/s equalization.
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_PL16G_CAP_PL16G_CAP_OFF_20H_REG_0
- Offset: 0x178
- Reset: 0x00000055 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0101,0101)
- Bit
- Reset
- Description
7:4 0x5 USP_16G_TX_PRESET0:
- Upstream Port 16.0 GT/s Transmitter Preset0. - Case A: When Operating port is
- Downstream port and whether the Crosslink is supported or not, this field
represents the value sent on Lane 0 during 16.0 GT/s equalization. - Case B: When
- Operating port is Upstream port and Crosslink Supported bit is 0, this field is
intended for debug and diagnostics. It contains the value captured from Lane 0 during Link Equalization. - Case C: When Operating port is Upstream port and
- Crosslink Supported bit is 1, Field is not used or affected by the current Link
- Equalization. Field value will be used if a future crosslink negotiation switches the
- Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For
case B, Field is RO. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R 3:0 0x5 DSP_16G_TX_PRESET0:
- Downstream Port 16.0 GT/s Transmitter Preset0. Transmitter Preset of Lane 0 used
for 16.0 GT/s equalization by this Port when the Port is operating as a Downstream
- Port. This field is ignored when the Port is operating as an Upstream Port. For an
- Upstream Port if Crosslink Supported is 0b, this field is RsvdP. Otherwise, this field is
- HwInit. Note: The access attributes of this field are as follows: - Wire: No access. -
- Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
- PCIE_X4_RC_PF0_PL16G_CAP_PL16G_CAP_OFF_20H_REG_0
- PCIE_X8_RC_PF0_PL16G_CAP_PL16G_CAP_OFF_20H_REG_0

- PCIe x1/x4/x8 Root Complex
- Offset: 0x188
- Reset: 0x55555555 (0b0101,0101,0101,0101,0101,0101,0101,0101)
- Bit
- Reset
- Description
31:28 0x5 USP_16G_TX_PRESET3:
- Upstream Port 16.0 GT/s Transmitter Preset3. - Case A: When Operating port is
- Downstream port and whether the Crosslink is supported or not, this field
represents the value sent on Lane 3 during 16.0 GT/s equalization. - Case B:
- When Operating port is Upstream port and Crosslink Supported bit is 0, this
field is intended for debug and diagnostics. It contains the value captured from
- Lane 3 during Link Equalization. - Case C: When Operating port is Upstream port
and Crosslink Supported bit is 1, Field is not used or affected by the current Link
- Equalization. Field value will be used if a future crosslink negotiation switches the
Operating Port Direction so that case A applies. For case A and C, Field is HwInit.
- For case B, Field is RO. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
27:24 0x5 DSP_16G_TX_PRESET3:
- Downstream Port 16.0 GT/s Transmitter Preset3. Transmitter Preset of Lane 3
used for 16.0 GT/s equalization by this Port when the Port is operating as a
- Downstream Port. This field is ignored when the Port is operating as an
- Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is
- RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this field are
as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R 23:20 0x5 USP_16G_TX_PRESET2:
- Upstream Port 16.0 GT/s Transmitter Preset2. - Case A: When Operating port is
- Downstream port and whether the Crosslink is supported or not, this field
represents the value sent on Lane 2 during 16.0 GT/s equalization. - Case B:
- When Operating port is Upstream port and Crosslink Supported bit is 0, this
field is intended for debug and diagnostics. It contains the value captured from
- Lane 2 during Link Equalization. - Case C: When Operating port is Upstream port
and Crosslink Supported bit is 1, Field is not used or affected by the current Link
- Equalization. Field value will be used if a future crosslink negotiation switches the
Operating Port Direction so that case A applies. For case A and C, Field is HwInit.
- For case B, Field is RO. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
19:16 0x5 DSP_16G_TX_PRESET2:
- Downstream Port 16.0 GT/s Transmitter Preset2. Transmitter Preset of Lane 2
used for 16.0 GT/s equalization by this Port when the Port is operating as a
- Downstream Port. This field is ignored when the Port is operating as an
- Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is
- RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this field are
as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R 15:12 0x5 USP_16G_TX_PRESET1:
- Upstream Port 16.0 GT/s Transmitter Preset1. - Case A: When Operating port is
- Downstream port and whether the Crosslink is supported or not, this field
represents the value sent on Lane 1 during 16.0 GT/s equalization. - CaseB: When
- Operating port is Upstream port and Crosslink Supported bit is 0, this field is
intended for debug and diagnostics. It contains the value captured from Lane 1 during Link Equalization. Case C: When Operating port is Upstream port and
- Crosslink Supported bit is 1, Field is not used or affected by the current Link
- Equalization. Field value will be used if a future crosslink negotiation switches the
Operating Port Direction so that case A applies. For case A and C, Field is HwInit.
- For case B, Field is RO. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
11:8 0x5 DSP_16G_TX_PRESET1:
- Downstream Port 16.0 GT/s Transmitter Preset1. Transmitter Preset of Lane 1
used for 16.0 GT/s equalization by this Port when the Port is operating as a
- Downstream Port. This field is ignored when the Port is operating as an
- Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is
- RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this field are
as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R 7:4 0x5 USP_16G_TX_PRESET0:
- Upstream Port 16.0 GT/s Transmitter Preset0. - Case A: When Operating port is
- Downstream port and whether the Crosslink is supported or not, this field
represents the value sent on Lane 0 during 16.0 GT/s equalization. - Case B:
- When Operating port is Upstream port and Crosslink Supported bit is 0, this
field is intended for debug and diagnostics. It contains the value captured from
- Lane 0 during Link Equalization. - Case C: When Operating port is Upstream port
and Crosslink Supported bit is 1, Field is not used or affected by the current Link
- Equalization. Field value will be used if a future crosslink negotiation switches the
Operating Port Direction so that case A applies. For case A and C, Field is HwInit.
- For case B, Field is RO. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
3:0 0x5 DSP_16G_TX_PRESET0:
- Downstream Port 16.0 GT/s Transmitter Preset0. Transmitter Preset of Lane 0
used for 16.0 GT/s equalization by this Port when the Port is operating as a
- Downstream Port. This field is ignored when the Port is operating as an
- Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is
- RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this field are
as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
- PCIE_X8_RC_PF0_PL16G_CAP_PL16G_CAP_OFF_24H_REG_0
Description: This Equalization Control register consists of control fields required for Lane 4-7 16.0
- GT/s equalization.)
- Offset: 0x18c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x55555555 (0b0101,0101,0101,0101,0101,0101,0101,0101)

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
31:28 0x5 USP_16G_TX_PRESET7:
- Upstream Port 16.0 GT/s Transmitter Preset7. - Case A: When Operating port is
- Downstream port and whether the Crosslink is supported or not, this field
represents the value sent on Lane 7 during 16.0 GT/s equalization. - Case B:
- When Operating port is Upstream port and Crosslink Supported bit is 0, this
field is intended for debug and diagnostics. It contains the value captured from
- Lane 7 during Link Equalization. - Case C: When Operating port is Upstream port
and Crosslink Supported bit is 1, Field is not used or affected by the current Link
- Equalization. Field value will be used if a future crosslink negotiation switches the
Operating Port Direction so that case A applies. For case A and C, Field is HwInit.
- For case B, Field is RO. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
27:24 0x5 DSP_16G_TX_PRESET7:
- Downstream Port 16.0 GT/s Transmitter Preset7. Transmitter Preset of Lane 7
used for 16.0 GT/s equalization by this Port when the Port is operating as a
- Downstream Port. This field is ignored when the Port is operating as an
- Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is
- RsvdP . Otherwise, this field is HwInit. Note: The access attributes of this field
are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R 23:20 0x5 USP_16G_TX_PRESET6:
- Upstream Port 16.0 GT/s Transmitter Preset6. - Case A: When Operating port is
- Downstream port and whether the Crosslink is supported or not, this field
represents the value sent on Lane 6 during 16.0 GT/s equalization. - Case B:
- When Operating port is Upstream port and Crosslink Supported bit is 0, this
field is intended for debug and diagnostics. It contains the value captured from
- Lane 6 during Link Equalization. - Case C: When Operating port is Upstream port
and Crosslink Supported bit is 1, Field is not used or affected by the current Link
- Equalization. Field value will be used if a future crosslink negotiation switches the
Operating Port Direction so that case A applies. For case A and C, Field is HwInit.
- For case B, Field is RO. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
19:16 0x5 DSP_16G_TX_PRESET6:
- Downstream Port 16.0 GT/s Transmitter Preset6. Transmitter Preset of Lane 6
used for 16.0 GT/s equalization by this Port when the Port is operating as a
- Downstream Port. This field is ignored when the Port is operating as an
- Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is
- RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this field are
as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R 15:12 0x5 USP_16G_TX_PRESET5:
- Upstream Port 16.0 GT/s Transmitter Preset5. - Case A: When Operating port is
- Downstream port and whether the Crosslink is supported or not, this field
represents the value sent on Lane 5 during 16.0 GT/s equalization. - Case B:
- When Operating port is Upstream port and Crosslink Supported bit is 0, this
field is intended for debug and diagnostics. It contains the value captured from
- Lane 5 during Link Equalization. - Case C: When Operating port is Upstream port
and Crosslink Supported bit is 1, Field is not used or affected by the current Link
- Equalization. Field value will be used if a future crosslink negotiation switches the
Operating Port Direction so that case A applies. For case A and C, Field is HwInit.
- For case B, Field is RO. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
11:8 0x5 DSP_16G_TX_PRESET5:
- Downstream Port 16.0 GT/s Transmitter Preset5. Transmitter Preset of Lane 5
used for 16.0 GT/s equalization by this Port when the Port is operating as a
- Downstream Port. This field is ignored when the Port is operating as an
- Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is
- RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this field are
as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
7:4 0x5 USP_16G_TX_PRESET4:
- Upstream Port 16.0 GT/s Transmitter Preset4. -Case A: When Operating port is
- Downstream port and whether the Crosslink is supported or not, this field
represents the value sent on Lane 4 during 16.0 GT/s equalization. -Case B: When
- Operating port is Upstream port and Crosslink Supported bit is 0, this field is
intended for debug and diagnostics. It contains the value captured from Lane 4 during Link Equalization. Case C: When Operating port is Upstream port and
- Crosslink Supported bit is 1, Field is not used or affected by the current Link
- Equalization. Field value will be used if a future crosslink negotiation switches the
Operating Port Direction so that case A applies. For case A and C, Field is HwInit.
- For case B, Field is RO. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
3:0 0x5 DSP_16G_TX_PRESET4:
- Downstream Port 16.0 GT/s Transmitter Preset4. Transmitter Preset of Lane 4
used for 16.0 GT/s equalization by this Port when the Port is operating as a
- Downstream Port. This field is ignored when the Port is operating as an
- Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is
- RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this field are
as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
- PCIE_X<i>_RC_PF0_MARGIN_CAP_MARGIN_EXT_CAP_HDR_REG_0
where <i> = 1, 4, 8. Description: This register provides capbility ID, capability version and next offset value for Margining Extended Capability.
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_MARGIN_CAP_MARGIN_EXT_CAP_HDR_REG_0
- Offset: 0x17c
- Reset: 0x19010027 (0b0001,1001,0000,0001,0000,0000,0010,0111)
- Bit
- Reset
- Description
31:20 0x190 NEXT_OFFSET:
- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space,
this offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greaterthan 0FFh. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
19:16 0x1 CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. This field is depends on version of the specification. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 15:0 0x27 EXTENDED_CAP_ID:
- PCI Express Extended Capability ID. This field is a PCI-SIG defined ID number
that indicates the nature and format of the Extended Capability. The Extended
- Capability ID for the Physical Layer 16.0 GT/s Margining Extended Capability is
0027h. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X4_RC_PF0_MARGIN_CAP_MARGIN_EXT_CAP_HDR_REG_0
- Offset: 0x18c
- Reset: 0x1ac10027 (0b0001,1010,1100,0001,0000,0000,0010,0111)
- Bit
- Reset
- Description
31:20 0x1ac NEXT_OFFSET:
- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space,
this offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greaterthan 0FFh. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 19:16 0x1 CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. This field is depends on version of the specification. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 15:0 0x27 EXTENDED_CAP_ID:
- PCI Express Extended Capability ID. This field is a PCI-SIG defined ID number
that indicates the nature and format of the Extended Capability. The Extended
- Capability ID for the Physical Layer 16.0 GT/s Margining Extended Capability is
0027h. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X8_RC_PF0_MARGIN_CAP_MARGIN_EXT_CAP_HDR_REG_0
- Offset: 0x190
- Reset: 0x1c010027 (0b0001,1100,0000,0001,0000,0000,0010,0111)

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
31:20 0x1c0 NEXT_OFFSET:
- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space,
this offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greaterthan 0FFh. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 19:16 0x1 CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. This field is depends on version of the specification. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 15:0 0x27 EXTENDED_CAP_ID:
- PCI Express Extended Capability ID. This field is a PCI-SIG defined ID number
that indicates the nature and format of the Extended Capability. The Extended
- Capability ID for the Physical Layer 16.0 GT/s Margining Extended Capability is
0027h. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_MARGIN_CAP_MARGIN_PORT_CAPABILITIES_STATUS_REG_0
where <i> = 1, 4, 8. Description: This register indicates the status of the Margining feature.
- PCIE_X1_RC_PF0_MARGIN_CAP_MARGIN_PORT_CAPABILITIES_STATUS_REG_0
- Offset: 0x180
- PCIE_X4_RC_PF0_MARGIN_CAP_MARGIN_PORT_CAPABILITIES_STATUS_REG_0
- Offset: 0x190
- PCIE_X8_RC_PF0_MARGIN_CAP_MARGIN_PORT_CAPABILITIES_STATUS_REG_0
- Offset: 0x194
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000001 (0b0000,0000,0000,0000,0000,0000,0000,0001)

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
31:18
- RO
0x0 RSVDP_18: Reserved for future use.
- RO
0x0 MARGINING_SOFTWARE_READY:
- Margining Software Ready. When Margining uses Driver Software is
- Set, then this bit, when Set, indicates that the required software has
performed the required initialization. The value of this bit is undefined if Margining uses Driver Software is Clear. The default value of this bit is implementation specific. If Margining uses Driver Software is Clear,
- Margining Ready must be Set no later than 100 ms after the Link
trains to 16.0 GT/s. Default value is implementation specific.
- RO
0x0 MARGINING_READY:
- Margining Ready. Indicates when the Margining feature is ready to
accept margining commands. Behavior is undefined if this bit is Clear and, for any Lane, any of the Receiver Number , Margin Type , Usage
- Model , or Margin Payload fields are written. If Margining uses Driver
- Software is Set, Margining Ready must be Set no later than 100 ms
after the later of Margining Software Ready becoming Set or the link training to 16.0 GT/s. 15:1
- RO
0x0 RSVDP_1: Reserved for future use.
- RW
0x1 MARGINING_USES_DRIVER_SOFTWARE:
- Margining uses Driver Software. If Set, indicates that Margining is
partially implemented using Device Driver software. Margining
- Software Ready indicates when this software is initialized. If Clear,
- Margining does not require device driver software. In this case the
value read from Margining Software Ready is undefined. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_MARGIN_CAP_MARGIN_LANE_CNTRL_STATUS0_REG_0
where <i> = 1, 4, 8. Description: The Margining Lane Control Register consists of control fields required for per-Lane margining. The number of entries in this register are sized by Maximum Link Width.
- PCIE_X1_RC_PF0_MARGIN_CAP_MARGIN_LANE_CNTRL_STATUS0_REG_0
- Offset: 0x184
- PCIE_X4_RC_PF0_MARGIN_CAP_MARGIN_LANE_CNTRL_STATUS0_REG_0
- Offset: 0x194
- PCIE_X8_RC_PF0_MARGIN_CAP_MARGIN_LANE_CNTRL_STATUS0_REG_0
- Offset: 0x198

- PCIe x1/x4/x8 Root Complex
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00009c38 (0b0000,0000,0000,0000,1001,1100,0011,1000)
- Bit
R/W
- Reset
- Description
31:24
- RO
0x0 MARGIN_PAYLOAD_STATUS:
- Margin Payload(Status) for Lane 0. This field is only meaningful,
when the Margin Type is a defined encoding other than 'No
- Command'. This field must be reset to the default value if the
Port goes to DL_Down status.
- RO
0x0 RSVDP_23: Reserved for future use.
- RO
0x0 USAGE_MODEL_STATUS:
- Usage Model(Status) for Lane 0. This field must be reset to the
default value if the Port goes to DL_Down status. 21:19
- RO
0x0 MARGIN_TYPE_STATUS:
- Margin Type(Status) for Lane 0. This field must be reset to the
default value if the Port goes to DL_Down status. 18:16
- RO
0x0 RECEIVER_NUMBER_STATUS:
- Receiver Number(Status) for Lane 0. For Downstream Ports, this
field must be reset to the default value if the Port goes to DL_Down status. 15:8
- RW
0x9c MARGIN_PAYLOAD:
- Margin Payload for Lane 0. This field must be reset to the default
value if the Port goes to DL_Down status.
- RO
0x0 RSVDP_7: Reserved for future use.
- RW
0x0 USAGE_MODEL:
- Usage Model for Lane 0. This field must be reset to the default
value if the Port goes to DL_Down status. 5:3
- RW
0x7 MARGIN_TYPE:
- Margin Type for Lane 0. The default value is 111b. This field must
be reset to the default value if the Port goes to DL_Down status. 2:0
- RW
0x0 RECEIVER_NUMBER:
- Receiver Number for Lane 0. This field must be reset to the
default value if the Port goes to DL_Down status.
- PCIE_X<j>_RC_PF0_MARGIN_CAP_MARGIN_LANE_CNTRL_STATUS1_REG_0
where <j> = 4, 8. Description: The Margining Lane Control Register consists of control fields required for per-Lane margining. The number of entries in this register are sized by Maximum Link Width.

- PCIe x1/x4/x8 Root Complex
- PCIE_X4_RC_PF0_MARGIN_CAP_MARGIN_LANE_CNTRL_STATUS1_REG_0
- Offset: 0x198
- PCIE_X8_RC_PF0_MARGIN_CAP_MARGIN_LANE_CNTRL_STATUS1_REG_0
- Offset: 0x19c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00009c38 (0b0000,0000,0000,0000,1001,1100,0011,1000)
- Bit
R/W
- Reset
- Description
31:24
- RO
0x0 MARGIN_PAYLOAD_STATUS:
- Margin Payload(Status) for Lane 1. This field is only meaningful,
when the Margin Type is a defined encoding other than 'No
- Command'. This field must be reset to the default value if the
Port goes to DL_Down status.
- RO
0x0 RSVDP_23: Reserved for future use.
- RO
0x0 USAGE_MODEL_STATUS:
- Usage Model(Status) for Lane 1. This field must be reset to the
default value if the Port goes to DL_Down status. 21:19
- RO
0x0 MARGIN_TYPE_STATUS:
- Margin Type(Status) for Lane 1. This field must be reset to the
default value if the Port goes to DL_Down status. 18:16
- RO
0x0 RECEIVER_NUMBER_STATUS:
- Receiver Number(Status) for Lane 1. For Downstream Ports, this
field must be reset to the default value if the Port goes to DL_Down status. 15:8
- RW
0x9c MARGIN_PAYLOAD:
- Margin Payload for Lane 1. This field must be reset to the default
value if the Port goes to DL_Down status.
- RO
0x0 RSVDP_7: Reserved for future use.
- RW
0x0 USAGE_MODEL:
- Usage Model for Lane 1. This field must be reset to the default
value if the Port goes to DL_Down status. 5:3
- RW
0x7 MARGIN_TYPE:
- Margin Type for Lane 1. The default value is 111b. This field must
be reset to the default value if the Port goes to DL_Down status. 2:0
- RW
0x0 RECEIVER_NUMBER:
- Receiver Number for Lane 1. This field must be reset to the
default value if the Port goes to DL_Down status.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<j>_RC_PF0_MARGIN_CAP_MARGIN_LANE_CNTRL_STATUS2_REG_0
where <j> = 4, 8. Description: The Margining Lane Control Register consists of control fields required for per-Lane margining. The number of entries in this register are sized by Maximum Link Width.
- PCIE_X4_RC_PF0_MARGIN_CAP_MARGIN_LANE_CNTRL_STATUS2_REG_0
- Offset: 0x19c
- PCIE_X8_RC_PF0_MARGIN_CAP_MARGIN_LANE_CNTRL_STATUS2_REG_0
- Offset: 0x1a0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00009c38 (0b0000,0000,0000,0000,1001,1100,0011,1000)
- Bit
R/W
- Reset
- Description
31:24
- RO
0x0 MARGIN_PAYLOAD_STATUS:
- Margin Payload(Status) for Lane 2. This field is only meaningful,
when the Margin Type is a defined encoding other than 'No
- Command'. This field must be reset to the default value if the
Port goes to DL_Down status.
- RO
0x0 RSVDP_23: Reserved for future use.
- RO
0x0 USAGE_MODEL_STATUS:
- Usage Model(Status) for Lane 2. This field must be reset to the
default value if the Port goes to DL_Down status. 21:19
- RO
0x0 MARGIN_TYPE_STATUS:
- Margin Type(Status) for Lane 2. This field must be reset to the
default value if the Port goes to DL_Down status. 18:16
- RO
0x0 RECEIVER_NUMBER_STATUS:
- Receiver Number(Status) for Lane 2. For Downstream Ports, this
field must be reset to the default value if the Port goes to DL_Down status. 15:8
- RW
0x9c MARGIN_PAYLOAD:
- Margin Payload for Lane 2. This field must be reset to the default
value if the Port goes to DL_Down status.
- RO
0x0 RSVDP_7: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x0 USAGE_MODEL:
- Usage Model for Lane 2. This field must be reset to the default
value if the Port goes to DL_Down status. 5:3
- RW
0x7 MARGIN_TYPE:
- Margin Type for Lane 2. The default value is 111b. This field must
be reset to the default value if the Port goes to DL_Down status. 2:0
- RW
0x0 RECEIVER_NUMBER:
- Receiver Number for Lane 2. This field must be reset to the
default value if the Port goes to DL_Down status.
- PCIE_X<j>_RC_PF0_MARGIN_CAP_MARGIN_LANE_CNTRL_STATUS3_REG_0
where <j> = 4, 8. Description: The Margining Lane Control Register consists of control fields required for per-Lane margining. The number of entries in this register are sized by Maximum Link Width.
- PCIE_X4_RC_PF0_MARGIN_CAP_MARGIN_LANE_CNTRL_STATUS3_REG_0
- Offset: 0x1a0
- PCIE_X8_RC_PF0_MARGIN_CAP_MARGIN_LANE_CNTRL_STATUS3_REG_0
- Offset: 0x1a4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00009c38 (0b0000,0000,0000,0000,1001,1100,0011,1000)
- Bit
R/W
- Reset
- Description
31:24
- RO
0x0 MARGIN_PAYLOAD_STATUS:
- Margin Payload(Status) for Lane 3. This field is only meaningful,
when the Margin Type is a defined encoding other than 'No
- Command'. This field must be reset to the default value if the
Port goes to DL_Down status.
- RO
0x0 RSVDP_23: Reserved for future use.
- RO
0x0 USAGE_MODEL_STATUS:
- Usage Model(Status) for Lane 3. This field must be reset to the
default value if the Port goes to DL_Down status. 21:19
- RO
0x0 MARGIN_TYPE_STATUS:
- Margin Type(Status) for Lane 3. This field must be reset to the
default value if the Port goes to DL_Down status.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
18:16
- RO
0x0 RECEIVER_NUMBER_STATUS:
- Receiver Number(Status) for Lane 3. For Downstream Ports, this
field must be reset to the default value if the Port goes to DL_Down status. 15:8
- RW
0x9c MARGIN_PAYLOAD:
- Margin Payload for Lane 3. This field must be reset to the default
value if the Port goes to DL_Down status.
- RO
0x0 RSVDP_7: Reserved for future use.
- RW
0x0 USAGE_MODEL:
- Usage Model for Lane 3. This field must be reset to the default
value if the Port goes to DL_Down status. 5:3
- RW
0x7 MARGIN_TYPE:
- Margin Type for Lane 3. The default value is 111b. This field must
be reset to the default value if the Port goes to DL_Down status. 2:0
- RW
0x0 RECEIVER_NUMBER:
- Receiver Number for Lane 3. This field must be reset to the
default value if the Port goes to DL_Down status.
- PCIE_X8_RC_PF0_MARGIN_CAP_MARGIN_LANE_CNTRL_STATUS4_REG_0
Description: The Margining Lane Control Register consists of control fields required for per-Lane margining. The number of entries in this register are sized by Maximum Link Width.
- Offset: 0x1a8
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00009c38 (0b0000,0000,0000,0000,1001,1100,0011,1000)
- Bit
R/W
- Reset
- Description
31:24
- RO
0x0 MARGIN_PAYLOAD_STATUS:
- Margin Payload(Status) for Lane 4. This field is only meaningful,
when the Margin Type is a defined encoding other than 'No
- Command'. This field must be reset to the default value if the
Port goes to DL_Down status.
- RO
0x0 RSVDP_23: Reserved for future use.
- RO
0x0 USAGE_MODEL_STATUS:
- Usage Model(Status) for Lane 4. This field must be reset to the
default value if the Port goes to DL_Down status. 21:19
- RO
0x0 MARGIN_TYPE_STATUS:
- Margin Type(Status) for Lane 4. This field must be reset to the
default value if the Port goes to DL_Down status.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
18:16
- RO
0x0 RECEIVER_NUMBER_STATUS:
- Receiver Number(Status) for Lane 4. For Downstream Ports, this
field must be reset to the default value if the Port goes to DL_Down status. 15:8
- RW
0x9c MARGIN_PAYLOAD:
- Margin Payload for Lane 4. This field must be reset to the default
value if the Port goes to DL_Down status.
- RO
0x0 RSVDP_7: Reserved for future use.
- RW
0x0 USAGE_MODEL:
- Usage Model for Lane 4. This field must be reset to the default
value if the Port goes to DL_Down status. 5:3
- RW
0x7 MARGIN_TYPE:
- Margin Type for Lane 4. The default value is 111b. This field must
be reset to the default value if the Port goes to DL_Down status. 2:0
- RW
0x0 RECEIVER_NUMBER:
- Receiver Number for Lane 4. This field must be reset to the
default value if the Port goes to DL_Down status.
- PCIE_X8_RC_PF0_MARGIN_CAP_MARGIN_LANE_CNTRL_STATUS5_REG_0
Description: The Margining Lane Control Register consists of control fields required for per-Lane margining. The number of entries in this register are sized by Maximum Link Width.
- Offset: 0x1ac
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00009c38 (0b0000,0000,0000,0000,1001,1100,0011,1000)
- Bit
R/W
- Reset
- Description
31:24
- RO
0x0 MARGIN_PAYLOAD_STATUS:
- Margin Payload(Status) for Lane 5. This field is only meaningful,
when the Margin Type is a defined encoding other than 'No
- Command'. This field must be reset to the default value if the
Port goes to DL_Down status.
- RO
0x0 RSVDP_23: Reserved for future use.
- RO
0x0 USAGE_MODEL_STATUS:
- Usage Model(Status) for Lane 5. This field must be reset to the
default value if the Port goes to DL_Down status. 21:19
- RO
0x0 MARGIN_TYPE_STATUS:
- Margin Type(Status) for Lane 5. This field must be reset to the
default value if the Port goes to DL_Down status.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
18:16
- RO
0x0 RECEIVER_NUMBER_STATUS:
- Receiver Number(Status) for Lane 5. For Downstream Ports, this
field must be reset to the default value if the Port goes to DL_Down status. 15:8
- RW
0x9c MARGIN_PAYLOAD:
- Margin Payload for Lane 5. This field must be reset to the default
value if the Port goes to DL_Down status.
- RO
0x0 RSVDP_7: Reserved for future use.
- RW
0x0 USAGE_MODEL:
- Usage Model for Lane 5. This field must be reset to the default
value if the Port goes to DL_Down status. 5:3
- RW
0x7 MARGIN_TYPE:
- Margin Type for Lane 5. The default value is 111b. This field must
be reset to the default value if the Port goes to DL_Down status. 2:0
- RW
0x0 RECEIVER_NUMBER:
- Receiver Number for Lane 5. This field must be reset to the
default value if the Port goes to DL_Down status.
- PCIE_X8_RC_PF0_MARGIN_CAP_MARGIN_LANE_CNTRL_STATUS6_REG_0
Description: The Margining Lane Control Register consists of control fields required for per-Lane margining. The number of entries in this register are sized by Maximum Link Width.
- Offset: 0x1b0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00009c38 (0b0000,0000,0000,0000,1001,1100,0011,1000)
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
31:24
- RO
0x0 MARGIN_PAYLOAD_STATUS:
- Margin Payload(Status) for Lane 6. This field is only meaningful,
when the Margin Type is a defined encoding other than 'No
- Command'. This field must be reset to the default value if the
Port goes to DL_Down status.
- RO
0x0 RSVDP_23: Reserved for future use.
- RO
0x0 USAGE_MODEL_STATUS:
- Usage Model(Status) for Lane 6. This field must be reset to the
default value if the Port goes to DL_Down status.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
21:19
- RO
0x0 MARGIN_TYPE_STATUS:
- Margin Type(Status) for Lane 6. This field must be reset to the
default value if the Port goes to DL_Down status. 18:16
- RO
0x0 RECEIVER_NUMBER_STATUS:
- Receiver Number(Status) for Lane 6. For Downstream Ports, this
field must be reset to the default value if the Port goes to DL_Down status. 15:8
- RW
0x9c MARGIN_PAYLOAD:
- Margin Payload for Lane 6. This field must be reset to the default
value if the Port goes to DL_Down status.
- RO
0x0 RSVDP_7: Reserved for future use.
- RW
0x0 USAGE_MODEL:
- Usage Model for Lane 6. This field must be reset to the default
value if the Port goes to DL_Down status. 5:3
- RW
0x7 MARGIN_TYPE:
- Margin Type for Lane 6. The default value is 111b. This field must
be reset to the default value if the Port goes to DL_Down status. 2:0
- RW
0x0 RECEIVER_NUMBER:
- Receiver Number for Lane 6. This field must be reset to the
default value if the Port goes to DL_Down status.
- PCIE_X8_RC_PF0_MARGIN_CAP_MARGIN_LANE_CNTRL_STATUS7_REG_0
Description: The Margining Lane Control Register consists of control fields required for per-Lane margining. The number of entries in this register are sized by Maximum Link Width.
- Offset: 0x1b4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00009c38 (0b0000,0000,0000,0000,1001,1100,0011,1000)
- Bit
R/W
- Reset
- Description
31:24
- RO
0x0 MARGIN_PAYLOAD_STATUS:
- Margin Payload(Status) for Lane 7. This field is only meaningful,
when the Margin Type is a defined encoding other than 'No
- Command'. This field must be reset to the default value if the
Port goes to DL_Down status.
- RO
0x0 RSVDP_23: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RO
0x0 USAGE_MODEL_STATUS:
- Usage Model(Status) for Lane 7. This field must be reset to the
default value if the Port goes to DL_Down status. 21:19
- RO
0x0 MARGIN_TYPE_STATUS:
- Margin Type(Status) for Lane 7. This field must be reset to the
default value if the Port goes to DL_Down status. 18:16
- RO
0x0 RECEIVER_NUMBER_STATUS:
- Receiver Number(Status) for Lane 7. For Downstream Ports, this
field must be reset to the default value if the Port goes to DL_Down status. 15:8
- RW
0x9c MARGIN_PAYLOAD:
- Margin Payload for Lane 7. This field must be reset to the default
value if the Port goes to DL_Down status.
- RO
0x0 RSVDP_7: Reserved for future use.
- RW
0x0 USAGE_MODEL:
- Usage Model for Lane 7. This field must be reset to the default
value if the Port goes to DL_Down status. 5:3
- RW
0x7 MARGIN_TYPE:
- Margin Type for Lane 7. The default value is 111b. This field must
be reset to the default value if the Port goes to DL_Down status. 2:0
- RW
0x0 RECEIVER_NUMBER:
- Receiver Number for Lane 7. This field must be reset to the
default value if the Port goes to DL_Down status.
- PCIE_X<i>_RC_PF0_L1SUB_CAP_L1SUB_CAP_HEADER_REG_0
where <i> = 1, 4, 8. Description: L1 Substates Extended Capability Header provides capability ID, capability version and next offset value for L1 Substates.
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_L1SUB_CAP_L1SUB_CAP_HEADER_REG_0
- Offset: 0x190
- Reset: 0x1a01001e (0b0001,1010,0000,0001,0000,0000,0001,1110)

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
31:20 0x1a0 NEXT_OFFSET:
- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h, if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space, this
offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greater than 0FFh. The bottom 2 bits of this offset are Reserved and must be implemented as 00b although software must mask them to allow for future uses of these bits. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 19:16 0x1 CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. This field is depends on version of the specification. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 15:0 0x1e EXTENDED_CAP_ID:
- L1SUB Extended Capability ID. This field is a PCI-SIG defined ID number that
indicates the nature and format of the Extended Capability. Extended Capability
- ID for L1 PM Substates is 001Eh. Note: The access attributes of this field are as
follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X4_RC_PF0_L1SUB_CAP_L1SUB_CAP_HEADER_REG_0
- Offset: 0x1ac
- Reset: 0x1bc1001e (0b0001,1011,1100,0001,0000,0000,0001,1110)
- Bit
- Reset
- Description
31:20 0x1bc NEXT_OFFSET:
- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h, if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space, this
offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greater than 0FFh. The bottom 2 bits of this offset are Reserved and must be implemented as 00b although software must mask them to allow for future uses of these bits. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 19:16 0x1 CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. This field is depends on version of the specification. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 15:0 0x1e EXTENDED_CAP_ID:
- L1SUB Extended Capability ID. This field is a PCI-SIG defined ID number that
indicates the nature and format of the Extended Capability. Extended Capability
- ID for L1 PM Substates is 001Eh. Note: The access attributes of this field are as
follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X8_RC_PF0_L1SUB_CAP_L1SUB_CAP_HEADER_REG_0

- PCIe x1/x4/x8 Root Complex
- Offset: 0x1c0
- Reset: 0x1d01001e (0b0001,1101,0000,0001,0000,0000,0001,1110)
- Bit
- Reset
- Description
31:20 0x1d0 NEXT_OFFSET:
- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h, if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space, this
offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greater than 0FFh. The bottom 2 bits of this offset are Reserved and must be implemented as 00b although software must mask them to allow for future uses of these bits. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 19:16 0x1 CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. This field is depends on version of the specification. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 15:0 0x1e EXTENDED_CAP_ID:
- L1SUB Extended Capability ID. This field is a PCI-SIG defined ID number that
indicates the nature and format of the Extended Capability. Extended Capability
- ID for L1 PM Substates is 001Eh. Note: The access attributes of this field are as
follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_L1SUB_CAP_L1SUB_CAPABILITY_REG_0
where <i> = 1, 4, 8. Description: This register provides extended capability of L1 Substates.
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_L1SUB_CAP_L1SUB_CAPABILITY_REG_0
- Offset: 0x194
- Reset: 0x00280a1f (0b0000,0000,0010,1000,0000,1010,0001,1111)
- Bit
R/W
- Reset
- Description
31:24
- RO
0x0 RSVDP_24: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
23:19
- RW
0x5 PWR_ON_VALUE_SUPPORT:
- Port T Power On Value. Along with the Port T_POWER_ON_SCALE field
in the L1 PM Substates Capabilities register sets the time (in us) that this Port requires the port on the opposite side of Link to wait in
- L1.2.Exit after sampling CLKREQ# asserted before actively driving the
interface. The value of Port T_POWER_ON is calculated by multiplying the value in this field by the scale value in the Port T_POWER_ON_SCALE field in the L1 PM Substates Capabilities register.
- Required for all Ports for which either the PCI-PM L1.2 Supported bit is
- Set, ASPM L1.2 Supported bit is Set, or both are Set, otherwise this
field is of type RsvdP. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi:
- L1SUB_CAPABILITY_REG.L1_2_ASPM_SUPPORT||
- L1SUB_CAPABILITY_REG.L1_2_PCIPM_SUPPORT ? RWS : RSVDP
- RO
0x0 RSVDP_18: Reserved for future use. 17:16
- RW
0x0 PWR_ON_SCALE_SUPPORT:
- Port T Power On Scale. Specifies the scale used for the Port
T_POWER_ON_VALUE field in the L1 PM Substates Capabilities register.
- Range of values are given below. Required for all Ports for which either
the PCI-PM L1.2 Supported bit is Set, ASPM L1.2 Supported bit is Set, or both are Set, otherwise this field is of type RsvdP. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi:
- L1SUB_CAPABILITY_REG.L1_2_ASPM_SUPPORT||
- L1SUB_CAPABILITY_REG.L1_2_PCIPM_SUPPORT ? RWS : RSVDP
15:8
- RW
0xa COMM_MODE_SUPPORT:
- Port Common Mode Restore Time. Time (in us) required for this Port to
re-establish common mode. Required for all Ports for which either the
- PCI-PM L1.2 Supported bit is Set, ASPM L1.2 Supported bit is Set, or
both are Set, otherwise this field is of type RsvdP. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi:
- L1SUB_CAPABILITY_REG.L1_2_ASPM_SUPPORT||
- L1SUB_CAPABILITY_REG.L1_2_PCIPM_SUPPORT ? RWS : RSVDP
7:5
- RO
0x0 RSVDP_5: Reserved for future use.
- RW
0x1 L1_PMSUB_SUPPORT:
- L1 PM Substates ECN Supported. When Set this field indicates that
this Port supports L1 PM Substates. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky)
- RW
0x1 L1_1_ASPM_SUPPORT:
- ASPM L11 Supported. When Set this field indicates that ASPM L1.1 is
supported. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: R/W (sticky)
- RW
0x1 L1_2_ASPM_SUPPORT:
- ASPM L12 Supported. When Set this field indicates that ASPM L1.2 is
supported. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: R/W (sticky)
- RW
0x1 L1_1_PCIPM_SUPPORT:
- PCI-PM L11 Supported. When Set this field indicates that PCI-PM L1.1
is supported, and must be Set by all Ports implementing L1 PM
- Substates. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: R/W (sticky)

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x1 L1_2_PCIPM_SUPPORT:
- PCI-PM L12 Supported. When Set this field indicates that PCI-PM L1.2
is supported. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: R/W (sticky)
- PCIE_X4_RC_PF0_L1SUB_CAP_L1SUB_CAPABILITY_REG_0
- Offset: 0x1b0
- PCIE_X8_RC_PF0_L1SUB_CAP_L1SUB_CAPABILITY_REG_0
- Offset: 0x1c4
- Reset: 0x00a03c1f (0b0000,0000,1010,0000,0011,1100,0001,1111)
- Bit
R/W
- Rese
t
- Description
31:24
- RO
0x0 RSVDP_24: Reserved for future use. 23:19
- RW
0x14 PWR_ON_VALUE_SUPPORT:
- Port T Power On Value. Along with the Port T_POWER_ON_SCALE field in the L1 PM Substates
Capabilities register sets the time (in us) that this Port requires the port on the opposite side of Link to wait in L1.2.Exit after sampling CLKREQ# asserted before actively driving the interface. The value of Port T_POWER_ON is calculated by multiplying the value in this field by the scale value in the Port T_POWER_ON_SCALE field in the L1 PM Substates Capabilities register.
- Required for all Ports for which either the PCI-PM L1.2 Supported bit is Set, ASPM L1.2
Supported bit is Set, or both are Set, otherwise this field is of type RsvdP. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi:
- L1SUB_CAPABILITY_REG.L1_2_ASPM_SUPPORT||
- L1SUB_CAPABILITY_REG.L1_2_PCIPM_SUPPORT ? RWS : RSVDP
- RO
0x0 RSVDP_18: Reserved for future use. 17:16
- RW
0x0 PWR_ON_SCALE_SUPPORT: Port T Power On Scale. Specifies the scale used for the Port T_POWER_ON_VALUE field in the L1 PM Substates Capabilities register. Range of values are given below. Required for all Ports for which either the PCI-PM L1.2 Supported bit is Set, ASPM L1.2 Supported bit is Set, or both are Set, otherwise this field is of type RsvdP. Note: The access attributes of this field are as follows:
- Wire: No access. - Dbi: L1SUB_CAPABILITY_REG.L1_2_ASPM_SUPPORT||
- L1SUB_CAPABILITY_REG.L1_2_PCIPM_SUPPORT ? RWS : RSVDP
15:8
- RW
0x3c COMM_MODE_SUPPORT:
- Port Common Mode Restore Time. Time (in us) required for this Port to re-establish common
mode. Required for all Ports for which either the PCI-PM L1.2 Supported bit is Set, ASPM L1.2 Supported bit is Set, or both are Set, otherwise this field is of type RsvdP. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi:
- L1SUB_CAPABILITY_REG.L1_2_ASPM_SUPPORT||
- L1SUB_CAPABILITY_REG.L1_2_PCIPM_SUPPORT ? RWS : RSVDP
7:5
- RO
0x0 RSVDP_5: Reserved for future use.
- RW
0x1 L1_PMSUB_SUPPORT:
- L1 PM Substates ECN Supported. When Set this field indicates that this Port supports L1 PM
Substates. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky)

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Rese
t
- Description
- RW
0x1 L1_1_ASPM_SUPPORT:
- ASPM L11 Supported. When Set this field indicates that ASPM L1.1 is supported. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky)
- RW
0x1 L1_2_ASPM_SUPPORT:
- ASPM L12 Supported. When Set this field indicates that ASPM L1.2 is supported. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky)
- RW
0x1 L1_1_PCIPM_SUPPORT: PCI-PM L11 Supported. When Set this field indicates that PCI-PM L1.1 is supported, and must be Set by all Ports implementing L1 PM Substates. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky)
- RW
0x1 L1_2_PCIPM_SUPPORT: PCI-PM L12 Supported. When Set this field indicates that PCI-PM L1.2 is supported. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky)
- PCIE_X<i>_RC_PF0_L1SUB_CAP_L1SUB_CONTROL1_REG_0
where <i> = 1, 4, 8. Description: This register Controls that the individual extended capability is enabled ot not.
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_L1SUB_CAP_L1SUB_CONTROL1_REG_0
- Offset: 0x198
- Reset: 0x00000a00 (0b0000,0000,0000,0000,0000,1010,0000,0000)
- Bit
R/W
- Reset
- Description
31:29
- RW
0x0 L1_2_TH_SCA:
- LTR L12 Threshold Scale. This field provides a scale for the value
contained within the LTR_L1.2_THRESHOLD_Value. Hardware operation is undefined if software writes a Not-Permitted value to this field. Required for all Ports Ports for which the ASPM L12
- Supported bit is Set, otherwise this field is of type RsvdP. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi:
- L1SUB_CAPABILITY_REG.L1_2_ASPM_SUPPORT ? RW : RSVDP
28:26
- RO
0x0 RSVDP_26: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
25:16
- RW
0x0 L1_2_TH_VAL:
- LTR L12 Threshold Value. Along with the
- LTR_L1.2_THRESHOLD_Scale, this field indicates the LTR threshold
used to determine if entry into L1 results in L1.1 (if enabled) or L1.2 (if enabled). Required for all Ports for which the ASPM L12
- Supported bit is Set, otherwise this field is of type RsvdP. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi:
- L1SUB_CAPABILITY_REG.L1_2_ASPM_SUPPORT ? RW : RSVDP
15:8
- RW
0xa T_COMMON_MODE:
- Common Mode Restore Time. Sets value of TCOMMONMODE (in us),
which must be used by the Downstream Ports for timing the re- establishment of common mode. This field is of type RsvdP for
- Upstream Ports. Note: The access attributes of this field are as
follows: - Wire: No access. - Dbi:
- L1SUB_CAPABILITY_REG.L1_2_ASPM_SUPPORT||
- L1SUB_CAPABILITY_REG.L1_2_PCIPM_SUPPORT ? RW : RSVDP
7:4
- RO
0x0 RSVDP_4: Reserved for future use.
- RW
0x0 L1_1_ASPM_EN:
- ASPM L11 Enable. When Set this field, enables ASPM L1.1. For Ports
for which the ASPM L1.1 Supported bit is clear, this bit is permitted to be hardwired to 0. Required for both Upstream and Downstream
- Ports. For compatibility with possible future extensions, software
must not enable L1 PM Substates unless the L1 PM Substates Supported field in the L1 PM Substates Capabilities Register is Set.
- RW
0x0 L1_2_ASPM_EN:
- ASPM L12 Enable. When Set this field, enables ASPM L1.2. For Ports
for which the ASPM L1.2 Supported bit is clear, this bit is permitted to be hardwired to 0. Required for both Upstream and Downstream
- Ports. For compatibility with possible future extensions, software
must not enable L1 PM Substates unless the L1 PM Substates Supported field in the L1 PM Substates Capabilities Register is Set.
- RW
0x0 L1_1_PCIPM_EN: PCI-PM L11 Enable. When Set this field, enables PCI-PM L1.1.
- Required for both Upstream and Downstream Ports. For
compatibility with possible future extensions, software must not enable L1 PM Substates unless the L1 PM Substates Supported field in the L1 PM Substates Capabilities Register is Set.
- RW
0x0 L1_2_PCIPM_EN:
- PCI-PM L12 Enable. When Set this field, enables PCI-PM L1.2. For
- Ports for which the PCI-PM L1.2 Supported bit is clear, this bit is
permitted to be hardwired to 0. Required for both Upstream and
- Downstream Ports. For compatibility with possible future
extensions, software must not enable L1 PM Substates unless the
- L1 PM Substates Supported field in the L1 PM Substates
Capabilities Register is Set.
- PCIE_X4_RC_PF0_L1SUB_CAP_L1SUB_CONTROL1_REG_0
- Offset: 0x1b4
- PCIE_X8_RC_PF0_L1SUB_CAP_L1SUB_CONTROL1_REG_0

- PCIe x1/x4/x8 Root Complex
- Offset: 0x1c8
- Reset: 0x00003c00 (0b0000,0000,0000,0000,0011,1100,0000,0000)
- Bit
R/W
- Reset
- Description
31:29
- RW
0x0 L1_2_TH_SCA:
- LTR L12 Threshold Scale. This field provides a scale for the value
contained within the LTR_L1.2_THRESHOLD_Value. Hardware operation is undefined if software writes a Not-Permitted value to this field. Required for all Ports Ports for which the ASPM L12
- Supported bit is Set, otherwise this field is of type RsvdP. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi:
- L1SUB_CAPABILITY_REG.L1_2_ASPM_SUPPORT ? RW : RSVDP
28:26
- RO
0x0 RSVDP_26: Reserved for future use. 25:16
- RW
0x0 L1_2_TH_VAL:
- LTR L12 Threshold Value. Along with the
- LTR_L1.2_THRESHOLD_Scale, this field indicates the LTR threshold
used to determine if entry into L1 results in L1.1 (if enabled) or L1.2 (if enabled). Required for all Ports for which the ASPM L12
- Supported bit is Set, otherwise this field is of type RsvdP. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi:
- L1SUB_CAPABILITY_REG.L1_2_ASPM_SUPPORT ? RW : RSVDP
15:8
- RW
0x3c T_COMMON_MODE:
- Common Mode Restore Time. Sets value of TCOMMONMODE (in us),
which must be used by the Downstream Ports for timing the re- establishment of common mode. This field is of type RsvdP for
- Upstream Ports. Note: The access attributes of this field are as
follows: - Wire: No access. - Dbi:
- L1SUB_CAPABILITY_REG.L1_2_ASPM_SUPPORT||
- L1SUB_CAPABILITY_REG.L1_2_PCIPM_SUPPORT ? RW : RSVDP
7:4
- RO
0x0 RSVDP_4: Reserved for future use.
- RW
0x0 L1_1_ASPM_EN:
- ASPM L11 Enable. When Set this field, enables ASPM L1.1. For Ports
for which the ASPM L1.1 Supported bit is clear, this bit is permitted to be hardwired to 0. Required for both Upstream and Downstream
- Ports. For compatibility with possible future extensions, software
must not enable L1 PM Substates unless the L1 PM Substates Supported field in the L1 PM Substates Capabilities Register is Set.
- RW
0x0 L1_2_ASPM_EN:
- ASPM L12 Enable. When Set this field, enables ASPM L1.2. For Ports
for which the ASPM L1.2 Supported bit is clear, this bit is permitted to be hardwired to 0. Required for both Upstream and Downstream
- Ports. For compatibility with possible future extensions, software
must not enable L1 PM Substates unless the L1 PM Substates Supported field in the L1 PM Substates Capabilities Register is Set.
- RW
0x0 L1_1_PCIPM_EN: PCI-PM L11 Enable. When Set this field, enables PCI-PM L1.1.
- Required for both Upstream and Downstream Ports. For
compatibility with possible future extensions, software must not enable L1 PM Substates unless the L1 PM Substates Supported field in the L1 PM Substates Capabilities Register is Set.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x0 L1_2_PCIPM_EN:
- PCI-PM L12 Enable. When Set this field, enables PCI-PM L1.2. For
- Ports for which the PCI-PM L1.2 Supported bit is clear, this bit is
permitted to be hardwired to 0. Required for both Upstream and
- Downstream Ports. For compatibility with possible future
extensions, software must not enable L1 PM Substates unless the
- L1 PM Substates Supported field in the L1 PM Substates
Capabilities Register is Set.
- PCIE_X<i>_RC_PF0_L1SUB_CAP_L1SUB_CONTROL2_REG_0
where <i> = 1, 4, 8. Description: This register Controls that the individual extended capability is enabled ot not.
- PCIE_X1_RC_PF0_L1SUB_CAP_L1SUB_CONTROL2_REG_0
- Offset: 0x19c
- PCIE_X4_RC_PF0_L1SUB_CAP_L1SUB_CONTROL2_REG_0
- Offset: 0x1b8
- PCIE_X8_RC_PF0_L1SUB_CAP_L1SUB_CONTROL2_REG_0
- Offset: 0x1cc
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000028 (0b0000,0000,0000,0000,0000,0000,0010,1000)
- Bit
R/W
- Reset
- Description
31:8
- RO
0x0 RSVDP_8: Reserved for future use. 7:3
- RW
0x5 T_POWER_ON_VALUE: T Power On Value. Along with the T_POWER_ON_SCALE sets the minimum amount of time (in us) that the Port must wait in L1.2.Exit after sampling CLKREQ# asserted before actively driving the interface. T_POWER_ON is calculated by multiplying the value in this field by the value in the T_POWER_ON_SCALE field. Required for all Ports that support L1.2, otherwise this field is of type RsvdP.This field must only be modified when the ASPM L1.2 Enable and PCI-PM L1.2 Enable bits are both Clear. The Port behavior is undefined if this field is modified when either the ASPM L1.2 Enable and/or PCI-PM L1.2 Enable bit(s) are set. Note: The access attributes of this field are as follows: - Wire: No access.
- Dbi: L1SUB_CAPABILITY_REG.L1_2_ASPM_SUPPORT||
- L1SUB_CAPABILITY_REG.L1_2_PCIPM_SUPPORT ? RWS : RSVDP

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RO
0x0 RSVDP_2: Reserved for future use. 1:0
- RW
0x0 T_POWER_ON_SCALE: T Power On Scale. Specifies the scale used for T_POWER_ON_VALUE.
- Range of values are given below. Required for all Ports that support L1.2,
otherwise this field is of type RsvdP. This field must only be modified when the ASPM L1.2 Enable and PCI-PM L1.2 Enable bits are both Clear.
- The Port behavior is undefined if this field is modified when either the
- ASPM L1.2 Enable and/or PCI-PM L1.2 Enable bit(s) are set. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi:
- L1SUB_CAPABILITY_REG.L1_2_ASPM_SUPPORT||
- L1SUB_CAPABILITY_REG.L1_2_PCIPM_SUPPORT ? RWS : RSVDP
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_RAS_DES_CAP_HEADER_REG_0
where <i> = 1, 4, 8. Description: The Vendor-Specific Extended Capability (VSEC Capability) is an optional Extended Capability that is permitted to be implemented by any PCI Express Function or RCRB. This Register contains Capability Id, Capability Version and Next Offset value for Vendor-Specific Extended Capability.
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_RAS_DES_CAP_RAS_DES_CAP_HEADER_REG_0
- Offset: 0x1a0
- Reset: 0x2a01000b (0b0010,1010,0000,0001,0000,0000,0000,1011)
- Bit
- Reset
- Description
31:20 0x2a0 NEXT_OFFSET:
- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space,
this offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greater than 0FFh. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 19:16 0x1 CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. Value of this field is depends on the version of the specification. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
15:0 0xb EXTENDED_CAP_ID:
- PCI Express Extended Capability ID. This field is a PCI-SIG defined ID number
that indicates the nature and format of the Extended Capability. Extended
- Capability ID for the Vendor-Specific Extended Capability is 000Bh. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X4_RC_PF0_RAS_DES_CAP_RAS_DES_CAP_HEADER_REG_0
- Offset: 0x1bc
- Reset: 0x2bc1000b (0b0010,1011,1100,0001,0000,0000,0000,1011)
- Bit
- Reset
- Description
31:20 0x2bc NEXT_OFFSET:
- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space,
this offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greater than 0FFh. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 19:16 0x1 CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. Value of this field is depends on the version of the specification. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0xb EXTENDED_CAP_ID:
- PCI Express Extended Capability ID. This field is a PCI-SIG defined ID number
that indicates the nature and format of the Extended Capability. Extended
- Capability ID for the Vendor-Specific Extended Capability is 000Bh. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X8_RC_PF0_RAS_DES_CAP_RAS_DES_CAP_HEADER_REG_0
- Offset: 0x1d0
- Reset: 0x2d01000b (0b0010,1101,0000,0001,0000,0000,0000,1011)
- Bit
- Reset
- Description
31:20 0x2d0 NEXT_OFFSET:
- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space,
this offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greater than 0FFh. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
19:16 0x1 CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. Value of this field is depends on the version of the specification. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0xb EXTENDED_CAP_ID:
- PCI Express Extended Capability ID. This field is a PCI-SIG defined ID number
that indicates the nature and format of the Extended Capability. Extended
- Capability ID for the Vendor-Specific Extended Capability is 000Bh. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_VENDOR_SPECIFIC_HEADER_REG_0
where <i> = 1, 4, 8. Description: This Register field provides VSEC Length, VSEC ID and VSEC Rev(Version Number). Vendor-specific software must qualify the associated Vendor ID of the PCI Express Function or RCRB before attempting to interpret the values in the VSEC ID or VSEC Rev fields.
- PCIE_X1_RC_PF0_RAS_DES_CAP_VENDOR_SPECIFIC_HEADER_REG_0
- Offset: 0x1a4
- PCIE_X4_RC_PF0_RAS_DES_CAP_VENDOR_SPECIFIC_HEADER_REG_0
- Offset: 0x1c0
- PCIE_X8_RC_PF0_RAS_DES_CAP_VENDOR_SPECIFIC_HEADER_REG_0
- Offset: 0x1d4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x10040002 (0b0001,0000,0000,0100,0000,0000,0000,0010)
- Bit
- Reset
- Description
31:20 0x100 VSEC_LENGTH:
- VSEC Length. This field indicates the number of bytes in the entire VSEC
structure, including the Vendor-Specific Extended Capability Header, the Vendor-Specific Header, and the vendor-specific registers.

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
19:16 0x4 VSEC_REV:
- VSEC Rev. This field is a vendor-defined version number that indicates the
version of the VSEC structure. Software must qualify the Vendor ID and VSEC ID before interpreting this field. 15:0 0x2 VSEC_ID:
- VSEC ID. This field is a vendor-defined ID number that indicates the nature
and format of the VSEC structure. Software must qualify the Vendor ID before interpreting this field.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EVENT_COUNTER_CONTROL_REG_0
where <i> = 1, 4, 8. Description: This is a viewport control register. - Setting the EVENT_COUNTER_EVENT_SELECT and EVENT_COUNTER_LANE_SELECT fields in this register determine the Event Counter data returned by the EVENT_COUNTER_DATA_REG viewport register. - Setting the EVENT_COUNTER_ENABLE field in this register enables the Event Counter selected by the EVENT_COUNTER_EVENT_SELECT and EVENT_COUNTER_LANE_SELECT fields in this register. - Setting the EVENT_COUNTER_CLEAR field in this register clears the Event Counter selected by the EVENT_COUNTER_EVENT_SELECT and EVENT_COUNTER_LANE_SELECT fields in this register. - Reading the
- EVENT_COUNTER_STATUS field in this register returns the Enable status of the Event Counter
selected by the EVENT_COUNTER_EVENT_SELECT and EVENT_COUNTER_LANE_SELECT fields in this register.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EVENT_COUNTER_CONTROL_REG_0
- Offset: 0x1a8
- PCIE_X4_RC_PF0_RAS_DES_CAP_EVENT_COUNTER_CONTROL_REG_0
- Offset: 0x1c4
- PCIE_X8_RC_PF0_RAS_DES_CAP_EVENT_COUNTER_CONTROL_REG_0
- Offset: 0x1d8
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
31:28
- RO
0x0 RSVDP_28: Reserved for future use. 27:16
- RW
0x0 EVENT_COUNTER_EVENT_SELECT:
- Event Counter Data Select. This field in conjunction with the
- EVENT_COUNTER_LANE_SELECT field indexes the Event Counter
data returned by the EVENT_COUNTER_DATA_REG register. - 27-24:
- Group number(4-bit: 0..0x7) - 23-16: Event number(8-bit: 0..0x13)
within the Group - .. For detailed definitions of Group number and
- Event number, see the RAS DES chapter in the Databook. Note: This
register field is sticky. 15:12
- RO
0x0 RSVDP_12: Reserved for future use. 11:8
- RW
0x0 EVENT_COUNTER_LANE_SELECT:
- Event Counter Lane Select. This field in conjunction with
- EVENT_COUNTER_EVENT_SELECT indexes the Event Counter data
returned by the EVENT_COUNTER_DATA_REG register. Note: This register field is sticky.
- RO
0x0 EVENT_COUNTER_STATUS:
- Event Counter Status. This register returns the current value of the
- Event Counter selected by the following fields: -
- EVENT_COUNTER_EVENT_SELECT -
EVENT_COUNTER_LANE_SELECT Note: This register field is sticky. 6:5
- RO
0x0 RSVDP_5: Reserved for future use. 4:2
- WO
0x0 EVENT_COUNTER_ENABLE:
- Event Counter Enable. Enables/disables the Event Counter selected
by the EVENT_COUNTER_EVENT_SELECT and
- EVENT_COUNTER_LANE_SELECT fields in this register. By default, all
event counters are disabled. You can enable/disable a specific Event
- Counter by writing the 'per event off' or 'per event on' codes. You can
enable/disable all event counters by writing the 'all on' or 'all off' codes. The read value is always '0'. For other values no change. 1:0
- WO
0x0 EVENT_COUNTER_CLEAR:
- Event Counter Clear. Clears the Event Counter selected by the
- EVENT_COUNTER_EVENT_SELECT and
- EVENT_COUNTER_LANE_SELECT fields in this register. You can clear
the value of a specific Event Counter by writing the 'per clear' code and you can clear all event counters at once by writing the 'all clear' code. The read value is always '0'. Other values are reserved.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EVENT_COUNTER_DATA_REG_0
where <i> = 1, 4, 8.
- Description: This viewport register returns the data selected by the following fields: -
- EVENT_COUNTER_EVENT_SELECT in EVENT_COUNTER_CONTROL_REG -
- EVENT_COUNTER_LANE_SELECT in EVENT_COUNTER_CONTROL_REG For more details, see the
RAS DES section in the Core Operations chapter of the Databook.

- PCIe x1/x4/x8 Root Complex
- PCIE_X1_RC_PF0_RAS_DES_CAP_EVENT_COUNTER_DATA_REG_0
- Offset: 0x1ac
- PCIE_X4_RC_PF0_RAS_DES_CAP_EVENT_COUNTER_DATA_REG_0
- Offset: 0x1c8
- PCIE_X8_RC_PF0_RAS_DES_CAP_EVENT_COUNTER_DATA_REG_0
- Offset: 0x1dc
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 EVENT_COUNTER_DATA:
- Event Counter Data. This register returns the data selected by the
following fields: - EVENT_COUNTER_EVENT_SELECT in EVENT_COUNTER_CONTROL_REG Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_TIME_BASED_ANALYSIS_CONTROL_REG_0
where <i> = 1, 4, 8. Description: Used for controlling the measurement of RX/TX data throughput and time spent in each low-power LTSSM state. For more details, see the RAS DES section in the Core Operations chapter of the Databook.
- PCIE_X1_RC_PF0_RAS_DES_CAP_TIME_BASED_ANALYSIS_CONTROL_REG_0
- Offset: 0x1b0
- PCIE_X4_RC_PF0_RAS_DES_CAP_TIME_BASED_ANALYSIS_CONTROL_REG_0
- Offset: 0x1cc
- PCIE_X8_RC_PF0_RAS_DES_CAP_TIME_BASED_ANALYSIS_CONTROL_REG_0
- Offset: 0x1e0
- Read/Write: See table below
- Parity Protection: N

- PCIe x1/x4/x8 Root Complex
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000100 (0b0000,0000,0000,0000,0000,0001,0000,0000)
- Bit
R/W
- Reset
- Description
31:24
- RW
0x0 TIME_BASED_REPORT_SELECT:
- Time-based Report Select. Selects what type of data is measured for the
selected duration (TIME_BASED_DURATION_SELECT), and returned in
- TIME_BASED_ANALYSIS_DATA. Each type of data is measured using one
of three types of units: - Core_clk Cycles for 2.5GT/s, 5.0GT/s, 8.0GT/s, 16.0GT/s, 32GT/s. Total time in ps is [Value of
- TIME_BASED_ANALYSIS_DATA returned when
TIME_BASED_REPORT_SELECT=0x00] * TIME_BASED_ANALYSIS_DATA.
- Values 0-4 and 7-8 correspond to Core_clk Cycles for 2.5GT/s, 5.0GT/s,
8.0GT/s, 16.0GT/s, 32GT/s. - Aux_clk Cycles. Total time in ps is [Period of platform specific clock] * TIME_BASED_ANALYSIS_DATA. Values 5, 6, and 9 correspond to aux_clk Cycles. - Core_clk Cycles for 20GT/s, 25GT/s (CCIX ESM data rate). Total time in ps is [Value of
- TIME_BASED_ANALYSIS_DATA returned when
TIME_BASED_REPORT_SELECT=0x10] * TIME_BASED_ANALYSIS_DATA.
- Values 10-14 and 17-18 correspond to Core_clk Cycles for 2.5GT/s,
5.0GT/s, 8.0GT/s, 16.0GT/s, 32GT/s. - Data Bytes. Actual amount of bytes is 16 * TIME_BASED_ANALYSIS_DATA. Values 20-23 correspond to data bytes. All encodings other than the defined encodings are reserved. Note: This register field is sticky. 23:16
- RO
0x0 RSVDP_16: Reserved for future use. 15:8
- RW
0x1 TIME_BASED_DURATION_SELECT: Time-based Duration Select. Selects the duration of time-based analysis.
- When "manual control" is selected and TIMER_START is set to '1', this
analysis never stops until TIMER_STOP is set to '0'. All encodings other than the defined encodings are reserved. Note: This register field is sticky. 7:1
- RO
0x0 RSVDP_1: Reserved for future use.
- RW
0x0 TIMER_START:
- Timer Start. This bit will be cleared automatically when the measurement
is finished. Note: The app_ras_des_tba_ctrl input also sets the contents of this field and controls the measurement start/stop. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_TIME_BASED_ANALYSIS_DATA_REG_0
where <i> = 1, 4, 8. Description: Contains the measurement results of RX/TX data throughput and time spent in each low-power LTSSM state. This viewport register returns the data selected by the
- TIME_BASED_REPORT_SELECT field in TIME_BASED_ANALYSIS_CONTROL_REG. For more details,
see the RAS DES section in the Core Operations chapter of the Databook.
- PCIE_X1_RC_PF0_RAS_DES_CAP_TIME_BASED_ANALYSIS_DATA_REG_0

- PCIe x1/x4/x8 Root Complex
- Offset: 0x1b4
- PCIE_X4_RC_PF0_RAS_DES_CAP_TIME_BASED_ANALYSIS_DATA_REG_0
- Offset: 0x1d0
- PCIE_X8_RC_PF0_RAS_DES_CAP_TIME_BASED_ANALYSIS_DATA_REG_0
- Offset: 0x1e4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 TIME_BASED_ANALYSIS_DATA:
- Time Based Analysis Data. This register returns the data selected by the
- TIME_BASED_REPORT_SELECT field in
- TIME_BASED_ANALYSIS_CONTROL_REG. The results are cleared when next
measurement starts. Note: This register field is sticky.
- PCIE_X1_RC_PF0_RAS_DES_CAP_TIME_BASED_ANALYSIS_DATA_63_32_REG_0
where <i> = 1, 4, 8. Description: This viewport register returns the data selected by the TIME_BASED_REPORT_SELECT field in TIME_BASED_ANALYSIS_CONTROL_REG. For more details, see the "Reliability, Availability, and Serviceability (RAS)" section in the "Controller Operations" chapter of the Databook.
- PCIE_X1_RC_PF0_RAS_DES_CAP_TIME_BASED_ANALYSIS_DATA_63_32_REG_0
- Offset: 0x1b8
- PCIE_X4_RC_PF0_RAS_DES_CAP_TIME_BASED_ANALYSIS_DATA_63_32_REG_0
- Offset: 0x1d4
- PCIE_X8_RC_PF0_RAS_DES_CAP_TIME_BASED_ANALYSIS_DATA_63_32_REG_0
- Offset: 0x1e8
- Read/Write: RO
- Parity Protection: N
- Shadow: N

- PCIe x1/x4/x8 Root Complex
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 TIME_BASED_ANALYSIS_DATA_63_32:
- Upper 32 bits of Time Based Analysis Data. Note: This register field is
sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EINJ_ENABLE_REG_0
where <i> = 1, 4, 8. Description: Each type of error insertion is enabled by the corresponding bit in this register. The specific injection controls for each type of error are defined in the following registers: - 0: CRC Error: EINJ0_CRC_REG - 1: Sequence Number Error: EINJ1_SEQNUM_REG - 2: DLLP Error:
- EINJ2_DLLP_REG - 3: Symbol DataK Mask Error or Sync Header Error: EINJ3_SYMBOL_REG - 4: FC
Credit Update Error: EINJ4_FC_REG - 5: TLP Duplicate/Nullify Error: EINJ5_SP_TLP_REG - 6: Specific
- TLP Error: EINJ6_COMPARE_*_REG/EINJ6_CHANGE_*_REG/EINJ6_TLP_REG After the errors have
been inserted by controller, it will clear each bit here. For more details, see the RAS DES section in the Core Operations chapter of the Databook.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ_ENABLE_REG_0
- Offset: 0x1d0
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ_ENABLE_REG_0
- Offset: 0x1ec
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ_ENABLE_REG_0
- Offset: 0x200
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:7
- RO
0x0 RSVDP_7: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x0 ERROR_INJECTION6_ENABLE:
- Error Injection6 Enable (Specific TLP Error). Enables insertion of errors
into the packets that you select. You can set this bit to '1' when you have disabled RAS datapath protection (DP) by setting CX_RASDP =
- CX_RASDP_RAM_PROT =0. You can set this bit to '1' when you have
disabled the address translation by setting
- ADDR_TRANSLATION_SUPPORT_EN=0. For more details, see the
- EINJ6_COMPARE_*_REG/EINJ6_CHANGE_*_REG/EINJ6_TLP_REG
registers. Note: This register field is sticky.
- RW
0x0 ERROR_INJECTION5_ENABLE:
- Error Injection5 Enable (TLP Duplicate/Nullify Error). Enables insertion
of duplicate/nullified TLPs. For more details, see the EINJ5_SP_TLP_REG register. Note: This register field is sticky.
- RW
0x0 ERROR_INJECTION4_ENABLE:
- Error Injection4 Enable (FC Credit Update Error). Enables insertion of
errors into UpdateFCs. For more details, see the EINJ4_FC_REG register. Note: This register field is sticky.
- RW
0x0 ERROR_INJECTION3_ENABLE:
- Error Injection3 Enable (Symbol DataK Mask Error or Sync Header
- Error). Enables DataK masking of special symbols or the breaking of
the sync header. For more details, see the EINJ3_SYMBOL_REG register. Note: This register field is sticky.
- RW
0x0 ERROR_INJECTION2_ENABLE: Error Injection2 Enable (DLLP Error). Enables insertion of DLLP errors.
- For more details, see the EINJ2_DLLP_REG register. Note: This register
field is sticky.
- RW
0x0 ERROR_INJECTION1_ENABLE:
- Error Injection1 Enable (Sequence Number Error). Enables insertion of
errors into sequence numbers. For more details, see the EINJ1_SEQNUM_REG register. Note: This register field is sticky.
- RW
0x0 ERROR_INJECTION0_ENABLE:
- Error Injection0 Enable (CRC Error). Enables insertion of errors into
various CRC. For more details, see the EINJ0_CRC_REG register. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EINJ0_CRC_REG_0
where <i> = 1, 4, 8. Description: Controls the insertion of errors into the CRC, and parity of ordered sets for the selected type of the packets as follows: - LCRC. Bad TLP will be detected at the receiver side; receiver responds with NAK DLLP; Data Link Retry starts. - 16-bit CRC of ACK/NAK DLLPs. Bad DLLP occurs at the receiver side; Replay NUM Rollover occurs. - 16-bit CRC of UpdateFC DLLPs. Error insertion continues for the specific time; LTSSM transitions to the Recovery state because of the UpdateFC timeout (if the timeout is implemented at the receiver of the UpdateFCs). - ECRC. If ECRC check is enabled, ECRC error is detected at the receiver side. - FCRC. Framing error will be detected, TLP is discarded, and the LTSSM transitions to Recovery state. - Parity of TSOS. Error

- PCIe x1/x4/x8 Root Complex
insertion continues for the specific time; LTSSM Recovery/Configuration timeout will occur. - Parity of SKPOS. Lane error will be detected at the receiver side.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ0_CRC_REG_0
- Offset: 0x1d4
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ0_CRC_REG_0
- Offset: 0x1f0
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ0_CRC_REG_0
- Offset: 0x204
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:12
- RO
0x0 RSVDP_12: Reserved for future use. 11:8
- RW
0x0 EINJ0_CRC_TYPE:
- Error injection type. Selects the type of CRC error to be inserted. All
encodings other than the defined encodings are reserved. Note: This register field is sticky. 7:0
- RW
0x0 EINJ0_COUNT:
- Error injection count. Indicates the number of errors. This register is
decremented when the errors have been inserted. - If the counter value is 0x01 and error is inserted, ERROR_INJECTION0_ENABLE in
- EINJ_ENABLE_REG returns 0b. - If the counter value is 0x00 and
- ERROR_INJECTION0_ENABLE=1, the errors are inserted until
- ERROR_INJECTION0_ENABLE is set to '0'. Note: This register field is
sticky.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ1_SEQNUM_REG_0
where <i> = 1, 4, 8. Description: Controls the sequence number of the specific TLPs and ACK/NAK DLLPs. Data Link Protocol Error will be detected at the Rx side of ACK/NAL DLLPs when one of these conditions is true: - ((NEXT_TRANSMIT_SEQ -1) - AckNak_Seq_Num) mod 4096 > 2048 - (AckNak_Seq_Num -
- ACKD_SEQ) mod 4096 >= 2048 TLP is treated as Duplicate TLP at the Rx side when all these
conditions are true: - Sequence Number != NEXT_RCV_SEQ - (NEXT_RCV_SEQ - Sequence Number) mod 4096 <= 2048 TLP is treated as Bad TLP at the Rx side when all these conditions are true: -

- PCIe x1/x4/x8 Root Complex
- Sequence Number != NEXT_RCV_SEQ and - (NEXT_RCV_SEQ - Sequence Number) mod 4096 >
2048).
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ1_SEQNUM_REG_0
- Offset: 0x1d8
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ1_SEQNUM_REG_0
- Offset: 0x1f4
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ1_SEQNUM_REG_0
- Offset: 0x208
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:29
- RO
0x0 RSVDP_29: Reserved for future use. 28:16
- RW
0x0 EINJ1_BAD_SEQNUM:
- Bad sequence number. Indicates the value to add/subtract from the
naturally-assigned sequence numbers. This value is represented by two's complement. For example: - Set Type, SEQ# and Count --
- EINJ1_SEQNUM_TYPE =0 (Insert errors into new TLPs) --
- EINJ1_BAD_SEQNUM =0x1FFD (represents -3) -- EINJ1_COUNT =1 -
- Enable Error Injection -- ERROR_INJECTION1_ENABLE =1 - Send a TLP
- From the Core's Application Interface -- Assume SEQ#5 is given to the
- TLP. - The SEQ# is Changed to #2 by the Error Injection Function in
Layer2. -- 5 + (-3) = 2 - The TLP with SEQ#2 is Transmitted to PCIe Link. Note: This register field is sticky. 15:9
- RO
0x0 RSVDP_9: Reserved for future use.
- RW
0x0 EINJ1_SEQNUM_TYPE: Sequence number type. Selects the type of sequence number. Note: This register field is sticky. 7:0
- RW
0x0 EINJ1_COUNT:
- Error injection count. Indicates the number of errors. This register is
decremented as the errors are being inserted. - If the counter value is 0x01 and error is inserted, ERROR_INJECTION1_ENABLE in
- EINJ_ENABLE_REG returns '0'. - If the counter value is 0x00 and
- ERROR_INJECTION1_ENABLE=1, the errors are inserted until
- ERROR_INJECTION1_ENABLE is set to '0'. Note: This register field is
sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EINJ2_DLLP_REG_0
where <i> = 1, 4, 8. Description: Controls the transmission of DLLPs and inserts the following errors: - If "ACK/NAK DLLP's transmission block" is selected, replay timeout error will occur at the transmitter of the TLPs and then Data Link Retry will occur. - If "Update FC DLLP's transmission block" is selected, LTSSM will transition to the Recovery state because of the UpdateFC timeout (if the timeout is implemented at the receiver of the UpdateFCs). - If "Always Transmission for NAK DLLP" is selected, Data Link Retry will occur at the transmitter of the TLPs. Furthermore, Replay NUM Rollover will occur when the transmitter has been requested four times to send the TLP with the same sequence number.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ2_DLLP_REG_0
- Offset: 0x1dc
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ2_DLLP_REG_0
- Offset: 0x1f8
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ2_DLLP_REG_0
- Offset: 0x20c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:10
- RO
0x0 RSVDP_10: Reserved for future use. 9:8
- RW
0x0 EINJ2_DLLP_TYPE:
- DLLP Type. Selects the type of DLLP errors to be inserted. Note: This
register field is sticky. 7:0
- RW
0x0 EINJ2_COUNT:
- Error injection count. Indicates the number of errors. This register is
decremented as the errors are being inserted. - If the counter value is 0x01 and the error is inserted, ERROR_INJECTION2_ENABLE in
- EINJ_ENABLE_REG returns '0'. - If the counter value is 0x00 and
- ERROR_INJECTION2_ENABLE =1, the errors are inserted until
- ERROR_INJECTION2_ENABLE is set to '0'. This register is affected
only when EINJ2_DLLP_TYPE =2'10b. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EINJ3_SYMBOL_REG_0
where <i> = 1, 4, 8. Description: When 8b/10b encoding is used, this register controls error insertion into the special (K code) symbols. - If TS1/TS2/FTS/E-Idle/SKP is selected, it affects whole of the ordered set. It might cause timeout of the LTSSM. - If END/EDB/STP/SDP is selected, TLP/DLLP will be discarded at the receiver side. When 128b/130b encoding is used, this register controls error insertion into the sync-header.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ3_SYMBOL_REG_0
- Offset: 0x1e0
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ3_SYMBOL_REG_0
- Offset: 0x1fc
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ3_SYMBOL_REG_0
- Offset: 0x210
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:11
- RO
0x0 RSVDP_11: Reserved for future use. 10:8
- RW
0x0 EINJ3_SYMBOL_TYPE:
- Error Type. 8b/10b encoding - Mask K symbol. It is not supported to
insert errors into the first ordered-set after exiting from TxElecIdle when CX_FREQ_STEP_EN has been enabled. All encodings other than the defined encodings are reserved. Note: This register field is sticky. 7:0
- RW
0x0 EINJ3_COUNT:
- Error injection count. Indicates the number of errors. This register is
decremented as the errors are being inserted. - If the counter value is 0x01 and error is inserted, ERROR_INJECTION3_ENABLE in
- EINJ_ENABLE_REG returns '0'. - If the counter value is 0x00 and
- ERROR_INJECTION3_ENABLE =1, the errors are inserted until
- ERROR_INJECTION3_ENABLE is set to '0'. Note: This register field is
sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EINJ4_FC_REG_0

- PCIe x1/x4/x8 Root Complex
where <i> = 1, 4, 8. Description: Controls error insertion into the credit value in the UpdateFCs. It is possible to insert errors for any of the following types: - Posted TLP Header credit - Non-Posted TLP Header credit - Completion TLP Header credit - Posted TLP Data credit - Non-Posted TLP Data credit - Completion TLP Data credit These errors are not correctable while error insertion is enabled. Receiver buffer overflow error might occur.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ4_FC_REG_0
- Offset: 0x1e4
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ4_FC_REG_0
- Offset: 0x200
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ4_FC_REG_0
- Offset: 0x214
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:29
- RO
0x0 RSVDP_29: Reserved for future use. 28:16
- RW
0x0 EINJ4_BAD_UPDFC_VALUE:
- Bad update-FC credit value. Indicates the value to add/subtract from
the UpdateFC credit. This value is represented by two's complement. Note: This register field is sticky.
- RO
0x0 RSVDP_15: Reserved for future use. 14:12
- RW
0x0 EINJ4_VC_NUMBER:
- VC Number. Indicates target VC Number. Note: This register field is
sticky.
- RO
0x0 RSVDP_11: Reserved for future use. 10:8
- RW
0x0 EINJ4_UPDFC_TYPE:
- Update-FC type. Selects the credit type. Note: This register field is
sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
7:0
- RW
0x0 EINJ4_COUNT:
- Error injection count. Indicates the number of errors. This register is
decremented as the errors are being inserted. - If the counter value is 0x01 and error is inserted, ERROR_INJECTION4_ENABLE in
- EINJ_ENABLE_REG returns '0'. - If the counter value is 0x00 and
- ERROR_INJECTION4_ENABLE =1, the errors are inserted until
- ERROR_INJECTION4_ENABLE is set to '0'. Note: This register field is
sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EINJ5_SP_TLP_REG_0
where <i> = 1, 4, 8. Description: Controls the generation of specified TLPs. Correctable errors will occur which will be fixed by the PCIe protocol. - For Duplicate TLP, the controller initiates Data Link Retry by handling ACK DLLP as NAK DLLP. These TLPs will be duplicate TLPs at the receiver side. - For Nullified TLP, the TLPs that the controller transmits are changed into nullified TLPs and the original TLPs are stored in the retry buffer. The receiver of these TLPs will detect the lack of seq# and send NAK DLLP at the next TLP. Then the original TLPs are sent from retry buffer and the data controls are recovered. For 128 bit controller or more than 128 bit, the controller inserts errors the number of times of EINJ5_COUNT but doesn't ensure that the errors are continuously inserted into TLPs.
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ5_SP_TLP_REG_0
- Offset: 0x1e8
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ5_SP_TLP_REG_0
- Offset: 0x204
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ5_SP_TLP_REG_0
- Offset: 0x218
- Bit
R/W
- Reset
- Description
31:9
- RO
0x0 RSVDP_9: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x0 EINJ5_SPECIFIED_TLP:
- Specified TLP. Selects the specified TLP to be inserted. Note: This
register field is sticky. 7:0
- RW
0x0 EINJ5_COUNT:
- Error injection count. Indicates the number of errors. This register is
decremented as the errors are being inserted. - If the counter value is 0x01 and error is inserted, ERROR_INJECTION5_ENABLE in
- EINJ_ENABLE_REG returns '0'. - If the counter value is 0x00 and
- ERROR_INJECTION5_ENABLE =1, the errors are inserted until
- ERROR_INJECTION5_ENABLE is set to '0'. Note: This register field is
sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_POINT_H0_REG_0
where <i> = 1, 4, 8. Description: Program this register for the 1st DWORD of TLP header/prefix. It is necessary to carefully consider the endianness when you program this register. Bits [31:0] = TLP_DW0[7:0],
- TLP_DW0[15:8], TLP_DW0[23:16], TLP_DW0[31:24] The Packet Compare Point registers
(EINJ6_COMPARE_POINT*) specify which Tx TLP header bits to compare with the corresponding bits in the Packet Compare Value registers (EINJ6_COMPARE_VALUE*). When all specified bits (in the Tx TLP header and EINJ6_COMPARE_VALUE*) match, the controller inserts errors into the TLP. The type and number of errors are specified by the EINJ6_TLP_REG register.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_POINT_H0_REG_0
- Offset: 0x1ec
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_POINT_H0_REG_0
- Offset: 0x208
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_POINT_H0_REG_0
- Offset: 0x21c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
31:0 0x0 EINJ6_COMPARE_POINT_H0:
- Packet Compare Point: 1st DWORD. Specifies which Tx TLP header DWORD#0
bits to compare with the corresponding bits in the Packet Compare Value registers (EINJ6_COMPARE_VALUE*). When all specified bits (in the Tx TLP header and EINJ6_COMPARE_VALUE*) match, the controller inserts errors into the TLP. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_POINT_H1_REG_0
where <i> = 1, 4, 8. Description: Program this register for the 2nd DWORD of TLP header/prefix. It is necessary to carefully consider the endianness when you program this register. Bits [31:0] = TLP_DW1[7:0],
- TLP_DW1[15:8], TLP_DW1[23:16], TLP_DW1[31:24] The Packet Compare Point registers
(EINJ6_COMPARE_POINT*) specify which Tx TLP header bits to compare with the corresponding bits in the Packet Compare Value registers (EINJ6_COMPARE_VALUE*). When all specified bits (in the Tx TLP header and EINJ6_COMPARE_VALUE*) match, the controller inserts errors into the TLP. The type and number of errors are specified by the EINJ6_TLP_REG register.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_POINT_H1_REG_0
- Offset: 0x1f0
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_POINT_H1_REG_0
- Offset: 0x20c
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_POINT_H1_REG_0
- Offset: 0x220
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 EINJ6_COMPARE_POINT_H1:
- Packet Compare Point: 2nd DWORD. Specifies which Tx TLP header DWORD#1
bits to compare with the corresponding bits in the Packet Compare Value registers (EINJ6_COMPARE_VALUE*). When all specified bits (in the Tx TLP header and EINJ6_COMPARE_VALUE*) match, the controller inserts errors into the TLP. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_POINT_H2_REG_0
where <i> = 1, 4, 8. Description: Program this register for the 3rd DWORD of TLP header/prefix. It is necessary to carefully consider the endianness when you program this register. Bits [31:0] = TLP_DW2[7:0],
- TLP_DW2[15:8], TLP_DW2[23:16], TLP_DW2[31:24] The Packet Compare Point registers
(EINJ6_COMPARE_POINT*) specify which Tx TLP header bits to compare with the corresponding bits in the Packet Compare Value registers (EINJ6_COMPARE_VALUE*). When all specified bits (in the Tx TLP header and EINJ6_COMPARE_VALUE*) match, the controller inserts errors into the TLP. The type and number of errors are specified by the EINJ6_TLP_REG register.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_POINT_H2_REG_0
- Offset: 0x1f4
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_POINT_H2_REG_0
- Offset: 0x210
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_POINT_H2_REG_0
- Offset: 0x224
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 EINJ6_COMPARE_POINT_H2:
- Packet Compare Point: 3rd DWORD. Specifies which Tx TLP header DWORD#2
bits to compare with the corresponding bits in the Packet Compare Value registers (EINJ6_COMPARE_VALUE*). When all specified bits (in the Tx TLP header and EINJ6_COMPARE_VALUE*) match, the controller inserts errors into the TLP. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_POINT_H3_REG_0
where <i> = 1, 4, 8. Description: Program this register for the 4th DWORD of TLP header/prefix. It is necessary to carefully consider the endianness when you program this register. Bits [31:0] = TLP_DW3[7:0],
- TLP_DW3[15:8], TLP_DW3[23:16], TLP_DW3[31:24] The Packet Compare Point registers

- PCIe x1/x4/x8 Root Complex
(EINJ6_COMPARE_POINT*) specify which Tx TLP header bits to compare with the corresponding bits in the Packet Compare Value registers (EINJ6_COMPARE_VALUE*). When all specified bits (in the Tx TLP header and EINJ6_COMPARE_VALUE*) match, the controller inserts errors into the TLP. The type and number of errors are specified by the EINJ6_TLP_REG register.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_POINT_H3_REG_0
- Offset: 0x1f8
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_POINT_H3_REG_0
- Offset: 0x214
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_POINT_H3_REG_0
- Offset: 0x228
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 EINJ6_COMPARE_POINT_H3:
- Packet Compare Point: 4th DWORD. Specifies which Tx TLP header DWORD#3
bits to compare with the corresponding bits in the Packet Compare Value registers (EINJ6_COMPARE_VALUE*). When all specified bits (in the Tx TLP header and EINJ6_COMPARE_VALUE*) match, the controller inserts errors into the TLP. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_VALUE_H0_REG_0
where <i> = 1, 4, 8. Description: Program this register for the 1st DWORD of TLP header/prefix. It is necessary to carefully consider the endianness when you program this register. Bits [31:0] = TLP_DW0[7:0],
- TLP_DW0[15:8], TLP_DW0[23:16], TLP_DW0[31:24] The Packet Compare Point registers
(EINJ6_COMPARE_POINT*) specify which Tx TLP header bits to compare with the corresponding bits in the Packet Compare Value registers (EINJ6_COMPARE_VALUE*). When all specified bits (in the Tx TLP header and EINJ6_COMPARE_VALUE*) match, the controller inserts errors into the TLP. The type and number of errors are specified by the EINJ6_TLP_REG register.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_VALUE_H0_REG_0
- Offset: 0x1fc

- PCIe x1/x4/x8 Root Complex
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_VALUE_H0_REG_0
- Offset: 0x218
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_VALUE_H0_REG_0
- Offset: 0x22c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 EINJ6_COMPARE_VALUE_H0:
- Packet Compare Value: 1st DWORD. Specifies the value to compare against
- Tx the TLP header DWORD#0 bits specified in the Packet Compare Point
registers (EINJ6_COMPARE_POINT*). Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_VALUE_H1_REG_0
where <i> = 1, 4, 8. Description: Program this register for the 2nd DWORD of TLP header/prefix. It is necessary to carefully consider the endianness when you program this register. Bits [31:0] = TLP_DW1[7:0],
- TLP_DW1[15:8], TLP_DW1[23:16], TLP_DW1[31:24] The Packet Compare Point registers
(EINJ6_COMPARE_POINT*) specify which Tx TLP header bits to compare with the corresponding bits in the Packet Compare Value registers (EINJ6_COMPARE_VALUE*). When all specified bits (in the Tx TLP header and EINJ6_COMPARE_VALUE*) match, the controller inserts errors into the TLP. The type and number of errors are specified by the EINJ6_TLP_REG register.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_VALUE_H1_REG_0
- Offset: 0x200
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_VALUE_H1_REG_0
- Offset: 0x21c
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_VALUE_H1_REG_0
- Offset: 0x230
- Read/Write: R/W
- Parity Protection: N

- PCIe x1/x4/x8 Root Complex
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 EINJ6_COMPARE_VALUE_H1:
- Packet Compare Value: 2nd DWORD. Specifies the value to compare against
- Tx the TLP header DWORD#1 bits specified in the Packet Compare Point
registers (EINJ6_COMPARE_POINT*). Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_VALUE_H2_REG_0
where <i> = 1, 4, 8. Description: Program this register for the 3rd DWORD of TLP header/prefix. It is necessary to carefully consider the endianness when you program this register. Bits [31:0] = TLP_DW2[7:0],
- TLP_DW2[15:8], TLP_DW2[23:16], TLP_DW2[31:24] The Packet Compare Point registers
(EINJ6_COMPARE_POINT*) specify which Tx TLP header bits to compare with the corresponding bits in the Packet Compare Value registers (EINJ6_COMPARE_VALUE*). When all specified bits (in the Tx TLP header and EINJ6_COMPARE_VALUE*) match, the controller inserts errors into the TLP. The type and number of errors are specified by the EINJ6_TLP_REG register.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_VALUE_H2_REG_0
- Offset: 0x204
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_VALUE_H2_REG_0
- Offset: 0x220
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_VALUE_H2_REG_0
- Offset: 0x234
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 EINJ6_COMPARE_VALUE_H2:
- Packet Compare Value: 3rd DWORD. Specifies the value to compare against
- Tx the TLP header DWORD#2 bits specified in the Packet Compare Point
registers (EINJ6_COMPARE_POINT*). Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_VALUE_H3_REG_0
where <i> = 1, 4, 8. Description: Program this register for the 4th DWORD of TLP header/prefix. It is necessary to carefully consider the endianness when you program this register. Bits [31:0] = TLP_DW3[7:0],
- TLP_DW3[15:8], TLP_DW3[23:16], TLP_DW3[31:24] The Packet Compare Point registers
(EINJ6_COMPARE_POINT*) specify which Tx TLP header bits to compare with the corresponding bits in the Packet Compare Value registers (EINJ6_COMPARE_VALUE*). When all specified bits (in the Tx TLP header and EINJ6_COMPARE_VALUE*) match, the controller inserts errors into the TLP. The type and number of errors are specified by the EINJ6_TLP_REG register.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_VALUE_H3_REG_0
- Offset: 0x208
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_VALUE_H3_REG_0
- Offset: 0x224
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ6_COMPARE_VALUE_H3_REG_0
- Offset: 0x238
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 EINJ6_COMPARE_VALUE_H3:
- Packet Compare Value: 4th DWORD. Specifies the value to compare against
- Tx the TLP header DWORD#3 bits specified in the Packet Compare Point
registers (EINJ6_COMPARE_POINT*). Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_POINT_H0_REG_0
where <i> = 1, 4, 8. Description: Program this register for the 1st DWORD of TLP header/prefix. It is necessary to carefully consider the endianness when you program this register. Bits [31:0] = TLP_DW0[7:0],
- TLP_DW0[15:8], TLP_DW0[23:16], TLP_DW0[31:24] The Packet Change Point registers
(EINJ6_CHANGE_POINT*) specify which Tx TLP header bits to replace with the corresponding bits

- PCIe x1/x4/x8 Root Complex
in the Packet Change Value registers (EINJ6_CHANGE_VALUE*). The type and number of errors are specified by the EINJ6_TLP_REG register. Only applies when EINJ6_INVERTED_CONTROL in EINJ6_TLP_REG =0.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_POINT_H0_REG_0
- Offset: 0x20c
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_POINT_H0_REG_0
- Offset: 0x228
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_POINT_H0_REG_0
- Offset: 0x23c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 EINJ6_CHANGE_POINT_H0:
- Packet Change Point: 1st DWORD. Specifies which Tx TLP header
- DWORD#0 bits to replace with the corresponding bits in the Packet Change
Value registers (EINJ6_CHANGE_VALUE*). Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_POINT_H1_REG_0
where <i> = 1, 4, 8. Description: Program this register for the 2nd DWORD of TLP header/prefix. It is necessary to carefully consider the endianness when you program this register. Bits [31:0] = TLP_DW1[7:0],
- TLP_DW1[15:8], TLP_DW1[23:16], TLP_DW1[31:24] The Packet Change Point registers
(EINJ6_CHANGE_POINT*) specify which Tx TLP header bits to replace with the corresponding bits in the Packet Change Value registers (EINJ6_CHANGE_VALUE*). The type and number of errors are specified by the EINJ6_TLP_REG register. Only applies when EINJ6_INVERTED_CONTROL in EINJ6_TLP_REG =0.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_POINT_H1_REG_0
- Offset: 0x210
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_POINT_H1_REG_0

- PCIe x1/x4/x8 Root Complex
- Offset: 0x22c
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_POINT_H1_REG_0
- Offset: 0x240
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 EINJ6_CHANGE_POINT_H1:
- Packet Change Point: 2nd DWORD. Specifies which Tx TLP header
- DWORD#1 bits to replace with the corresponding bits in the Packet Change
Value registers (EINJ6_CHANGE_VALUE*). Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_POINT_H2_REG_0
where <i> = 1, 4, 8. Description: Program this register for the 3rd DWORD of TLP header/prefix. It is necessary to carefully consider the endianness when you program this register. Bits [31:0] = TLP_DW2[7:0],
- TLP_DW2[15:8], TLP_DW2[23:16], TLP_DW2[31:24] The Packet Change Point registers
(EINJ6_CHANGE_POINT*) specify which Tx TLP header bits to replace with the corresponding bits in the Packet Change Value registers (EINJ6_CHANGE_VALUE*). The type and number of errors are specified by the EINJ6_TLP_REG register. Only applies when EINJ6_INVERTED_CONTROL in EINJ6_TLP_REG =0.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_POINT_H2_REG_0
- Offset: 0x214
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_POINT_H2_REG_0
- Offset: 0x230
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_POINT_H2_REG_0
- Offset: 0x244
- Read/Write: R/W
- Parity Protection: N
- Shadow: N

- PCIe x1/x4/x8 Root Complex
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 EINJ6_CHANGE_POINT_H2:
- Packet Change Point: 3rd DWORD. Specifies which Tx TLP header
- DWORD#2 bits to replace with the corresponding bits in the Packet Change
Value registers (EINJ6_CHANGE_VALUE*). Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_POINT_H3_REG_0
where <i> = 1, 4, 8. Description: Program this register for the 4th DWORD of TLP header/prefix. It is necessary to carefully consider the endianness when you program this register. Bits [31:0] = TLP_DW3[7:0],
- TLP_DW3[15:8], TLP_DW3[23:16], TLP_DW3[31:24] The Packet Change Point registers
(EINJ6_CHANGE_POINT*) specify which Tx TLP header bits to replace with the corresponding bits in the Packet Change Value registers (EINJ6_CHANGE_VALUE*). The type and number of errors are specified by the EINJ6_TLP_REG register. Only applies when EINJ6_INVERTED_CONTROL in EINJ6_TLP_REG =0.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_POINT_H3_REG_0
- Offset: 0x218
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_POINT_H3_REG_0
- Offset: 0x234
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_POINT_H3_REG_0
- Offset: 0x248
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 EINJ6_CHANGE_POINT_H3:
- Packet Change Point: 4th DWORD. Specifies which Tx TLP header
- DWORD#3 bits to replace with the corresponding bits in the Packet Change
Value registers (EINJ6_CHANGE_VALUE*). Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_VALUE_H0_REG_0
where <i> = 1, 4, 8. Description: Program this register for the 1st DWORD of TLP header/prefix. It is necessary to carefully consider the endianness when you program this register. Bits [31:0] = TLP_DW0[7:0],
- TLP_DW0[15:8], TLP_DW0[23:16], TLP_DW0[31:24] The Packet Change Point registers
(EINJ6_CHANGE_POINT*) specify which Tx TLP header bits to replace with the corresponding bits in the Packet Change Value registers (EINJ6_CHANGE_VALUE*). The type and number of errors are specified by the EINJ6_TLP_REG register. Only applies when EINJ6_INVERTED_CONTROL in EINJ6_TLP_REG =0.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_VALUE_H0_REG_0
- Offset: 0x21c
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_VALUE_H0_REG_0
- Offset: 0x238
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_VALUE_H0_REG_0
- Offset: 0x24c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 EINJ6_CHANGE_VALUE_H0:
- Packet Change Value: 1st DWORD. Specifies replacement values for the Tx
- TLP header DWORD#0 bits defined in the Packet Change Point registers
(EINJ6_CHANGE_POINT*). Only applies when the
- EINJ6_INVERTED_CONTROL field in EINJ6_TLP_REG is '0'. Note: This register
field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_VALUE_H1_REG_0
where <i> = 1, 4, 8. Description: Program this register for the 2nd DWORD of TLP header/prefix. It is necessary to carefully consider the endianness when you program this register. Bits [31:0] = TLP_DW1[7:0],
- TLP_DW1[15:8], TLP_DW1[23:16], TLP_DW1[31:24] The Packet Change Point registers

- PCIe x1/x4/x8 Root Complex
(EINJ6_CHANGE_POINT*) specify which Tx TLP header bits to replace with the corresponding bits in the Packet Change Value registers (EINJ6_CHANGE_VALUE*). The type and number of errors are specified by the EINJ6_TLP_REG register. Only applies when EINJ6_INVERTED_CONTROL in EINJ6_TLP_REG =0.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_VALUE_H1_REG_0
- Offset: 0x220
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_VALUE_H1_REG_0
- Offset: 0x23c
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_VALUE_H1_REG_0
- Offset: 0x250
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 EINJ6_CHANGE_VALUE_H1:
- Packet Change Value: 2nd DWORD. Specifies replacement values for the Tx
- TLP header DWORD#1 bits defined in the Packet Change Point registers
(EINJ6_CHANGE_POINT*). Only applies when the
- EINJ6_INVERTED_CONTROL field in EINJ6_TLP_REG is '0'. Note: This register
field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_VALUE_H2_REG_0
where <i> = 1, 4, 8. Description: Program this register for the 3rd DWORD of TLP header/prefix. It is necessary to carefully consider the endianness when you program this register. Bits [31:0] = TLP_DW2[7:0],
- TLP_DW2[15:8], TLP_DW2[23:16], TLP_DW2[31:24] The Packet Change Point registers
(EINJ6_CHANGE_POINT*) specify which Tx TLP header bits to replace with the corresponding bits in the Packet Change Value registers (EINJ6_CHANGE_VALUE*). The type and number of errors are specified by the EINJ6_TLP_REG register. Only applies when EINJ6_INVERTED_CONTROL in EINJ6_TLP_REG =0.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_VALUE_H2_REG_0
- Offset: 0x224

- PCIe x1/x4/x8 Root Complex
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_VALUE_H2_REG_0
- Offset: 0x240
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_VALUE_H2_REG_0
- Offset: 0x254
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 EINJ6_CHANGE_VALUE_H2:
- Packet Change Value: 3rd DWORD. Specifies replacement values for the Tx
- TLP header DWORD#2 bits defined in the Packet Change Point registers
(EINJ6_CHANGE_POINT*). Only applies when the
- EINJ6_INVERTED_CONTROL field in EINJ6_TLP_REG is '0'. Note: This register
field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_VALUE_H3_REG_0
where <i> = 1, 4, 8. Description: Program this register for the 4th DWORD of TLP header/prefix. It is necessary to carefully consider the endianness when you program this register. Bits [31:0] = TLP_DW3[7:0],
- TLP_DW3[15:8], TLP_DW3[23:16], TLP_DW3[31:24] The Packet Change Point registers
(EINJ6_CHANGE_POINT*) specify which Tx TLP header bits to replace with the corresponding bits in the Packet Change Value registers (EINJ6_CHANGE_VALUE*). The type and number of errors are specified by the EINJ6_TLP_REG register. Only applies when EINJ6_INVERTED_CONTROL in EINJ6_TLP_REG =0.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_VALUE_H3_REG_0
- Offset: 0x228
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_VALUE_H3_REG_0
- Offset: 0x244
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ6_CHANGE_VALUE_H3_REG_0
- Offset: 0x258

- PCIe x1/x4/x8 Root Complex
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 EINJ6_CHANGE_VALUE_H3:
- Packet Change Value: 4th DWORD. Specifies replacement values for the Tx
- TLP header DWORD#3 bits defined in the Packet Change Point registers
(EINJ6_CHANGE_POINT*). Only applies when the
- EINJ6_INVERTED_CONTROL field in EINJ6_TLP_REG is '0'. Note: This register
field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_EINJ6_TLP_REG_0
where <i> = 1, 4, 8. Description: The Packet Compare Point registers (EINJ6_COMPARE_POINT*) specify which Tx TLP header bits to compare with the corresponding bits in the Packet Compare Value registers (EINJ6_COMPARE_VALUE*). When all specified bits (in the Tx TLP header and EINJ6_COMPARE_VALUE*) match, the controller inserts errors into the TLP. The type and number of errors are specified by the this register. The Packet Change Point registers (EINJ6_CHANGE_POINT*) specify which Tx TLP header bits to replace with the corresponding bits in the Packet Change Value registers (EINJ6_CHANGE_VALUE*). The type and number of errors are specified by the this register. Only applies when EINJ6_INVERTED_CONTROL in this register =0. The TLP into that errors are injected will not arrive at the transaction layer of the remote device when all of the following conditions are true. - Using 128b/130b encoding - Injecting errors into TLP Length field / TLP digest bit.
- PCIE_X1_RC_PF0_RAS_DES_CAP_EINJ6_TLP_REG_0
- Offset: 0x22c
- PCIE_X4_RC_PF0_RAS_DES_CAP_EINJ6_TLP_REG_0
- Offset: 0x248
- PCIE_X8_RC_PF0_RAS_DES_CAP_EINJ6_TLP_REG_0
- Offset: 0x25c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N

- PCIe x1/x4/x8 Root Complex
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:12
- RO
0x0 RSVDP_12: Reserved for future use. 11:9
- RW
0x0 EINJ6_PACKET_TYPE:
- Packet type. Selects the TLP packets to inject errors into. All
encodings other than the specified encodings are reserved. Note: This register field is sticky.
- RW
0x0 EINJ6_INVERTED_CONTROL: Inverted Error Injection Control. Encodded vlues given as above. Note: This register field is sticky. 7:0
- RW
0x0 EINJ6_COUNT:
- Error Injection Count. Indicates the number of errors to insert. This
counter is decremented while errors are been inserted. - If the counter value is 0x01 and error is inserted,
- ERROR_INJECTION6_ENABLE in EINJ_ENABLE_REG returns '0'. - If
the counter value is 0x00 and ERROR_INJECTION6_ENABLE=1, errors are inserted until ERROR_INJECTION6_ENABLE is set to '0'. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_SD_CONTROL1_REG_0
where <i> = 1, 4, 8. Description: For more details, see the RAS DES section in the Core Operations chapter of the Databook.
- PCIE_X1_RC_PF0_RAS_DES_CAP_SD_CONTROL1_REG_0
- Offset: 0x240
- PCIE_X4_RC_PF0_RAS_DES_CAP_SD_CONTROL1_REG_0
- Offset: 0x25c
- PCIE_X8_RC_PF0_RAS_DES_CAP_SD_CONTROL1_REG_0
- Offset: 0x270
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
31:24
- RO
0x0 RSVDP_24: Reserved for future use. 23:22
- RW
0x0 LOW_POWER_INTERVAL:
- Low Power Entry Interval Time. Interval Time that the controller
starts monitoring RXELECIDLE signal after L0s/L1/L2 entry. You should set the value according to the latency from receiving EIOS to, RXELECIDLE assertion at the PHY. Note: This register field is sticky. 21:20
- RW
0x0 TX_EIOS_NUM:
- Number of Tx EIOS. This register sets the number of transmit
- EIOS for L0s/L1 entry and Disable/Loopback/Hot-reset exit. The
controller selects the greater value between this register and the value defined by the PCI-SIG specification. Note: This register field is sticky. 19:17
- RO
0x0 RSVDP_17: Reserved for future use.
- RW
0x0 FORCE_DETECT_LANE_EN: Force Detect Lane Enable. Note: This register field is sticky. 15:0
- RW
0x0 FORCE_DETECT_LANE:
- Force Detect Lane. When the FORCE_DETECT_LANE_EN field is
set, the controller ignores receiver detection from PHY during
- LTSSM Detect state and uses this value instead. Value represents
lane number. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_SD_CONTROL2_REG_0
where <i> = 1, 4, 8. Description: For more details, see the RAS DES section in the Core Operations chapter of the Databook.
- PCIE_X1_RC_PF0_RAS_DES_CAP_SD_CONTROL2_REG_0
- Offset: 0x244
- PCIE_X4_RC_PF0_RAS_DES_CAP_SD_CONTROL2_REG_0
- Offset: 0x260
- PCIE_X8_RC_PF0_RAS_DES_CAP_SD_CONTROL2_REG_0
- Offset: 0x274
- Read/Write: See table below
- Parity Protection: N
- Shadow: N

- PCIe x1/x4/x8 Root Complex
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:17
- RO
0x0 RSVDP_17: Reserved for future use.
- RW
0x0 FRAMING_ERR_RECOVERY_DISABLE:
- Framing Error Recovery Disable. This bit disables a transition to
- Recovery state when a Framing Error is occurred. Note: This
register field is sticky. 15:11
- RO
0x0 RSVDP_11: Reserved for future use.
- RW
0x0 DIRECT_LPBKSLV_TO_EXIT: Direct Loopback Slave To Exit. Note: This register field is sticky.
- RW
0x0 DIRECT_POLCOMP_TO_DETECT:
- Direct Polling.Compliance to Detect. Note: This register field is
sticky.
- RW
0x0 DIRECT_RECIDLE_TO_CONFIG:
- Direct Recovery.Idle to Configuration. Note: This register field is
sticky. 7:3
- RO
0x0 RSVDP_3: Reserved for future use.
- RW
0x0 NOACK_FORCE_LINKDOWN: Force LinkDown. Note: This register field is sticky.
- WO
0x0 RECOVERY_REQUEST: Recovery Request.
- RW
0x0 HOLD_LTSSM: Hold and Release LTSSM. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_SD_STATUS_L1LANE_REG_0
where <i> = 1, 4, 8. Description: This viewport register returns the data selected by the following field: - LANE_SELECT in SD_STATUS_L1LANE_REG For more details, see the RAS DES section in the Core Operations chapter of the Databook.
- PCIE_X1_RC_PF0_RAS_DES_CAP_SD_CONTROL2_REG_0
- Offset: 0x244
- PCIE_X4_RC_PF0_RAS_DES_CAP_SD_CONTROL2_REG_0
- Offset: 0x260

- PCIe x1/x4/x8 Root Complex
- PCIE_X8_RC_PF0_RAS_DES_CAP_SD_CONTROL2_REG_0
- Offset: 0x274
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00180000 (0b0000,0000,0001,1000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:24
- RO
0x0 DESKEW_POINTER:
- Deskew Pointer. Indicates Deskew pointer of internal Deskew
buffer of selected lane number(LANE_SELECT). Note: This register field is sticky. 23:21
- RO
0x0 RSVDP_21: Reserved for future use.
- RO
0x1 PIPE_TXELECIDLE:
- PIPE:TxElecIdle. Indicates PIPE TXELECIDLE signal of selected
lane number(LANE_SELECT). Note: This register field is sticky.
- RO
0x1 PIPE_RXELECIDLE:
- PIPE:RxElecIdle. Indicates PIPE RXELECIDLE signal of selected
lane number(LANE_SELECT). Note: This register field is sticky.
- RO
0x0 PIPE_RXVALID:
- PIPE:RxValid. Indicates PIPE RXVALID signal of selected lane
number(LANE_SELECT). Note: This register field is sticky.
- RO
0x0 PIPE_DETECT_LANE:
- PIPE:Detect Lane. Indicates whether PHY indicates receiver
detection or not on selected lane number(LANE_SELECT). Note: This register field is sticky.
- RO
0x0 PIPE_RXPOLARITY:
- PIPE:RxPolarity. Indicates PIPE RXPOLARITY signal of selected
lane number(LANE_SELECT). Note: This register field is sticky. 15:4
- RO
0x0 RSVDP_4: Reserved for future use. 3:0
- RW
0x0 LANE_SELECT:
- Lane Select. Lane Select register for Silicon Debug Status
Register of Layer1-PerLane. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_SD_STATUS_L1LTSSM_REG_0
where <i> = 1, 4, 8. Description: For more details, see the RAS DES section in the Core Operations chapter of the Databook.

- PCIe x1/x4/x8 Root Complex
- PCIE_X1_RC_PF0_RAS_DES_CAP_SD_STATUS_L1LTSSM_REG_0
- Offset: 0x254
- PCIE_X4_RC_PF0_RAS_DES_CAP_SD_STATUS_L1LTSSM_REG_0
- Offset: 0x270
- PCIE_X8_RC_PF0_RAS_DES_CAP_SD_STATUS_L1LTSSM_REG_0
- Offset: 0x284
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000200 (0b0000,0000,0000,0000,0000,0010,0000,0000)
- Bit
R/W
- Reset
- Description
31:16
- RO
0x0 LTSSM_VARIABLE:
- LTSSM Variable. Indicates internal LTSSM variables defined in the
- PCI Express Base Specification. For other value
idle_to_rlock_transitioned. Note: This register field is sticky.
- RO
0x0 LANE_REVERSAL:
- Lane Reversal Operation. Receiver detected lane reversal. This field is
only valid in the L0 LTSSM state. Note: This register field is sticky. 14:11
- RO
0x0 RSVDP_11: Reserved for future use. 10:8
- RO
0x2 PIPE_POWER_DOWN:
- PIPE:PowerDown. Indicates PIPE PowerDown signal. Note: This
register field is sticky.
- RW
0x0 FRAMING_ERR: Framing Error. Indicates Framing Error detection status. 6:0
- RO
0x0 FRAMING_ERR_PTR:
- First Framing Error Pointer. Identifies the first Framing Error using
the following encoding. The field contents are only valid value when
- FRAMING_ERR =1. - Received Unexpected Framing Token (Values 01h
to 06h) - Received Unexpected STP Token (Values 11h to 13h) -
- Received Unexpected Block (Values 21h to 2Eh) All encodings other
than the defined encodings are reserved. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_SD_STATUS_PM_REG_0
where <i> = 1, 4, 8.

- PCIe x1/x4/x8 Root Complex
Description: For more details, see the RAS DES section in the Core Operations chapter of the Databook.
- PCIE_X1_RC_PF0_RAS_DES_CAP_SD_STATUS_PM_REG_0
- Offset: 0x258
- PCIE_X4_RC_PF0_RAS_DES_CAP_SD_STATUS_PM_REG_0
- Offset: 0x274
- PCIE_X8_RC_PF0_RAS_DES_CAP_SD_STATUS_PM_REG_0
- Offset: 0x288
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:24
- RO
0x0 RSVDP_24: Reserved for future use. 23:16
- RO
0x0 LATCHED_NFTS:
- Latched N_FTS. Indicates the value of N_FTS in the received
- TS Ordered Sets from the Link Partner. Note: This register field
is sticky. 15:13
- RO
0x0 L1SUB_STATE: L1Sub State. Indicates internal state machine of L1Sub state. Note: This register field is sticky.
- RW
0x0
- PME_RESEND_FLAG
11:8
- RO
0x0 INTERNAL_PM_SSTATE:
- Internal PM State(Slave). Indicates internal state machine of
- Power Management Slave controller. Note: This register field is
sticky. 7:5
- RO
0x0 RSVDP_5: Reserved for future use. 4:0
- RO
0x0 INTERNAL_PM_MSTATE:
- Internal PM State(Master). Indicates internal state machine of
- Power Management Master controller. Note: This register field
is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_SD_STATUS_L2_REG_0
where <i> = 1, 4, 8.

- PCIe x1/x4/x8 Root Complex
Description: For more details, see the RAS DES section in the Core Operations chapter of the Databook.
- PCIE_X1_RC_PF0_RAS_DES_CAP_SD_STATUS_L2_REG_0
- Offset: 0x25c
- PCIE_X4_RC_PF0_RAS_DES_CAP_SD_STATUS_L2_REG_0
- Offset: 0x278
- PCIE_X8_RC_PF0_RAS_DES_CAP_SD_STATUS_L2_REG_0
- Offset: 0x28c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00fff000 (0b0000,0000,1111,1111,1111,0000,0000,0000)
- Bit
- Reset
- Description
31:28 0x0 RSVDP_28: Reserved for future use. 0x0 FC_INIT2:
- FC_INIT2. Indicates the controller is in FC_INIT2(VC0) state. Note: This
register field is sticky. 0x0 FC_INIT1:
- FC_INIT1. Indicates the controller is in FC_INIT1(VC0) state. Note: This
register field is sticky. 25:24 0x0 DLCMSM:
- DLCMSM. Indicates the current DLCMSM. Note: This register field is
sticky. 23:12 0xfff RX_ACK_SEQ_NO:
- Tx Ack Sequence Number. Indicates ACKD_SEQ which is updated by
receiving ACK/NAK DLLP. Note: This register field is sticky. 11:0 0x0 TX_TLP_SEQ_NO:
- Tx Tlp Sequence Number. Indicates next transmit sequence number
for transmit TLP. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_SD_STATUS_L3FC_REG_0
where <i> = 1, 4, 8.

- PCIe x1/x4/x8 Root Complex
Description: The CREDIT_DATA[0/1] fields in this viewport register return the data for the VC and
- TLP Type selected by the following fields: - CREDIT_SEL_VC - CREDIT_SEL_CREDIT_TYPE -
- CREDIT_SEL_TLP_TYPE - CREDIT_SEL_HD For more details, see the RAS DES section in the Core
Operations chapter of the Databook.
- PCIE_X1_RC_PF0_RAS_DES_CAP_SD_STATUS_L3FC_REG_0
- Offset: 0x260
- PCIE_X4_RC_PF0_RAS_DES_CAP_SD_STATUS_L3FC_REG_0
- Offset: 0x27c
- PCIE_X8_RC_PF0_RAS_DES_CAP_SD_STATUS_L3FC_REG_0
- Offset: 0x290
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:20
- RO
0x0 CREDIT_DATA1:
- Credit Data1. Current FC credit data selected by the
- CREDIT_SEL_VC, CREDIT_SEL_CREDIT_TYPE,
- CREDIT_SEL_TLP_TYPE, and CREDIT_SEL_HD viewport-select
fields. - Rx: Credit Allocated Value - Tx: Credit Limit Value. This value is valid when DLCMSM=0x3(DL_ACTIVE). Note: This register field is sticky. 19:8
- RO
0x0 CREDIT_DATA0:
- Credit Data0. Current FC credit data selected by the
- CREDIT_SEL_VC, CREDIT_SEL_CREDIT_TYPE,
- CREDIT_SEL_TLP_TYPE, and CREDIT_SEL_HD viewport-select
fields. - Rx: Credit Received Value - Tx: Credit Consumed Value Note: This register field is sticky.
- RO
0x0 RSVDP_7: Reserved for future use.
- RW
0x0 CREDIT_SEL_HD:
- Credit Select(HeaderData). This field in conjunction with the
- CREDIT_SEL_VC, CREDIT_SEL_CREDIT_TYPE, and
- CREDIT_SEL_TLP_TYPE viewport-select fields determines that data
that is returned by the CREDIT_DATA0 and CREDIT_DATA1 data fields. Note: This register field is sticky. 5:4
- RW
0x0 CREDIT_SEL_TLP_TYPE:
- Credit Select(TLP Type). This field in conjunction with the
- CREDIT_SEL_VC, CREDIT_SEL_CREDIT_TYPE, and CREDIT_SEL_HD
viewport-select fields determines that data that is returned by the
- CREDIT_DATA0 and CREDIT_DATA1 data fields. Note: This register
field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x0 CREDIT_SEL_CREDIT_TYPE:
- Credit Select(Credit Type). This field in conjunction with the
- CREDIT_SEL_VC, CREDIT_SEL_TLP_TYPE, and CREDIT_SEL_HD
viewport-select fields determines that data that is returned by the
- CREDIT_DATA0 and CREDIT_DATA1 data fields. Note: This register
field is sticky. 2:0
- RW
0x0 CREDIT_SEL_VC:
- Credit Select(VC). This field in conjunction with the
- CREDIT_SEL_CREDIT_TYPE, CREDIT_SEL_TLP_TYPE, and
- CREDIT_SEL_HD viewport-select fields determines that data that
is returned by the CREDIT_DATA0 and CREDIT_DATA1 data fields. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_SD_STATUS_L3_REG_0
where <i> = 1, 4, 8. Description: Silicon Debug Status(Layer3). For more details, see the RAS DES section in the Core Operations chapter of the Databook.
- PCIE_X1_RC_PF0_RAS_DES_CAP_SD_STATUS_L3_REG_0
- Offset: 0x264
- PCIE_X4_RC_PF0_RAS_DES_CAP_SD_STATUS_L3_REG_0
- Offset: 0x280
- PCIE_X8_RC_PF0_RAS_DES_CAP_SD_STATUS_L3_REG_0
- Offset: 0x294
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:8
- RO
0x0 RSVDP_8: Reserved for future use.
- RW
0x0 MFTLP_STATUS: Malformed TLP Status. Indicates malformed TLP has occurred.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
6:0
- RO
0x0 MFTLP_POINTER:
- First Malformed TLP Error Pointer. Indicates the element of the
received first malformed TLP. This pointer is validated by
- MFTLP_STATUS. All encodings other than the defined encodings
are reserved. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_SD_EQ_CONTROL1_REG_0
where <i> = 1, 4, 8. Description: This is a viewport control register. Setting the EQ_RATE_SEL and EQ_LANE_SEL fields in this register determine the per-lane Silicon Debug EQ Status data returned by the SD_EQ_STATUS[1/2/3] viewport registers. For more details, see the RAS DES section in the Core Operations chapter of the Databook.
- PCIE_X1_RC_PF0_RAS_DES_CAP_SD_EQ_CONTROL1_REG_0
- Offset: 0x270
- PCIE_X4_RC_PF0_RAS_DES_CAP_SD_EQ_CONTROL1_REG_0
- Offset: 0x28c
- PCIE_X8_RC_PF0_RAS_DES_CAP_SD_EQ_CONTROL1_REG_0
- Offset: 0x2a0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:24
- RW
0x0 FOM_TARGET:
- FOM Target. Indicates figure of merit target criteria value of EQ
- Master(DSP in EQ Phase3/USP in EQ Phase2). This field is only
valid when GEN3_EQ_FB_MODE is 0001b(Figure Of Merit). Note: This register field is sticky.
- RW
0x0 FOM_TARGET_ENABLE:
- FOM Target Enable. Enables the FOM_TARGET fields. Note: This
register field is sticky. 22:18
- RO
0x0 RSVDP_18: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
17:16
- RW
0x0 EVAL_INTERVAL_TIME: Eval Interval Time. Indicates interval time of RxEqEval assertion.
- This field is used for EQ Master(DSP in EQ Phase3/USP in EQ
Phase2). Note: This register field is sticky. 15:10
- RO
0x0 RSVDP_10: Reserved for future use. 9:8
- RW
0x0 EXT_EQ_TIMEOUT:
- Extends EQ Phase2/3 Timeout. This field is used when the LTSSM
is in Recovery.EQ2/3. When this field is set, the value of EQ2/3 timeout is extended. Note: This register field is sticky. 7:6
- RO
0x0 RSVDP_6: Reserved for future use. 5:4
- RW
0x0 EQ_RATE_SEL:
- EQ Status Rate Select. Setting this field in conjunction with the
- EQ_LANE_SEL field determines the per-lane Silicon Debug EQ
- Status data returned by the SD_EQ_CONTROL[2/3] and
- SD_EQ_STATUS[1/2/3] viewport registers. Note: This register field
is sticky. 3:0
- RW
0x0 EQ_LANE_SEL:
- EQ Status Lane Select. Setting this field in conjunction with the
- EQ_RATE_SEL field determines the per-lane Silicon Debug EQ
- Status data returned by the SD_EQ_CONTROL[2/3] and
- SD_EQ_STATUS[1/2/3] viewport registers. Note: This register field
is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_SD_EQ_CONTROL2_REG_0
where <i> = 1, 4, 8. Description: This viewport register returns the value for the rate and lane selected by the
- EQ_RATE_SEL and EQ_LANE_SEL fields in the SD_EQ_CONTROL1_REG register. For more details,
see the RAS DES section in the Core Operations chapter of the Databook.
- PCIE_X1_RC_PF0_RAS_DES_CAP_SD_EQ_CONTROL2_REG_0
- Offset: 0x274
- PCIE_X4_RC_PF0_RAS_DES_CAP_SD_EQ_CONTROL2_REG_0
- Offset: 0x290
- PCIE_X8_RC_PF0_RAS_DES_CAP_SD_EQ_CONTROL2_REG_0
- Offset: 0x2a4

- PCIe x1/x4/x8 Root Complex
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RO
0x0 RSVDP_31: Reserved for future use.
- RW
0x0 FORCE_LOCAL_TX_PRESET_ENABLE:
- Force Local Transmitter Preset Enable. Enables the
- FORCE_LOCAL_TX_PRESET field. If select rate in the EQ_RATE_SEL
field is 32.0GT/s Speed, this feature is not available. Note: This register field is sticky.
- RW
0x0 FORCE_LOCAL_RX_HINT_ENABLE:
- Force Local Receiver Preset Hint Enable. Enables the
- FORCE_LOCAL_RX_HINT field. If select rate in the EQ_RATE_SEL
field is other than 8.0GT/s Speed, this feature is not available. Note: This register field is sticky.
- RW
0x0 FORCE_LOCAL_TX_COEF_ENABLE:
- Force Local Transmitter Coefficient Enable. Enables the following
fields: - FORCE_LOCAL_TX_PRE_CURSOR -
- FORCE_LOCAL_TX_CURSOR - FORCE_LOCAL_TX_POST_CURSOR
Note: This register field is sticky. 27:24
- RW
0x0 FORCE_LOCAL_TX_PRESET:
- Force Local Transmitter Preset. Indicates initial preset value of USP
in EQ Slave(EQ Phase2) instead of receiving EQ TS2. If select rate in the EQ_RATE_SEL field is 32.0GT/s Speed, this feature is not available. Note: This register field is sticky. 23:21
- RO
0x0 RSVDP_21: Reserved for future use. 20:18
- RW
0x0 FORCE_LOCAL_RX_HINT:
- Force Local Receiver Preset Hint. Indicates the RxPresetHint value
of EQ Slave(DSP in EQ Phase2/USP in EQ Phase3), instead of received or set value. If select rate in the EQ_RATE_SEL field is other than 8.0GT/s Speed, this feature is not available. Note: This register field is sticky. 17:12
- RW
0x0 FORCE_LOCAL_TX_POST_CURSOR:
- Force Local Transmitter Post-Cursor. Indicates the coefficient value
of EQ Slave(DSP in EQ Phase2/USP in EQ Phase3), instead of the value instructed from link partner. Note: This register field is sticky. 11:6
- RW
0x0 FORCE_LOCAL_TX_CURSOR:
- Force Local Transmitter Cursor. Indicates the coefficient value of
- EQ Slave(DSP in EQ Phase2/USP in EQ Phase3), instead of the value
instructed from link partner. Note: This register field is sticky. 5:0
- RW
0x0 FORCE_LOCAL_TX_PRE_CURSOR:
- Force Local Transmitter Pre-cursor. Indicates the coefficient value
of EQ Slave(DSP in EQ Phase2/USP in EQ Phase3), instead of the value instructed from link partner. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_SD_EQ_CONTROL3_REG_0
where <i> = 1, 4, 8. Description: This viewport register returns the value for the rate and lane selected by the
- EQ_RATE_SEL and EQ_LANE_SEL fields in the SD_EQ_CONTROL1_REG register. For more details,
see the RAS DES section in the Core Operations chapter of the Databook.
- PCIE_X1_RC_PF0_RAS_DES_CAP_SD_EQ_CONTROL3_REG_0
- Offset: 0x278
- PCIE_X4_RC_PF0_RAS_DES_CAP_SD_EQ_CONTROL3_REG_0
- Offset: 0x294
- PCIE_X8_RC_PF0_RAS_DES_CAP_SD_EQ_CONTROL3_REG_0
- Offset: 0x2a8
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:29
- RO
0x0 RSVDP_29: Reserved for future use.
- RW
0x0 FORCE_REMOTE_TX_COEF_ENABLE:
- Force Remote Transmitter Coefficient Enable. Enables the
following fields: - FORCE_REMOTE_TX_PRE_CURSOR -
- FORCE_REMOTE_TX_CURSOR -
- FORCE_REMOTE_TX_POST_CURSOR This function can only be
used when GEN3_EQ_FB_MODE = 0000b(Direction Change) Note: This register field is sticky. 27:18
- RO
0x0 RSVDP_18: Reserved for future use. 17:12
- RW
0x0 FORCE_REMOTE_TX_POST_CURSOR:
- Force Remote Transmitter Post-Cursor. Indicates the coefficient
value of EQ Master(DSP in EQ Phase3/USP in EQ Phase2), instead of the value instructed from local phy in dirchange mode. Note: This register field is sticky. 11:6
- RW
0x0 FORCE_REMOTE_TX_CURSOR:
- Force Remote Transmitter Cursor. Indicates the coefficient value
of EQ Master(DSP in EQ Phase3/USP in EQ Phase2), instead of the value instructed from local phy in dirchange mode. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
5:0
- RW
0x0 FORCE_REMOTE_TX_PRE_CURSOR:
- Force Remote Transmitter Pre-Cursor. Indicates the coefficient
value of EQ Master(DSP in EQ Phase3/USP in EQ Phase2), instead of the value instructed from local phy in dirchange mode. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_SD_EQ_STATUS1_REG_0
where <i> = 1, 4, 8. Description: This viewport register returns the first of three words of Silicon Debug EQ Status data for the rate and lane selected by the EQ_RATE_SEL and EQ_LANE_SEL fields in the
- SD_EQ_CONTROL1_REG register. The following fields are available when Equalization finished
unsuccessfully(EQ_CONVERGENCE_INFO=2). - EQ_RULEA_VIOLATION - EQ_RULEB_VIOLATION -
- EQ_RULEC_VIOLATION - EQ_REJECT_EVENT For more details, see the RAS DES section in the Core
Operations chapter of the Databook.
- PCIE_X1_RC_PF0_RAS_DES_CAP_SD_EQ_STATUS1_REG_0
- Offset: 0x280
- PCIE_X4_RC_PF0_RAS_DES_CAP_SD_EQ_STATUS1_REG_0
- Offset: 0x29c
- PCIE_X8_RC_PF0_RAS_DES_CAP_SD_EQ_STATUS1_REG_0
- Offset: 0x2b0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:8 0x0 RSVDP_8: Reserved for future use. 0x0 EQ_REJECT_EVENT:
- EQ Reject Event. Indicates that the controller receives two consecutive TS1 OS
w/Reject=1b during EQ Master phase(DSP in EQ Phase3/USP in EQ Phase2).
- This bit is automatically cleared when the controller starts EQ Master phase
again. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
0x0 EQ_RULEC_VIOLATION:
- EQ Rule C Violation. Indicates that coefficients rule C violation is detected in
the values provided by PHY using direction change method during EQ Master phase(DSP in EQ Phase3/USP in EQ Phase2). The coefficients rule C correspond to the rules c) from section "Rules for Transmitter Coefficents" in the PCI
- Express Base Specification. This bit is automatically cleared when the controller
starts EQ Master phase again. Note: This register field is sticky. 0x0 EQ_RULEB_VIOLATION:
- EQ Rule B Violation. Indicates that coefficients rule B violation is detected in
the values provided by PHY using direction change method during EQ Master phase(DSP in EQ Phase3/USP in EQ Phase2). The coefficients rules B correspond to the rules b) from section "Rules for Transmitter Coefficents" in the PCI Express Base Specification. This bit is automatically cleared when the controller starts EQ Master phase again. Note: This register field is sticky. 0x0 EQ_RULEA_VIOLATION:
- EQ Rule A Violation. Indicates that coefficients rule A violation is detected in
the values provided by PHY using direction change method during EQ Master phase(DSP in EQ Phase3/USP in EQ Phase2). The coefficients rules A correspond to the rules a) from section "Rules for Transmitter Coefficents" in the PCI Express Base Specification. This bit is automatically cleared when the controller starts EQ Master phase again. Note: This register field is sticky. 0x0 RSVDP_3: Reserved for future use. 2:1 0x0 EQ_CONVERGENCE_INFO:
- EQ Convergence Info. Indicates equalization convergence information. This bit is
automatically cleared when the controller starts EQ Master phase again. Note: This register field is sticky. 0x0 EQ_SEQUENCE:
- EQ Sequence. Indicates that the controller is starting the equalization
sequence. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_SD_EQ_STATUS2_REG_0
where <i> = 1, 4, 8. Description: This viewport register returns the second of three words of Silicon Debug EQ Status data for the rate and lane selected by the EQ_RATE_SEL and EQ_LANE_SEL fields in the
- SD_EQ_CONTROL1_REG register. Each field is available when Equalization finished
successfully(EQ_CONVERGENCE_INFO=1). For more details, see the RAS DES section in the Core Operations chapter of the Databook.
- PCIE_X1_RC_PF0_RAS_DES_CAP_SD_EQ_STATUS2_REG_0
- Offset: 0x284
- PCIE_X4_RC_PF0_RAS_DES_CAP_SD_EQ_STATUS2_REG_0
- Offset: 0x2a0

- PCIe x1/x4/x8 Root Complex
- PCIE_X8_RC_PF0_RAS_DES_CAP_SD_EQ_STATUS2_REG_0
- Offset: 0x2b4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:24 0x0 EQ_LOCAL_FOM_VALUE: EQ Local Figure of Merit. Indicates Local maximum Figure of Merit value. Note: This register field is sticky. 23:21 0x0 RSVDP_21: Reserved for future use. 20:18 0x0 EQ_LOCAL_RX_HINT:
- EQ Local Receiver Preset Hint. Indicates Local Receiver Preset Hint value. If
select rate in the EQ_RATE_SEL field is other than 8.0GT/s Speed, this feature is not available. Note: This register field is sticky. 17:12 0x0 EQ_LOCAL_POST_CURSOR: EQ Local Post-Cursor. Indicates Local post cursor coefficient value. Note: This register field is sticky. 11:6 0x0 EQ_LOCAL_CURSOR:
- EQ Local Cursor. Indicates Local cursor coefficient value. Note: This
register field is sticky. 5:0 0x0 EQ_LOCAL_PRE_CURSOR: EQ Local Pre-Cursor. Indicates Local pre cursor coefficient value. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_SD_EQ_STATUS3_REG_0
where <i> = 1, 4, 8. Description: This viewport register returns the third of three words of Silicon Debug EQ Status data for the rate and lane selected by the EQ_RATE_SEL and EQ_LANE_SEL fields in the
- SD_EQ_CONTROL1_REG register. Each field is available when Equalization finished
successfully(EQ_CONVERGENCE_INFO=1). For more details, see the RAS DES section in the Core Operations chapter of the Databook.
- PCIE_X1_RC_PF0_RAS_DES_CAP_SD_EQ_STATUS3_REG_0
- Offset: 0x288
- PCIE_X4_RC_PF0_RAS_DES_CAP_SD_EQ_STATUS3_REG_0

- PCIe x1/x4/x8 Root Complex
- Offset: 0x2a4
- PCIE_X8_RC_PF0_RAS_DES_CAP_SD_EQ_STATUS3_REG_0
- Offset: 0x2b8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:30 0x0 RSVDP_30: Reserved for future use. 29:24 0x0 EQ_REMOTE_FS:
- EQ Remote FS. Indicates Remote FS value. Note: This register field is
sticky. 23:18 0x0 EQ_REMOTE_LF:
- EQ Remote LF. Indicates Remote LF value. Note: This register field is
sticky. 17:12 0x0 EQ_REMOTE_POST_CURSOR:
- EQ Remote Post-Cursor. Indicates Remote post cursor coefficient
value. Note: This register field is sticky. 11:6 0x0 EQ_REMOTE_CURSOR: EQ Remote Cursor. Indicates Remote cursor coefficient value. Note: This register field is sticky. 5:0 0x0 EQ_REMOTE_PRE_CURSOR: EQ Remote Pre-Cursor. Indicates Remote pre cursor coefficient value. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_VSECRAS_CAP_RASDP_EXT_CAP_HDR_OFF_0
where <i> = 1, 4, 8. Description: This Register provides capability ID, Capability version, and Next capability offset for PCIe Extended capability stucture.
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_VSECRAS_CAP_RASDP_EXT_CAP_HDR_OFF_0

- PCIe x1/x4/x8 Root Complex
- Offset: 0x2a0
- Reset: 0x2d81000b (0b0010,1101,1000,0001,0000,0000,0000,1011)
- Bit
- Reset
- Description
31:20 0x2d8 NEXT_OFFSET:
- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space, this
offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greater than 0FFh. The bottom 2 bits of this offset are Reserved and must be implemented as 00b although software must mask them to allow for future uses of these bits. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 19:16 0x1 CAP:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. A version of the specification that changes the Extended Capability in a way that is not otherwise identifiable (e.g., through a new Capability field) is permitted to increment this field. All such changes to the Capability structure must be software-compatible. Software must check for Capability Version numbers that are greater than or equal to the highest number defined when the software is written, as Functions reporting any such Capability Version numbers will contain a Capability structure that is compatible with that piece of software. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0xb ID:
- PCI Express Extended Capability ID. This field is a PCI-SIG defined ID number
that indicates the nature and format of the Extended Capability. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X4_RC_PF0_VSECRAS_CAP_RASDP_EXT_CAP_HDR_OFF_0
- Offset: 0x2bc
- Reset: 0x2f41000b (0b0010,1111,0100,0001,0000,0000,0000,1011)
- Bit
- Reset
- Description
31:20 0x2f4 NEXT_OFFSET:
- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space, this
offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greater than 0FFh. The bottom 2 bits of this offset are Reserved and must be implemented as 00b although software must mask them to allow for future uses of these bits. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
19:16 0x1 CAP:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. A version of the specification that changes the Extended Capability in a way that is not otherwise identifiable (e.g., through a new Capability field) is permitted to increment this field. All such changes to the Capability structure must be software-compatible. Software must check for Capability Version numbers that are greater than or equal to the highest number defined when the software is written, as Functions reporting any such Capability Version numbers will contain a Capability structure that is compatible with that piece of software. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0xb ID:
- PCI Express Extended Capability ID. This field is a PCI-SIG defined ID number
that indicates the nature and format of the Extended Capability. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X8_RC_PF0_VSECRAS_CAP_RASDP_EXT_CAP_HDR_OFF_0
- Offset: 0x2d0
- Reset: 0x3081000b (0b0011,0000,1000,0001,0000,0000,0000,1011)
- Bit
- Reset
- Description
31:20 0x308 NEXT_OFFSET:
- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space, this
offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greater than 0FFh. The bottom 2 bits of this offset are Reserved and must be implemented as 00b although software must mask them to allow for future uses of these bits. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 19:16 0x1 CAP:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. A version of the specification that changes the Extended Capability in a way that is not otherwise identifiable (e.g., through a new Capability field) is permitted to increment this field. All such changes to the Capability structure must be software-compatible. Software must check for Capability Version numbers that are greater than or equal to the highest number defined when the software is written, as Functions reporting any such Capability Version numbers will contain a Capability structure that is compatible with that piece of software. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0xb ID:
- PCI Express Extended Capability ID. This field is a PCI-SIG defined ID number
that indicates the nature and format of the Extended Capability. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_VSECRAS_CAP_RASDP_VENDOR_SPECIFIC_HDR_OFF_0
where <i> = 1, 4, 8. Description: This Register provides VSEC Length, VSEC ID and VSEC Rev (Version Number). Vendor- specific software must qualify the associated Vendor ID of the PCI Express Function or RCRB before attempting to interpret the values in the VSEC ID or VSEC Rev fields.
- PCIE_X1_RC_PF0_VSECRAS_CAP_RASDP_VENDOR_SPECIFIC_HDR_OFF_0
- Offset: 0x2a4
- PCIE_X4_RC_PF0_VSECRAS_CAP_RASDP_VENDOR_SPECIFIC_HDR_OFF_0
- Offset: 0x2c0
- PCIE_X8_RC_PF0_VSECRAS_CAP_RASDP_VENDOR_SPECIFIC_HDR_OFF_0
- Offset: 0x2d4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x03810001 (0b0000,0011,1000,0001,0000,0000,0000,0001)
- Bit
- Reset
- Description
31:20 0x38 VSEC_LENGTH:
- VSEC Length. This field indicates the number of bytes in the entire VSEC
structure, including the Vendor-Specific Extended Capability Header, the
- Vendor-Specific Header, and the vendor-specific registers. Note: This
register field is sticky. 19:16 0x1 VSEC_REV:
- VSEC Rev. This field is a vendor-defined version number that indicates the
version of the VSEC structure. Software must qualify the Vendor ID and VSEC ID before interpreting this field. Note: This register field is sticky. 15:0 0x1 VSEC_ID:
- VSEC ID. This field is a vendor-defined ID number that indicates the nature
and format of the VSEC structure. Software must qualify the Vendor ID before interpreting this field. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_VSECRAS_CAP_RASDP_ERROR_PROT_CTRL_OFF_0
where <i> = 1, 4, 8.

- PCIe x1/x4/x8 Root Complex
Description: Allows you to disable ECC error correction for RAMs and datapath. When the AXI Bridge Module is implemented and the master / slave clocks are asynchronous to the PCIe native controller clock (core_clk), you must not write this register while operations are in progress in the AXI master / slave interface.
- PCIE_X1_RC_PF0_VSECRAS_CAP_RASDP_ERROR_PROT_CTRL_OFF_0
- Offset: 0x2a8
- PCIE_X4_RC_PF0_VSECRAS_CAP_RASDP_ERROR_PROT_CTRL_OFF_0
- Offset: 0x2c4
- PCIE_X8_RC_PF0_VSECRAS_CAP_RASDP_ERROR_PROT_CTRL_OFF_0
- Offset: 0x2d8
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:24
- RO
0x0 RSVDP_24: Reserved for future use.
- RW
0x0 ERROR_PROT_DISABLE_CXS_RX: Error correction disable for CXS Tx path (PCIe Rx path). Note: This register field is sticky.
- RW
0x0 ERROR_PROT_DISABLE_ADM_RX:
- Error correction disable for ADM Rx path. Note: This register
field is sticky.
- RW
0x0 ERROR_PROT_DISABLE_LAYER3_RX:
- Error correction disable for layer 3 Rx path. Note: This register
field is sticky.
- RW
0x0 ERROR_PROT_DISABLE_LAYER2_RX:
- Error correction disable for layer 2 Rx path. Note: This register
field is sticky.
- RW
0x0 ERROR_PROT_DISABLE_DMA_READ:
- Error correction disable for DMA read engine. Note: This register
field is sticky.
- RW
0x0 ERROR_PROT_DISABLE_AXI_BRIDGE_INBOUND_REQUEST: Error correction disable for AXI bridge inbound request path. Note: This register field is sticky.
- RW
0x0 ERROR_PROT_DISABLE_AXI_BRIDGE_INBOUND_COMPLETION:
- Error correction disable for AXI bridge inbound completion
composer. Does not disable the error detection reporting for 1- bit and 2-bit ECC errors. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x0 ERROR_PROT_DISABLE_RX:
- Global error correction disable for all Rx layers. Note: This
register field is sticky. 15:9
- RO
0x0 RSVDP_9: Reserved for future use.
- RW
0x0 ERROR_PROT_DISABLE_DTIM_TX:
- Error correction disable for DTIM Tx path. Note: This register
field is sticky.
- RW
0x0 ERROR_PROT_DISABLE_CXS_TX: Error correction disable for CXS Rx path (PCIe Tx path). Note: This register field is sticky.
- RW
0x0 ERROR_PROT_DISABLE_ADM_TX:
- Error correction disable for Adm Tx path. Note: This register field
is sticky.
- RW
0x0 ERROR_PROT_DISABLE_LAYER3_TX:
- Error correction disable for layer 3 Tx path. Note: This register
field is sticky.
- RW
0x0 ERROR_PROT_DISABLE_LAYER2_TX:
- Error correction disable for layer 2 Tx path. Note: This register
field is sticky.
- RW
0x0 ERROR_PROT_DISABLE_DMA_WRITE:
- Error correction disable for DMA write engine. Note: This register
field is sticky.
- RW
0x0 ERROR_PROT_DISABLE_AXI_BRIDGE_OUTBOUND: Error correction disable for AXI bridge outbound request path. Note: This register field is sticky.
- RW
0x0 ERROR_PROT_DISABLE_AXI_BRIDGE_MASTER: Error correction disable for AXI bridge master completion buffer. Note: This register field is sticky.
- RW
0x0 ERROR_PROT_DISABLE_TX:
- Global error correction disable for all Tx layers. Does not disable
the error detection reporting for 1-bit and 2-bit ECC errors. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_VSECRAS_CAP_RASDP_CORR_COUNTER_CTRL_OFF_0
where <i> = 1, 4, 8. Description: This is a viewport control register. Setting the CORR_COUNTER_SELECTION_REGION and CORR_COUNTER_SELECTION fields in this register determine the counter data returned by the RASDP_CORR_COUNT_REPORT_OFF viewport data register.
- PCIE_X1_RC_PF0_VSECRAS_CAP_RASDP_CORR_COUNTER_CTRL_OFF_0
- Offset: 0x2ac

- PCIe x1/x4/x8 Root Complex
- PCIE_X4_RC_PF0_VSECRAS_CAP_RASDP_CORR_COUNTER_CTRL_OFF_0
- Offset: 0x2c8
- PCIE_X8_RC_PF0_VSECRAS_CAP_RASDP_CORR_COUNTER_CTRL_OFF_0
- Offset: 0x2dc
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000010 (0b0000,0000,0000,0000,0000,0000,0001,0000)
- Bit
R/W
- Reset
- Description
31:24
- RW
0x0 CORR_COUNTER_SELECTION:
- Counter selection. This field selects the counter ID (within the
region defined by CORR_COUNTER_SELECTION_REGION) whose contents can be read from the
- RASDP_CORR_COUNT_REPORT_OFF register. You can cycle this
field value from 0 to 255 to access all counters. 23:20
- RW
0x0 CORR_COUNTER_SELECTION_REGION:
- Select correctable counter region. All encodings other than the
defined encodings are reserved. 19:5
- RO
0x0 RSVDP_5: Reserved for future use.
- RW
0x1 CORR_EN_COUNTERS:
- Enable correctable errors counters. The counters are enabled by
default. 3:1
- RO
0x0 RSVDP_1: Reserved for future use.
- WO
0x0 CORR_CLEAR_COUNTERS: Clear all correctable error counters.
- PCIE_X<i>_RC_PF0_VSECRAS_CAP_RASDP_CORR_COUNT_REPORT_OFF_0
where <i> = 1, 4, 8.
- Description: This viewport register returns the counter data selected by the
- CORR_COUNTER_SELECTION_REGION and CORR_COUNTER_SELECTION fields in the
RASDP_CORR_COUNTER_CTRL_OFF register.
- PCIE_X1_RC_PF0_VSECRAS_CAP_RASDP_CORR_COUNT_REPORT_OFF_0
- Offset: 0x2b0

- PCIe x1/x4/x8 Root Complex
- PCIE_X4_RC_PF0_VSECRAS_CAP_RASDP_CORR_COUNT_REPORT_OFF_0
- Offset: 0x2cc
- PCIE_X8_RC_PF0_VSECRAS_CAP_RASDP_CORR_COUNTER_CTRL_OFF_0
- Offset: 0x2dc
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:24 0x0 CORR_COUNTER_SELECTED:
- Counter selection. Returns the value set in the
- CORR_COUNTER_SELECTION field of the
RASDP_CORR_COUNTER_CTRL_OFF register. 23:20 0x0 CORR_COUNTER_SELECTED_REGION:
- Selected correctable counter region. All encodings other than the
defined encodings are reserved. 19:8 0x0 RSVDP_8: Reserved for future use. 7:0 0x0 CORR_COUNTER: Current corrected error count for the selected counter.
- PCIE_X<i>_RC_PF0_VSECRAS_CAP_RASDP_UNCORR_COUNTER_CTRL_OFF_0
where <i> = 1, 4, 8.
- Description: This is a viewport control register. Setting the
- UNCORR_COUNTER_SELECTION_REGION and UNCORR_COUNTER_SELECTION fields in this
register determine the counter data returned by the RASDP_UNCORR_COUNT_REPORT_OFF viewport data register.
- PCIE_X1_RC_PF0_VSECRAS_CAP_RASDP_UNCORR_COUNTER_CTRL_OFF_0
- Offset: 0x2b4
- PCIE_X4_RC_PF0_VSECRAS_CAP_RASDP_UNCORR_COUNTER_CTRL_OFF_0
- Offset: 0x2d0
- PCIE_X8_RC_PF0_VSECRAS_CAP_RASDP_UNCORR_COUNTER_CTRL_OFF_0

- PCIe x1/x4/x8 Root Complex
- Offset: 0x2e4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000010 (0b0000,0000,0000,0000,0000,0000,0001,0000)
- Bit
R/W
- Reset
- Description
31:24
- RW
0x0 UNCORR_COUNTER_SELECTION:
- Counter selection. This field selects the counter ID (within the
region defined by UNCORR_COUNTER_SELECTION_REGION) whose contents can be read from the
- RASDP_UNCORR_COUNT_REPORT_OFF register. You can cycle this
field value from 0 to 255 to access all counters. 23:20
- RW
0x0 UNCORR_COUNTER_SELECTION_REGION:
- Select uncorrectable counter region. All encodings other than the
defined encodings are reserved. 19:5
- RO
0x0 RSVDP_5: Reserved for future use.
- RW
0x1 UNCORR_EN_COUNTERS:
- Enable uncorrectable errors counters. The counters are enabled by
default. 3:1
- RO
0x0 RSVDP_1: Reserved for future use.
- WO
0x0 UNCORR_CLEAR_COUNTERS:
- Clear uncorrectable errors counters. When asserted causes all
counters tracking the uncorrectable errors to be cleared.
- PCIE_X<i>_RC_PF0_VSECRAS_CAP_RASDP_UNCORR_COUNT_REPORT_OFF_0
where <i> = 1, 4, 8.
- Description: This viewport register returns the counter data selected by the
- UNCORR_COUNTER_SELECTION_REGION and UNCORR_COUNTER_SELECTION fields in the
RASDP_UNCORR_COUNTER_CTRL_OFF register.
- PCIE_X1_RC_PF0_VSECRAS_CAP_RASDP_UNCORR_COUNT_REPORT_OFF_0
- Offset: 0x2b8
- PCIE_X4_RC_PF0_VSECRAS_CAP_RASDP_UNCORR_COUNT_REPORT_OFF_0
- Offset: 0x2d4
- PCIE_X8_RC_PF0_VSECRAS_CAP_RASDP_UNCORR_COUNT_REPORT_OFF_0

- PCIe x1/x4/x8 Root Complex
- Offset: 0x2e8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:24 0x0 UNCORR_COUNTER_SELECTED:
- Counter selection. Returns the value set in the
- UNCORR_COUNTER_SELECTION field of the
RASDP_UNCORR_COUNTER_CTRL_OFF register. 23:20 0x0 UNCORR_COUNTER_SELECTED_REGION:
- Selected uncorrectable counter region. All encodings other than the
defined encodings are reserved. 19:8 0x0 RSVDP_8: Reserved for future use. 7:0 0x0 UNCORR_COUNTER:
- Current uncorrected error count for the selected counter
- PCIE_X<i>_RC_PF0_VSECRAS_CAP_RASDP_ERROR_INJ_CTRL_OFF_0
where <i> = 1, 4, 8. Description: Error injection control for the following features: - 1-bit or 2-bit injection - Continuous or fixed-number (n) injection modes - Global enable/disable - Selectable location where injection occurs.
- PCIE_X1_RC_PF0_VSECRAS_CAP_RASDP_ERROR_INJ_CTRL_OFF_0
- Offset: 0x2bc
- PCIE_X4_RC_PF0_VSECRAS_CAP_RASDP_ERROR_INJ_CTRL_OFF_0
- Offset: 0x2d8
- PCIE_X8_RC_PF0_VSECRAS_CAP_RASDP_ERROR_INJ_CTRL_OFF_0
- Offset: 0x2ec
- Read/Write: See table below
- Parity Protection: N
- Shadow: N

- PCIe x1/x4/x8 Root Complex
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:24
- RO
0x0 RSVDP_24: Reserved for future use. 23:16
- RW
0x0 ERROR_INJ_LOC:
- Error injection location. Selects where error injection takes
place. You can cycle this field value from 0 to 255 to access all locations. 15:8
- RW
0x0 ERROR_INJ_COUNT: Error injection count. If value is n, n amount of errors injected. 7:6
- RO
0x0 RSVDP_6: Reserved for future use. 5:4
- RW
0x0 ERROR_INJ_TYPE: Error injection type. 3:1
- RO
0x0 RSVDP_1: Reserved for future use.
- RW
0x0 ERROR_INJ_EN:
- Error injection global enable. When set, enables the error
insertion logic.
- PCIE_X<i>_RC_PF0_VSECRAS_CAP_RASDP_CORR_ERROR_LOCATION_OFF_0
where <i> = 1, 4, 8. Description: Corrected errors locations. For more details, see the RAS Data Protection (DP) section in the Core Operations chapter of the Databook.
- PCIE_X1_RC_PF0_VSECRAS_CAP_RASDP_CORR_ERROR_LOCATION_OFF_0
- Offset: 0x2c0
- PCIE_X4_RC_PF0_VSECRAS_CAP_RASDP_CORR_ERROR_LOCATION_OFF_0
- Offset: 0x2dc
- PCIE_X8_RC_PF0_VSECRAS_CAP_RASDP_CORR_ERROR_LOCATION_OFF_0
- Offset: 0x2f0
- Read/Write: RO
- Parity Protection: N
- Shadow: N

- PCIe x1/x4/x8 Root Complex
- SCR Protection: 0
- Reset: 0x00e000e0 (0b0000,0000,1110,0000,0000,0000,1110,0000)
- Bit
- Reset
- Description
31:24 0x0 LOC_LAST_CORR_ERROR:
- Location/ID of the last corrected error within the region defined by
- REG_LAST_CORR_ERROR. You can cycle this field value from 0 to 255 to
access all counters. 23:20 0xe REG_LAST_CORR_ERROR:
- Region of the last corrected error. All encodings other than the defined
encodings are reserved. 19:16 0x0 RSVDP_16: Reserved for future use. 15:8 0x0 LOC_FIRST_CORR_ERROR:
- Location/ID of the first corrected error within the region defined by
- REG_FIRST_CORR_ERROR. You can cycle this field value from 0 to 255 to
access all counters. 7:4 0xe REG_FIRST_CORR_ERROR:
- Region of the first corrected error. All encodings other than the defined
encodings are reserved. 3:0 0x0 RSVDP_0: Reserved for future use.
- PCIE_X<i>_RC_PF0_VSECRAS_CAP_RASDP_UNCORR_ERROR_LOCATION_OFF_0
where <i> = 1, 4, 8. Description: Uncorrected errors locations. For more details, see the RAS Data Protection (DP) section in the Core Operations chapter of the Databook.
- PCIE_X1_RC_PF0_VSECRAS_CAP_RASDP_UNCORR_ERROR_LOCATION_OFF_0
- Offset: 0x2c4
- PCIE_X4_RC_PF0_VSECRAS_CAP_RASDP_UNCORR_ERROR_LOCATION_OFF_0
- Offset: 0x2e0
- PCIE_X8_RC_PF0_VSECRAS_CAP_RASDP_UNCORR_ERROR_LOCATION_OFF_0
- Offset: 0x2f4
- Read/Write: RO
- Parity Protection: N
- Shadow: N

- PCIe x1/x4/x8 Root Complex
- SCR Protection: 0
- Reset: 0x00e000e0 (0b0000,0000,1110,0000,0000,0000,1110,0000)
- Bit
- Reset
- Description
31:24 0x0 LOC_LAST_UNCORR_ERROR:
- Location/ID of the last uncorrected error within the region defined by
- REG_LAST_UNCORR_ERROR. You can cycle this field value from 0 to 255
to access all counters. 23:20 0xe REG_LAST_UNCORR_ERROR:
- Region of the last uncorrected error. All encodings other than the
defined encodings are reserved. 19:16 0x0 RSVDP_16: Reserved for future use. 15:8 0x0 LOC_FIRST_UNCORR_ERROR:
- Location/ID of the first uncorrected error within the region defined by
- REG_FIRST_UNCORR_ERROR. You can cycle this field value from 0 to 255
to access all counters. 7:4 0xe REG_FIRST_UNCORR_ERROR:
- Region of the first uncorrected error. All encodings other than the
defined encodings are reserved. 3:0 0x0 RSVDP_0: Reserved for future use.
- PCIE_X<i>_RC_PF0_VSECRAS_CAP_RASDP_ERROR_MODE_EN_OFF_0
where <i> = 1, 4, 8.
- Description: RASDP error mode enable. The controller enters RASDP error mode (if
ERROR_MODE_EN =1) upon detection of the first uncorrectable error. During this mode: - Rx TLPs that are forwarded to your application are not guaranteed to be correct; you must discard them. For more details, see the RAS Data Protection (DP) section in the Core Operations chapter of the Databook.
- PCIE_X1_RC_PF0_VSECRAS_CAP_RASDP_ERROR_MODE_EN_OFF_0
- Offset: 0x2c8
- PCIE_X4_RC_PF0_VSECRAS_CAP_RASDP_ERROR_MODE_EN_OFF_0
- Offset: 0x2e4
- PCIE_X8_RC_PF0_VSECRAS_CAP_RASDP_ERROR_MODE_EN_OFF_0
- Offset: 0x2f8

- PCIe x1/x4/x8 Root Complex
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000001 (0b0000,0000,0000,0000,0000,0000,0000,0001)
- Bit
R/W
- Reset
- Description
31:2
- RO
0x0 RSVDP_2: Reserved for future use.
- RW
0x0 AUTO_LINK_DOWN_EN:
- Write '1' to enable the controller to bring the link down when
the controller enters RASDP error mode. Note: This register field is sticky.
- RW
0x1 ERROR_MODE_EN:
- Write '1' to enable the controller enter RASDP error mode when
it detects an uncorrectable error. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_VSECRAS_CAP_RASDP_ERROR_MODE_CLEAR_OFF_0
where <i> = 1, 4, 8. Description: Exit RASDP error mode. For more details, see the RAS Data Protection (DP) section in the Core Operations chapter of the Databook.
- PCIE_X1_RC_PF0_VSECRAS_CAP_RASDP_ERROR_MODE_CLEAR_OFF_0
- Offset: 0x2cc
- PCIE_X4_RC_PF0_VSECRAS_CAP_RASDP_ERROR_MODE_CLEAR_OFF_0
- Offset: 0x2e8
- PCIE_X8_RC_PF0_VSECRAS_CAP_RASDP_ERROR_MODE_CLEAR_OFF_0
- Offset: 0x2fc
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:1
- RO
0x0 RSVDP_1: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- WO
0x0 ERROR_MODE_CLEAR:
- Write '1' to take the controller out of RASDP error mode. The
controller will then report uncorrectable errors (through AER internal error reporting) and also stop nullifying/discarding TLPs.
- PCIE_X<i>_RC_PF0_VSECRAS_CAP_RASDP_RAM_ADDR_CORR_ERROR_OFF_0
where <i> = 1, 4, 8. Description: For more details, see the RAS Data Protection (DP) section in the Core Operations chapter of the Databook.
- PCIE_X1_RC_PF0_VSECRAS_CAP_RASDP_RAM_ADDR_CORR_ERROR_OFF_0
- Offset: 0x2d0
- PCIE_X4_RC_PF0_VSECRAS_CAP_RASDP_RAM_ADDR_CORR_ERROR_OFF_0
- Offset: 0x2ec
- PCIE_X8_RC_PF0_VSECRAS_CAP_RASDP_RAM_ADDR_CORR_ERROR_OFF_0
- Offset: 0x300
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:28 0x0 RAM_INDEX_CORR_ERROR: RAM index where a corrected error (1-bit ECC) is detected. 0x0 RSVDP_27: Reserved for future use. 26:0 0x0 RAM_ADDR_CORR_ERROR: RAM Address where a corrected error (1-bit ECC) is detected.
- PCIE_X<i>_RC_PF0_VSECRAS_CAP_RASDP_RAM_ADDR_UNCORR_ERROR_OFF_0
where <i> = 1, 4, 8.

- PCIe x1/x4/x8 Root Complex
Description: For more details, see the RAS Data Protection (DP) section in the Core Operations chapter of the Databook.
- PCIE_X1_RC_PF0_VSECRAS_CAP_RASDP_RAM_ADDR_UNCORR_ERROR_OFF_0
- Offset: 0x2d4
- PCIE_X4_RC_PF0_VSECRAS_CAP_RASDP_RAM_ADDR_UNCORR_ERROR_OFF_0
- Offset: 0x2f0
- PCIE_X8_RC_PF0_VSECRAS_CAP_RASDP_RAM_ADDR_UNCORR_ERROR_OFF_0
- Offset: 0x304
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:28 0x0 RAM_INDEX_UNCORR_ERROR: RAM index where an uncorrected error (2-bit ECC) is detected. 0x0 RSVDP_27: Reserved for future use. 26:0 0x0 RAM_ADDR_UNCORR_ERROR: RAM Address where an uncorrected error (2-bit ECC) is detected.
- PCIE_X<i>_RC_PF0_DLINK_CAP_DATA_LINK_FEATURE_EXT_HDR_OFF_0
where <i> = 1, 4, 8. Description: This register provides capability ID, capability version, and next offset value.
- PCIE_X1_RC_PF0_DLINK_CAP_DATA_LINK_FEATURE_EXT_HDR_OFF_0
- Offset: 0x2d8
- PCIE_X4_RC_PF0_DLINK_CAP_DATA_LINK_FEATURE_EXT_HDR_OFF_0
- Offset: 0x2f4
- PCIE_X8_RC_PF0_DLINK_CAP_DATA_LINK_FEATURE_EXT_HDR_OFF_0

- PCIe x1/x4/x8 Root Complex
- Offset: 0x308
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x2e410025 (0b0010,1110,0100,0001,0000,0000,0010,0101)
- Bit
- Reset
- Description
31:20 0x2e4 DLINK_NEXT_OFFSET:
- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h, if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space, this
offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greater than 0FFh. The bottom 2 bits of this offset are Reserved and must be implemented as 00b although software must mask them to allow for future uses of these bits. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 19:16 0x1 DLINK_CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. This field depends on the version of the specification. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0x25 DLINK_EXT_CAP_ID:
- Capability ID. This field is a PCI-SIG defined ID number that indicates the nature
and format of the Extended Capability. Extended Capability ID for Data Link Feature is 0025h. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_DLINK_CAP_DATA_LINK_FEATURE_CAP_OFF_0
where <i> = 1, 4, 8. Description: This register provides description about extended feature.
- PCIE_X1_RC_PF0_DLINK_CAP_DATA_LINK_FEATURE_CAP_OFF_0
- Offset: 0x2dc
- PCIE_X4_RC_PF0_DLINK_CAP_DATA_LINK_FEATURE_CAP_OFF_0
- Offset: 0x2f8
- PCIE_X8_RC_PF0_DLINK_CAP_DATA_LINK_FEATURE_CAP_OFF_0
- Offset: 0x30c

- PCIe x1/x4/x8 Root Complex
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x80000001 (0b1000,0000,0000,0000,0000,0000,0000,0001)
- Bit
R/W
- Reset
- Description
- RW
0x1 DL_FEATURE_EXCHANGE_EN:
- Data Link Feature Exchange Enable. If Set, this bit indicates that
this Port will enter the DL_Feature negotiation state. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) 30:23
- RO
0x0 RSVDP_23: Reserved for future use. 22:1
- RW
0x0 FUTURE_FEATURE_SUPPORTED:
- Local Future Data Link Feature Supported. Note: The access
attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- RW
0x1 SCALED_FLOW_CNTL_SUPPORTED:
- Local Scaled Flow Control Supported. - Bit 0: Local Scaled Flow
- Control Supported - Bits [22:1]: RsvdP Bits associated with features
that this Port is capable of supporting are HwInit, defaulting to 1b.
- Note: The access attributes of this field are as follows: - Wire: No
access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
- PCIE_X<i>_RC_PF0_DLINK_CAP_DATA_LINK_FEATURE_STATUS_OFF_0
where <i> = 1, 4, 8. Description: This register provides status of the capability of data link feature.
- PCIE_X1_RC_PF0_DLINK_CAP_DATA_LINK_FEATURE_STATUS_OFF_0
- Offset: 0x2e0
- PCIE_X4_RC_PF0_DLINK_CAP_DATA_LINK_FEATURE_STATUS_OFF_0
- Offset: 0x2fc
- PCIE_X8_RC_PF0_DLINK_CAP_DATA_LINK_FEATURE_STATUS_OFF_0
- Offset: 0x310
- Read/Write: RO
- Parity Protection: N
- Shadow: N

- PCIe x1/x4/x8 Root Complex
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 DATA_LINK_FEATURE_STATUS_VALID:
- Remote Data Link Feature Supported Valid. This field indicates that the Port
has received a Data Link Feature DLLP in state DL_Feature and that the
- Remote Data Link Feature Supported and Remote Data Link Feature Ack
fields are meaningful. This field is Cleared on entry to state DL_Inactive. 30:23 0x0 RSVDP_23: Reserved for future use. 22:0 0x0 REMOTE_DATA_LINK_FEATURE_SUPPORTED:
- Remote Data Link Feature Supported. - Bit 0: Remote Scaled Flow Control
- Supported - Bits [22:1]: Undefined
- PCIE_X<i>_RC_PF0_PTM_CAP_PTM_EXT_CAP_HDR_OFF_0
where <i> = 1, 4, 8. Description: This Register provides Capability ID, Cabability Version, and Next Offset of Precision Time Measurement Capability structure.
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_PTM_CAP_PTM_EXT_CAP_HDR_OFF_0
- Offset: 0x2e4
- Reset: 0x2f01001f (0b0010,1111,0000,0001,0000,0000,0001,1111)
- Bit
- Reset
- Description
31:20 0x2f0 PTM_NEXT_OFFSET: Precision Time Measurement PCI Express Extended Capability Next Offset.
- This field contains the offset to the next PCI Express Extended Capability
structure or 000h if no other items exist in the linked list of Capabilities.
- Note: The access attributes of this field are as follows: - Wire: No access. -
- Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This
register field is sticky. 19:16 0x1 PTM_CAP_VERSION:
- Precision Time Measurement PCI Express Extended Capability Version. This
field is a PCI-SIG defined version number that indicates the version of the
- Capability structure present. This bit depends on the version of the
specification. Note: The access attributes of this field are as follows: - Wire:
- No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
15:0 0x1f PTM_CAP_ID:
- Precision Time Measurement PCI Express Extended Capability ID. This field is
a PCI-SIG defined ID number that indicates the nature and format of the
- Extended Capability. PCI Express Extended Capability ID for the Precision
- Time Measurement Capability is 001Fh. Note: The access attributes of this
field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X4_RC_PF0_PTM_CAP_PTM_EXT_CAP_HDR_OFF_0
- Offset: 0x300
- Reset: 0x30c1001f (0b0011,0000,1100,0001,0000,0000,0001,1111)
- Bit
- Reset
- Description
31:20 0x30c PTM_NEXT_OFFSET: Precision Time Measurement PCI Express Extended Capability Next Offset.
- This field contains the offset to the next PCI Express Extended Capability
structure or 000h if no other items exist in the linked list of Capabilities.
- Note: The access attributes of this field are as follows: - Wire: No access. -
- Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This
register field is sticky. 19:16 0x1 PTM_CAP_VERSION:
- Precision Time Measurement PCI Express Extended Capability Version. This
field is a PCI-SIG defined version number that indicates the version of the
- Capability structure present. This bit depends on the version of the
specification. Note: The access attributes of this field are as follows: - Wire:
- No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 15:0 0x1f PTM_CAP_ID:
- Precision Time Measurement PCI Express Extended Capability ID. This field is
a PCI-SIG defined ID number that indicates the nature and format of the
- Extended Capability. PCI Express Extended Capability ID for the Precision
- Time Measurement Capability is 001Fh. Note: The access attributes of this
field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X8_RC_PF0_PTM_CAP_PTM_EXT_CAP_HDR_OFF_0
- Offset: 0x314
- Reset: 0x3201001f (0b0011,0010,0000,0001,0000,0000,0001,1111)
- Bit
- Reset
- Description
31:20 0x320 PTM_NEXT_OFFSET: Precision Time Measurement PCI Express Extended Capability Next Offset.
- This field contains the offset to the next PCI Express Extended Capability
structure or 000h if no other items exist in the linked list of Capabilities.
- Note: The access attributes of this field are as follows: - Wire: No access. -
- Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This
register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
19:16 0x1 PTM_CAP_VERSION:
- Precision Time Measurement PCI Express Extended Capability Version. This
field is a PCI-SIG defined version number that indicates the version of the
- Capability structure present. This bit depends on the version of the
specification. Note: The access attributes of this field are as follows: - Wire:
- No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 15:0 0x1f PTM_CAP_ID:
- Precision Time Measurement PCI Express Extended Capability ID. This field is
a PCI-SIG defined ID number that indicates the nature and format of the
- Extended Capability. PCI Express Extended Capability ID for the Precision
- Time Measurement Capability is 001Fh. Note: The access attributes of this
field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PTM_CAP_PTM_CAP_OFF_0
where <i> = 1, 4, 8. Description: This register describes a Function's support for Precision Time Measurement. Not all fields within this register apply to all Functions capable of implementing PTM.
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_PTM_CAP_PTM_CAP_OFF_0
- Offset: 0x2e8
- Reset: 0x00001006 (0b0000,0000,0000,0000,0001,0000,0000,0110)
- Bit
R/W
- Reset
- Description
31:16
- RO
0x0 RSVDP_16: Reserved for future use. 15:8
- RW
0x10 PTM_CLK_GRAN:
- PTM Local Clock Granularity. For other than this value (between
b00000001-b111111110) indicates the period of this Time Source's local clock in ns. If the PTM Root Select bit is Set, this local clock is used to provide PTM Master Time. Otherwise, the Time Source uses this local clock to locally track PTM Master Time received from further
- Upstream within a PTM Hierarchy. This field is reserved for Functions
that do not implement the PTM Time Source role. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) 7:3
- RO
0x0 RSVDP_3: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x1 PTM_ROOT_CAPABLE:
- PTM Root Capable. Note: The access attributes of this field are as
follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky.
- RW
0x1 PTM_RES_CAPABLE:
- PTM Responder Capable. Note: The access attributes of this field are
as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky.
- RW
0x0 PTM_REQ_CAPABLE:
- PTM Requester Capable. Note: The access attributes of this field are
as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X4_RC_PF0_PTM_CAP_PTM_CAP_OFF_0
- Offset: 0x304
- PCIE_X8_RC_PF0_PTM_CAP_PTM_CAP_OFF_0
- Offset: 0x318
- Reset: 0x00001007 (0b0000,0000,0000,0000,0001,0000,0000,0111)
- Bit
R/W
- Reset
- Description
31:16
- RO
0x0 RSVDP_16: Reserved for future use. 15:8
- RW
0x10 PTM_CLK_GRAN:
- PTM Local Clock Granularity. For other than this value (between
b00000001-b111111110) indicates the period of this Time Source's local clock in ns. If the PTM Root Select bit is Set, this local clock is used to provide PTM Master Time. Otherwise, the Time Source uses this local clock to locally track PTM Master Time received from further
- Upstream within a PTM Hierarchy. This field is reserved for Functions
that do not implement the PTM Time Source role. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) 7:3
- RO
0x0 RSVDP_3: Reserved for future use.
- RW
0x1 PTM_ROOT_CAPABLE:
- PTM Root Capable. Note: The access attributes of this field are as
follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky.
- RW
0x1 PTM_RES_CAPABLE:
- PTM Responder Capable. Note: The access attributes of this field are
as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky.
- RW
0x1 PTM_REQ_CAPABLE:
- PTM Requester Capable. Note: The access attributes of this field are
as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_PTM_CAP_PTM_CONTROL_OFF_0
where <i> = 1, 4, 8. Description: This register controls a Function's participation in the Precision Time Measurement mechanism. Not all fields within this register apply to all Functions capable of implementing PTM.
- PCIE_X1_RC_PF0_PTM_CAP_PTM_CONTROL_OFF_0
- Offset: 0x2ec
- PCIE_X4_RC_PF0_PTM_CAP_PTM_CONTROL_OFF_0
- Offset: 0x308
- PCIE_X8_RC_PF0_PTM_CAP_PTM_CONTROL_OFF_0
- Offset: 0x31c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:16
- RO
0x0 RSVDP_16: Reserved for future use. 15:8
- RO
0x0 EFF_GRAN:
- PTM Effective Granularity. For Functions implementing the PTM
- Requester Role, this field provides information relating to the expected
accuracy of the PTM clock, but does not otherwise affect the PTM mechanism. For Endpoints, system software must program this field to the value representing the maximum Local Clock Granularity reported by the PTM Root and all intervening PTM Time Sources. For RCiEPs, system software must set this field to the value reported in the Local
- Clock Granularity field by the associated PTM Time Source. For other
than this value (between b00000001-b111111110) indicates the effective PTM granularity in ns. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: HWINIT 7:2
- RO
0x0 RSVDP_2: Reserved for future use.
- RO
0x0 ROOT_SELECT:
- PTM Root Select. If the value of the PTM Root Capable bit is 0b, this bit
is permitted to be hardwired to 0b by the controller. Within each PTM
- Hierarchy, it is recommended that system software select only the
furthest Upstream Time Source to be the PTM Root. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: HWINIT

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x0 PTM_ENABLE: PTM Enable.
- PCIE_X<i>_RC_PF0_PTM_RES_CAP_PTM_RES_CAP_HDR_OFF_0
where <i> = 1, 4, 8. Description: For more details, see the PTM section in the Databook.
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_PTM_RES_CAP_PTM_RES_CAP_HDR_OFF_0
- Offset: 0x2f0
- Reset: 0x3581000b (0b0011,0101,1000,0001,0000,0000,0000,1011)
- Bit
- Reset
- Description
31:20 0x358 PTM_RES_EXT_CAP_NEXT_OFFS:
- Precision Time Measurement Responder VSEC Next Pointer. For more
details, see the PTM section in the Databook. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 19:16 0x1 PTM_RES_EXT_CAP_VER:
- Precision Time Measurement Responder VSEC Version. For more details, see
the PTM section in the Databook. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0xb PTM_RES_EXT_CAP_ID:
- Precision Time Measurement Responder VSEC ID. For more details, see the
- PTM section in the Databook. Note: The access attributes of this field are
as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X4_RC_PF0_PTM_RES_CAP_PTM_RES_CAP_HDR_OFF_0
- Offset: 0x30c
- Reset: 0x3741000b (0b0011,0111,0100,0001,0000,0000,0000,1011)

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
31:20 0x374 PTM_RES_EXT_CAP_NEXT_OFFS:
- Precision Time Measurement Responder VSEC Next Pointer. For more
details, see the PTM section in the Databook. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 19:16 0x1 PTM_RES_EXT_CAP_VER:
- Precision Time Measurement Responder VSEC Version. For more details, see
the PTM section in the Databook. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0xb PTM_RES_EXT_CAP_ID:
- Precision Time Measurement Responder VSEC ID. For more details, see the
- PTM section in the Databook. Note: The access attributes of this field are
as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X8_RC_PF0_PTM_RES_CAP_PTM_RES_CAP_HDR_OFF_0
- Offset: 0x320
- Reset: 0x3881000b (0b0011,1000,1000,0001,0000,0000,0000,1011)
- Bit
- Reset
- Description
31:20 0x388 PTM_RES_EXT_CAP_NEXT_OFFS:
- Precision Time Measurement Responder VSEC Next Pointer. For more
details, see the PTM section in the Databook. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 19:16 0x1 PTM_RES_EXT_CAP_VER:
- Precision Time Measurement Responder VSEC Version. For more details, see
the PTM section in the Databook. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0xb PTM_RES_EXT_CAP_ID:
- Precision Time Measurement Responder VSEC ID. For more details, see the
- PTM section in the Databook. Note: The access attributes of this field are
as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PTM_RES_CAP_PTM_RES_HDR_OFF_0
where <i> = 1, 4, 8. Description: For more details, see the PTM section in the Databook.
- PCIE_X1_RC_PF0_PTM_RES_CAP_PTM_RES_HDR_OFF_0
- Offset: 0x2f4

- PCIe x1/x4/x8 Root Complex
- PCIE_X4_RC_PF0_PTM_RES_CAP_PTM_RES_HDR_OFF_0
- Offset: 0x310
- PCIE_X8_RC_PF0_PTM_RES_CAP_PTM_RES_HDR_OFF_0
- Offset: 0x324
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x05410004 (0b0000,0101,0100,0001,0000,0000,0000,0100)
- Bit
- Reset
- Description
31:20 0x54 PTM_RES_VSEC_LENGTH:
- PTM Responder VSEC Length. For more details, see the PTM section in the
- Databook. Note: The access attributes of this field are as follows: - Wire: No
access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 19:16 0x1 PTM_RES_VSEC_REV:
- PTM Responder VSEC Revision. For more details, see the PTM section in
the Databook. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else
R(sticky) Note: This register field is sticky. 15:0 0x4 PTM_RES_VSEC_ID:
- PTM Responder VSEC ID. For more details, see the PTM section in the
- Databook. Note: The access attributes of this field are as follows: - Wire: No
access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PTM_RES_CAP_PTM_RES_CONTROL_OFF_0
where <i> = 1, 4, 8. Description: For more details, see the PTM section in the Databook.
- PCIE_X1_RC_PF0_PTM_RES_CAP_PTM_RES_CONTROL_OFF_0
- Offset: 0x2f8
- PCIE_X4_RC_PF0_PTM_RES_CAP_PTM_RES_CONTROL_OFF_0
- Offset: 0x314
- PCIE_X8_RC_PF0_PTM_RES_CAP_PTM_RES_CONTROL_OFF_0
- Offset: 0x328

- PCIe x1/x4/x8 Root Complex
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:2
- RO
0x0 RSVDP_2: Reserved for future use.
- RW
0x0 PTM_RES_PDEL_BYTE_REV:
- PTM Requester Propagation Delay Byte Reversal. For more details,
see the PTM section in the Databook. Note: This register field is sticky.
- RW
0x0 PTM_RES_CCONTEXT_VALID:
- PTM Responder Control Context Valid. PTM Local Timing is valid. This
bit is set over the DBI. A speed change or aux_clk_active will set this bit low. For more details, see the PTM section in the Databook. Note:
- The access attributes of this field are as follows: - Wire: No access. -
Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PTM_RES_CAP_PTM_RES_STATUS_OFF_0
where <i> = 1, 4, 8. Description: For more details, see the PTM section in the Databook.
- PCIE_X1_RC_PF0_PTM_RES_CAP_PTM_RES_STATUS_OFF_0
- Offset: 0x2fc
- PCIE_X4_RC_PF0_PTM_RES_CAP_PTM_RES_STATUS_OFF_0
- Offset: 0x318
- PCIE_X8_RC_PF0_PTM_RES_CAP_PTM_RES_STATUS_OFF_0
- Offset: 0x32c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
31:2 0x0 RSVDP_2: Reserved for future use. 0x0 PTM_RES_REQUEST_RECEIVED:
- PTM 1st Request Received. PTM Responder has received the first PTM
- Request Message. Upon receipt of a second PTM Request Message a
- ResponseD message with timing information will be sent from the Responder,
if the context is valid. If the context is invalid a Response message will be sent instead. For more details, see the PTM section in the Databook. Note: This register field is sticky. 0x0 PTM_RES_CONTEXT_VALID:
- PTM Responder Status Context Valid. PTM Local Timing Context is Valid. Value
set from upstream port Requester in a Switch. Shadows the same in the control register in all other products. For more details, see the PTM section in the Databook. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PTM_RES_CAP_PTM_RES_LOCAL_LSB_OFF_0
where <i> = 1, 4, 8. Description: For more details, see the PTM section in the Databook.
- PCIE_X1_RC_PF0_PTM_RES_CAP_PTM_RES_LOCAL_LSB_OFF_0
- Offset: 0x300
- PCIE_X4_RC_PF0_PTM_RES_CAP_PTM_RES_LOCAL_LSB_OFF_0
- Offset: 0x31c
- PCIE_X8_RC_PF0_PTM_RES_CAP_PTM_RES_LOCAL_LSB_OFF_0
- Offset: 0x330
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 PTM_RES_LOCAL_LSB:
- PTM Responder Local Clock LSB. Lower 32 bits of local timer value. For more
details, see the PTM section in the Databook. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_PTM_RES_CAP_PTM_RES_LOCAL_MSB_OFF_0
where <i> = 1, 4, 8. Description: For more details, see the PTM section in the Databook.
- PCIE_X1_RC_PF0_PTM_RES_CAP_PTM_RES_LOCAL_MSB_OFF_0
- Offset: 0x304
- PCIE_X4_RC_PF0_PTM_RES_CAP_PTM_RES_LOCAL_MSB_OFF_0
- Offset: 0x320
- PCIE_X8_RC_PF0_PTM_RES_CAP_PTM_RES_LOCAL_MSB_OFF_0
- Offset: 0x334
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 PTM_RES_LOCAL_MSB:
- PTM Responder Local Clock MSB. Upper 32 bits of local timer value. For more
details, see the PTM section in the Databook. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PTM_RES_CAP_PTM_RES_T2_LSB_OFF_0
where <i> = 1, 4, 8. Description: For more details, see the PTM section in the Databook.
- PCIE_X1_RC_PF0_PTM_RES_CAP_PTM_RES_T2_LSB_OFF_0
- Offset: 0x308
- PCIE_X4_RC_PF0_PTM_RES_CAP_PTM_RES_T2_LSB_OFF_0
- Offset: 0x324

- PCIe x1/x4/x8 Root Complex
- PCIE_X8_RC_PF0_PTM_RES_CAP_PTM_RES_T2_LSB_OFF_0
- Offset: 0x338
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 PTM_RES_T2_LSB:
- PTM Responder T2 Timestamp LSB. Lower 32 bits of the T2 Timestamp
value. For more details, see the PTM section in the Databook. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PTM_RES_CAP_PTM_RES_T2_MSB_OFF_0
where <i> = 1, 4, 8. Description: For more details, see the PTM section in the Databook.
- PCIE_X1_RC_PF0_PTM_RES_CAP_PTM_RES_T2_MSB_OFF_0
- Offset: 0x30c
- PCIE_X4_RC_PF0_PTM_RES_CAP_PTM_RES_T2_MSB_OFF_0
- Offset: 0x328
- PCIE_X8_RC_PF0_PTM_RES_CAP_PTM_RES_T2_MSB_OFF_0
- Offset: 0x33c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 PTM_RES_T2_MSB:
- PTM Responder T2 Timestamp MSB. Upper 32 bits of the T2 Timestamp
value. For more details, see the PTM section in the Databook. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_PTM_RES_CAP_PTM_RES_T2P_LSB_OFF_0
where <i> = 1, 4, 8. Description: For more details, see the PTM section in the Databook.
- PCIE_X1_RC_PF0_PTM_RES_CAP_PTM_RES_T2P_LSB_OFF_0
- Offset: 0x310
- PCIE_X4_RC_PF0_PTM_RES_CAP_PTM_RES_T2P_LSB_OFF_0
- Offset: 0x32c
- PCIE_X8_RC_PF0_PTM_RES_CAP_PTM_RES_T2P_LSB_OFF_0
- Offset: 0x340
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 PTM_RES_T2P_LSB:
- PTM Responder T2 Previous Timestamp LSB. Lower 32 bits of the
previously stored T2 Timestamp value. For more details, see the PTM section in the Databook. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PTM_RES_CAP_PTM_RES_T2P_MSB_OFF_0
where <i> = 1, 4, 8. Description: For more details, see the PTM section in the Databook.
- PCIE_X1_RC_PF0_PTM_RES_CAP_PTM_RES_T2P_MSB_OFF_0
- Offset: 0x314
- PCIE_X4_RC_PF0_PTM_RES_CAP_PTM_RES_T2P_MSB_OFF_0
- Offset: 0x330

- PCIe x1/x4/x8 Root Complex
- PCIE_X8_RC_PF0_PTM_RES_CAP_PTM_RES_T2P_MSB_OFF_0
- Offset: 0x344
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 PTM_RES_T2P_MSB:
- PTM Responder T2 Previous Timestamp MSB. Upper 32 bits of the
previously stored T2 Timestamp value. For more details, see the PTM section in the Databook. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PTM_RES_CAP_PTM_RES_T3_LSB_OFF_0
where <i> = 1, 4, 8. Description: For more details, see the PTM section in the Databook.
- PCIE_X1_RC_PF0_PTM_RES_CAP_PTM_RES_T3_LSB_OFF_0
- Offset: 0x318
- PCIE_X4_RC_PF0_PTM_RES_CAP_PTM_RES_T3_LSB_OFF_0
- Offset: 0x334
- PCIE_X8_RC_PF0_PTM_RES_CAP_PTM_RES_T3_LSB_OFF_0
- Offset: 0x348
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 PTM_RES_T3_LSB:
- PTM Responder T3 Timestamp LSB. Lower 32 bits of the T3 Timestamp
value. For more details, see the PTM section in the Databook. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_PTM_RES_CAP_PTM_RES_T3_MSB_OFF_0
where <i> = 1, 4, 8. Description: For more details, see the PTM section in the Databook.
- PCIE_X1_RC_PF0_PTM_RES_CAP_PTM_RES_T3_MSB_OFF_0
- Offset: 0x31c
- PCIE_X4_RC_PF0_PTM_RES_CAP_PTM_RES_T3_MSB_OFF_0
- Offset: 0x338
- PCIE_X8_RC_PF0_PTM_RES_CAP_PTM_RES_T3_MSB_OFF_0
- Offset: 0x34c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 PTM_RES_T3_MSB:
- PTM Responder T3 Timestamp MSB. Upper 32 bits of the T2 Timestamp
value. For more details, see the PTM section in the Databook. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PTM_RES_CAP_PTM_RES_T3P_LSB_OFF_0
where <i> = 1, 4, 8. Description: For more details, see the PTM section in the Databook.
- PCIE_X1_RC_PF0_PTM_RES_CAP_PTM_RES_T3P_LSB_OFF_0
- Offset: 0x320
- PCIE_X4_RC_PF0_PTM_RES_CAP_PTM_RES_T3P_LSB_OFF_0
- Offset: 0x33c

- PCIe x1/x4/x8 Root Complex
- PCIE_X8_RC_PF0_PTM_RES_CAP_PTM_RES_T3P_LSB_OFF_0
- Offset: 0x350
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 PTM_RES_T3P_LSB:
- PTM Responder T3 Previous Timestamp LSB. Lower 32 bits of the
previously stored T3 Timestamp value. For more details, see the PTM section in the Databook. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PTM_RES_CAP_PTM_RES_T3P_MSB_OFF_0
where <i> = 1, 4, 8. Description: For more details, see the PTM section in the Databook.
- PCIE_X1_RC_PF0_PTM_RES_CAP_PTM_RES_T3P_MSB_OFF_0
- Offset: 0x324
- PCIE_X4_RC_PF0_PTM_RES_CAP_PTM_RES_T3P_MSB_OFF_0
- Offset: 0x340
- PCIE_X8_RC_PF0_PTM_RES_CAP_PTM_RES_T3P_MSB_OFF_0
- Offset: 0x354
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 PTM_RES_T3P_MSB:
- PTM Responder T3 Previous Timestamp MSB. Upper 32 bits of the
previously stored T3 Timestamp value. For more details, see the PTM section in the Databook. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_PTM_RES_CAP_PTM_RES_TX_LATENCY_OFF_0
where <i> = 1, 4, 8. Description: For more details, see the PTM section in the Databook.
- PCIE_X1_RC_PF0_PTM_RES_CAP_PTM_RES_TX_LATENCY_OFF_0
- Offset: 0x328
- PCIE_X4_RC_PF0_PTM_RES_CAP_PTM_RES_TX_LATENCY_OFF_0
- Offset: 0x344
- PCIE_X8_RC_PF0_PTM_RES_CAP_PTM_RES_TX_LATENCY_OFF_0
- Offset: 0x358
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000018 (0b0000,0000,0000,0000,0000,0000,0001,1000)
- Bit
R/W
- Reset
- Description
31:12
- RO
0x0 RSVDP_12: Reserved for future use. 11:0
- RW
0x18 PTM_RES_TX_LATENCY:
- PTM Responder TX Latency. Responder Transmit path latency
viewport register. A register is provided for each supported link speed, and the value used for timestamp adjustment is automatically selected based on the current speed. The PTM
- Responder Latency Register Select register specifies the register to
be written or read. For more details, see the PTM section in the Databook. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PTM_RES_CAP_PTM_RES_RX_LATENCY_OFF_0
where <i> = 1, 4, 8. Description: For more details, see the PTM section in the Databook.
- PCIE_X1_RC_PF0_PTM_RES_CAP_PTM_RES_RX_LATENCY_OFF_0
- Offset: 0x32c

- PCIe x1/x4/x8 Root Complex
- PCIE_X4_RC_PF0_PTM_RES_CAP_PTM_RES_RX_LATENCY_OFF_0
- Offset: 0x348
- PCIE_X8_RC_PF0_PTM_RES_CAP_PTM_RES_RX_LATENCY_OFF_0
- Offset: 0x35c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0000001f (0b0000,0000,0000,0000,0000,0000,0001,1111)
- Bit
R/W
- Reset
- Description
31:12
- RO
0x0 RSVDP_12: Reserved for future use. 11:0
- RW
0x1f PTM_RES_RX_LATENCY:
- PTM Responder RX Latency. Responder Receive path latency
viewport register. A register is provided for each supported link speed, and the value used for timestamp adjustment is automatically selected based on the current speed. The PTM
- Responder Latency Register Select register specifies the register to
be written or read. For more details, see the PTM section in the Databook. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PTM_RES_CAP_PTM_RES_NOM_CLOCK_T_OFF_0
where <i> = 1, 4, 8. Description: For more details, see the PTM section in the Databook.
- PCIE_X1_RC_PF0_PTM_RES_CAP_PTM_RES_NOM_CLOCK_T_OFF_0
- Offset: 0x330
- PCIE_X4_RC_PF0_PTM_RES_CAP_PTM_RES_NOM_CLOCK_T_OFF_0
- Offset: 0x34c
- PCIE_X8_RC_PF0_PTM_RES_CAP_PTM_RES_NOM_CLOCK_T_OFF_0
- Offset: 0x360
- Read/Write: RO
- Parity Protection: N
- Shadow: N

- PCIe x1/x4/x8 Root Complex
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:24 0x0 RSVDP_24: Reserved for future use. 23:16 0x0 PTM_RES_NOM_CLOCK_T_INT:
- PTM Responder Nominal Clock Period Integral - Integral part of the
nominal PTM local clock period, in nanoseconds. For more details, see the PTM section in the Databook. Note: This register field is sticky. 15:0 0x0 PTM_RES_NOM_CLOCK_T_FRAC:
- PTM Responder Nominal Clock Period Fractional. Fractional part of the
nominal PTM local clock period. LSB is 1/(2^16) nanoseconds. For more details, see the PTM section in the Databook. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PTM_RES_CAP_PTM_RES_SCALED_CLOCK_T_OFF_0
where <i> = 1, 4, 8. Description: For more details, see the PTM section in the Databook.
- PCIE_X1_RC_PF0_PTM_RES_CAP_PTM_RES_SCALED_CLOCK_T_OFF_0
- Offset: 0x334
- PCIE_X4_RC_PF0_PTM_RES_CAP_PTM_RES_SCALED_CLOCK_T_OFF_0
- Offset: 0x350
- PCIE_X8_RC_PF0_PTM_RES_CAP_PTM_RES_SCALED_CLOCK_T_OFF_0
- Offset: 0x364
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RW
0x0 PTM_RES_SCALED_CLOCK_T_EN:
- PTM Responder Scaled Clock Period Enable. Use the programmed
scaled PTM clock period rather than the nominal values. This bit is cleared when the core_clk rate starts to change and can only be set when the clock period change is complete. For more details, see the PTM section in the Databook. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
30:24
- RO
0x0 RSVDP_24: Reserved for future use. 23:16
- RW
0x0 PTM_RES_SCALED_CLOCK_T_INT:
- PTM Responder Scaled Clock Period Integral. Integral part of the
nominal PTM local clock period, in nanoseconds. For more details, see the PTM section in the Databook. Note: This register field is sticky. 15:0
- RW
0x0 PTM_RES_SCALED_CLOCK_T_FRAC:
- PTM Responder Scaled Clock Period Fractional. Fractional part of
the nominal PTM local clock period. LSB is 1/(2^16) nanoseconds.
- For more details, see the PTM section in the Databook. Note: This
register field is sticky.
- PCIE_X<i>_RC_PF0_PTM_RES_CAP_PTM_RES_LATENCY_REG_SEL_OFF_0
where <i> = 1, 4, 8. Description: For more details, see the PTM section in the Databook.
- PCIE_X1_RC_PF0_PTM_RES_CAP_PTM_RES_LATENCY_REG_SEL_OFF_0
- Offset: 0x338
- PCIE_X4_RC_PF0_PTM_RES_CAP_PTM_RES_LATENCY_REG_SEL_OFF_0
- Offset: 0x354
- PCIE_X8_RC_PF0_PTM_RES_CAP_PTM_RES_LATENCY_REG_SEL_OFF_0
- Offset: 0x368
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:8
- RO
0x0 RSVDP_8: Reserved for future use.
- RW
0x0 PTM_RES_ESM_SEL:
- Selection Mode for PTM Responder Tx and Rx Latency Viewport
register to be written or read. For more details, see the PTM section in the Databook. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
6:4
- RO
0x0 RSVDP_4: Reserved for future use. 3:0
- RW
0x0 PTM_RES_LATENCY_REG_SEL:
- Selects the PTM Responder Tx and Rx Latency Viewport register
to be written or read, together with the PTM_RES_ESM_SEL field.
- For more details, see the PTM section in the Databook. Note: This
register field is sticky.
- PCIE_X<i>_RC_PF0_VSECDMA_CAP_VSECDMA_EXT_CAP_HDR_OFF_0
where <i> = 1, 4, 8. Description: This register provides capability ID, capability version, and next capability offset for PCIe extended capability structure.
- PCIE_X1_RC_PF0_VSECDMA_CAP_VSECDMA_EXT_CAP_HDR_OFF_0
- Offset: 0x358
- PCIE_X4_RC_PF0_VSECDMA_CAP_VSECDMA_EXT_CAP_HDR_OFF_0
- Offset: 0x374
- PCIE_X8_RC_PF0_VSECDMA_CAP_VSECDMA_EXT_CAP_HDR_OFF_0
- Offset: 0x388
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0001000b (0b0000,0000,0000,0001,0000,0000,0000,1011)
- Bit
- Reset
- Description
31:20 0x0 NEXT_OFFSET:
- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space, this
offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greater than 0FFh. The bottom 2 bits of this offset are Reserved and must be implemented as 00b although software must mask them to allow for future uses of these bits. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
19:16 0x1 CAP:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. A version of the specification that changes the Extended Capability in a way that is not otherwise identifiable (that is, through a new Capability field) is permitted to increment this field. All such changes to the Capability structure must be software-compatible.
- Software must check for Capability Version numbers that are greater than or
equal to the highest number defined when the software is written, as Functions reporting any such Capability Version numbers will contain a Capability structure that is compatible with that piece of software. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0xb ID:
- PCI Express Extended Capability ID. This field is a PCI-SIG defined ID number
that indicates the nature and format of the Extended Capability. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_VSECDMA_CAP_VSECDMA_VENDOR_SPECIFIC_HDR_OFF_0
where <i> = 1, 4, 8. Description: This Register provides VSEC Length, VSEC ID, and VSEC Rev(Version Number). Vendor- specific software must qualify the associated Vendor ID of the PCI Express Function or RCRB before attempting to interpret the values in the VSEC ID or VSEC Rev fields.
- PCIE_X1_RC_PF0_VSECDMA_CAP_VSECDMA_VENDOR_SPECIFIC_HDR_OFF_0
- Offset: 0x35c
- PCIE_X4_RC_PF0_VSECDMA_CAP_VSECDMA_VENDOR_SPECIFIC_HDR_OFF_0
- Offset: 0x378
- PCIE_X8_RC_PF0_VSECDMA_CAP_VSECDMA_VENDOR_SPECIFIC_HDR_OFF_0
- Offset: 0x38c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x01800006 (0b0000,0001,1000,0000,0000,0000,0000,0110)

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
31:20 0x18 VSEC_LENGTH:
- VSEC Length. This field indicates the number of bytes in the entire VSEC
structure, including the Vendor-Specific Extended Capability Header, the Vendor-Specific Header, and the vendor-specific registers. 19:16 0x0 VSEC_REV:
- VSEC Rev. This field is a vendor-defined version number that indicates the
version of the VSEC structure. Software must qualify the Vendor ID and VSEC ID before interpreting this field. 15:0 0x6 VSEC_ID:
- VSEC ID. This field is a vendor-defined ID number that indicates the nature
and format of the VSEC structure. Software must qualify the Vendor ID before interpreting this field.
- PCIE_X<i>_RC_PF0_VSECDMA_CAP_VSECDMA_DEVICE_INFORMATION_OFF_0
where <i> = 1, 4, 8. Description: This register provides DMA and AXI Bridge implementation-specific information: - DMA Architecture: Legacy DMA or Hyper DMA (HDMA). - Register Location: Port-logic or Mapped to a Function and BAR. - Register Map: Legacy DMA or HDMA. - Channel Separation: Address distance between read and write channels. - AXI Bridge: Used or Not Used - AXI Master Bus Specification: AXI Master Bus Width, Burst Length, and Boundary Pointer Width You must use this information along with the IP version registers: - PCIE_VERSION_NUMBER_OFF - PCIE_VERSION_TYPE_OFF.
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_VSECDMA_CAP_VSECDMA_DEVICE_INFORMATION_OFF_0
- Offset: 0x360
- Reset: 0x35180000 (0b0011,0101,0001,1000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:30 0x0 RSVDP_30: Reserved for future use. 29:26 0xd MASTER_PAGE_BOUNDARY_POINTER_WIDTH:
- This field provides address page boundary information. It reports the
value of CC_MSTR_PAGE_BOUNDARY_PW configuration parameter. 25:23 0x2 MASTER_BURST_LENGTH: Reports the CC_MSTR_BURST_LEN configuration parameter.

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
22:20 0x1 MASTER_BUS_WIDTH:
- This field provides information regarding the AXI master data bus
width. It reports the value of MASTER_BUS_DATA_WIDTH configuration parameter. 0x1 AXI:
- This field provides information about AXI interface usage. It reports the
value of AXI_POPULATED configuration parameter. 18:16 0x0 CHANNEL_SEPARATION:
- If the MAP_FORMAT is set to HDMA_NATIVE, this field specifies the
read write channel address separation. Other values are reserved. 15:11 0x0 PFN:
- Physical Function Number. This field provides information regarding the
DMA register and physical function mapping. 10:8 0x0 BARN:
- Bar Number. This field provides information regarding the DMA register
and BAR number mapping. 7:3 0x0 RSVDP_3: Reserved for future use. 2:0 0x0 MAP_FORMAT:
- Defines the register map format and features to be one of the
following values: Other values are reserved.
- PCIE_X4_RC_PF0_VSECDMA_CAP_VSECDMA_DEVICE_INFORMATION_OFF_0
- Offset: 0x37c
- Reset: 0x34a80401 (0b0011,0100,1010,1000,0000,0100,0000,0001)
- Bit
- Reset
- Description
31:30 0x0 RSVDP_30: Reserved for future use. 29:26 0xd MASTER_PAGE_BOUNDARY_POINTER_WIDTH:
- This field provides address page boundary information. It reports the
value of CC_MSTR_PAGE_BOUNDARY_PW configuration parameter. 25:23 0x1 MASTER_BURST_LENGTH: Reports the CC_MSTR_BURST_LEN configuration parameter. 22:20 0x2 MASTER_BUS_WIDTH:
- This field provides information regarding the AXI master data bus
width. It reports the value of MASTER_BUS_DATA_WIDTH configuration parameter. 0x1 AXI:
- This field provides information about AXI interface usage. It reports the
value of AXI_POPULATED configuration parameter. 18:16 0x0 CHANNEL_SEPARATION:
- If the MAP_FORMAT is set to HDMA_NATIVE, this field specifies the
read write channel address separation. Other values are reserved.

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
15:11 0x0 PFN:
- Physical Function Number. This field provides information regarding the
DMA register and physical function mapping. 10:8 0x4 BARN:
- Bar Number. This field provides information regarding the DMA register
and BAR number mapping. 7:3 0x0 RSVDP_3: Reserved for future use. 2:0 0x1 MAP_FORMAT:
- Defines the register map format and features to be one of the
following values: Other values are reserved.
- PCIE_X8_RC_PF0_VSECDMA_CAP_VSECDMA_DEVICE_INFORMATION_OFF_0
- Offset: 0x390
- Reset: 0x34380401 (0b0011,0100,0011,1000,0000,0100,0000,0001)
- Bit
- Reset
- Description
31:30 0x0 RSVDP_30: Reserved for future use. 29:26 0xd MASTER_PAGE_BOUNDARY_POINTER_WIDTH:
- This field provides address page boundary information. It reports the
value of CC_MSTR_PAGE_BOUNDARY_PW configuration parameter. 25:23 0x0 MASTER_BURST_LENGTH: Reports the CC_MSTR_BURST_LEN configuration parameter. 22:20 0x3 MASTER_BUS_WIDTH:
- This field provides information regarding the AXI master data bus
width. It reports the value of MASTER_BUS_DATA_WIDTH configuration parameter. 0x1 AXI:
- This field provides information about AXI interface usage. It reports the
value of AXI_POPULATED configuration parameter. 18:16 0x0 CHANNEL_SEPARATION:
- If the MAP_FORMAT is set to HDMA_NATIVE, this field specifies the
read write channel address separation. Other values are reserved. 15:11 0x0 PFN:
- Physical Function Number. This field provides information regarding the
DMA register and physical function mapping. 10:8 0x4 BARN:
- Bar Number. This field provides information regarding the DMA register
and BAR number mapping. 7:3 0x0 RSVDP_3: Reserved for future use. 2:0 0x1 MAP_FORMAT:
- Defines the register map format and features to be one of the
following values: Other values are reserved.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_VSECDMA_CAP_VSECDMA_NUM_CHAN_OFF_0
where <i> = 1, 4, 8. Description: This register specifies the number of read and write channels implemented.
- PCIE_X1_RC_PF0_VSECDMA_CAP_VSECDMA_NUM_CHAN_OFF_0
- Offset: 0x364
- PCIE_X4_RC_PF0_VSECDMA_CAP_VSECDMA_NUM_CHAN_OFF_0
- Offset: 0x380
- PCIE_X8_RC_PF0_VSECDMA_CAP_VSECDMA_NUM_CHAN_OFF_0
- Offset: 0x394
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00020004 (0b0000,0000,0000,0010,0000,0000,0000,0100)
- Bit
- Reset
- Description
31:26 0x0 RSVDP_26: Reserved for future use. 25:16 0x2 NUM_DMA_RD_CHAN:
- This field provides information regarding the number of implemented
read channels. It reports the value of CC_NUM_DMA_RD_CHAN parameter. 15:10 0x0 RSVDP_10: Reserved for future use. 9:0 0x4 NUM_DMA_WR_CHAN:
- This field provides information regarding the number of implemented
write channels. It reports the value of CC_NUM_DMA_WR_CHAN parameter.
- PCIE_X<i>_RC_PF0_VSECDMA_CAP_VSECDMA_UNROLL_ADDR_OFFSET_LOW_OFF_0
where <i> = 1, 4, 8. Description: This register specifies the lower 32 bits of the offset of the start address of the DMA register map. Applicable only if MAP_FORMAT >0, that is, all map formats other than EDMA_LEGACY_PL.

- PCIe x1/x4/x8 Root Complex
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_VSECDMA_CAP_VSECDMA_UNROLL_ADDR_OFFSET_LOW_OFF_0
- Offset: 0x368
- Reset: 0x00001000 (0b0000,0000,0000,0000,0001,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x1000 UNROLL_ADDR_OFFSET_LOW: BAR address offset, 32-bit LSB.
- PCIE_X4_RC_PF0_VSECDMA_CAP_VSECDMA_UNROLL_ADDR_OFFSET_LOW_OFF_0
- Offset: 0x384
- PCIE_X8_RC_PF0_VSECDMA_CAP_VSECDMA_UNROLL_ADDR_OFFSET_LOW_OFF_0
- Offset: 0x398
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 UNROLL_ADDR_OFFSET_LOW: BAR address offset, 32-bit LSB.
- PCIE_X<i>_RC_PF0_VSECDMA_CAP_VSECDMA_UNROLL_ADDR_OFFSET_HIGH_OFF_0
where <i> = 1, 4, 8. Description: This register specifies the upper 32 bits of the offset of the start address of the DMA register map. Applicable only if MAP_FORMAT >0, that is, all map formats other than EDMA_LEGACY_PL.
- PCIE_X1_RC_PF0_VSECDMA_CAP_VSECDMA_UNROLL_ADDR_OFFSET_HIGH_OFF_0
- Offset: 0x36c
- PCIE_X4_RC_PF0_VSECDMA_CAP_VSECDMA_UNROLL_ADDR_OFFSET_HIGH_OFF_0
- Offset: 0x388
- PCIE_X8_RC_PF0_VSECDMA_CAP_VSECDMA_UNROLL_ADDR_OFFSET_HIGH_OFF_0

- PCIe x1/x4/x8 Root Complex
- Offset: 0x39c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 UNROLL_ADDR_OFFSET_HIGH: BAR address offset, 32-bit MSB.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_ACK_LATENCY_TIMER_OFF_0
where <i> = 1, 4, 8. Description: This register holds the ack latency timer limit and replay timer limit values.
- PCIE_X1_RC_PF0_PORT_LOGIC_ACK_LATENCY_TIMER_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_ACK_LATENCY_TIMER_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_ACK_LATENCY_TIMER_OFF_0
- Offset: 0x700
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0c23040b (0b0000,1100,0010,0011,0000,0100,0000,1011)
- Bit
- Reset
- Description
31:16 0xc23 REPLAY_TIME_LIMIT:
- Replay Timer Limit. The replay timer expires when it reaches this limit. The
controller initiates a replay upon reception of a NAK or when the replay timer expires. For more details, see "Transmit Replay" in the Databook. - You can modify the effective timer limit through the TIMER_MOD_REPLAY_TIMER field of the TIMER_CTRL_MAX_FUNC_NUM_OFF register. - After reset, the controller updates the default according to the Negotiated Link Width, Max_Payload_Size, and speed. The value is determined from Tables 3-4, 3-5, and 3-6 of the PCI
- Express Base Specification. - If there is a change in the payload size or link
speed, the controller overrides any value that you have written to this register field, and resets the field back to the specification-defined value. The controller does not change the value in the TIMER_MOD_REPLAY_TIMER field of the TIMER_CTRL_MAX_FUNC_NUM_OFF register.

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
15:0 0x40b ROUND_TRIP_LATENCY_TIME_LIMIT: Ack Latency Timer Limit. The Ack latency timer expires when it reaches this limit.
- For more details, see "ACK/NAK Scheduling" in the Databook. - You can modify
the effective timer limit through the TIMER_MOD_ACK_NAK field of the
- TIMER_CTRL_MAX_FUNC_NUM_OFF register. - After reset, the controller
updates the default according to the Negotiated Link Width, Max_Payload_Size, and speed. The value is determined from Tables 3-7, 3-8, and 3-9 of the PCI
- Express Base Specification. - The limit must reflect the round trip latency from
requester to completer. - If there is a change in the payload size or link width, the controller overrides any value that you have written to this register field, and resets the field back to the specification-defined value. The controller does not change the value in the TIMER_MOD_ACK_NAK field of the TIMER_CTRL_MAX_FUNC_NUM_OFF register.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_VENDOR_SPEC_DLLP_OFF_0
where <i> = 1, 4, 8. Description: This register holds the vendor specific DLLP.
- PCIE_X1_RC_PF0_PORT_LOGIC_VENDOR_SPEC_DLLP_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_VENDOR_SPEC_DLLP_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_VENDOR_SPEC_DLLP_OFF_0
- Offset: 0x704
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xffffffff (0b1111,1111,1111,1111,1111,1111,1111,1111)
- Bit
- Reset
- Description
31:0 0xffffffff VENDOR_SPEC_DLLP:
- Vendor Specific DLLP Register. You can use this register to send a
specific PCI Express DLLP. Your application can write 8-bit DLLP Type and 24-bit Payload data into this register, and set the
- VENDOR_SPECIFIC_DLLP_REQ field of the PORT_LINK_CTRL_OFF, to
send the DLLP. - Bits[7:0]: DLLP Type - Bits[31:8]: Vendor Defined Payload (24 bits) Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_PORT_FORCE_OFF_0
where <i> = 1, 4, 8. Description: This register can be used for testing and debuggong the link.

- PCIe x1/x4/x8 Root Complex
- PCIE_X1_RC_PF0_PORT_LOGIC_PORT_FORCE_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_PORT_FORCE_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_PORT_FORCE_OFF_0
- Offset: 0x708
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00400000 (0b0000,0000,0100,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:24
- RO
0x0 RSVDP_24: Reserved for future use.
- RW
0x0 DO_DESKEW_FOR_SRIS:
- Use the transitions from TS2 to Logical Idle Symbol, SKP OS to
- Logical Idle Symbol, EIEOS to Logical Idle Symbol, and FTS Sequence
to SKP OS to do deskew instead of using received SKP OS or TS1 to
- TS2 transition if DO_DESKEW_FOR_SRIS is set to '1'. Note: This
register field is sticky.
- RW
0x1 SUPPORT_PART_LANES_RXEI_EXIT:
- Support LTSSM transition from Polling.Active to Polling.Config based
on Rx 8 TSs on any lanes which are Rx EI exit too from base spec after 24ms timeout. This prevents some lanes detected but not Rx EI exit and LTSSM cannot move to Polling.Config. You must set the parameter CX_AUTO_LANE_FLIP_CTRL_EN true for the auto lanes reversal. Note: This register field is sticky. 21:16
- RW
0x0 LINK_STATE:
- Forced LTSSM State. The LTSSM state that the controller is forced to
when you set the FORCE_EN bit (Force Link). LTSSM state encoding is defined by the lts_state variable in workspace/src/Layer1/ smlh_ltssm.v. Note: This register field is sticky.
- WO
0x0 FORCE_EN:
- Force Link. The controller supports a testing and debug capability to
allow your software to force the LTSSM state machine into a specific state, and to force the controller to transmit a specific Link
- Command. Asserting this bit triggers the following actions: - Forces
the LTSSM to the state specified by the Forced LTSSM State field. -
- Forces the controller to transmit the command specified by the
Forced Link Command field. This is a self-clearing register field. Reading from this register field always returns a '0'. 14:12
- RO
0x0 RSVDP_12: Reserved for future use. 11:8
- RW
0x0 FORCED_LTSSM:
- Forced Link Command. The link command that the controller is
forced to transmit when you set FORCE_EN bit (Force Link). Link command encoding is defined by the ltssm_cmd variable in workspace/src/Layer1/smlh_ltssm.v. Note: This register field is sticky. 7:0
- RW
0x0 LINK_NUM: Link Number. Not used for endpoint. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_PORT_LOGIC_ACK_F_ASPM_CTRL_OFF_0
where <i> = 1, 4, 8. Description: This register is used to control ack frequency and L0-L1 ASPM behaviour.
- Offset: 0x70c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_PORT_LOGIC_ACK_F_ASPM_CTRL_OFF_0
- Reset: 0x1b343400 (0b0001,1011,0011,0100,0011,0100,0000,0000)
- Bit
R/W
- Reset
- Description
- RO
0x0 RSVDP_31: Reserved for future use.
- RW
0x0 ENTER_ASPM: ASPM L1 Entry Control. Note: This register field is sticky. 29:27
- RW
0x3 L1_ENTRANCE_LATENCY:
- L1 Entrance Latency. Note: Programming this timer with a value greater
that 32us has no effect unless extended sync is used, or all of the credits are infinite. Note: This register field is sticky. 26:24
- RW
0x3 L0S_ENTRANCE_LATENCY: L0s Entrance Latency. Note: This register field is sticky. 23:16
- RO
0x34 COMMON_CLK_N_FTS: Common Clock N_FTS. This is the N_FTS when common clock is used.
- The number of Fast Training Sequence ordered sets to be transmitted
when transitioning from L0s to L0. This field is only writable (sticky) when all of the following configuration parameter equations are true: -
- CX_NFTS !=CX_COMM_NFTS - DEFAULT_L0S_EXIT_LATENCY !
=DEFAULT_COMM_L0S_EXIT_LATENCY - DEFAULT_L1_EXIT_LATENCY ! =DEFAULT_COMM_L1_EXIT_LATENCY Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R 15:8
- RW
0x34 ACK_N_FTS:
- The number of Fast Training Sequence(N_FTS) ordered sets to be
transmitted when transitioning from L0s to L0. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
7:0
- RW
0x0 ACK_FREQ:
- Ack Frequency. The controller accumulates the number of pending ACKs
specified here (up to 255) before scheduling an ACK DLLP. - 0: Indicates that this Ack Frequency Counter feature is turned off. The controller generates a low-priority ACK request for every TLP that it receives. The controller waits until the ACK Latency Timer expires, then converts the current low-priority ACK request to a high-priority ACK request and schedules the DLLP for transmission to the remote link partner. - 1-255:
- Indicates that the controller will schedule a high-priority ACK after
receiving this number of TLPs. It might schedule the ACK before receiving this number of TLPs if the ACK Latency Timer expires, but never later. For a typical system, you do not have to modify the default setting. For more details, see "ACK/NAK Scheduling" in the Databook. Note: This register field is sticky.
- PCIE_X4_RC_PF0_PORT_LOGIC_ACK_F_ASPM_CTRL_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_ACK_F_ASPM_CTRL_OFF_0
- Reset: 0x23343400 (0b0010,0011,0011,0100,0011,0100,0000,0000)
- Bit
R/W
- Reset
- Description
- RO
0x0 RSVDP_31: Reserved for future use.
- RW
0x0 ENTER_ASPM: ASPM L1 Entry Control. Note: This register field is sticky. 29:27
- RW
0x4 L1_ENTRANCE_LATENCY:
- L1 Entrance Latency. Note: Programming this timer with a value greater
that 32us has no effect unless extended sync is used, or all of the credits are infinite. Note: This register field is sticky. 26:24
- RW
0x3 L0S_ENTRANCE_LATENCY: L0s Entrance Latency. Note: This register field is sticky. 23:16
- RO
0x34 COMMON_CLK_N_FTS: Common Clock N_FTS. This is the N_FTS when common clock is used.
- The number of Fast Training Sequence ordered sets to be transmitted
when transitioning from L0s to L0. This field is only writable (sticky) when all of the following configuration parameter equations are true: -
- CX_NFTS !=CX_COMM_NFTS - DEFAULT_L0S_EXIT_LATENCY !
=DEFAULT_COMM_L0S_EXIT_LATENCY - DEFAULT_L1_EXIT_LATENCY ! =DEFAULT_COMM_L1_EXIT_LATENCY Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R 15:8
- RW
0x34 ACK_N_FTS:
- The number of Fast Training Sequence(N_FTS) ordered sets to be
transmitted when transitioning from L0s to L0. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
7:0
- RW
0x0 ACK_FREQ:
- Ack Frequency. The controller accumulates the number of pending ACKs
specified here (up to 255) before scheduling an ACK DLLP. - 0: Indicates that this Ack Frequency Counter feature is turned off. The controller generates a low-priority ACK request for every TLP that it receives. The controller waits until the ACK Latency Timer expires, then converts the current low-priority ACK request to a high-priority ACK request and schedules the DLLP for transmission to the remote link partner. - 1-255:
- Indicates that the controller will schedule a high-priority ACK after
receiving this number of TLPs. It might schedule the ACK before receiving this number of TLPs if the ACK Latency Timer expires, but never later. For a typical system, you do not have to modify the default setting. For more details, see "ACK/NAK Scheduling" in the Databook. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_PORT_LINK_CTRL_OFF_0
where <i> = 1, 4, 8. Description: Using this register you can control the port link behaviour.
- Offset: 0x710
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_PORT_LOGIC_PORT_LINK_CTRL_OFF_0
- Reset: 0x00010120 (0b0000,0000,xx00,0001,0000,0001,0010,0000)
- Bit
R/W
- Reset
- Description
31:28
- RO
0x0 RSVDP_28: Reserved for future use.
- RW
0x0 TRANSMIT_LANE_REVERSALE_ENABLE: TRANSMIT_LANE_REVERSALE_ENABLE is an internally reserved field. Do not use. Note: This register field is sticky.
- RW
0x0 EXTENDED_SYNCH: EXTENDED_SYNCH is an internally reserved field. Do not use. Note: This register field is sticky.
- RW
0x0 CORRUPT_LCRC_ENABLE: CORRUPT_LCRC_ENABLE is an internally reserved field. Do not use. Note: This register field is sticky.
- RW
0x0 BEACON_ENABLE:
- BEACON_ENABLE is an internally reserved field. Do not use. Note: This
register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
21:16
- RW
0x1 LINK_CAPABLE:
- Link Mode Enable. Sets the number of lanes in the link that you want
to connect to the link partner. When you have unused lanes in your system, then you must change the value in this register to reflect the number of lanes. You must also change the value in the "Predetermined Number of Lanes" field of the "Link Width and Speed
- Change Control Register". For more information, see "How to Tie Off
- Unused Lanes". For information on upsizing and downsizing the link
width, see "Link Establishment". Note: This register field is sticky. 15:12
- RO
0x0 RSVDP_12: Reserved for future use. 11:8
- RW
0x1 LINK_RATE:
- LINK_RATE is an internally reserved field. Do not use. Note: This
register field is sticky.
- RW
0x0 FAST_LINK_MODE:
- Fast Link Mode. Sets all internal LTSSM millisecond timers to Fast
- Mode for speeding up simulation. Forces the LTSSM training (link
initialization) to use shorter time-outs and to link up faster. - The default scaling factor can be changed using the
- DEFAULT_FAST_LINK_SCALING_FACTOR parameter or through the
- FAST_LINK_SCALING_FACTOR field in the
- TIMER_CTRL_MAX_FUNC_NUM_OFF register. - Fast Link Mode can also
be activated by setting the diag_ctrl_bus[2] pin to '1'. For more details, see the "Fast Link Simulation Mode" section in the "Integrating the
- Controller with the PHY or Application RTL or Verification IP" chapter
of the User Guide. Note: This register field is sticky.
- RW
0x0 LINK_DISABLE:
- LINK_DISABLE is an internally reserved field. Do not use. Note: This
register field is sticky.
- RW
0x1 DLL_LINK_EN: DLL Link Enable. Note: This register field is sticky.
- RO
0x0 RSVDP_4: Reserved for future use.
- RW
0x0 RESET_ASSERT:
- Reset Assert. Triggers a recovery and forces the LTSSM to the hot
reset state (downstream port only). Note: This register field is sticky.
- RW
0x0 LOOPBACK_ENABLE:
- Loopback Enable. Turns on loopback. For more details, see "Loopback"
in the Databook. Note: This register field is sticky.
- RW
0x0 SCRAMBLE_DISABLE:
- Scramble Disable. Turns off data scrambling. Note: This register field is
sticky.
- RW
0x0 VENDOR_SPECIFIC_DLLP_REQ:
- Vendor Specific DLLP Request. Reading from this self-clearing register
field always returns a '0'.
- PCIE_X4_RC_PF0_PORT_LOGIC_PORT_LINK_CTRL_OFF_0
- Reset: 0x00070120 (0b0000,0000,xx00,0111,0000,0001,0010,0000)

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
31:28
- RO
0x0 RSVDP_28: Reserved for future use.
- RW
0x0 TRANSMIT_LANE_REVERSALE_ENABLE: TRANSMIT_LANE_REVERSALE_ENABLE is an internally reserved field. Do not use. Note: This register field is sticky.
- RW
0x0 EXTENDED_SYNCH: EXTENDED_SYNCH is an internally reserved field. Do not use. Note: This register field is sticky.
- RW
0x0 CORRUPT_LCRC_ENABLE: CORRUPT_LCRC_ENABLE is an internally reserved field. Do not use. Note: This register field is sticky.
- RW
0x0 BEACON_ENABLE:
- BEACON_ENABLE is an internally reserved field. Do not use. Note: This
register field is sticky. 21:16
- RW
0x7 LINK_CAPABLE:
- Link Mode Enable. Sets the number of lanes in the link that you want
to connect to the link partner. When you have unused lanes in your system, then you must change the value in this register to reflect the number of lanes. You must also change the value in the "Predetermined Number of Lanes" field of the "Link Width and Speed
- Change Control Register". For more information, see "How to Tie Off
- Unused Lanes". For information on upsizing and downsizing the link
width, see "Link Establishment". Note: This register field is sticky. 15:12
- RO
0x0 RSVDP_12: Reserved for future use. 11:8
- RW
0x1 LINK_RATE:
- LINK_RATE is an internally reserved field. Do not use. Note: This
register field is sticky.
- RW
0x0 FAST_LINK_MODE:
- Fast Link Mode. Sets all internal LTSSM millisecond timers to Fast
- Mode for speeding up simulation. Forces the LTSSM training (link
initialization) to use shorter time-outs and to link up faster. - The default scaling factor can be changed using the
- DEFAULT_FAST_LINK_SCALING_FACTOR parameter or through the
- FAST_LINK_SCALING_FACTOR field in the
- TIMER_CTRL_MAX_FUNC_NUM_OFF register. - Fast Link Mode can also
be activated by setting the diag_ctrl_bus[2] pin to '1'. For more details, see the "Fast Link Simulation Mode" section in the "Integrating the
- Controller with the PHY or Application RTL or Verification IP" chapter
of the User Guide. Note: This register field is sticky.
- RW
0x0 LINK_DISABLE:
- LINK_DISABLE is an internally reserved field. Do not use. Note: This
register field is sticky.
- RW
0x1 DLL_LINK_EN: DLL Link Enable. Note: This register field is sticky.
- RO
0x0 RSVDP_4: Reserved for future use.
- RW
0x0 RESET_ASSERT:
- Reset Assert. Triggers a recovery and forces the LTSSM to the hot
reset state (downstream port only). Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x0 LOOPBACK_ENABLE:
- Loopback Enable. Turns on loopback. For more details, see "Loopback"
in the Databook. Note: This register field is sticky.
- RW
0x0 SCRAMBLE_DISABLE:
- Scramble Disable. Turns off data scrambling. Note: This register field is
sticky.
- RW
0x0 VENDOR_SPECIFIC_DLLP_REQ:
- Vendor Specific DLLP Request. Reading from this self-clearing register
field always returns a '0'.
- PCIE_X8_RC_PF0_PORT_LOGIC_PORT_LINK_CTRL_OFF_0
- Reset: 0x000f0120 (0b0000,0000,xx00,1111,0000,0001,0010,0000)
- Bit
R/W
- Reset
- Description
31:28
- RO
0x0 RSVDP_28: Reserved for future use.
- RW
0x0 TRANSMIT_LANE_REVERSALE_ENABLE: TRANSMIT_LANE_REVERSALE_ENABLE is an internally reserved field. Do not use. Note: This register field is sticky.
- RW
0x0 EXTENDED_SYNCH: EXTENDED_SYNCH is an internally reserved field. Do not use. Note: This register field is sticky.
- RW
0x0 CORRUPT_LCRC_ENABLE: CORRUPT_LCRC_ENABLE is an internally reserved field. Do not use. Note: This register field is sticky.
- RW
0x0 BEACON_ENABLE:
- BEACON_ENABLE is an internally reserved field. Do not use. Note: This
register field is sticky. 21:16
- RW
0xf LINK_CAPABLE:
- Link Mode Enable. Sets the number of lanes in the link that you want
to connect to the link partner. When you have unused lanes in your system, then you must change the value in this register to reflect the number of lanes. You must also change the value in the "Predetermined Number of Lanes" field of the "Link Width and Speed
- Change Control Register". For more information, see "How to Tie Off
- Unused Lanes". For information on upsizing and downsizing the link
width, see "Link Establishment". Note: This register field is sticky. 15:12
- RO
0x0 RSVDP_12: Reserved for future use. 11:8
- RW
0x1 LINK_RATE:
- LINK_RATE is an internally reserved field. Do not use. Note: This
register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x0 FAST_LINK_MODE:
- Fast Link Mode. Sets all internal LTSSM millisecond timers to Fast
- Mode for speeding up simulation. Forces the LTSSM training (link
initialization) to use shorter time-outs and to link up faster. - The default scaling factor can be changed using the
- DEFAULT_FAST_LINK_SCALING_FACTOR parameter or through the
- FAST_LINK_SCALING_FACTOR field in the
- TIMER_CTRL_MAX_FUNC_NUM_OFF register. - Fast Link Mode can also
be activated by setting the diag_ctrl_bus[2] pin to '1'. For more details, see the "Fast Link Simulation Mode" section in the "Integrating the
- Controller with the PHY or Application RTL or Verification IP" chapter
of the User Guide. Note: This register field is sticky.
- RW
0x0 LINK_DISABLE:
- LINK_DISABLE is an internally reserved field. Do not use. Note: This
register field is sticky.
- RW
0x1 DLL_LINK_EN: DLL Link Enable. Note: This register field is sticky.
- RO
0x0 RSVDP_4: Reserved for future use.
- RW
0x0 RESET_ASSERT:
- Reset Assert. Triggers a recovery and forces the LTSSM to the hot
reset state (downstream port only). Note: This register field is sticky.
- RW
0x0 LOOPBACK_ENABLE:
- Loopback Enable. Turns on loopback. For more details, see "Loopback"
in the Databook. Note: This register field is sticky.
- RW
0x0 SCRAMBLE_DISABLE:
- Scramble Disable. Turns off data scrambling. Note: This register field is
sticky.
- RW
0x0 VENDOR_SPECIFIC_DLLP_REQ:
- Vendor Specific DLLP Request. Reading from this self-clearing register
field always returns a '0'.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_LANE_SKEW_OFF_0
where <i> = 1, 4, 8. Description: This register is used to control the lane skew behaviour.
- Offset: 0x714
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_PORT_LOGIC_LANE_SKEW_OFF_0

- PCIe x1/x4/x8 Root Complex
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 DISABLE_LANE_TO_LANE_DESKEW:
- Disable Lane-to-Lane Deskew. Causes the controller to disable the internal
Lane-to-Lane deskew logic. Note: This register field is sticky. 30:27 0x0 IMPLEMENT_NUM_LANES:
- Implementation-specific Number of Lanes. Set the implementation-specific
number of lanes. The number of lanes to be used when in Loopback Master.
- The number of lanes programmed must be equal to or less than the valid
number of lanes set in LINK_CAPABLE field. You must configure this field before initiating Loopback by writing in the LOOPBACK_ENABLE field. The controller will transition from Loopback.Entry to Loopback.Active after receiving two consecutive TS1 Ordered Sets with the Loopback bit asserted on the implementation specific number of lanes configured in this field. Note: This register field is sticky. 0x0 ELASTIC_BUFFER_MODE: Selects Elasticity Buffer operating mode: Note: This register field is sticky. 0x0 ACK_NAK_DISABLE: Ack/Nak Disable. Prevents the controller from sending ACK and NAK DLLPs. Note: This register field is sticky. 0x0 FLOW_CTRL_DISABLE: Flow Control Disable. Prevents the controller from sending FC DLLPs. Note: This register field is sticky. 23:0 0x0 INSERT_LANE_SKEW:
- INSERT_LANE_SKEW is an internally reserved field. Do not use. Note: This
register field is sticky.
- PCIE_X4_RC_PF0_PORT_LOGIC_LANE_SKEW_OFF_0
- Reset: 0x18000000 (0b0001,1000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 DISABLE_LANE_TO_LANE_DESKEW:
- Disable Lane-to-Lane Deskew. Causes the controller to disable the internal
Lane-to-Lane deskew logic. Note: This register field is sticky. 30:27 0x3 IMPLEMENT_NUM_LANES:
- Implementation-specific Number of Lanes. Set the implementation-specific
number of lanes. The number of lanes to be used when in Loopback Master.
- The number of lanes programmed must be equal to or less than the valid
number of lanes set in LINK_CAPABLE field. You must configure this field before initiating Loopback by writing in the LOOPBACK_ENABLE field. The controller will transition from Loopback.Entry to Loopback.Active after receiving two consecutive TS1 Ordered Sets with the Loopback bit asserted on the implementation specific number of lanes configured in this field. Note: This register field is sticky. 0x0 ELASTIC_BUFFER_MODE: Selects Elasticity Buffer operating mode: Note: This register field is sticky. 0x0 ACK_NAK_DISABLE: Ack/Nak Disable. Prevents the controller from sending ACK and NAK DLLPs. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
0x0 FLOW_CTRL_DISABLE: Flow Control Disable. Prevents the controller from sending FC DLLPs. Note: This register field is sticky. 23:0 0x0 INSERT_LANE_SKEW:
- INSERT_LANE_SKEW is an internally reserved field. Do not use. Note: This
register field is sticky.
- PCIE_X8_RC_PF0_PORT_LOGIC_LANE_SKEW_OFF_0
- Reset: 0x38000000 (0b0011,1000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 DISABLE_LANE_TO_LANE_DESKEW:
- Disable Lane-to-Lane Deskew. Causes the controller to disable the internal
Lane-to-Lane deskew logic. Note: This register field is sticky. 30:27 0x7 IMPLEMENT_NUM_LANES:
- Implementation-specific Number of Lanes. Set the implementation-specific
number of lanes. The number of lanes to be used when in Loopback Master.
- The number of lanes programmed must be equal to or less than the valid
number of lanes set in LINK_CAPABLE field. You must configure this field before initiating Loopback by writing in the LOOPBACK_ENABLE field. The controller will transition from Loopback.Entry to Loopback.Active after receiving two consecutive TS1 Ordered Sets with the Loopback bit asserted on the implementation specific number of lanes configured in this field. Note: This register field is sticky. 0x0 ELASTIC_BUFFER_MODE: Selects Elasticity Buffer operating mode: Note: This register field is sticky. 0x0 ACK_NAK_DISABLE: Ack/Nak Disable. Prevents the controller from sending ACK and NAK DLLPs. Note: This register field is sticky. 0x0 FLOW_CTRL_DISABLE: Flow Control Disable. Prevents the controller from sending FC DLLPs. Note: This register field is sticky. 23:0 0x0 INSERT_LANE_SKEW:
- INSERT_LANE_SKEW is an internally reserved field. Do not use. Note: This
register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_TIMER_CTRL_MAX_FUNC_NUM_OFF_0
where <i> = 1, 4, 8. Description: This register holds the ack frequency, latency, replay, fast link scaling timers, and max function number values.
- PCIE_X1_RC_PF0_PORT_LOGIC_TIMER_CTRL_MAX_FUNC_NUM_OFF_0

- PCIe x1/x4/x8 Root Complex
- PCIE_X4_RC_PF0_PORT_LOGIC_TIMER_CTRL_MAX_FUNC_NUM_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_TIMER_CTRL_MAX_FUNC_NUM_OFF_0
- Offset: 0x718
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00010000 (0b0000,0000,0000,0001,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RO
0x0 RSVDP_31: Reserved for future use. 30:29
- RW
0x0 FAST_LINK_SCALING_FACTOR:
- Fast Link Timer Scaling Factor. Sets the scaling factor of LTSSM
timer when FAST_LINK_MODE field in PORT_LINK_CTRL_OFF is set to '1'. Default is set by the hidden configuration parameter DEFAULT_FAST_LINK_SCALING_FACTOR which defaults to '0'. Note: This register field is sticky. 28:24
- RW
0x0 UPDATE_FREQ_TIMER: UPDATE_FREQ_TIMER is an internally reserved field. Do not use. Note: This register field is sticky. 23:19
- RW
0x0 TIMER_MOD_ACK_NAK:
- Ack Latency Timer Modifier. Increases the timer value for the Ack
latency timer in increments of 64 clock cycles. A value of '0' represents no modification to the timer value. For more details, see the ROUND_TRIP_LATENCY_TIME_LIMIT field of the ACK_LATENCY_TIMER_OFF register. Note: This register field is sticky. 18:14
- RW
0x4 TIMER_MOD_REPLAY_TIMER:
- Replay Timer Limit Modifier. Increases the time-out value for the
replay timer in increments of 64 clock cycles at Gen1 or Gen2 speed, and in increments of 256 clock cycles at Gen3 speed. A value of '0' represents no modification to the timer limit. For more details, see the REPLAY_TIME_LIMIT field of the ACK_LATENCY_TIMER_OFF register. At Gen3 speed, the controller automatically changes the value of this field to DEFAULT_GEN3_REPLAY_ADJ. Note: This register field is sticky. 13:8
- RO
0x0 RSVDP_8: Reserved for future use. 7:0
- RW
0x0 MAX_FUNC_NUM: Maximum function number that can be used in a request.
- Configuration requests targeted at function numbers above this
value are returned with UR (unsupported request). Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_SYMBOL_TIMER_FILTER_1_OFF_0
where <i> = 1, 4, 8.

- PCIe x1/x4/x8 Root Complex
Description: The Filter Mask 1 Register modifies the RADM filtering and error handling rules. For more details, see the "Receive Filtering" section. In each case, '0' applies the associated filtering rule and '1' masks the associated filtering rule.
- PCIE_X1_RC_PF0_PORT_LOGIC_SYMBOL_TIMER_FILTER_1_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_SYMBOL_TIMER_FILTER_1_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_SYMBOL_TIMER_FILTER_1_OFF_0
- Offset: 0x71c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000140 (0b0000,0000,0000,0000,0000,0001,0100,0000)

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
31:16 0x0 MASK_RADM_1:
- Filter Mask 1. The Filter Mask 1 Register modifies the RADM filtering and error
handling rules. For more details, see the "Receive Filtering" section. In each case, '0' applies the associated filtering rule and '1' masks the associated filtering rule. [31]:
- CX_FLT_MASK_RC_CFG_DISCARD - 0: For RADM RC filter to not allow CFG
transaction being received - 1: For RADM RC filter to allow CFG transaction being received [30]: CX_FLT_MASK_RC_IO_DISCARD - 0: For RADM RC filter to not allow IO transaction being received - 1: For RADM RC filter to allow IO transaction being received [29]: CX_FLT_MASK_MSG_DROP - 0: Drop MSG TLP (except for Vendor
- MSG). Send decoded message on the SII. - 1: Do not Drop MSG (except for Vendor
- MSG). Send message TLPs to your application on TRGT1 and send decoded message
on the SII. - The default for this bit is the inverse of FLT_DROP_MSG. That is, if
- FLT_DROP_MSG =1, then the default of this bit is '0' (drop message TLPs). This bit
only controls message TLPs other than Vendor MSGs. Vendor MSGs are controlled by
- Filter Mask Register 2, bits [1:0]. The controller never passes ATS Invalidate messages
to the SII interface regardless of this filter rule setting. The controller passes all ATS Invalidate messages to TRGT1 (or AXI bridge master), as they are too big for the SII. [28]: CX_FLT_MASK_CPL_ECRC_DISCARD - Only used when completion queue is advertised with infinite credits and is in store-and-forward mode. - 0: Discard completions with ECRC errors - 1: Allow completions with ECRC errors to be passed up - Reserved field for SW. [27]: CX_FLT_MASK_ECRC_DISCARD - 0: Discard TLPs with ECRC errors - 1: Allow TLPs with ECRC errors to be passed up [26]:
- CX_FLT_MASK_CPL_LEN_MATCH - 0: Enforce length match for completions; a
violation results in cpl_abort, and possibly AER of unexp_cpl_err - 1: Mask length match for completions [25]: CX_FLT_MASK_CPL_ATTR_MATCH - 0: Enforce attribute match for completions; a violation results in a malformed TLP error, and possibly AER of unexp_cpl_err, cpl_rcvd_ur, cpl_rcvd_ca - 1: Mask attribute match for completions [24]: CX_FLT_MASK_CPL_TC_MATCH - 0: Enforce Traffic Class match for completions; a violation results in a malformed TLP error, and possibly AER of unexp_cpl_err, cpl_rcvd_ur, cpl_rcvd_ca - 1: Mask Traffic Class match for completions [23]:
- CX_FLT_MASK_CPL_FUNC_MATCH - 0: Enforce function match for completions; a
violation results in cpl_abort, and possibly AER of unexp_cpl_err, cpl_rcvd_ur, cpl_rcvd_ca - 1: Mask function match for completions [22]:
- CX_FLT_MASK_CPL_REQID_MATCH - 0: Enforce Req. Id match for completions; a
violation result in cpl_abort, and possibly AER of unexp_cpl_err, cpl_rcvd_ur, cpl_rcvd_ca - 1: Mask Req. Id match for completions [21]:
- CX_FLT_MASK_CPL_TAGERR_MATCH - 0: Enforce Tag Error Rules for completions; a
violation result in cpl_abort, and possibly AER of unexp_cpl_err, cpl_rcvd_ur, cpl_rcvd_ca - 1: Mask Tag Error Rules for completions [20]:
- CX_FLT_MASK_LOCKED_RD_AS_UR - 0: Treat locked Read TLPs as UR for EP;
Supported for RC - 1: Treat locked Read TLPs as Supported for EP; UR for RC [19]:
- CX_FLT_MASK_CFG_TYPE1_REQ_AS_UR - 0: Treat CFG type1 TLPs as UR for EP;
- Supported for RC - 1: Treat CFG type1 TLPs as Supported for EP; UR for RC - When
- CX_SRIOV_ENABLE is set then this bit is set to allow the filter to process Type 1
Config requests if the EP consumes more than one bus number. [18]:
- CX_FLT_MASK_UR_OUTSIDE_BAR - 0: Treat out-of-bar TLPs as UR - 1: Do not treat
out-of-bar TLPs as UR [17]: CX_FLT_MASK_UR_POIS - 0: Treat poisoned request TLPs as UR - 1: Do not treat poisoned request TLPs as UR - The native controller always passes poisoned completions to your application except when you are using the DMA read channel. [16]: CX_FLT_MASK_UR_FUNC_MISMATCH - 0: Treat Function
- MisMatched TLPs as UR - 1: Do not treat Function MisMatched TLPs as UR Note: This
register field is sticky. 0x0 DISABLE_FC_WD_TIMER: Disable FC Watchdog Timer. Note: This register field is sticky. 14:11 0x0 EIDLE_TIMER:
- EIDLE_TIMER is an internally reserved field. Do not use. Note: This register field is
sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
10:0 0x140 SKP_INT_VAL:
- SKP Interval Value. The number of symbol times to wait between transmitting SKP
ordered sets. The controller waits the number of symbol times in this register plus 1, between transmitting SKP ordered sets. Your application must program this register accordingly. For example, if 1536 were programmed into this register (in a 250 MHz controller), then the controller actually transmits SKP ordered sets once every 1537 symbol times. The value programmed to this register is actually clock ticks and not symbol times. In a 125 MHz controller, programming the value programmed to this register should be scaled down by a factor of 2 (because one clock tick =two symbol times in this case). Note: This value is not used at Gen3 speed; the skip interval is hardcoded to 370 blocks. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_FILTER_MASK_2_OFF_0
where <i> = 1, 4, 8. Description: This register modifies the RADM filtering and error handling rules. For more details, see the "Receive Filtering" section. In each case, '0' applies the associated filtering rule and '1' masks the associated filtering rule.
- PCIE_X1_RC_PF0_PORT_LOGIC_FILTER_MASK_2_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_FILTER_MASK_2_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_FILTER_MASK_2_OFF_0
- Offset: 0x720
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
31:0 0x0 MASK_RADM_2:
- Filter Mask 2. This field modifies the RADM filtering and error handling rules. For
more details, see the "Receive Filtering" in the Databook. In each case, '0' applies the associated filtering rule and '1' masks the associated filtering rule. [31:10]: Reserved [9]: CX_FLT_MASK_CPL_IN_LUT_CHECK - 0: Disable masking of checking if the tag of CPL is registered in LUT - 1: Enable masking of checking if the tag of CPL is registered in LUT [8]: CX_FLT_MASK_POIS_ERROR_REPORTING - 0: Disable masking of error reporting for Poisoned TLPs - 1: Enable masking of error reporting for
- Poisoned TLPs [7]: CX_FLT_MASK_PRS_DROP - 0: Allow PRS message to pass
through - 1: Drop PRS Messages silently - This bit is ignored when the
- CX_FLT_MASK_MSG_DROP bit in the MASK_RADM_1 field of the
SYMBOL_TIMER_FILTER_1_OFF register is set to '1'. [6]: CX_FLT_UNMASK_TD - 0:
- Disable unmask TD bit if CX_STRIP_ECRC_ENABLE - 1: Enable unmask TD bit if
- CX_STRIP_ECRC_ENABLE [5]: CX_FLT_UNMASK_UR_POIS_TRGT0 - 0: Disable
unmask CX_FLT_MASK_UR_POIS with TRGT0 destination - 1: Enable unmask CX_FLT_MASK_UR_POIS with TRGT0 destination [4]:
- CX_FLT_MASK_LN_VENMSG1_DROP - 0: Allow LN message to pass through - 1: Drop
- LN Messages silently [3]: CX_FLT_MASK_HANDLE_FLUSH - 0: Disable controller
Filter to handle flush request - 1: Enable controller Filter to handle flush request [2]:
- CX_FLT_MASK_DABORT_4UCPL - 0: Enable DLLP abort for unexpected completion -
1: Do not enable DLLP abort for unexpected completion [1]:
- CX_FLT_MASK_VENMSG1_DROP - 0: Vendor MSG Type 1 dropped silently - 1: Vendor
- MSG Type 1 not dropped [0]: CX_FLT_MASK_VENMSG0_DROP - 0: Vendor MSG Type
0 dropped with UR error reporting - 1: Vendor MSG Type 0 not dropped Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_AMBA_MUL_OB_DECOMP_NP_SUB_REQ_CTRL_OFF_0
where <i> = 1, 4, 8. Description: This register controls multiple outbound decomposed NP subRequests operation.
- PCIE_X1_RC_PF0_PORT_LOGIC_AMBA_MUL_OB_DECOMP_NP_SUB_REQ_CTRL_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_AMBA_MUL_OB_DECOMP_NP_SUB_REQ_CTRL_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_AMBA_MUL_OB_DECOMP_NP_SUB_REQ_CTRL_OFF_0
- Offset: 0x724
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000001 (0b0000,0000,0000,0000,0000,0000,0000,0001)
- Bit
R/W
- Reset
- Description
31:1
- RO
0x0 RSVDP_1: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x1 OB_RD_SPLIT_BURST_EN:
- Enable AMBA Multiple Outbound Decomposed NP SubRequests. You
should not clear this register unless your application master is requesting an amount of read data greater than
- Max_Read_Request_Size, and the remote device (or switch) is
reordering completions that have different tags. For more details, see "AXI Bridge Ordering" in the AXI chapter of the Databook. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/ W (sticky) Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_PL_DEBUG0_OFF_0
where <i> = 1, 4, 8. Description: This register holds cxpl_debug_info[31:0].
- PCIE_X1_RC_PF0_PORT_LOGIC_PL_DEBUG0_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_PL_DEBUG0_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_PL_DEBUG0_OFF_0
- Offset: 0x728
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 DEB_REG_0: The value on cxpl_debug_info[31:0].
- PCIE_X<i>_RC_PF0_PORT_LOGIC_PL_DEBUG1_OFF_0
where <i> = 1, 4, 8. Description: This register holds cxpl_debug_info[63:32].
- PCIE_X1_RC_PF0_PORT_LOGIC_PL_DEBUG1_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_PL_DEBUG1_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_PL_DEBUG1_OFF_0

- PCIe x1/x4/x8 Root Complex
- Offset: 0x72c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 DEB_REG_1: The value on cxpl_debug_info[63:32].
- PCIE_X<i>_RC_PF0_PORT_LOGIC_TX_P_FC_CREDIT_STATUS_OFF_0
where <i> = 1, 4, 8. Description: This register provides transmit posted FC credit status.
- PCIE_X1_RC_PF0_PORT_LOGIC_TX_P_FC_CREDIT_STATUS_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_TX_P_FC_CREDIT_STATUS_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_TX_P_FC_CREDIT_STATUS_OFF_0
- Offset: 0x730
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:28 0x0 RSVDP_TX_P_FC_CREDIT_STATUS: Reserved for future use. 27:16 0x0 TX_P_HEADER_FC_CREDIT:
- Transmit Posted Header FC Credits. - The posted Header credits advertised by
the receiver at the other end of the link, updated with each UpdateFC DLLP. -
- Default value depends on the number of advertised credits for header and data
- Scaled Flow Control: [4'b0, xtlh_xadm_ph_cdts, xtlh_xadm_pd_cdts]; When
the number of advertised posted credits (both header and data) are infinite, then the default would be [4'b0, 12'hFFF, 16'hFFFF]. - No Scaling: [12'b0, xtlh_xadm_ph_cdts, xtlh_xadm_pd_cdts]; When the number of advertised posted credits (both header and data) are infinite, then the default would be [12'b0, 8'hFF, 12'hFFF].

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
15:0 0x0 TX_P_DATA_FC_CREDIT:
- Transmit Posted Data FC Credits. - The posted Data credits advertised by the
receiver at the other end of the link, updated with each UpdateFC DLLP. -
- Default value depends on the number of advertised credits for header and data
- Scaled Flow Control: [4'b0, xtlh_xadm_ph_cdts, xtlh_xadm_pd_cdts]; When
the number of advertised posted credits (both header and data) are infinite, then the default would be [4'b0, 12'hFFF, 16'hFFFF]. - No Scaling: [12'b0, xtlh_xadm_ph_cdts, xtlh_xadm_pd_cdts]; When the number of advertised posted credits (both header and data) are infinite, then the default would be [12'b0, 8'hFF, 12'hFFF].
- PCIE_X<i>_RC_PF0_PORT_LOGIC_TX_NP_FC_CREDIT_STATUS_OFF_0
where <i> = 1, 4, 8. Description: This register provides the transmit Non-Posted FC credit status.
- PCIE_X1_RC_PF0_PORT_LOGIC_TX_NP_FC_CREDIT_STATUS_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_TX_NP_FC_CREDIT_STATUS_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_TX_NP_FC_CREDIT_STATUS_OFF_0
- Offset: 0x734
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:28 0x0 RSVDP_TX_NP_FC_CREDIT_STATUS: Reserved for future use. 27:16 0x0 TX_NP_HEADER_FC_CREDIT:
- Transmit Non-Posted Header FC Credits. - The non-posted Header credits
advertised by the receiver at the other end of the link, updated with each
- UpdateFC DLLP. - Default value depends on the number of advertised credits
for header and data - Scaled Flow Control: [4'b0, xtlh_xadm_nph_cdts, xtlh_xadm_npd_cdts]; When the number of advertised non-posted credits (both header and data) are infinite, then the default would be [4'b0, 12'hFFF, 16'hFFFF]. - No Scaling: [12'b0, xtlh_xadm_nph_cdts, xtlh_xadm_npd_cdts];
- When the number of advertised non-posted credits (both header and data) are
infinite, then the default would be [12'b0, 8'hFF, 12'hFFF].

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
15:0 0x0 TX_NP_DATA_FC_CREDIT:
- Transmit Non-Posted Data FC Credits. - The non-posted Data credits
advertised by the receiver at the other end of the link, updated with each
- UpdateFC DLLP. - Default value depends on the number of advertised credits
for header and data - Scaled Flow Control: [4'b0, xtlh_xadm_nph_cdts, xtlh_xadm_npd_cdts]; When the number of advertised non-posted credits (both header and data) are infinite, then the default would be [4'b0, 12'hFFF, 16'hFFFF]. - No Scaling: [12'b0, xtlh_xadm_nph_cdts, xtlh_xadm_npd_cdts];
- When the number of advertised non-posted credits (both header and data) are
infinite, then the default would be [12'b0, 8'hFF, 12'hFFF].
- PCIE_X<i>_RC_PF0_PORT_LOGIC_TX_CPL_FC_CREDIT_STATUS_OFF_0
where <i> = 1, 4, 8. Description: This register provides transmit completion FC credit status.
- PCIE_X1_RC_PF0_PORT_LOGIC_TX_CPL_FC_CREDIT_STATUS_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_TX_CPL_FC_CREDIT_STATUS_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_TX_CPL_FC_CREDIT_STATUS_OFF_0
- Offset: 0x738
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:28 0x0 RSVDP_TX_CPL_FC_CREDIT_STATUS: Reserved for future use. 27:16 0x0 TX_CPL_HEADER_FC_CREDIT:
- Transmit Completion Header FC Credits. - The Completion Header credits
advertised by the receiver at the other end of the link, updated with each
- UpdateFC DLLP. - Default value depends on the number of advertised credits
for header and data - Scaled Flow Control: [4'b0, xtlh_xadm_cplh_cdts, xtlh_xadm_cpld_cdts]; When the number of advertised completion credits (both header and data) are infinite, then the default would be [4'b0, 12'hFFF, 16'hFFFF]. - No Scaling: [12'b0, xtlh_xadm_cplh_cdts, xtlh_xadm_cpld_cdts];
- When the number of advertised completion credits (both header and data) are
infinite, then the default would be [12'b0, 8'hFF, 12'hFFF].

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
15:0 0x0 TX_CPL_DATA_FC_CREDIT:
- Transmit Completion Data FC Credits. - The Completion Data credits advertised
by the receiver at the other end of the link, updated with each UpdateFC DLLP.
- Default value depends on the number of advertised credits for header and
data - Scaled Flow Control: [4'b0, xtlh_xadm_cplh_cdts, xtlh_xadm_cpld_cdts];
- When the number of advertised completion credits (both header and data) are
infinite, then the default would be [4'b0, 12'hFFF, 16'hFFFF]. - No Scaling: [12'b0, xtlh_xadm_cplh_cdts, xtlh_xadm_cpld_cdts]; When the number of advertised completion credits (both header and data) are infinite, then the default would be [12'b0, 8'hFF, 12'hFFF].
- PCIE_X<i>_RC_PF0_PORT_LOGIC_QUEUE_STATUS_OFF_0
where <i> = 1, 4, 8. Description: This register provides the queue status.
- PCIE_X1_RC_PF0_PORT_LOGIC_QUEUE_STATUS_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_QUEUE_STATUS_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_QUEUE_STATUS_OFF_0
- Offset: 0x73c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,xx00,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RW
0x0 TIMER_MOD_FLOW_CONTROL_EN: FC Latency Timer Override Enable. Note: This register field is sticky. 30:29
- RO
0x0 RSVDP_29: Reserved for future use. 28:16
- RW
0x0 TIMER_MOD_FLOW_CONTROL:
- FC Latency Timer Override Value. When you set the "FC Latency
- Timer Override Enable" in this register, the value in this field will
override the FC latency timer value that the controller calculates according to the PCIe specification. For more details, see "Flow Control" in the Databook. Note: This register field is sticky.
- RO
0x0 RX_SERIALIZATION_Q_NON_EMPTY: Receive Serialization Queue Not Empty. 12:4
- RO
0x0 RSVDP_4: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x0 RX_QUEUE_OVERFLOW: Receive Credit Queue Overflow.
- RO
0x0 RX_QUEUE_NON_EMPTY: Receive Credit Queue Not Empty.
- RO
0x0 TX_RETRY_BUFFER_NE: Transmit Retry Buffer Not Empty.
- RO
0x0 RX_TLP_FC_CREDIT_NON_RETURN: Received TLP FC Credits Not Returned.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_VC_TX_ARBI_1_OFF_0
where <i> = 1, 4, 8. Description: This register is used for setting the WRR weights for VC0 - VC3.
- PCIE_X1_RC_PF0_PORT_LOGIC_VC_TX_ARBI_1_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_VC_TX_ARBI_1_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_VC_TX_ARBI_1_OFF_0
- Offset: 0x740
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0000000f (0b0000,0000,0000,0000,0000,0000,0000,1111)
- Bit
- Reset
- Description
31:24 0x0 WRR_WEIGHT_VC_3:
- WRR Weight for VC3. Note: The access attributes of this field are as
follows: - Wire: No access. - Dbi: R 23:16 0x0 WRR_WEIGHT_VC_2:
- WRR Weight for VC2. Note: The access attributes of this field are as
follows: - Wire: No access. - Dbi: R 15:8 0x0 WRR_WEIGHT_VC_1:
- WRR Weight for VC1. Note: The access attributes of this field are as
follows: - Wire: No access. - Dbi: R 7:0 0xf WRR_WEIGHT_VC_0:
- WRR Weight for VC0. Note: The access attributes of this field are as
follows: - Wire: No access. - Dbi: R

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_PORT_LOGIC_VC_TX_ARBI_2_OFF_0
where <i> = 1, 4, 8. Description: This register is used for setting the WRR weights for VC4 - VC7.
- PCIE_X1_RC_PF0_PORT_LOGIC_VC_TX_ARBI_2_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_VC_TX_ARBI_2_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_VC_TX_ARBI_2_OFF_0
- Offset: 0x744
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:24 0x0 WRR_WEIGHT_VC_7:
- WRR Weight for VC7. Note: The access attributes of this field are as
follows: - Wire: No access. - Dbi: R 23:16 0x0 WRR_WEIGHT_VC_6:
- WRR Weight for VC6. Note: The access attributes of this field are as
follows: - Wire: No access. - Dbi: R 15:8 0x0 WRR_WEIGHT_VC_5:
- WRR Weight for VC5. Note: The access attributes of this field are as
follows: - Wire: No access. - Dbi: R 7:0 0x0 WRR_WEIGHT_VC_4:
- WRR Weight for VC4. Note: The access attributes of this field are as
follows: - Wire: No access. - Dbi: R
- PCIE_X<i>_RC_PF0_PORT_LOGIC_VC0_P_RX_Q_CTRL_OFF_0
where <i> = 1, 4, 8. Description: This register controls segmented-buffer VC0 posted receive queue operation.
- Offset: 0x748
- Read/Write: R/W
- Parity Protection: N

- PCIe x1/x4/x8 Root Complex
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_PORT_LOGIC_VC0_P_RX_Q_CTRL_OFF_0
- Reset: 0x4523b070 (0b0100,0101,0010,0011,1011,0000,0111,0000)
- Bit
- Reset
- Description
0x0 VC_ORDERING_RX_Q:
- VC Ordering for Receive Queues. Determines the VC ordering rule for the
receive queues, used only in the segmented-buffer configuration: Note: This register field is sticky. 0x1 TLP_TYPE_ORDERING_VC0:
- TLP Type Ordering for VC0. Determines the TLP type ordering rule for VC0
receive queues, used only in the segmented-buffer configuration: Note: This register field is sticky. 29:28 0x0 RESERVED5: Reserved. Note: This register field is sticky. 27:26 0x1 VC0_P_DATA_SCALE: VC0 Scale Posted Data Credits. Note: This register field is sticky. 25:24 0x1 VC0_P_HDR_SCALE: VC0 Scale Posted Header Credits. Note: This register field is sticky. 23:21 0x1 VC0_P_TLP_Q_MODE: Reserved. Note: This register field is sticky. 0x0 RESERVED4: Reserved. Note: This register field is sticky. 19:12 0x3b VC0_P_HEADER_CREDIT:
- VC0 Posted Header Credits. The number of initial posted header credits for
- VC0, used only in the segmented-buffer configuration. Note: The access
attributes of this field are as follows: - Wire: No access. - Dbi: R (sticky) Note: This register field is sticky. 11:0 0x70 VC0_P_DATA_CREDIT:
- VC0 Posted Data Credits. The number of initial posted data credits for VC0,
used only in the segmented-buffer configuration. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R (sticky) Note: This register field is sticky.
- PCIE_X4_RC_PF0_PORT_LOGIC_VC0_P_RX_Q_CTRL_OFF_0
- Reset: 0x4622c140 (0b0100,0110,0010,0010,1100,0001,0100,0000)
- Bit
- Reset
- Description
0x0 VC_ORDERING_RX_Q:
- VC Ordering for Receive Queues. Determines the VC ordering rule for the
receive queues, used only in the segmented-buffer configuration: Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
0x1 TLP_TYPE_ORDERING_VC0:
- TLP Type Ordering for VC0. Determines the TLP type ordering rule for VC0
receive queues, used only in the segmented-buffer configuration: Note: This register field is sticky. 29:28 0x0 RESERVED5: Reserved. Note: This register field is sticky. 27:26 0x1 VC0_P_DATA_SCALE: VC0 Scale Posted Data Credits. Note: This register field is sticky. 25:24 0x2 VC0_P_HDR_SCALE: VC0 Scale Posted Header Credits. Note: This register field is sticky. 23:21 0x1 VC0_P_TLP_Q_MODE: Reserved. Note: This register field is sticky. 0x0 RESERVED4: Reserved. Note: This register field is sticky. 19:12 0x2c VC0_P_HEADER_CREDIT:
- VC0 Posted Header Credits. The number of initial posted header credits for
- VC0, used only in the segmented-buffer configuration. Note: The access
attributes of this field are as follows: - Wire: No access. - Dbi: R (sticky) Note: This register field is sticky. 11:0 0x140 VC0_P_DATA_CREDIT:
- VC0 Posted Data Credits. The number of initial posted data credits for VC0,
used only in the segmented-buffer configuration. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R (sticky) Note: This register field is sticky.
- PCIE_X8_RC_PF0_PORT_LOGIC_VC0_P_RX_Q_CTRL_OFF_0
- Reset: 0x46258260 (0b0100,0110,0010,0101,1000,0010,0110,0000)
- Bit
- Reset
- Description
0x0 VC_ORDERING_RX_Q:
- VC Ordering for Receive Queues. Determines the VC ordering rule for the
receive queues, used only in the segmented-buffer configuration: Note: This register field is sticky. 0x1 TLP_TYPE_ORDERING_VC0:
- TLP Type Ordering for VC0. Determines the TLP type ordering rule for VC0
receive queues, used only in the segmented-buffer configuration: Note: This register field is sticky. 29:28 0x0 RESERVED5: Reserved. Note: This register field is sticky. 27:26 0x1 VC0_P_DATA_SCALE: VC0 Scale Posted Data Credits. Note: This register field is sticky. 25:24 0x2 VC0_P_HDR_SCALE: VC0 Scale Posted Header Credits. Note: This register field is sticky. 23:21 0x1 VC0_P_TLP_Q_MODE: Reserved. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
0x0 RESERVED4: Reserved. Note: This register field is sticky. 19:12 0x58 VC0_P_HEADER_CREDIT:
- VC0 Posted Header Credits. The number of initial posted header credits for
- VC0, used only in the segmented-buffer configuration. Note: The access
attributes of this field are as follows: - Wire: No access. - Dbi: R (sticky) Note: This register field is sticky. 11:0 0x260 VC0_P_DATA_CREDIT:
- VC0 Posted Data Credits. The number of initial posted data credits for VC0,
used only in the segmented-buffer configuration. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R (sticky) Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_VC0_NP_RX_Q_CTRL_OFF_0
where <i> = 1, 4, 8. Description: This register controls the segmented-buffer VC0 non-posted receive queue operation.
- Offset: 0x74c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_PORT_LOGIC_VC0_NP_RX_Q_CTRL_OFF_0
- Reset: 0x0523b00e (0b0000,0101,0010,0011,1011,0000,0000,1110)
- Bit
- Reset
- Description
31:28 0x0 RESERVED7: Reserved. Note: This register field is sticky. 27:26 0x1 VC0_NP_DATA_SCALE: VC0 Scale Non-Posted Data Credits. Note: This register field is sticky. 25:24 0x1 VC0_NP_HDR_SCALE: VC0 Scale Non-Posted Header Credits. Note: This register field is sticky. 23:21 0x1 VC0_NP_TLP_Q_MODE: Reserved. Note: This register field is sticky. 0x0 RESERVED6: Reserved. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
19:12 0x3b VC0_NP_HEADER_CREDIT:
- VC0 Non-Posted Header Credits. The number of initial non-posted header
credits for VC0, used only in the segmented-buffer configuration. Note:
- The access attributes of this field are as follows: - Wire: No access. - Dbi: R
(sticky) Note: This register field is sticky. 11:0 0xe VC0_NP_DATA_CREDIT:
- VC0 Non-Posted Data Credits. The number of initial non-posted data
credits for VC0, used only in the segmented-buffer configuration. Note:
- The access attributes of this field are as follows: - Wire: No access. - Dbi: R
(sticky) Note: This register field is sticky.
- PCIE_X4_RC_PF0_PORT_LOGIC_VC0_NP_RX_Q_CTRL_OFF_0
- Reset: 0x0622c02c (0b0000,0110,0010,0010,1100,0000,0010,1100)
- Bit
- Reset
- Description
31:28 0x0 RESERVED7: Reserved. Note: This register field is sticky. 27:26 0x1 VC0_NP_DATA_SCALE: VC0 Scale Non-Posted Data Credits. Note: This register field is sticky. 25:24 0x2 VC0_NP_HDR_SCALE: VC0 Scale Non-Posted Header Credits. Note: This register field is sticky. 23:21 0x1 VC0_NP_TLP_Q_MODE: Reserved. Note: This register field is sticky. 0x0 RESERVED6: Reserved. Note: This register field is sticky. 19:12 0x2c VC0_NP_HEADER_CREDIT:
- VC0 Non-Posted Header Credits. The number of initial non-posted header
credits for VC0, used only in the segmented-buffer configuration. Note:
- The access attributes of this field are as follows: - Wire: No access. - Dbi: R
(sticky) Note: This register field is sticky. 11:0 0x2c VC0_NP_DATA_CREDIT:
- VC0 Non-Posted Data Credits. The number of initial non-posted data
credits for VC0, used only in the segmented-buffer configuration. Note:
- The access attributes of this field are as follows: - Wire: No access. - Dbi: R
(sticky) Note: This register field is sticky.
- PCIE_X8_RC_PF0_PORT_LOGIC_VC0_NP_RX_Q_CTRL_OFF_0
- Reset: 0x06258058 (0b0000,0110,0010,0101,1000,0000,0101,1000)
- Bit
- Reset
- Description
31:28 0x0 RESERVED7: Reserved. Note: This register field is sticky. 27:26 0x1 VC0_NP_DATA_SCALE: VC0 Scale Non-Posted Data Credits. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
25:24 0x2 VC0_NP_HDR_SCALE: VC0 Scale Non-Posted Header Credits. Note: This register field is sticky. 23:21 0x1 VC0_NP_TLP_Q_MODE: Reserved. Note: This register field is sticky. 0x0 RESERVED6: Reserved. Note: This register field is sticky. 19:12 0x58 VC0_NP_HEADER_CREDIT:
- VC0 Non-Posted Header Credits. The number of initial non-posted header
credits for VC0, used only in the segmented-buffer configuration. Note:
- The access attributes of this field are as follows: - Wire: No access. - Dbi: R
(sticky) Note: This register field is sticky. 11:0 0x58 VC0_NP_DATA_CREDIT:
- VC0 Non-Posted Data Credits. The number of initial non-posted data
credits for VC0, used only in the segmented-buffer configuration. Note:
- The access attributes of this field are as follows: - Wire: No access. - Dbi: R
(sticky) Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_VC0_CPL_RX_Q_CTRL_OFF_0
where <i> = 1, 4, 8. Description: This register controls the segmented-buffer VC0 completion receive queue operation.
- Offset: 0x750
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_PORT_LOGIC_VC0_CPL_RX_Q_CTRL_OFF_0
- Reset: 0x05200000 (0b0000,0101,0010,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:28 0x0 RESERVED9: Reserved. Note: This register field is sticky. 27:26 0x1 VC0_CPL_DATA_SCALE: VC0 Scale CPL Data Credits. Note: This register field is sticky. 25:24 0x1 VC0_CPL_HDR_SCALE: VC0 Scale CPL Header Credits. Note: This register field is sticky. 23:21 0x1 VC0_CPL_TLP_Q_MODE: Reserved. Note: This register field is sticky. 0x0 RESERVED8: Reserved. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
19:12 0x0 VC0_CPL_HEADER_CREDIT:
- VC0 Completion Header Credits. The number of initial Completion header
credits for VC0, used only in the segmented-buffer configuration. Note:
- The access attributes of this field are as follows: - Wire: No access. - Dbi: R
(sticky) Note: This register field is sticky. 11:0 0x0 VC0_CPL_DATA_CREDIT:
- VC0 Completion Data Credits. The number of initial Completion data
credits for VC0, used only in the segmented-buffer configuration. Note:
- The access attributes of this field are as follows: - Wire: No access. - Dbi: R
(sticky) Note: This register field is sticky.
- PCIE_X4_RC_PF0_PORT_LOGIC_VC0_CPL_RX_Q_CTRL_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_VC0_CPL_RX_Q_CTRL_OFF_0
- Reset: 0x06200000 (0b0000,0110,0010,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:28 0x0 RESERVED9: Reserved. Note: This register field is sticky. 27:26 0x1 VC0_CPL_DATA_SCALE: VC0 Scale CPL Data Credits. Note: This register field is sticky. 25:24 0x2 VC0_CPL_HDR_SCALE: VC0 Scale CPL Header Credits. Note: This register field is sticky. 23:21 0x1 VC0_CPL_TLP_Q_MODE: Reserved. Note: This register field is sticky. 0x0 RESERVED8: Reserved. Note: This register field is sticky. 19:12 0x0 VC0_CPL_HEADER_CREDIT:
- VC0 Completion Header Credits. The number of initial Completion header
credits for VC0, used only in the segmented-buffer configuration. Note:
- The access attributes of this field are as follows: - Wire: No access. - Dbi: R
(sticky) Note: This register field is sticky. 11:0 0x0 VC0_CPL_DATA_CREDIT:
- VC0 Completion Data Credits. The number of initial Completion data
credits for VC0, used only in the segmented-buffer configuration. Note:
- The access attributes of this field are as follows: - Wire: No access. - Dbi: R
(sticky) Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_GEN2_CTRL_OFF_0
where <i> = 1, 4, 8. Description: This register controls various functions of the controller related to link training, lane reversal, and equalization.

- PCIe x1/x4/x8 Root Complex
- Offset: 0x80c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_PORT_LOGIC_GEN2_CTRL_OFF_0
- Reset: 0x00020134 (0b0xxx,xxxx,0000,0010,0000,0001,0011,0100)
- Bit
R/W
- Reset
- Description
- RO
0x0 RSVDP_31: Reserved for future use.
- RW
0x0 SELECTABLE_DEEMPH_BIT_MUX:
- The selectable deemphasis bit (Symbol 4 bit 6) of the transmitted TS2
- Ordered Sets for DSP in Recovery.RcvrCfg state is muxed between the
- Selectable De-emphasis field in the Link Control 2 register and the value
requested by USP in Recovery.RcvrLock state through Tx TS1s from USP. Note: This register field is sticky.
- RW
0x0 SELECT_DEEMPH_VAR_MUX:
- The select_deemphasis variable for DSP on entry to Recovery.RcvrCfg
state is muxed between the Selectable De-emphasis field in the Link
- Control 2 register and the value requested by the Upstream Port in the
eight consecutive TS1 Ordered Sets it received. Note: This register field is sticky.
- RW
0x0 GEN1_EI_INFERENCE:
- Electrical Idle Inference Mode at Gen1 Rate. Programmable mode to
determine inferred electrical idle (EI) in Recovery.Speed or Loopback.Active (as slave) state at Gen1 speed by looking for a '1' value on RxElecIdle instead of looking for a '0' on RxValid. If the PHY fails to deassert the
- RxValid signal in Recovery.Speed or Loopback.Active (because of
corrupted EIOS for example), then EI cannot be inferred successfully in the controller by just detecting the condition RxValid=0. Note: This register field is sticky.
- RW
0x0 SEL_DEEMPHASIS:
- Used to set the de-emphasis level for upstream ports. This bit selects the
level of de-emphasis the link operates at. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky.
- RW
0x0 CONFIG_TX_COMP_RX:
- Config Tx Compliance Receive Bit. Note: The access attributes of this field
are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky.
- RW
0x0 CONFIG_PHY_TX_CHANGE: Config PHY Tx Swing. Controls the PHY transmitter voltage swing level.
- The controller drives the mac_phy_txswing output from this register bit
field. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x1 DIRECT_SPEED_CHANGE:
- Directed Speed Change. When the speed change occurs, the controller will
clear the contents of this field; and a read to this field by your software will return a '0'. To manually initiate the speed change: - Write to
- LINK_CONTROL2_LINK_STATUS2_REG.PCIE_CAP_TARGET_LINK_SPEED in
the local device - Deassert this field - Assert this field If you set the default of this field using the DEFAULT_GEN2_SPEED_CHANGE configuration parameter to '1', then the speed change is initiated automatically after link up, and the controller clears the contents of this field. If you want to prevent this automatic speed change, then write a lower speed value to the Target Link Speed field of the Link Control 2 register (LINK_CONTROL2_LINK_STATUS2_OFF.PCIE_CAP_TARGET_LINK_SPEED) through the DBI before link up. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W
- RW
0x0 AUTO_LANE_FLIP_CTRL_EN:
- Enable Auto flipping of the lanes. You must set the
- CX_AUTO_LANE_FLIP_CTRL_EN configuration parameter to include the
hardware for this feature in the controller. For more details, see the 'Lane
- Reversal' appendix in the Databook. Note: The access attributes of this
field are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky. 15:13
- RW
0x0 PRE_DET_LANE:
- Predetermined Lane for Auto Flip. This field defines which physical lane is
connected to logical Lane0 by the flip operation performed in Detect. This field is used to restrict the receiver detect procedure to a particular lane when the default detect and polling procedure performed on all lanes cannot be successful. A notable example of when it is useful to program this field to a value different from the default, is when a lane is asymmetrically broken, that is, it is detected in Detect LTSSM state but it cannot exit Electrical Idle in Polling LTSSM state. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky. 12:8
- RW
0x1 NUM_OF_LANES:
- Predetermined Number of Lanes. Defines the number of lanes which are
connected and not bad. Used to limit the effective link width to ignore 'broken" or "unused" lanes that detect a receiver. Indicates the number of lanes to check for exit from Electrical Idle in Polling.Active and L2.Idle. It is possible that the LTSSM might detect a receiver on a bad or broken lane during the Detect Substate. However, it is also possible that such a lane might also fail to exit Electrical Idle and therefore prevent a valid link from being configured. This value is referred to as the "Predetermined Number of Lanes" in section 4.2.6.2.1 of the PCI Express Base Specification. When you have unused lanes in your system, then you must change the value in this register to reflect the number of lanes. You must also change the value in the "Link Mode Enable" field of PORT_LINK_CTRL_OFF. The value in this register is normally the same as the encoded value in
- PORT_LINK_CTRL_OFF. If you find that one of your used lanes is bad then
you must reduce the value in this register. For more information, see "How to Tie Off Unused Lanes" in the Databook. For information on upsizing and downsizing the link width, see "Link Establishment" in the Databook. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
7:0
- RW
0x34 FAST_TRAINING_SEQ:
- Sets the Number of Fast Training Sequences (N_FTS) that the controller
advertises as its N_FTS during Gen2 or Gen3 link training. This value is used to inform the link partner about the PHY's ability to recover synchronization after a low power state. The number should be provided by the PHY vendor. Do not set N_FTS to zero; doing so can cause the
- LTSSM to go into the recovery state when exiting from L0s. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky.
- PCIE_X4_RC_PF0_PORT_LOGIC_GEN2_CTRL_OFF_0
- Reset: 0x00030434 (0b00xx,0000,0000,0011,0000,0100,0011,0100)
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
- RO
0x0 RSVDP_31: Reserved for future use.
- RW
0x0 FORCE_LANE_FLIP: Enable to force the LANE_UNDER_TEST physical lane flips to logical lane 0.
- All the other physical lanes are turned off. The LINK_CAPABLE register
must be set to 1 and only x1 link can be formed if the FORCE_LANE_FLIP register is set to 1. Note: The access attributes of this field are as follows:
- Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky.
27:24
- RW
0x0 LANE_UNDER_TEST: The Lane Under Test is the lane for Forced Lane Flip or for Loopback Eq.
- Only one lane is configured each time. The default of this field is the
- CX_DEFAULT_LANE_UNDER_TEST configuration parameter. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky.
- RW
0x0 SELECTABLE_DEEMPH_BIT_MUX:
- The selectable deemphasis bit (Symbol 4 bit 6) of the transmitted TS2
- Ordered Sets for DSP in Recovery.RcvrCfg state is muxed between the
- Selectable De-emphasis field in the Link Control 2 register and the value
requested by USP in Recovery.RcvrLock state through Tx TS1s from USP. Note: This register field is sticky.
- RW
0x0 SELECT_DEEMPH_VAR_MUX:
- The select_deemphasis variable for DSP on entry to Recovery.RcvrCfg
state is muxed between the Selectable De-emphasis field in the Link
- Control 2 register and the value requested by the Upstream Port in the
eight consecutive TS1 Ordered Sets it received. Note: This register field is sticky.
- RW
0x0 GEN1_EI_INFERENCE:
- Electrical Idle Inference Mode at Gen1 Rate. Programmable mode to
determine inferred electrical idle (EI) in Recovery.Speed or Loopback.Active (as slave) state at Gen1 speed by looking for a '1' value on RxElecIdle instead of looking for a '0' on RxValid. If the PHY fails to deassert the
- RxValid signal in Recovery.Speed or Loopback.Active (because of
corrupted EIOS for example), then EI cannot be inferred successfully in the controller by just detecting the condition RxValid=0. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
- RW
0x0 SEL_DEEMPHASIS:
- Used to set the de-emphasis level for upstream ports. This bit selects the
level of de-emphasis the link operates at. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky.
- RW
0x0 CONFIG_TX_COMP_RX:
- Config Tx Compliance Receive Bit. Note: The access attributes of this field
are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky.
- RW
0x0 CONFIG_PHY_TX_CHANGE: Config PHY Tx Swing. Controls the PHY transmitter voltage swing level.
- The controller drives the mac_phy_txswing output from this register bit
field. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky.
- RW
0x1 DIRECT_SPEED_CHANGE:
- Directed Speed Change. When the speed change occurs, the controller will
clear the contents of this field; and a read to this field by your software will return a '0'. To manually initiate the speed change: - Write to
- LINK_CONTROL2_LINK_STATUS2_REG.PCIE_CAP_TARGET_LINK_SPEED in
the local device - Deassert this field - Assert this field If you set the default of this field using the DEFAULT_GEN2_SPEED_CHANGE configuration parameter to '1', then the speed change is initiated automatically after link up, and the controller clears the contents of this field. If you want to prevent this automatic speed change, then write a lower speed value to the Target Link Speed field of the Link Control 2 register (LINK_CONTROL2_LINK_STATUS2_OFF.PCIE_CAP_TARGET_LINK_SPEED) through the DBI before link up. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W
- RW
0x1 AUTO_LANE_FLIP_CTRL_EN:
- Enable Auto flipping of the lanes. You must set the
- CX_AUTO_LANE_FLIP_CTRL_EN configuration parameter to include the
hardware for this feature in the controller. For more details, see the 'Lane
- Reversal' appendix in the Databook. Note: The access attributes of this
field are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky. 15:13
- RW
0x0 PRE_DET_LANE:
- Predetermined Lane for Auto Flip. This field defines which physical lane is
connected to logical Lane0 by the flip operation performed in Detect. This field is used to restrict the receiver detect procedure to a particular lane when the default detect and polling procedure performed on all lanes cannot be successful. A notable example of when it is useful to program this field to a value different from the default, is when a lane is asymmetrically broken, that is, it is detected in Detect LTSSM state but it cannot exit Electrical Idle in Polling LTSSM state. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
12:8
- RW
0x4 NUM_OF_LANES:
- Predetermined Number of Lanes. Defines the number of lanes which are
connected and not bad. Used to limit the effective link width to ignore 'broken" or "unused" lanes that detect a receiver. Indicates the number of lanes to check for exit from Electrical Idle in Polling.Active and L2.Idle. It is possible that the LTSSM might detect a receiver on a bad or broken lane during the Detect Substate. However, it is also possible that such a lane might also fail to exit Electrical Idle and therefore prevent a valid link from being configured. This value is referred to as the "Predetermined Number of Lanes" in section 4.2.6.2.1 of the PCI Express Base Specification. When you have unused lanes in your system, then you must change the value in this register to reflect the number of lanes. You must also change the value in the "Link Mode Enable" field of PORT_LINK_CTRL_OFF. The value in this register is normally the same as the encoded value in
- PORT_LINK_CTRL_OFF. If you find that one of your used lanes is bad then
you must reduce the value in this register. For more information, see "How to Tie Off Unused Lanes" in the Databook. For information on upsizing and downsizing the link width, see "Link Establishment" in the Databook. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky. 7:0
- RW
0x34 FAST_TRAINING_SEQ:
- Sets the Number of Fast Training Sequences (N_FTS) that the controller
advertises as its N_FTS during Gen2 or Gen3 link training. This value is used to inform the link partner about the PHY's ability to recover synchronization after a low power state. The number should be provided by the PHY vendor. Do not set N_FTS to zero; doing so can cause the
- LTSSM to go into the recovery state when exiting from L0s. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky.
- PCIE_X8_RC_PF0_PORT_LOGIC_GEN2_CTRL_OFF_0
- Reset: 0x00030834 (0b00xx,0000,0000,0011,0000,1000,0011,0100)
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
- RO
0x0 RSVDP_31: Reserved for future use.
- RW
0x0 FORCE_LANE_FLIP: Enable to force the LANE_UNDER_TEST physical lane flips to logical lane 0.
- All the other physical lanes are turned off. The LINK_CAPABLE register
must be set to 1 and only x1 link can be formed if the FORCE_LANE_FLIP register is set to 1. Note: The access attributes of this field are as follows:
- Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky.
27:24
- RW
0x0 LANE_UNDER_TEST: The Lane Under Test is the lane for Forced Lane Flip or for Loopback Eq.
- Only one lane is configured each time. The default of this field is the
- CX_DEFAULT_LANE_UNDER_TEST configuration parameter. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
- RW
0x0 SELECTABLE_DEEMPH_BIT_MUX:
- The selectable deemphasis bit (Symbol 4 bit 6) of the transmitted TS2
- Ordered Sets for DSP in Recovery.RcvrCfg state is muxed between the
- Selectable De-emphasis field in the Link Control 2 register and the value
requested by USP in Recovery.RcvrLock state through Tx TS1s from USP. Note: This register field is sticky.
- RW
0x0 SELECT_DEEMPH_VAR_MUX:
- The select_deemphasis variable for DSP on entry to Recovery.RcvrCfg
state is muxed between the Selectable De-emphasis field in the Link
- Control 2 register and the value requested by the Upstream Port in the
eight consecutive TS1 Ordered Sets it received. Note: This register field is sticky.
- RW
0x0 GEN1_EI_INFERENCE:
- Electrical Idle Inference Mode at Gen1 Rate. Programmable mode to
determine inferred electrical idle (EI) in Recovery.Speed or Loopback.Active (as slave) state at Gen1 speed by looking for a '1' value on RxElecIdle instead of looking for a '0' on RxValid. If the PHY fails to deassert the
- RxValid signal in Recovery.Speed or Loopback.Active (because of
corrupted EIOS for example), then EI cannot be inferred successfully in the controller by just detecting the condition RxValid=0. Note: This register field is sticky.
- RW
0x0 SEL_DEEMPHASIS:
- Used to set the de-emphasis level for upstream ports. This bit selects the
level of de-emphasis the link operates at. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky.
- RW
0x0 CONFIG_TX_COMP_RX:
- Config Tx Compliance Receive Bit. Note: The access attributes of this field
are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky.
- RW
0x0 CONFIG_PHY_TX_CHANGE: Config PHY Tx Swing. Controls the PHY transmitter voltage swing level.
- The controller drives the mac_phy_txswing output from this register bit
field. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky.
- RW
0x1 DIRECT_SPEED_CHANGE:
- Directed Speed Change. When the speed change occurs, the controller will
clear the contents of this field; and a read to this field by your software will return a '0'. To manually initiate the speed change: - Write to
- LINK_CONTROL2_LINK_STATUS2_REG.PCIE_CAP_TARGET_LINK_SPEED in
the local device - Deassert this field - Assert this field If you set the default of this field using the DEFAULT_GEN2_SPEED_CHANGE configuration parameter to '1', then the speed change is initiated automatically after link up, and the controller clears the contents of this field. If you want to prevent this automatic speed change, then write a lower speed value to the Target Link Speed field of the Link Control 2 register (LINK_CONTROL2_LINK_STATUS2_OFF.PCIE_CAP_TARGET_LINK_SPEED) through the DBI before link up. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
- RW
0x1 AUTO_LANE_FLIP_CTRL_EN:
- Enable Auto flipping of the lanes. You must set the
- CX_AUTO_LANE_FLIP_CTRL_EN configuration parameter to include the
hardware for this feature in the controller. For more details, see the 'Lane
- Reversal' appendix in the Databook. Note: The access attributes of this
field are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky. 15:13
- RW
0x0 PRE_DET_LANE:
- Predetermined Lane for Auto Flip. This field defines which physical lane is
connected to logical Lane0 by the flip operation performed in Detect. This field is used to restrict the receiver detect procedure to a particular lane when the default detect and polling procedure performed on all lanes cannot be successful. A notable example of when it is useful to program this field to a value different from the default, is when a lane is asymmetrically broken, that is, it is detected in Detect LTSSM state but it cannot exit Electrical Idle in Polling LTSSM state. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky. 12:8
- RW
0x8 NUM_OF_LANES:
- Predetermined Number of Lanes. Defines the number of lanes which are
connected and not bad. Used to limit the effective link width to ignore 'broken" or "unused" lanes that detect a receiver. Indicates the number of lanes to check for exit from Electrical Idle in Polling.Active and L2.Idle. It is possible that the LTSSM might detect a receiver on a bad or broken lane during the Detect Substate. However, it is also possible that such a lane might also fail to exit Electrical Idle and therefore prevent a valid link from being configured. This value is referred to as the "Predetermined Number of Lanes" in section 4.2.6.2.1 of the PCI Express Base Specification. When you have unused lanes in your system, then you must change the value in this register to reflect the number of lanes. You must also change the value in the "Link Mode Enable" field of PORT_LINK_CTRL_OFF. The value in this register is normally the same as the encoded value in
- PORT_LINK_CTRL_OFF. If you find that one of your used lanes is bad then
you must reduce the value in this register. For more information, see "How to Tie Off Unused Lanes" in the Databook. For information on upsizing and downsizing the link width, see "Link Establishment" in the Databook. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky. 7:0
- RW
0x34 FAST_TRAINING_SEQ:
- Sets the Number of Fast Training Sequences (N_FTS) that the controller
advertises as its N_FTS during Gen2 or Gen3 link training. This value is used to inform the link partner about the PHY's ability to recover synchronization after a low power state. The number should be provided by the PHY vendor. Do not set N_FTS to zero; doing so can cause the
- LTSSM to go into the recovery state when exiting from L0s. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_PHY_STATUS_OFF_0
where <i> = 1, 4, 8. Description: Memory mapped register from phy_cfg_status GPIO input pins.

- PCIe x1/x4/x8 Root Complex
- PCIE_X1_RC_PF0_PORT_LOGIC_PHY_STATUS_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_PHY_STATUS_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_PHY_STATUS_OFF_0
- Offset: 0x810
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 PHY_STATUS:
- PHY Status. Data received directly from the phy_cfg_status bus. These is a
GPIO register reflecting the values on the static phy_cfg_status input signals.
- The usage is left completely to the user and does not in any way influence
controller functionality. You can use it for any static sideband status signalling requirements that you have for your PHY. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_PHY_CONTROL_OFF_0
where <i> = 1, 4, 8. Description: Memory mapped register to cfg_phy_control GPIO output pins.
- PCIE_X1_RC_PF0_PORT_LOGIC_PHY_CONTROL_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_PHY_CONTROL_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_PHY_CONTROL_OFF_0
- Offset: 0x814
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 PHY_CONTROL:
- PHY Control. Data sent directly to the cfg_phy_control bus. This is a GPIO
register driving the values on the static cfg_phy_control output signals, and does not in any way influence controller functionality. It can be used for any static sideband control signaling requirements that you have for your PHY. This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_PORT_LOGIC_TRGT_MAP_CTRL_OFF_0
where <i> = 1, 4, 8. Description: This register controls the target map.
- Offset: 0x81c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_PORT_LOGIC_TRGT_MAP_CTRL_OFF_0
- Reset: 0x0000007f (0b0000,0000,0000,0000,000x,xxxx,x111,1111)
- Bit
R/W
- Reset
- Description
31:21
- RO
0x0 TARGET_MAP_RESERVED_21_31: Reserved. Note: The access attributes of this field are as follows:
- Wire: No access. - Dbi: R (sticky)
20:16
- RW
0x0 TARGET_MAP_INDEX:
- The number of the PF Function on which the Target Values are
set. This register does not respect the Byte Enable setting, any write will affect all register bits. 15:13
- RO
0x0 TARGET_MAP_RESERVED_13_15: Reserved. Note: The access attributes of this field are as follows:
- Wire: No access. - Dbi: R (sticky)
- RW
0x1 TARGET_MAP_ROM:
- Target Value for the ROM page of the PF Function selected by
the index number. This register does not respect the Byte Enable setting, any write will affect all register bits. 5:0
- RW
0x3f TARGET_MAP_PF:
- Target Values for each BAR on the PF Function selected by the
index number. This register does not respect the Byte Enable setting, any write will affect all register bits.
- PCIE_X4_RC_PF0_PORT_LOGIC_TRGT_MAP_CTRL_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_TRGT_MAP_CTRL_OFF_0
- Reset: 0x0000006b (0b0000,0000,0000,0000,000x,xxxx,x110,1011)
- Bit
R/W
- Reset
- Description
31:21
- RO
0x0 TARGET_MAP_RESERVED_21_31: Reserved. Note: The access attributes of this field are as follows:
- Wire: No access. - Dbi: R (sticky)

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
20:16
- RW
0x0 TARGET_MAP_INDEX:
- The number of the PF Function on which the Target Values are
set. This register does not respect the Byte Enable setting, any write will affect all register bits. 15:13
- RO
0x0 TARGET_MAP_RESERVED_13_15: Reserved. Note: The access attributes of this field are as follows:
- Wire: No access. - Dbi: R (sticky)
- RW
0x1 TARGET_MAP_ROM:
- Target Value for the ROM page of the PF Function selected by
the index number. This register does not respect the Byte Enable setting, any write will affect all register bits. 5:0
- RW
0x2b TARGET_MAP_PF:
- Target Values for each BAR on the PF Function selected by the
index number. This register does not respect the Byte Enable setting, any write will affect all register bits.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_ADDR_OFF_0
where <i> = 1, 4, 8. Description: This register holds the integrated MSI reception module address.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_ADDR_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_ADDR_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_ADDR_OFF_0
- Offset: 0x820
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_ADDR:
- Integrated MSI Reception Module Address. System specified address for MSI
memory write transaction termination. Within the AXI Bridge, every received
- Memory Write request is examined to see if it targets the MSI Address that has
been specified in this register; and also to see if it satisfies the definition of an
- MSI interrupt request. When these conditions are satisfied the Memory Write
request is marked as an MSI request. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_UPPER_ADDR_OFF_0
where <i> = 1, 4, 8. Description: This register holds the integrated MSI reception module upper address.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_UPPER_ADDR_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_UPPER_ADDR_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_UPPER_ADDR_OFF_0
- Offset: 0x824
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_UPPER_ADDR:
- Integrated MSI Reception Module Upper Address. System specified upper
address for MSI memory write transaction termination. Allows functions to support a 64-bit MSI address. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_0_EN_OFF_0
where <i> = 1, 4, 8. Description: This register enables integrated MSI reception module interrupt0.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_0_EN_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_0_EN_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_0_EN_OFF_0
- Offset: 0x828
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_0_EN:
- MSI Interrupt0 Enable. Specifies which interrupts are enabled. When an MSI
is received from a disabled interrupt, no status bit gets set in MSI controller interrupt status register. Each bit corresponds to a single MSI Interrupt Vector. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_0_MASK_OFF_0
where <i> = 1, 4, 8. Description: This register provides information regarding the MSI Interrupt0 mask.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_0_MASK_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_0_MASK_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_0_MASK_OFF_0
- Offset: 0x82c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_0_MASK:
- MSI Interrupt0 Mask. Allows enabled interrupts to be masked. When an MSI
is received for a masked interrupt, the corresponding status bit gets set in the interrupt status register but the msi_ctrl_int output is not set HIGH. Each bit corresponds to a single MSI Interrupt Vector. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_0_STATUS_OFF_0
where <i> = 1, 4, 8. Description: This register provides the MSI Interrupt0 status.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_0_STATUS_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_0_STATUS_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_0_STATUS_OFF_0

- PCIe x1/x4/x8 Root Complex
- Offset: 0x830
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_0_STATUS:
- MSI Interrupt0 Status. When an MSI is detected for EP#i, one bit in this
register is set. The decoding of the data payload of the MSI Memory Write request determines which bit gets set. A status is bit is cleared by writing a 1 to the bit. Each bit corresponds to a single MSI Interrupt Vector.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_1_EN_OFF_0
where <i> = 1, 4, 8. Description: This register enables integrated MSI reception module interrupt1.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_1_EN_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_1_EN_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_1_EN_OFF_0
- Offset: 0x834
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_1_EN:
- MSI Interrupt1 Enable. Specifies which interrupts are enabled. When an MSI
is received from a disabled interrupt, no status bit gets set in MSI controller interrupt status register. Each bit corresponds to a single MSI Interrupt Vector. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_1_MASK_OFF_0
where <i> = 1, 4, 8. Description: This register provides information regarding the MSI Interrupt1 mask.

- PCIe x1/x4/x8 Root Complex
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_1_MASK_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_1_MASK_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_1_MASK_OFF_0
- Offset: 0x838
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_1_MASK:
- MSI Interrupt1 Mask. Allows enabled interrupts to be masked. When an MSI
is received for a masked interrupt, the corresponding status bit gets set in the interrupt status register but the msi_ctrl_int output is not set HIGH. Each bit corresponds to a single MSI Interrupt Vector. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_1_STATUS_OFF_0
where <i> = 1, 4, 8. Description: This register provides the MSI Interrupt1 status.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_1_STATUS_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_1_STATUS_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_1_STATUS_OFF_0
- Offset: 0x83c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_1_STATUS:
- MSI Interrupt1 Status. When an MSI is detected for EP#i, one bit in this
register is set. The decoding of the data payload of the MSI Memory Write request determines which bit gets set. A status is bit is cleared by writing a 1 to the bit. Each bit corresponds to a single MSI Interrupt Vector.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_2_EN_OFF_0
where <i> = 1, 4, 8. Description: This register enables integrated MSI reception module interrupt2.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_2_EN_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_2_EN_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_2_EN_OFF_0
- Offset: 0x840
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_2_EN:
- MSI Interrupt2 Enable. Specifies which interrupts are enabled. When an MSI
is received from a disabled interrupt, no status bit gets set in MSI controller interrupt status register. Each bit corresponds to a single MSI Interrupt Vector. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_2_MASK_OFF_0
where <i> = 1, 4, 8. Description: This register provides information regarding the MSI Interrupt2 mask.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_2_MASK_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_2_MASK_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_2_MASK_OFF_0
- Offset: 0x844
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_2_MASK:
- MSI Interrupt2 Mask. Allows enabled interrupts to be masked. When an MSI
is received for a masked interrupt, the corresponding status bit gets set in the interrupt status register but the msi_ctrl_int output is not set HIGH. Each bit corresponds to a single MSI Interrupt Vector. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_2_STATUS_OFF_0
where <i> = 1, 4, 8. Description: This register provides the MSI Interrupt2 status.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_2_STATUS_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_2_STATUS_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_2_STATUS_OFF_0
- Offset: 0x848
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_2_STATUS:
- MSI Interrupt2 Status. When an MSI is detected for EP#i, one bit in this
register is set. The decoding of the data payload of the MSI Memory Write request determines which bit gets set. A status is bit is cleared by writing a 1 to the bit. Each bit corresponds to a single MSI Interrupt Vector.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_3_EN_OFF_0
where <i> = 1, 4, 8. Description: This register enables integrated MSI reception module interrupt3.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_3_EN_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_3_EN_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_3_EN_OFF_0

- PCIe x1/x4/x8 Root Complex
- Offset: 0x84c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_3_EN:
- MSI Interrupt3 Enable. Specifies which interrupts are enabled. When an MSI
is received from a disabled interrupt, no status bit gets set in MSI controller interrupt status register. Each bit corresponds to a single MSI Interrupt Vector. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_3_MASK_OFF_0
where <i> = 1, 4, 8. Description: This register provides information regarding the MSI Interrupt3 mask.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_3_MASK_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_3_MASK_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_3_MASK_OFF_0
- Offset: 0x850
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_3_MASK:
- MSI Interrupt3 Mask. Allows enabled interrupts to be masked. When an MSI
is received for a masked interrupt, the corresponding status bit gets set in the interrupt status register but the msi_ctrl_int output is not set HIGH. Each bit corresponds to a single MSI Interrupt Vector. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_3_STATUS_OFF_0
where <i> = 1, 4, 8.

- PCIe x1/x4/x8 Root Complex
Description: This register provides the MSI Interrupt3 status.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_3_STATUS_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_3_STATUS_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_3_STATUS_OFF_0
- Offset: 0x854
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_3_STATUS:
- MSI Interrupt3 Status. When an MSI is detected for EP#i, one bit in this
register is set. The decoding of the data payload of the MSI Memory Write request determines which bit gets set. A status is bit is cleared by writing a 1 to the bit. Each bit corresponds to a single MSI Interrupt Vector.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_4_EN_OFF_0
where <i> = 1, 4, 8. Description: This register enables integrated MSI reception module interrupt4.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_4_EN_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_4_EN_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_4_EN_OFF_0
- Offset: 0x858
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_4_EN:
- MSI Interrupt4 Enable. Specifies which interrupts are enabled. When an MSI
is received from a disabled interrupt, no status bit gets set in MSI controller interrupt status register. Each bit corresponds to a single MSI Interrupt Vector. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_4_MASK_OFF_0
where <i> = 1, 4, 8. Description: This register provides information regarding the MSI Interrupt4 mask.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_4_MASK_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_4_MASK_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_4_MASK_OFF_0
- Offset: 0x85c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_4_MASK:
- MSI Interrupt4 Mask. Allows enabled interrupts to be masked. When an MSI
is received for a masked interrupt, the corresponding status bit gets set in the interrupt status register but the msi_ctrl_int output is not set HIGH. Each bit corresponds to a single MSI Interrupt Vector. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_4_STATUS_OFF_0
where <i> = 1, 4, 8. Description: This register provides the MSI Interrupt4 status.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_4_STATUS_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_4_STATUS_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_4_STATUS_OFF_0
- Offset: 0x860
- Read/Write: R/W
- Parity Protection: N
- Shadow: N

- PCIe x1/x4/x8 Root Complex
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_4_STATUS:
- MSI Interrupt4 Status. When an MSI is detected for EP#i, one bit in this
register is set. The decoding of the data payload of the MSI Memory Write request determines which bit gets set. A status is bit is cleared by writing a 1 to the bit. Each bit corresponds to a single MSI Interrupt Vector.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_5_EN_OFF_0
where <i> = 1, 4, 8. Description: This register enables integrated MSI reception module interrupt5.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_5_EN_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_5_EN_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_5_EN_OFF_0
- Offset: 0x864
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_5_EN:
- MSI Interrupt5 Enable. Specifies which interrupts are enabled. When an MSI
is received from a disabled interrupt, no status bit gets set in MSI controller interrupt status register. Each bit corresponds to a single MSI Interrupt Vector. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_5_MASK_OFF_0
where <i> = 1, 4, 8. Description: This register provides information regarding the MSI Interrupt5 mask.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_5_MASK_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_5_MASK_OFF_0

- PCIe x1/x4/x8 Root Complex
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_5_MASK_OFF_0
- Offset: 0x868
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_5_MASK:
- MSI Interrupt5 Mask. Allows enabled interrupts to be masked. When an MSI
is received for a masked interrupt, the corresponding status bit gets set in the interrupt status register but the msi_ctrl_int output is not set HIGH. Each bit corresponds to a single MSI Interrupt Vector. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_5_STATUS_OFF_0
where <i> = 1, 4, 8. Description: This register provides the MSI Interrupt5 status.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_5_STATUS_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_5_STATUS_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_5_STATUS_OFF_0
- Offset: 0x86c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_5_STATUS:
- MSI Interrupt5 Status. When an MSI is detected for EP#i, one bit in this
register is set. The decoding of the data payload of the MSI Memory Write request determines which bit gets set. A status is bit is cleared by writing a 1 to the bit. Each bit corresponds to a single MSI Interrupt Vector.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_6_EN_OFF_0

- PCIe x1/x4/x8 Root Complex
where <i> = 1, 4, 8. Description: This register enables integrated MSI reception module interrupt6.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_6_EN_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_6_EN_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_6_EN_OFF_0
- Offset: 0x870
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_6_EN:
- MSI Interrupt6 Enable. Specifies which interrupts are enabled. When an MSI
is received from a disabled interrupt, no status bit gets set in MSI controller interrupt status register. Each bit corresponds to a single MSI Interrupt Vector. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_6_MASK_OFF_0
where <i> = 1, 4, 8. Description: This register provides information regarding the MSI Interrupt6 mask.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_6_MASK_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_6_MASK_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_6_MASK_OFF_0
- Offset: 0x874
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_6_MASK:
- MSI Interrupt6 Mask. Allows enabled interrupts to be masked. When an MSI
is received for a masked interrupt, the corresponding status bit gets set in the interrupt status register but the msi_ctrl_int output is not set HIGH. Each bit corresponds to a single MSI Interrupt Vector. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_6_STATUS_OFF_0
where <i> = 1, 4, 8. Description: This register provides the MSI Interrupt6 status.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_6_STATUS_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_6_STATUS_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_6_STATUS_OFF_0
- Offset: 0x878
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_6_STATUS:
- MSI Interrupt6 Status. When an MSI is detected for EP#i, one bit in this
register is set. The decoding of the data payload of the MSI Memory Write request determines which bit gets set. A status is bit is cleared by writing a 1 to the bit. Each bit corresponds to a single MSI Interrupt Vector.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_7_EN_OFF_0
where <i> = 1, 4, 8. Description: This register enables integrated MSI reception module interrupt7.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_7_EN_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_7_EN_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_7_EN_OFF_0

- PCIe x1/x4/x8 Root Complex
- Offset: 0x87c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_7_EN:
- MSI Interrupt7 Enable. Specifies which interrupts are enabled. When an MSI
is received from a disabled interrupt, no status bit gets set in MSI controller interrupt status register. Each bit corresponds to a single MSI Interrupt Vector. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_7_MASK_OFF_0
where <i> = 1, 4, 8. Description: This register provides information regarding the MSI Interrupt7 mask.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_7_MASK_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_7_MASK_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_7_MASK_OFF_0
- Offset: 0x880
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_7_MASK:
- MSI Interrupt7 Mask. Allows enabled interrupts to be masked. When an MSI
is received for a masked interrupt, the corresponding status bit gets set in the interrupt status register but the msi_ctrl_int output is not set HIGH. Each bit corresponds to a single MSI Interrupt Vector. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_7_STATUS_OFF_0
where <i> = 1, 4, 8.

- PCIe x1/x4/x8 Root Complex
Description: This register provides the MSI Interrupt7 status.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_7_STATUS_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_7_STATUS_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_7_STATUS_OFF_0
- Offset: 0x884
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_CTRL_INT_7_STATUS:
- MSI Interrupt7 Status. When an MSI is detected for EP#i, one bit in this
register is set. The decoding of the data payload of the MSI Memory Write request determines which bit gets set. A status is bit is cleared by writing a 1 to the bit. Each bit corresponds to a single MSI Interrupt Vector.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_GPIO_IO_OFF_0
where <i> = 1, 4, 8. Description: The contents of this register drive the top-level GPIO msi_ctrl_io[31:0].
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_GPIO_IO_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_GPIO_IO_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_GPIO_IO_OFF_0
- Offset: 0x888
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSI_GPIO_REG:
- MSI GPIO Register. The contents of this register drive the top-level GPIO
msi_ctrl_io[31:0]. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_PORT_LOGIC_CLOCK_GATING_CTRL_OFF_0
where <i> = 1, 4, 8. Description: This register enables you to disable dynamic clock gating. By default dynamic clock gating is on, allowing the controller to autonomously enable and disable its clocks. The clock gating is performed in the clock and reset module, DWC_pcie_clk_rst.v, and is initiated by the controllers clock enable signals. The following modules support dynamic clock gating: - AXI Bridge - RADM.
- PCIE_X1_RC_PF0_PORT_LOGIC_CLOCK_GATING_CTRL_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_CLOCK_GATING_CTRL_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_CLOCK_GATING_CTRL_OFF_0
- Offset: 0x88c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000003 (0b0000,0000,0000,0000,0000,0000,0000,0011)
- Bit
R/W
- Reset
- Description
31:2
- RO
0x0 RSVDP_2: Reserved for future use.
- RW
0x1 AXI_CLK_GATING_EN:
- AXI Clock Gating Enable. This register enables the AXI Bridge to
autonomously enable and disable the AXI Master clock, the AXI Slave clock and the AXI DBI slave clock. The DWC_pcie_clk_rst.v module provides the gated clock, mstr_axi_aclk_gated, to the AXI Bridge and is enabled when the controllers clock enable signal, mstr_aclk_active, is asserted. For the AXI Slave this module provides the gated clock, slv_axi_aclk_gated, to the AXI Bridge and is enabled when the controllers clock enable signal, slv_aclk_active, is asserted. If the AXI DBI Slave is enabled (DBI_4SLAVE_POPULATED=1) the module provides the gated clock, dbi_axi_aclk_gated, to the AXI Bridge and is enabled when the controllers clock enable signal, dbi_aclk_active, is asserted. The controller de-asserts the clock enable signals when the respective AXI Master/Slave interfaces are idle. Note: This register field is sticky.
- RW
0x1 RADM_CLK_GATING_EN:
- RADM Clock Gating Enable. This register, if set, enables the RADM to
autonomously enable and disable its clock. The DWC_pcie_clk_rst.v module provides the gated clock, radm_clk_g, to the RADM and is enabled when the controllers clock enable signal, en_radm_clk_g, is asserted. The RADM clock is a gated version of the controller clock, core_clk. The controller de-asserts en_radm_clk_g when there is no Rx traffic, Rx queues and pre/post-queue pipelines are empty, RADM completion LUT is empty, and there are no FLR actions pending. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_PORT_LOGIC_GEN3_RELATED_OFF_0
where <i> = 1, 4, 8. Description: There is no Gen3-specific N_FTS field. The N_FTS field in the "Link Width and Speed Change Control Register" is used for both Gen2 and Gen3 speed modes. There is no Gen3-specific "Directed Speed Change" field. The "Directed Speed Change" field in the "Link Width and Speed
- Change Control Register" is used to change to Gen2 or Gen3 speed. A speed change to Gen3
occurs if (1) the "Directed Speed Change" field is set to '1' and (2) the "Target Link Speed" field in the Link Control 2 Register is set to Gen3. Gen3 support is advertised by both sides of the link during link training.
- Offset: 0x890
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_PORT_LOGIC_GEN3_RELATED_OFF_0
- Reset: 0x00400000 (0b0000,0000,0100,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:26
- RO
0x0 RSVDP_26: Reserved for future use. 25:24
- RW
0x0 RATE_SHADOW_SEL:
- Rate Shadow Select. This register value decide the Data Rate of shadow
register. The following shadow registers are controlled by this register. -
- GEN3_RELATED_OFF[9] EQ_PHASE_2_3 - GEN3_RELATED_OFF[12]
- RXEQ_PH01_EN - GEN3_RELATED_OFF[19] RE_EQ_REQUEST_ENABLE -
- GEN3_RELATED_OFF[21] AUTO_EQ_DISABLE - GEN3_RELATED_OFF[22]
- USP_SEND_8GT_EQ_TS2_DISABLE - GEN3_EQ_LOCAL_FS_LF_OFF[5:0]
- GEN3_EQ_LOCAL_LF - GEN3_EQ_LOCAL_FS_LF_OFF[11:6]
- GEN3_EQ_LOCAL_FS - GEN3_EQ_PSET_COEFF_MAP_0[5:0]
- GEN3_EQ_PRE_CURSOR_PSET - GEN3_EQ_PSET_COEFF_MAP_0[11:6]
- GEN3_EQ_CURSOR_PSET - GEN3_EQ_PSET_COEFF_MAP_0[17:12]
- GEN3_EQ_POSET_CURSOR_PSET - GEN3_EQ_CONTROL_OFF[3:0]
- GEN3_EQ_FB_MODE - GEN3_EQ_CONTROL_OFF[4]
- GEN3_EQ_PHASE23_EXIT_MODE - GEN3_EQ_CONTROL_OFF[5]
- GEN3_EQ_EVAL_2MS_DISABLE - GEN3_EQ_CONTROL_OFF[23:8]
- GEN3_EQ_PSET_REQ_VEC - GEN3_EQ_CONTROL_OFF[24]
- GEN3_EQ_FOM_INC_INITIAL_EVAL - GEN3_EQ_CONTROL_OFF[25]
- GEN3_EQ_PSET_REQ_AS_COEF -
- GEN3_EQ_FB_MODE_DIR_CHANGE_OFF[4:0]
- GEN3_EQ_FMDC_T_MIN_PHASE23 -
- GEN3_EQ_FB_MODE_DIR_CHANGE_OFF[9:5] GEN3_EQ_FMDC_N_EVALS -
- GEN3_EQ_FB_MODE_DIR_CHANGE_OFF[13:10]
- GEN3_EQ_FMDC_MAX_PRE_CUSROR_DELTA -
- GEN3_EQ_FB_MODE_DIR_CHANGE_OFF[17:14]
- GEN3_EQ_FMDC_MAX_POST_CUSROR_DELTA Note: This register field is
sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x0 GEN3_EQ_INVREQ_EVAL_DIFF_DISABLE:
- Eq InvalidRequest and RxEqEval Different Time Assertion Disable. Disable
the assertion of Eq InvalidRequest and RxEqEval at different time. Note:
- When CX_GEN4_SPEED/CX_GEN5_SPEED, this register is shared for
Gen3 and Gen4/Gen5 data rate. Note: This register field is sticky.
- RW
0x1 USP_SEND_8GT_EQ_TS2_DISABLE:
- Upstream Port Send 8GT/s or 16GT/s EQ TS2 Disable. The base spec
defines that USP can optionally send 8GT or 16GT EQ TS2, which implies that USP can set DSP TxPreset value in Gen4 or Gen5 Data Rate. This applies to upstream ports only; It does not apply to downstream ports.
- Note: - When CX_GEN4_SPEED/CX_GEN5_SPEED, this register is shadow
register for Gen3 and Gen4/Gen5 data rate. - If
- RATE_SHADOW_SEL==00b, this register is RSVD. - If
- RATE_SHADOW_SEL==01b, this register is for Gen4 data rate. - If
- RATE_SHADOW_SEL==10b, this register is for Gen5 data rate. Value after
reset in Gen4/Gen5 is 0x1. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: see description Note: This register field is sticky.
- RW
0x0 AUTO_EQ_DISABLE:
- Autonomous Equalization Disable. Note: - When CX_GEN4_SPEED/
- CX_GEN5_SPEED, this register is shadow register for Gen3 and Gen4/
- Gen5 data rate. - If RATE_SHADOW_SEL==00b, this register is RSVD. - If
- RATE_SHADOW_SEL==01b, this register is for Gen4 data rate. - If
- RATE_SHADOW_SEL==10b, this register is for Gen5 data rate. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi: see description Note: This register field is sticky. 20:19
- RO
0x0 RSVDP_19: Reserved for future use.
- RW
0x0 GEN3_DC_BALANCE_DISABLE:
- DC Balance Disable. Disable DC Balance feature. Note: When
- CX_GEN4_SPEED/CX_GEN5_SPEED, this register is shared for Gen3 and
Gen4/Gen5 data rate. Note: This register field is sticky.
- RW
0x0 GEN3_DLLP_XMT_DELAY_DISABLE:
- DLLP Transmission Delay Disable. Disable delay transmission of DLLPs
before equalization. Note: When CX_GEN4_SPEED/CX_GEN5_SPEED, this register is shared for Gen3 and Gen4/Gen5 data rate. Note: This register field is sticky.
- RW
0x0 GEN3_EQUALIZATION_DISABLE:
- Equalization Disable. Disable equalization feature. This bit cannot be
changed once the LTSSM starts link training. Note: When
- CX_GEN4_SPEED/CX_GEN5_SPEED, this register is shared for Gen3 and
Gen4/Gen5 data rate. Note: This register field is sticky. 15:14
- RO
0x0 RSVDP_14: Reserved for future use.
- RW
0x0 RXEQ_RGRDLESS_RXTS:
- When set to '1', the controller as Gen3 EQ master asserts RxEqEval to
instruct the PHY to do Rx adaptation and evaluation after a 500ns timeout from a new preset request. Note: When CX_GEN4_SPEED/
- CX_GEN5_SPEED, this register is shadow register for Gen3 and Gen4/
- Gen5 data rate. If RATE_SHADOW_SEL==00b, this register is for Gen3
data rate. If RATE_SHADOW_SEL==01b, this register is for Gen4 data rate.
- If RATE_SHADOW_SEL==10b, this register is for Gen5 data rate. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi: see description Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x0 RXEQ_PH01_EN:
- Rx Equalization Phase 0/Phase 1 Hold Enable. When this bit is set the
upstream port holds phase 0 (the downstream port holds phase 1) for 10ms. Holding phase 0 or phase 1 can be used to allow sufficient time for
- Rx Equalization to be performed by the PHY. This bit is used during
- Virtex-7 Gen3 equalization. The programmable bits [RXEQ_PH01_EN,
- EQ_PHASE_2_3] can be used to obtain the following variations of the
equalization procedure: Note: When CX_GEN4_SPEED/CX_GEN5_SPEED, this register is shadow register for Gen3 and Gen4/Gen5 data rate. If
- RATE_SHADOW_SEL==00b, this register is for Gen3 data rate. If
- RATE_SHADOW_SEL==01b, this register is for Gen4 data rate. If
- RATE_SHADOW_SEL==10b, this register is for Gen5 data rate. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi: see description Note: This register field is sticky.
- RW
0x0 EQ_REDO:
- Equalization Redo Disable. Disable autonomous mechanism for
requesting to redo the equalization process. The received presets or coefficients mismatch in Recovery.RcvrLock after Recovery EQ phases causes the EQ redo requests. If the EQ redo is infinite or you do not want eq requests and redo, setting this bit to 1 will stop the EQ requests and EQ redo so that the link can go ahead to L0 state for packet trasmissions.
- Note: When CX_GEN4_SPEED/CX_GEN5_SPEED, this register is shared
for Gen3 and Gen4/Gen5 data rate. Note: This register field is sticky.
- RW
0x0 EQ_EIEOS_CNT:
- Equalization EIEOS Count Reset Disable. Disable requesting reset of
- EIEOS count during equalization. Note: When CX_GEN4_SPEED/
- CX_GEN5_SPEED, this register is shared for Gen3 and Gen4/Gen5 data
rate. Note: This register field is sticky.
- RW
0x0 EQ_PHASE_2_3:
- Equalization Phase 2 and Phase 3 Disable. This applies to downstream
ports only. Note: When CX_GEN4_SPEED/CX_GEN5_SPEED, this register is shadow register for Gen3 and Gen4/Gen5 data rate. If
- RATE_SHADOW_SEL==00b, this register is for Gen3 data rate. If
- RATE_SHADOW_SEL==01b, this register is for Gen4 data rate. If
- RATE_SHADOW_SEL==10b, this register is for Gen5 data rate. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi: see description Note: This register field is sticky.
- RW
0x0 DISABLE_SCRAMBLER_GEN_3:
- Disable Scrambler for Gen3 and Gen4 Data Rate. The Gen3 and Gen4
scrambler/descrambler within the controller needs to be disabled when the scrambling function is implemented outside of the controller (for example within the PHY). Note: When CX_GEN4_SPEED/CX_GEN5_SPEED, this register is shared for Gen3 and Gen4/Gen5 data rate. Note: This register field is sticky. 7:2
- RO
0x0 RSVDP_2: Reserved for future use.
- RW
0x0 NO_SEED_VALUE_CHANGE:
- If this bit is set to 1, the seed value of LFSR for scrambler at Gen3 rate
does not change after LinkUp = 1. This bit takes effect only when
- CX_AUTO_LANE_FLIP_CTRL_EN is supported. This feature requires both
sides of the link support it. Note: this register is shared for Gen3 and Gen4/Gen5 data rates. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x0 GEN3_ZRXDC_NONCOMPL:
- Gen3 Receiver Impedance ZRX-DC Not Compliant. Receivers that operate
at 8.0 GT/s with an impedance other than the range defined by the ZRX-
- DC parameter for 2.5 GT/s (40-60 Ohms) must meet additional behavior
requirements in the following LTSSM states: Polling, Rx_L0s, L1, L2, and
- Disabled. Note: When CX_GEN4_SPEED/CX_GEN5_SPEED, this register is
shared for Gen3 and Gen4/Gen5 data rates. Note: This register field is sticky.
- PCIE_X4_RC_PF0_PORT_LOGIC_GEN3_RELATED_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_GEN3_RELATED_OFF_0
- Reset: 0x00400002 (0b0000,0000,0100,0000,0000,0000,0000,0010)
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
31:26
- RO
0x0 RSVDP_26: Reserved for future use. 25:24
- RW
0x0 RATE_SHADOW_SEL:
- Rate Shadow Select. This register value decide the Data Rate of shadow
register. The following shadow registers are controlled by this register. -
- GEN3_RELATED_OFF[9] EQ_PHASE_2_3 - GEN3_RELATED_OFF[12]
- RXEQ_PH01_EN - GEN3_RELATED_OFF[19] RE_EQ_REQUEST_ENABLE -
- GEN3_RELATED_OFF[21] AUTO_EQ_DISABLE - GEN3_RELATED_OFF[22]
- USP_SEND_8GT_EQ_TS2_DISABLE - GEN3_EQ_LOCAL_FS_LF_OFF[5:0]
- GEN3_EQ_LOCAL_LF - GEN3_EQ_LOCAL_FS_LF_OFF[11:6]
- GEN3_EQ_LOCAL_FS - GEN3_EQ_PSET_COEFF_MAP_0[5:0]
- GEN3_EQ_PRE_CURSOR_PSET - GEN3_EQ_PSET_COEFF_MAP_0[11:6]
- GEN3_EQ_CURSOR_PSET - GEN3_EQ_PSET_COEFF_MAP_0[17:12]
- GEN3_EQ_POSET_CURSOR_PSET - GEN3_EQ_CONTROL_OFF[3:0]
- GEN3_EQ_FB_MODE - GEN3_EQ_CONTROL_OFF[4]
- GEN3_EQ_PHASE23_EXIT_MODE - GEN3_EQ_CONTROL_OFF[5]
- GEN3_EQ_EVAL_2MS_DISABLE - GEN3_EQ_CONTROL_OFF[23:8]
- GEN3_EQ_PSET_REQ_VEC - GEN3_EQ_CONTROL_OFF[24]
- GEN3_EQ_FOM_INC_INITIAL_EVAL - GEN3_EQ_CONTROL_OFF[25]
- GEN3_EQ_PSET_REQ_AS_COEF -
- GEN3_EQ_FB_MODE_DIR_CHANGE_OFF[4:0]
- GEN3_EQ_FMDC_T_MIN_PHASE23 -
- GEN3_EQ_FB_MODE_DIR_CHANGE_OFF[9:5] GEN3_EQ_FMDC_N_EVALS -
- GEN3_EQ_FB_MODE_DIR_CHANGE_OFF[13:10]
- GEN3_EQ_FMDC_MAX_PRE_CUSROR_DELTA -
- GEN3_EQ_FB_MODE_DIR_CHANGE_OFF[17:14]
- GEN3_EQ_FMDC_MAX_POST_CUSROR_DELTA Note: This register field is
sticky.
- RW
0x0 GEN3_EQ_INVREQ_EVAL_DIFF_DISABLE:
- Eq InvalidRequest and RxEqEval Different Time Assertion Disable. Disable
the assertion of Eq InvalidRequest and RxEqEval at different time. Note:
- When CX_GEN4_SPEED/CX_GEN5_SPEED, this register is shared for
Gen3 and Gen4/Gen5 data rate. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
- RW
0x1 USP_SEND_8GT_EQ_TS2_DISABLE:
- Upstream Port Send 8GT/s or 16GT/s EQ TS2 Disable. The base spec
defines that USP can optionally send 8GT or 16GT EQ TS2, which implies that USP can set DSP TxPreset value in Gen4 or Gen5 Data Rate. This applies to upstream ports only; It does not apply to downstream ports.
- Note: - When CX_GEN4_SPEED/CX_GEN5_SPEED, this register is shadow
register for Gen3 and Gen4/Gen5 data rate. - If
- RATE_SHADOW_SEL==00b, this register is RSVD. - If
- RATE_SHADOW_SEL==01b, this register is for Gen4 data rate. - If
- RATE_SHADOW_SEL==10b, this register is for Gen5 data rate. Value after
reset in Gen4/Gen5 is 0x1. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: see description Note: This register field is sticky.
- RW
0x0 AUTO_EQ_DISABLE:
- Autonomous Equalization Disable. Note: - When CX_GEN4_SPEED/
- CX_GEN5_SPEED, this register is shadow register for Gen3 and Gen4/
- Gen5 data rate. - If RATE_SHADOW_SEL==00b, this register is RSVD. - If
- RATE_SHADOW_SEL==01b, this register is for Gen4 data rate. - If
- RATE_SHADOW_SEL==10b, this register is for Gen5 data rate. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi: see description Note: This register field is sticky. 20:19
- RO
0x0 RSVDP_19: Reserved for future use.
- RW
0x0 GEN3_DC_BALANCE_DISABLE:
- DC Balance Disable. Disable DC Balance feature. Note: When
- CX_GEN4_SPEED/CX_GEN5_SPEED, this register is shared for Gen3 and
Gen4/Gen5 data rate. Note: This register field is sticky.
- RW
0x0 GEN3_DLLP_XMT_DELAY_DISABLE:
- DLLP Transmission Delay Disable. Disable delay transmission of DLLPs
before equalization. Note: When CX_GEN4_SPEED/CX_GEN5_SPEED, this register is shared for Gen3 and Gen4/Gen5 data rate. Note: This register field is sticky.
- RW
0x0 GEN3_EQUALIZATION_DISABLE:
- Equalization Disable. Disable equalization feature. This bit cannot be
changed once the LTSSM starts link training. Note: When
- CX_GEN4_SPEED/CX_GEN5_SPEED, this register is shared for Gen3 and
Gen4/Gen5 data rate. Note: This register field is sticky. 15:14
- RO
0x0 RSVDP_14: Reserved for future use.
- RW
0x0 RXEQ_RGRDLESS_RXTS:
- When set to '1', the controller as Gen3 EQ master asserts RxEqEval to
instruct the PHY to do Rx adaptation and evaluation after a 500ns timeout from a new preset request. Note: When CX_GEN4_SPEED/
- CX_GEN5_SPEED, this register is shadow register for Gen3 and Gen4/
- Gen5 data rate. If RATE_SHADOW_SEL==00b, this register is for Gen3
data rate. If RATE_SHADOW_SEL==01b, this register is for Gen4 data rate.
- If RATE_SHADOW_SEL==10b, this register is for Gen5 data rate. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi: see description Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
- RW
0x0 RXEQ_PH01_EN:
- Rx Equalization Phase 0/Phase 1 Hold Enable. When this bit is set the
upstream port holds phase 0 (the downstream port holds phase 1) for 10ms. Holding phase 0 or phase 1 can be used to allow sufficient time for
- Rx Equalization to be performed by the PHY. This bit is used during
- Virtex-7 Gen3 equalization. The programmable bits [RXEQ_PH01_EN,
- EQ_PHASE_2_3] can be used to obtain the following variations of the
equalization procedure: Note: When CX_GEN4_SPEED/CX_GEN5_SPEED, this register is shadow register for Gen3 and Gen4/Gen5 data rate. If
- RATE_SHADOW_SEL==00b, this register is for Gen3 data rate. If
- RATE_SHADOW_SEL==01b, this register is for Gen4 data rate. If
- RATE_SHADOW_SEL==10b, this register is for Gen5 data rate. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi: see description Note: This register field is sticky.
- RW
0x0 EQ_REDO:
- Equalization Redo Disable. Disable autonomous mechanism for
requesting to redo the equalization process. The received presets or coefficients mismatch in Recovery.RcvrLock after Recovery EQ phases causes the EQ redo requests. If the EQ redo is infinite or you do not want eq requests and redo, setting this bit to 1 will stop the EQ requests and EQ redo so that the link can go ahead to L0 state for packet trasmissions.
- Note: When CX_GEN4_SPEED/CX_GEN5_SPEED, this register is shared
for Gen3 and Gen4/Gen5 data rate. Note: This register field is sticky.
- RW
0x0 EQ_EIEOS_CNT:
- Equalization EIEOS Count Reset Disable. Disable requesting reset of
- EIEOS count during equalization. Note: When CX_GEN4_SPEED/
- CX_GEN5_SPEED, this register is shared for Gen3 and Gen4/Gen5 data
rate. Note: This register field is sticky.
- RW
0x0 EQ_PHASE_2_3:
- Equalization Phase 2 and Phase 3 Disable. This applies to downstream
ports only. Note: When CX_GEN4_SPEED/CX_GEN5_SPEED, this register is shadow register for Gen3 and Gen4/Gen5 data rate. If
- RATE_SHADOW_SEL==00b, this register is for Gen3 data rate. If
- RATE_SHADOW_SEL==01b, this register is for Gen4 data rate. If
- RATE_SHADOW_SEL==10b, this register is for Gen5 data rate. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi: see description Note: This register field is sticky.
- RW
0x0 DISABLE_SCRAMBLER_GEN_3:
- Disable Scrambler for Gen3 and Gen4 Data Rate. The Gen3 and Gen4
scrambler/descrambler within the controller needs to be disabled when the scrambling function is implemented outside of the controller (for example within the PHY). Note: When CX_GEN4_SPEED/CX_GEN5_SPEED, this register is shared for Gen3 and Gen4/Gen5 data rate. Note: This register field is sticky. 7:2
- RO
0x0 RSVDP_2: Reserved for future use.
- RW
0x1 NO_SEED_VALUE_CHANGE:
- If this bit is set to 1, the seed value of LFSR for scrambler at Gen3 rate
does not change after LinkUp = 1. This bit takes effect only when
- CX_AUTO_LANE_FLIP_CTRL_EN is supported. This feature requires both
sides of the link support it. Note: this register is shared for Gen3 and Gen4/Gen5 data rates. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
- RW
0x0 GEN3_ZRXDC_NONCOMPL:
- Gen3 Receiver Impedance ZRX-DC Not Compliant. Receivers that operate
at 8.0 GT/s with an impedance other than the range defined by the ZRX-
- DC parameter for 2.5 GT/s (40-60 Ohms) must meet additional behavior
requirements in the following LTSSM states: Polling, Rx_L0s, L1, L2, and
- Disabled. Note: When CX_GEN4_SPEED/CX_GEN5_SPEED, this register is
shared for Gen3 and Gen4/Gen5 data rates. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_GEN3_EQ_CONTROL_OFF_0
where <i> = 1, 4, 8. Description: This register controls equalization for Phase2 in an upstream port (USP), or Phase3 in a downstream port (DSP).
- PCIE_X1_RC_PF0_PORT_LOGIC_GEN3_EQ_CONTROL_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_GEN3_EQ_CONTROL_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_GEN3_EQ_CONTROL_OFF_0
- Offset: 0x8a8
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x05000f60 (0b0000,0101,0000,0000,0000,1111,0110,0000)
- Bit
R/W
- Reset
- Description
31:27
- RO
0x0 RSVDP_27: Reserved for future use.
- RW
0x1 GEN3_REQ_SEND_CONSEC_EIEOS_FOR_PSET_MAP:
- Request controller to send back-to-back EIEOS in Recovery.RcvrLock state
until presets to coefficients mapping is complete. Note: Gen3 and Gen4 share the same register bit and have the same feature. Note: This register field is sticky.
- RW
0x0 GEN3_EQ_PSET_REQ_AS_COEF: GEN3_EQ_PSET_REQ_AS_COEF is an internally reserved field. Do not use. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x1 GEN3_EQ_FOM_INC_INITIAL_EVAL:
- Include Initial FOM. Include or not the FOM feedback from the initial preset
evaluation performed in the EQ Master, when finding the highest FOM among all preset evaluations. Note: - When CX_GEN4_SPEED/
- CX_GEN5_SPEED, this register is shadow register for Gen3 and Gen4/Gen5
data rate. - If RATE_SHADOW_SEL==00b, this register is for Gen3 data rate.
- If RATE_SHADOW_SEL==01b, this register is for Gen4 data rate. - If
- RATE_SHADOW_SEL==10b, this register is for Gen5 data rate. Note: This
register field is sticky. 23:8
- RW
0xf GEN3_EQ_PSET_REQ_VEC:
- Preset Request Vector. Requesting of Presets during the initial part of the
- EQ Master Phase. Encoding scheme is as follows: Bit [15:0] =0x0: No preset
is requested and evaluated in EQ Master Phase. Bit [i] =1: "Preset=i" is requested and evaluated in EQ Master Phase. - 0000000000000000: No preset be requested and evaluated in EQ Master Phase - 000000xxxxxxxxx1: Preset 0 is requested and evaluated in EQ Master
- Phase - 000000xxxxxxxx1x: Preset 1 is requested and evaluated in EQ
- Master Phase - 000000xxxxxxx1xx: Preset 2 is requested and evaluated in
- EQ Master Phase - 000000xxxxxx1xxx: Preset 3 is requested and evaluated
in EQ Master Phase - 000000xxxxx1xxxx: Preset 4 is requested and evaluated in EQ Master Phase - 000000xxxx1xxxxx: Preset 5 is requested and evaluated in EQ Master Phase - 000000xxx1xxxxxx: Preset 6 is requested and evaluated in EQ Master Phase - 000000xx1xxxxxxx: Preset 7 is requested and evaluated in EQ Master Phase - 000000x1xxxxxxxx:
- Preset 8 is requested and evaluated in EQ Master Phase -
00000x1xxxxxxxxx: Preset 9 is requested and evaluated in EQ Master
- Phase - 000001xxxxxxxxxx: Preset 10 is requested and evaluated in EQ
- Master Phase - All other encodings: Reserved Note: You must contact your
- PHY vendor to ensure 24 ms timeout does not occur in presets requests in
- EQ master phase, that is, you must set a proper value to the
- GEN3_EQ_PSET_REQ_VEC register so that the EQ tunning for Figure of
- Merit in the EQ master phase completes before 24 ms timeout. Note: -
- When CX_GEN4_SPEED/CX_GEN5_SPEED, this register is shadow register
for Gen3 and Gen4/Gen5 data rate. - If RATE_SHADOW_SEL==00b, this register is for Gen3 data rate. - If RATE_SHADOW_SEL==01b, this register is for Gen4 data rate. - If RATE_SHADOW_SEL==10b, this register is for Gen5 data rate. Note: This register field is sticky.
- RO
0x0 RSVDP_7: Reserved for future use.
- RW
0x1 GEN3_LOWER_RATE_EQ_REDO_ENABLE:
- Support EQ redo and lower rate change. Note: Gen3 and Gen4 share the
same register bit and have the same feature. Note: This register field is sticky.
- RW
0x1 GEN3_EQ_EVAL_2MS_DISABLE:
- Phase2_3 2 ms Timeout Disable. Determine behavior in Phase2 for USP
(Phase3 if DSP) when the PHY does not respond within 2ms to the assertion of RxEqEval. Note: - When CX_GEN4_SPEED/CX_GEN5_SPEED, this register is shadow register for Gen3 and Gen4/Gen5 data rate. - If
- RATE_SHADOW_SEL==00b, this register is for Gen3 data rate. - If
- RATE_SHADOW_SEL==01b, this register is for Gen4 data rate. - If
- RATE_SHADOW_SEL==10b, this register is for Gen5 data rate. Note: This
register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x0 GEN3_EQ_PHASE23_EXIT_MODE:
- Behavior After 24 ms Timeout (when optimal settings are not found). For a
USP: Determine next LTSSM state from Phase2 after 24ms Timeout - 0:
- Recovery.Speed - 1: Recovery.Equalization.Phase3 When optimal settings
are not found then: - Equalization Phase 2 Successful status bit is not set in the "Link Status Register 2" when GEN3_EQ_PHASE23_EXIT_MODE = 0 -
- Equalization Phase 2 Successful status bit is set in the "Link Status
- Register 2" when GEN3_EQ_PHASE23_EXIT_MODE = 1 - Equalization Phase
2 Complete status bit is set in the "Link Status Register 2" For a DSP: Determine next LTSSM state from Phase3 after 24ms Timeout - 0:
- Recovery.Speed - 1: Recovery.Equalization.RcvrLock When optimal settings
are not found then: - Equalization Phase 3 Successful status bit is not set in the "Link Status Register 2" when GEN3_EQ_PHASE23_EXIT_MODE = 0 -
- Equalization Phase 3 Successful status bit is set in the "Link Status
- Register 2" when GEN3_EQ_PHASE23_EXIT_MODE = 1 - Equalization Phase
3 Complete status bit is set in the "Link Status Register 2" Note:
- GEN3_EQ_PHASE23_EXIT_MODE = 1 affects Direction Change feed back
mode. EQ requests for Figure Of Merit mode complete before 24 ms timeout. Please see GEN3_EQ_PSET_REQ_VEC Register for more. Note: -
- When CX_GEN4_SPEED/CX_GEN5_SPEED, this register is shadow register
for Gen3 and Gen4/Gen5 data rate. - If RATE_SHADOW_SEL==00b, this register is for Gen3 data rate. - If RATE_SHADOW_SEL==01b, this register is for Gen4 data rate. - If RATE_SHADOW_SEL==10b, this register is for Gen5 data rate. Note: This register field is sticky. 3:0
- RW
0x0 GEN3_EQ_FB_MODE:
- Feedback Mode. Other values are reserved. Note: - When
- CX_GEN4_SPEED/CX_GEN5_SPEED, this register is a shadow register for
- Gen3 and Gen4/Gen5 data rate. - If RATE_SHADOW_SEL==00b, this
register is for Gen3 data rate. - If RATE_SHADOW_SEL==01b, this register is for Gen4 data rate. - If RATE_SHADOW_SEL==10b, this register is for Gen5 data rate. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_ORDER_RULE_CTRL_OFF_0
where <i> = 1, 4, 8. Description: This register controls the order rule.
- PCIE_X1_RC_PF0_PORT_LOGIC_ORDER_RULE_CTRL_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_ORDER_RULE_CTRL_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_ORDER_RULE_CTRL_OFF_0
- Offset: 0x8b4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
31:16
- RO
0x0 RSVDP_16: Reserved for future use. 15:8
- RW
0x0 CPL_PASS_P: Completion Passing Posted Ordering Rule Control. Determines if CPL can pass halted P queue. 7:0
- RW
0x0 NP_PASS_P: Non-Posted Passing Posted Ordering Rule Control. Determines if NP can pass halted P queue.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_PIPE_LOOPBACK_CONTROL_OFF_0
where <i> = 1, 4, 8. Description: This register controls the PIPE Loopback.
- Offset: 0x8b8
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_PORT_LOGIC_PIPE_LOOPBACK_CONTROL_OFF_0
- Reset: 0x00000001 (0b0000,0000,0000,0000,0000,0000,0000,0001)
- Bit
R/W
- Reset
- Description
- RW
0x0 PIPE_LOOPBACK: PIPE Loopback Enable. Indicates RMMI Loopback if M-PCIe. Note: This register field is sticky. 30:27
- RO
0x0 RSVDP_27: Reserved for future use. 26:24
- WO
0x0 RXSTATUS_VALUE: RXSTATUS_VALUE is an internally reserved field. Do not use. 23:22
- RO
0x0 RSVDP_22: Reserved for future use. 21:16
- RW
0x0 RXSTATUS_LANE: RXSTATUS_LANE is an internally reserved field. Do not use. Note: This register field is sticky. 15:0
- RW
0x1 LPBK_RXVALID: LPBK_RXVALID is an internally reserved field. Do not use. Note: This register field is sticky.
- PCIE_X4_RC_PF0_PORT_LOGIC_PIPE_LOOPBACK_CONTROL_OFF_0

- PCIe x1/x4/x8 Root Complex
- Reset: 0x0000000f (0b0000,0000,0000,0000,0000,0000,0000,1111)
- Bit
R/W
- Reset
- Description
- RW
0x0 PIPE_LOOPBACK: PIPE Loopback Enable. Indicates RMMI Loopback if M-PCIe. Note: This register field is sticky. 30:27
- RO
0x0 RSVDP_27: Reserved for future use. 26:24
- WO
0x0 RXSTATUS_VALUE: RXSTATUS_VALUE is an internally reserved field. Do not use. 23:22
- RO
0x0 RSVDP_22: Reserved for future use. 21:16
- RW
0x0 RXSTATUS_LANE: RXSTATUS_LANE is an internally reserved field. Do not use. Note: This register field is sticky. 15:0
- RW
0xf LPBK_RXVALID: LPBK_RXVALID is an internally reserved field. Do not use. Note: This register field is sticky.
- PCIE_X8_RC_PF0_PORT_LOGIC_PIPE_LOOPBACK_CONTROL_OFF_0
- Reset: 0x000000ff (0b0000,0000,0000,0000,0000,0000,1111,1111)
- Bit
R/W
- Reset
- Description
- RW
0x0 PIPE_LOOPBACK: PIPE Loopback Enable. Indicates RMMI Loopback if M-PCIe. Note: This register field is sticky. 30:27
- RO
0x0 RSVDP_27: Reserved for future use. 26:24
- WO
0x0 RXSTATUS_VALUE: RXSTATUS_VALUE is an internally reserved field. Do not use. 23:22
- RO
0x0 RSVDP_22: Reserved for future use. 21:16
- RW
0x0 RXSTATUS_LANE: RXSTATUS_LANE is an internally reserved field. Do not use. Note: This register field is sticky. 15:0
- RW
0xff LPBK_RXVALID: LPBK_RXVALID is an internally reserved field. Do not use. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MISC_CONTROL_1_OFF_0
where <i> = 1, 4, 8.

- PCIe x1/x4/x8 Root Complex
Description: This is the DBI Read-Only write enable register.
- PCIE_X1_RC_PF0_PORT_LOGIC_MISC_CONTROL_1_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MISC_CONTROL_1_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MISC_CONTROL_1_OFF_0
- Offset: 0x8bc
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x000bff49 (0b0000,0000,0000,1011,1111,1111,0100,1001)
- Bit
R/W
- Reset
- Description
31:23
- RO
0x0 RSVDP_23: Reserved for future use.
- RW
0x0 PORT_LOGIC_WR_DISABLE:
- Disable port logic register write from wire side. Note: The access
attributes of this field are as follows: - Wire: No access. - Dbi: R/W (sticky) Note: This register field is sticky.
- RW
0x0 P2P_ERR_RPT_CTRL: Determines whether to enable Peer to Peer (P2P) error reporting. Note: This register field is sticky.
- RW
0x0 P2P_TRACK_CPL_TO_REG:
- Determines whether to track completion of transmitted Non-Posted
TLPs in P2P mode. Note: This register field is sticky. 19:18
- RW
0x2 TARGET_ABOVE_CONFIG_LIMIT_REG:
- Configuration requests with an address greater than
- CONFIG_LIMIT_REG are directed to either ELBI or TRGT1 interface
based on the setting of this field. This field can have the following values: Note: This register field is sticky. 17:8
- RW
0x3ff CONFIG_LIMIT_REG:
- Configuration requests are directed either to CDM or ELBI/RTRGT1
based on the value of this field. - Configuration requests with an address less CONFIG_LIMIT_REG are directed to the CDM -
- Configuration requests with an address greater than
- CONFIG_LIMIT_REG are directed to either ELBI or TRGT1 interface
based on the setting of TARGET_ABOVE_CONFIG_LIMIT_REG field. Your application must set a proper value for this field based on your extended configuration registers. For more details, see the "CDM/ELBI
- Register Space Access Through CFG Request" in "Register Module,
- LBC, and DBI" section in the "Controller Operations" chapter of the
Databook. Note: This register field is sticky.
- RW
0x0 CFG_TLP_BYPASS_EN_REG:
- Setting of this field defines how to decide the destination of
- Configuration requests. Note: When app_req_retry_en is asserted, the
setting of this field is ignored. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x1 CPLQ_MNG_EN: This field enables the Completion Queue Management feature. Note: This register field is sticky.
- RW
0x0 ARI_DEVICE_NUMBER:
- When ARI is enabled, this field enables use of the device ID. Note: This
register field is sticky.
- RW
0x0 DISABLE_AUTO_LTR_CLR_MSG:
- Disable the autonomous generation of LTR clear message in upstream
port. This field can have the following values: For more details, see "Latency Tolerance Reporting (LTR) Message Generation [EP Mode]" in "Message Generation" section of the "Controller Operations" chapter of the Databook. Note: This register field is sticky.
- RW
0x1 SIMPLIFIED_REPLAY_TIMER:
- Enables Simplified Replay Timer (Gen4). For more details, see "Transmit
- Replay" in "Transmit TLP Processing" section in the "Controller
- Operations" chapter of the Databook. Simplified Replay Timer can have
the following Values: - A value from 24,000 to 31,000 Symbol Times when Extended Synch is 0b. - A value from 80,000 to 100,000 Symbol
- Times when Extended Synch is 1b. The Simplified Replay Timer value
must not be changed while the link is in use. Note: This register field is sticky.
- RW
0x0 UR_CA_MASK_4_TRGT1:
- When this field is set to '1', the controller suppresses error logging,
error message generation, and CPL generation for non-posted requests TLPs (with UR filtering status) forwarded to your application (that is, when DEFAULT_TARGET =1). For more details, see "Advanced
- Error Handling For Received TLPs" chapter of the Databook. Note: This
register field is sticky.
- RW
0x0 DEFAULT_TARGET: Default target for an IO or MEM request with UR/CA/CRS received.
- Based on the value of this field the controller either drops or forwards
these requests to your application. For more details, see "ECRC
- Handling" and "Request TLP Routing Rules" in "Receive Routing"
section of the "Controller Operations" chapter of the Databook. Note: This register field is sticky.
- RW
0x1 DBI_RO_WR_EN:
- Write to RO Registers Using DBI. For more details, see "Writing to
- Read-Only Registers" in "Register Module, LBC, and DBI" section in the
"Controller Operations" chapter of the Databook. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MULTI_LANE_CONTROL_OFF_0
where <i> = 1, 4, 8. Description: Used when upsizing or downsizing the link width through Configuration state without bringing the link down. For more details, see the "Link Establishment" section in the "Controller Operations" chapter of the Databook.
- PCIE_X1_RC_PF0_PORT_LOGIC_MULTI_LANE_CONTROL_OFF_0

- PCIe x1/x4/x8 Root Complex
- PCIE_X4_RC_PF0_PORT_LOGIC_MULTI_LANE_CONTROL_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MULTI_LANE_CONTROL_OFF_0
- Offset: 0x8c0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:8
- RO
0x0 RSVDP_8: Reserved for future use.
- RW
0x0 UPCONFIGURE_SUPPORT:
- Upconfigure Support. The controller sends this value as the Link
- Upconfigure Capability in TS2 Ordered Sets in Configuration.Complete
state. Note: This register field is sticky.
- RW
0x0 DIRECT_LINK_WIDTH_CHANGE:
- Directed Link Width Change. - If the upconfigure_capable variable is '1'
and the PCIE_CAP_HW_AUTO_WIDTH_DISABLE bit in
- LINK_CONTROL_LINK_STATUS_REG is '0', the controller starts
upconfigure or autonomous width downsizing (to the
- TARGET_LINK_WIDTH value) in the Configuration state. - If
- TARGET_LINK_WIDTH value is 0x0, the controller does not start
upconfigure or autonomous width downsizing in the Configuration state. The controller self-clears this field when the controller accepts this request. 5:0
- RW
0x0 TARGET_LINK_WIDTH: Target Link Width.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_PHY_INTEROP_CTRL_OFF_0
where <i> = 1, 4, 8. Description: This register controls the PHY interoperability.
- PCIE_X1_RC_PF0_PORT_LOGIC_PHY_INTEROP_CTRL_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_PHY_INTEROP_CTRL_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_PHY_INTEROP_CTRL_OFF_0
- Offset: 0x8c4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N

- PCIe x1/x4/x8 Root Complex
- SCR Protection: 0
- Reset: 0x0001e27f (0b0000,0000,0000,0001,1110,x010,0111,1111)
- Bit
R/W
- Reset
- Description
31:18
- RO
0x0 RSVDP_18: Reserved for future use. 17:12
- RW
0x1e PHY_RST_TIMER:
- Decide how many aux clock cycles the PHY reset lasts (0 to 63 aux
clock cycles). Note: This register field is sticky.
- RW
0x0 L1_CLK_SEL:
- L1 Clock control bit. This field is reserved for internal use. This
register field is sticky.
- RO
0x1 L1_NOWAIT_P1: L1 entry control bit. This field is reserved for internal use. The access attributes of this field are as follows: - Wire: No access.
- Dbi: R/W (sticky).
This register field is sticky.
- RW
0x0 L1SUB_EXIT_MODE:
- L1 Exit Control Using phy_mac_pclkack_n. This field is reserved for
internal use. Note: This register field is sticky.
- RO
0x0 RSVDP_7: Reserved for future use. 6:0
- RW
0x7f RXSTANDBY_CONTROL:
- Rxstandby Control. Bits 0..5 determine if the controller asserts the
RxStandby signal (mac_phy_rxstandby) in the indicated condition.
- Bit 6 enables the controller to perform the RxStandby/
- RxStandbyStatus handshake. This field is reserved for internal
use. [0]: Rx EIOS and subsequent T TX-IDLE-MIN [1]: Rate Change [2]: Inactive lane for upconfigure/downconfigure [3]: PowerDown=P1orP2 [4]: RxL0s.Idle [5]: EI Infer in L0 [6]: Execute RxStandby/RxStandbyStatus Handshake Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_TRGT_CPL_LUT_DELETE_ENTRY_OFF_0
where <i> = 1, 4, 8. Description: Using this register you can delete one entry in the target completion LUT. You should only use this register when you know that your application will never send the completion because of an FLR or any other reason. Note:: The target completion LUT (and associated target completion timeout event) is watching for completions (from your application on XALI0/1/2 or AXI master read channel) corresponding to previously received non-posted requests from the PCIe wire.
- PCIE_X1_RC_PF0_PORT_LOGIC_TRGT_CPL_LUT_DELETE_ENTRY_OFF_0

- PCIe x1/x4/x8 Root Complex
- PCIE_X4_RC_PF0_PORT_LOGIC_TRGT_CPL_LUT_DELETE_ENTRY_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_TRGT_CPL_LUT_DELETE_ENTRY_OFF_0
- Offset: 0x8c8
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- WO
0x0 DELETE_EN: This is a one-shot bit. This is a self-clearing register field. Reading from this register field always returns a '0'. 30:0
- RW
0x0 LOOK_UP_ID: This number selects one entry to delete of the TRGT_CPL_LUT.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_LINK_FLUSH_CONTROL_OFF_0
where <i> = 1, 4, 8. Description: This register controls link reset request flush behaviour.
- PCIE_X1_RC_PF0_PORT_LOGIC_LINK_FLUSH_CONTROL_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_LINK_FLUSH_CONTROL_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_LINK_FLUSH_CONTROL_OFF_0
- Offset: 0x8cc
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xff000001 (0b1111,1111,0000,0000,0000,0000,0000,0001)
- Bit
R/W
- Reset
- Description
31:24
- RW
0xff RSVD_I_8:
- This is an internally reserved field. Do not use. Note: This register field is
sticky. 23:1
- RO
0x0 RSVDP_1: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x1 AUTO_FLUSH_EN:
- Enables automatic flushing of pending requests before sending the
reset request to the application logic to reset the PCIe controller and the AXI Bridge. The flushing process is initiated if any of the following events occur: - Hot reset request. A downstream port (DSP) can "hot reset" an upstream port (USP) by sending two consecutive TS1 ordered sets with the hot reset bit asserted. - Warm (Soft) reset request.
- Generated when exiting from D3 to D0 and cfg_pm_no_soft_rst=0. -
- Link down reset request. A high to low transition on smlh_req_rst_not
indicates the link has gone down and the controller is requesting a reset.
- If you disable automatic flushing, your application is responsible for
resetting the PCIe controller and the AXI Bridge. For more details see "Warm and Hot Resets" section in the Architecture chapter of the Databook. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_AMBA_ERROR_RESPONSE_DEFAULT_OFF_0
where <i> = 1, 4, 8. Description: This register holds the AXI bridge slave error responses.
- PCIE_X1_RC_PF0_PORT_LOGIC_AMBA_ERROR_RESPONSE_DEFAULT_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_AMBA_ERROR_RESPONSE_DEFAULT_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_AMBA_ERROR_RESPONSE_DEFAULT_OFF_0
- Offset: 0x8d0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00009c00 (0b0000,0000,0000,0000,1001,1100,0000,0000)
- Bit
R/W
- Reset
- Description
31:16
- RO
0x0 RSVDP_16: Reserved for future use. 15:10
- RW
0x27 AMBA_ERROR_RESPONSE_MAP:
- AXI Slave Response Error Map. Allows you to selectively map the
errors received from the PCIe completion (for non-posted requests) to the AXI slave responses, slv_rresp or slv_bresp. The recommended setting is SLVERR. CRS is always mapped to OKAY.
- The controller sets the AXI slave read databus to 0xFFFF for all error
responses. Note: This register field is sticky. 9:5
- RO
0x0 RSVDP_5: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
4:3
- RW
0x0 AMBA_ERROR_RESPONSE_CRS:
- CRS Slave Error Response Mapping. Determines the AXI slave
response for CRS completions. For more details see "Error Handling" in the AXI chapter of the Databook. Note: This register field is sticky.
- RW
0x0 AMBA_ERROR_RESPONSE_VENDORID:
- Vendor ID Non-existent Slave Error Response Mapping. Determines
the AXI slave response for errors on reads to non-existent Vendor
- ID register. For more details see "Error Handling" in the AXI chapter
of the Databook. Note: This register field is sticky.
- RO
0x0 RSVDP_1: Reserved for future use.
- RW
0x0 AMBA_ERROR_RESPONSE_GLOBAL:
- Global Slave Error Response Mapping. Determines the AXI slave
response for all error scenarios on non-posted requests. For more details see "Error Handling" in the AXI chapter of the Databook. The error response mapping is not applicable to Non-existent Vendor ID register reads. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_AMBA_LINK_TIMEOUT_OFF_0
where <i> = 1, 4, 8. Description: If your application AXI master issues outbound requests to the AXI bridge slave interface before the PCIe link is operational, the controller starts a "flush" timer. The timeout value of the timer is set by this register. If the timer times out before the PCIe link is operational, the bridge TX request queues are flushed. For more details, see the "AXI Bridge Initialization, Clocking and Reset" section in the AXI chapter of the Databook.
- PCIE_X1_RC_PF0_PORT_LOGIC_AMBA_LINK_TIMEOUT_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_AMBA_LINK_TIMEOUT_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_AMBA_LINK_TIMEOUT_OFF_0
- Offset: 0x8d4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000032 (0b0000,0000,0000,0000,0000,0000,0011,0010)
- Bit
R/W
- Reset
- Description
31:9
- RO
0x0 RSVDP_9: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x0 LINK_TIMEOUT_ENABLE_DEFAULT: Disable Flush. Note: This register field is sticky. 7:0
- RW
0x32 LINK_TIMEOUT_PERIOD_DEFAULT:
- Timeout Value (ms). The timer will timeout and then flush the bridge
- TX request queues after this amount of time. The timer counts
when there are pending outbound AXI slave interface requests and the PCIe TX link is not transmitting any of these requests. The timer is clocked by core_clk. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_AMBA_ORDERING_CTRL_OFF_0
where <i> = 1, 4, 8. Description: This register controls the AXI Bridge Ordering.
- PCIE_X1_RC_PF0_PORT_LOGIC_AMBA_ORDERING_CTRL_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_AMBA_ORDERING_CTRL_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_AMBA_ORDERING_CTRL_OFF_0
- Offset: 0x8d8
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:8
- RO
0x0 RSVDP_8: Reserved for future use.
- RW
0x0 AX_MSTR_ZEROLREAD_FW:
- AXI Master Zero Length Read Forward to the application. The DW PCIe
controller AXI bridge is able to terminate in order with the Posted transactions the zero length read, implementing the PCIe express flush semantics of the Posted transactions. Note: This register field is sticky. 6:5
- RO
0x0 RSVDP_5: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
4:3
- RW
0x0 AX_MSTR_ORDR_P_EVENT_SEL:
- AXI Master Posted Ordering Event Selector. This field selects how the
master interface determines when a P write is completed when enforcing the PCIe ordering rule, "NP must not pass P" at the AXI Master Interface.
- The AXI protocol does not support ordering between channels. Therefore,
- NP reads can pass P on your AXI bus fabric. This can result in an ordering
violation when the read overtakes a P that is going to the same address.
- Therefore, the bridge master does not issue any NP requests until all
outstanding P writes reach their destination. It does this by waiting for the all of the write responses on the B channel. This can affect the performance of the master read channel. For scenarios where the interconnect serializes the AXI master "AW", "W" and "AR" channels,you can increase the performance by reducing the need to wait until the complete
- Posted transaction has effectively reached the application slave. Note: This
setting will not affect: - MSI interrupt catcher and P data ordering. This is always driven by the B'last event. - DMA read engine TLP ordering. This is always driven by the B'last event. - NP write transactions which are always serialized with P write transactions.Note: This register field is sticky.
- RO
0x0 RSVDP_2: Reserved for future use.
- RW
0x0 AX_SNP_EN:
- AXI Serialize Non-Posted Requests Enable. This field enables the AXI
Bridge to serialize same ID Non-Posted Read/Write Requests on the wire.
- Serialization implies one outstanding same ID NP Read or Write on the wire
and used to avoid AXI RAR and WAW hazards at the remote link partner.
- For more details, see the "Optional Serialization of AXI Slave Non-posted
- Requests" section in the AXI chapter of the Databook. Note: This register
field is sticky.
- RO
0x0 RSVDP_0: Reserved for future use.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_COHERENCY_CONTROL_1_OFF_0
where <i> = 1, 4, 8. Description: This register controls the ACE cache coherency operation.
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- PCIE_X1_RC_PF0_PORT_LOGIC_COHERENCY_CONTROL_1_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_COHERENCY_CONTROL_1_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_COHERENCY_CONTROL_1_OFF_0
- Offset: 0x8e0

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
31:2
- RW
0x0 CFG_MEMTYPE_BOUNDARY_LOW_ADDR:
- Boundary Lower Address For Memory Type. Bits [31:0] of dword-
aligned address of the boundary for Memory type. The two lower address LSBs are '00'. Addresses up to but not including this value are in the lower address space region; addresses equal or greater than this value are in the upper address space region. Note: This register field is sticky.
- RO
0x0 RSVDP_1: Reserved for future use.
- RW
0x0 CFG_MEMTYPE_VALUE:
- Sets the memory type for the lower and upper parts of the address
space: Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_COHERENCY_CONTROL_2_OFF_0
where <i> = 1, 4, 8. Description: This register controls the ACE cache coherency operation.
- PCIE_X1_RC_PF0_PORT_LOGIC_COHERENCY_CONTROL_2_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_COHERENCY_CONTROL_2_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_COHERENCY_CONTROL_2_OFF_0
- Offset: 0x8e4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 CFG_MEMTYPE_BOUNDARY_HIGH_ADDR:
- Boundary Upper Address For Memory Type. Bits [63:32] of the 64-bit
dword-aligned address of the boundary for Memory type. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_COHERENCY_CONTROL_3_OFF_0
where <i> = 1, 4, 8. Description: This register controls the ACE cache coherency operation.

- PCIe x1/x4/x8 Root Complex
- PCIE_X1_RC_PF0_PORT_LOGIC_COHERENCY_CONTROL_3_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_COHERENCY_CONTROL_3_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_COHERENCY_CONTROL_3_OFF_0
- Offset: 0x8e8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bx000,0xxx,x000,0xxx,x000,0xxx,x000,0xxx)
- Bit
- Reset
- Description
30:27 0x0 CFG_MSTR_AWCACHE_VALUE:
- Master Write CACHE Signal Value. Value of the individual bits in
mstr_awcache when CFG_MSTR_AWCACHE_MODE is '1'. Note: Not applicable to message requests; for message requests the value of mstr_awcache is always '0000'. Note: This register field is sticky. 22:19 0x0 CFG_MSTR_ARCACHE_VALUE:
- Master Read CACHE Signal Value. Value of the individual bits in
mstr_arcache when CFG_MSTR_ARCACHE_MODE is '1'. Note: This register field is sticky. 14:11 0x0 CFG_MSTR_AWCACHE_MODE:
- Master Write CACHE Signal Behavior. Defines how the individual bits in
mstr_awcache are controlled. Note: for message requests the value of mstr_awcache is always "0000" regardless of the value of this bit. Note: This register field is sticky. 6:3 0x0 CFG_MSTR_ARCACHE_MODE:
- Master Read CACHE Signal Behavior. Defines how the individual bits in
mstr_arcache are controlled. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_AXI_MSTR_MSG_ADDR_LOW_OFF_0
where <i> = 1, 4, 8. Description: Lower 20 bits of the programmable AXI address to which Messages coming from wire are mapped. Bits [11:0] of the register are tied to zero for the address to be 4k-aligned. In previous releases, the third and fourth DWORDs of a message (Msg/MsgD) TLP header were delivered though the AXI master address bus (mstr_awaddr). These DWORDS are now supplied through the mstr_awmisc_info_hdr_34dw[63:0] output; and the value on mstr_awaddr is driven to the value you have programmed into the AXI_MSTR_MSG_ADDR_LOW_OFF and AXI_MSTR_MSG_ADDR_HIGH_OFF registers.
- PCIE_X1_RC_PF0_PORT_LOGIC_AXI_MSTR_MSG_ADDR_LOW_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_AXI_MSTR_MSG_ADDR_LOW_OFF_0

- PCIe x1/x4/x8 Root Complex
- PCIE_X8_RC_PF0_PORT_LOGIC_AXI_MSTR_MSG_ADDR_LOW_OFF_0
- Offset: 0x8f0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:12
- RW
0x0 CFG_AXIMSTR_MSG_ADDR_LOW:
- Lower 20-bits of the programmable AXI address for
Messages. Note: This register field is sticky. 11:0
- RO
0x0 CFG_AXIMSTR_MSG_ADDR_LOW_RESERVED: Reserved for future use. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_AXI_MSTR_MSG_ADDR_HIGH_OFF_0
where <i> = 1, 4, 8. Description: Upper 32 bits of the programmable AXI address to which Messages coming from wire are mapped.
- PCIE_X1_RC_PF0_PORT_LOGIC_AXI_MSTR_MSG_ADDR_HIGH_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_AXI_MSTR_MSG_ADDR_HIGH_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_AXI_MSTR_MSG_ADDR_HIGH_OFF_0
- Offset: 0x8f4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 CFG_AXIMSTR_MSG_ADDR_HIGH: Upper 32 bits of the programmable AXI address for Messages. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_PCIE_VERSION_NUMBER_OFF_0

- PCIe x1/x4/x8 Root Complex
where <i> = 1, 4, 8. Description: The version number is given in hex format. You should convert each pair of hex characters to ASCII to interpret. Using 4.70a (GA) as an example: - VERSION_NUMBER = 0x3437302a which translates to 470* - VERSION_TYPE = 0x67612a2a which translates to ga**
- Using 4.70a-ea01 as an example: - VERSION_NUMBER = 0x3437302a which translates to 470* -
- VERSION_TYPE = 0x65613031 which translates to ea01 GA is a general release available on
www.designware.com EA is an early release available on a per-customer basis.
- PCIE_X1_RC_PF0_PORT_LOGIC_PCIE_VERSION_NUMBER_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_PCIE_VERSION_NUMBER_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_PCIE_VERSION_NUMBER_OFF_0
- Offset: 0x8f8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x3536322a (0b0011,0101,0011,0110,0011,0010,0010,1010)
- Bit
- Reset
- Description
31:0 0x3536322a VERSION_NUMBER: Version Number.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_PCIE_VERSION_TYPE_OFF_0
where <i> = 1, 4, 8. Description: The type is given in hex format. You should convert each pair of hex characters to
- ASCII to interpret. Using 4.70a (GA) as an example: - VERSION_NUMBER = 0x3437302a which
translates to 470* - VERSION_TYPE = 0x67612a2a which translates to ga** Using 4.70a-ea01 as an example: - VERSION_NUMBER = 0x3437302a which translates to 470* - VERSION_TYPE = 0x65613031 which translates to ea01 GA is a general release available on www.designware.com EA is an early release available on a per-customer basis.
- PCIE_X1_RC_PF0_PORT_LOGIC_PCIE_VERSION_TYPE_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_PCIE_VERSION_TYPE_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_PCIE_VERSION_TYPE_OFF_0
- Offset: 0x8fc
- Read/Write: RO

- PCIe x1/x4/x8 Root Complex
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x65613035 (0b0110,0101,0110,0001,0011,0000,0011,0101)
- Bit
- Reset
- Description
31:0 0x65613035 VERSION_TYPE: Version Type.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_INTERFACE_TIMER_CONTROL_OFF_0
where <i> = 1, 4, 8. Description: This register controls the interface timer.
- PCIE_X1_RC_PF0_PORT_LOGIC_INTERFACE_TIMER_CONTROL_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_INTERFACE_TIMER_CONTROL_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_INTERFACE_TIMER_CONTROL_OFF_0
- Offset: 0x930
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:5
- RO
0x0 RSVDP_5: Reserved for future use.
- RW
0x0 FORCE_PENDING:
- Writing to this bit forces the value of the pending flags. Note: This
register field is sticky. 3:2
- RW
0x0 INTERFACE_TIMER_SCALING:
- Interface timer scaling. This field can be used to reduce the timer
duration for verification purpose. This field should only be programmed when the INTERFACE_TIMER_EN bit is set to 1'b0. Note: This register field is sticky.
- RW
0x0 INTERFACE_TIMER_AER_EN:
- When set to 1 the Interface timer internal uncorrectable error
generation is enabled. Note: This register field is sticky.
- RW
0x0 INTERFACE_TIMER_EN: Interface timer enable. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_PORT_LOGIC_INTERFACE_TIMER_TARGET_OFF_0
where <i> = 1, 4, 8. Description: This is the interface timer target register.
- PCIE_X1_RC_PF0_PORT_LOGIC_INTERFACE_TIMER_TARGET_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_INTERFACE_TIMER_TARGET_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_INTERFACE_TIMER_TARGET_OFF_0
- Offset: 0x934
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000032 (0b0000,0000,0000,0000,0000,0000,0011,0010)
- Bit
R/W
- Reset
- Description
31:16
- RO
0x0 RSVDP_16: Reserved for future use. 15:0
- RW
0x32 INTERFACE_TIMER_TARGET:
- Interface timer target value. This field should only be
programmed when the INTERFACE_TIMER_EN bit is set to 1'b0. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_INTERFACE_TIMER_STATUS_OFF_0
where <i> = 1, 4, 8. Description: This is the interface timer status register.
- PCIE_X1_RC_PF0_PORT_LOGIC_INTERFACE_TIMER_STATUS_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_INTERFACE_TIMER_STATUS_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_INTERFACE_TIMER_STATUS_OFF_0
- Offset: 0x938
- Read/Write: R/W
- Parity Protection: N
- Shadow: N

- PCIe x1/x4/x8 Root Complex
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,000x,x000,0x00)
- Bit
- Reset
- Description
0x0 SLAVE_RD_ADD_TIMEOUT: Slave read address channel timeout. 0x0 SLAVE_WR_DATA_TIMEOUT: Slave write data channel timeout. 0x0 SLAVE_WR_ADD_TIMEOUT: Slave write address channel timeout. 0x0 MASTER_RD_DATA_TIMEOUT: Master read data channel timeout. 0x0 MASTER_WR_RES_TIMEOUT: Master write response channel timeout. 0x0 CLIENT2_INTERFACE_TIMEOUT: Client2 interface timeout. 0x0 CLIENT1_INTERFACE_TIMEOUT: Client1 interface timeout. 0x0 CPL_INTERFACE_TIMEOUT: CPL interface timeout. 0x0 MESSAGE_INTERFACE_TIMEOUT: Message interface timeout.
- PCIE_X<j>_RC_PF0_PORT_LOGIC_MSIX_ADDRESS_MATCH_LOW_OFF_0
where <j> = 4, 8.
- Description: When you enable the MSI-X Table RAM feature (MSIX_TABLE_EN=1), the controller
implements the logic and RAM required to generate MSI-X requests. For more details, see the Interrupts section in the "Controller Operations" chapter of the Databook. This register is only used in AXI configurations. When your local AXI application writes (MWr) to the address defined in this register (and MSIX_ADDRESS_MATCH_HIGH_OFF), the controller will load the
- MSIX_DOORBELL_OFF register with the contents of the MWr and subsequently create and send
MSI-X TLPs.
- PCIE_X4_RC_PF0_PORT_LOGIC_MSIX_ADDRESS_MATCH_LOW_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSIX_ADDRESS_MATCH_LOW_OFF_0
- Offset: 0x940
- Read/Write: See table below
- Parity Protection: N
- Shadow: N

- PCIe x1/x4/x8 Root Complex
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:2
- RW
0x0 MSIX_ADDRESS_MATCH_LOW:
- MSI-X Address Match Low Address. Note: This register field is
sticky.
- RO
0x0 MSIX_ADDRESS_MATCH_RESERVED_1: Reserved. Note: This register field is sticky.
- RW
0x0 MSIX_ADDRESS_MATCH_EN:
- MSI-X Match Enable. Enable the MSI-X Address Match feature
when the AXI bridge is present. Note: This register field is sticky.
- PCIE_X<j>_RC_PF0_PORT_LOGIC_MSIX_ADDRESS_MATCH_HIGH_OFF_0
where <j> = 4, 8. Description: MSI-X Address Match High Register. When you enable the MSI-X Table RAM feature (MSIX_TABLE_EN=1), the controller implements the logic and RAM required to generate MSI-X requests. For more details, see the Interrupts section in the "Controller Operations" chapter of the Databook. This register is only used in AXI configurations. When your local AXI application writes (MWr) to the address defined in this register (and MSIX_ADDRESS_MATCH_LOW_OFF), the controller will load the MSIX_DOORBELL_OFF register with the contents of the MWr and subsequently create and send MSI-X TLPs.
- PCIE_X4_RC_PF0_PORT_LOGIC_MSIX_ADDRESS_MATCH_HIGH_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSIX_ADDRESS_MATCH_HIGH_OFF_0
- Offset: 0x944
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 MSIX_ADDRESS_MATCH_HIGH: MSI-X Address Match High Address. Note: This register field is sticky.
- PCIE_X<j>_RC_PF0_PORT_LOGIC_MSIX_DOORBELL_OFF_0
where <j> = 4, 8.

- PCIe x1/x4/x8 Root Complex
- Description: When you enable the MSI-X Table RAM feature (MSIX_TABLE_EN=1), the controller
implements the logic and RAM required to generate MSI-X requests. For more details, see the Interrupts section in the "Controller Operations" chapter of the Databook. - For AXI configurations: when your local application writes (MWr) to the address defined in MSIX_ADDRESS_MATCH_LOW_OFF, the controller will load this register with the contents of the
- MWr and subsequently create and send MSI-X TLPs. - For non-AMBA configurations: when your
local application writes to this register, the controller will create and send MSI-X TLPs.
- PCIE_X4_RC_PF0_PORT_LOGIC_MSIX_DOORBELL_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSIX_DOORBELL_OFF_0
- Offset: 0x948
- Read/Write: WO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
- Bit
- Reset
- Description
31:29 0x0 MSIX_DOORBELL_RESERVED_29_31: Reserved. 28:24 0x0 MSIX_DOORBELL_PF:
- MSIX Doorbell Physical Function. This register determines the Physical
Function for the MSI-X transaction. 23:16 0x0 MSIX_DOORBELL_VF:
- MSIX Doorbell Virtual Function. This register determines the Virtual
Function for the MSI-X transaction. 0x0 MSIX_DOORBELL_VF_ACTIVE:
- MSIX Doorbell Virtual Function Active. This register determines whether
a Virtual Function is used to generate the MSI-X transaction. 14:12 0x0 MSIX_DOORBELL_TC:
- MSIX Doorbell Traffic Class. This register determines which traffic class
to generate the MSI-X transaction with. 0x0 MSIX_DOORBELL_RESERVED_11: Reserved. 10:0 0x0 MSIX_DOORBELL_VECTOR:
- MSI-X Doorbell Vector. This register determines which vector to
generate the MSI-X transaction for.
- PCIE_X<j>_RC_PF0_PORT_LOGIC_MSIX_RAM_CTRL_OFF_0
where <j> = 4, 8.

- PCIe x1/x4/x8 Root Complex
- Description: When you enable the MSI-X Table RAM feature (MSIX_TABLE_EN=1), the controller
implements the logic and RAM required to generate MSI-X requests. For more details, see the Interrupts section in the "Controller Operations" chapter of the Databook.
- PCIE_X4_RC_PF0_PORT_LOGIC_MSIX_RAM_CTRL_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSIX_RAM_CTRL_OFF_0
- Offset: 0x94c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:26
- RO
0x0 MSIX_RAM_CTRL_RESERVED_26_31: Reserved. Note: This register field is sticky.
- RW
0x0 MSIX_RAM_CTRL_DBG_PBA:
- MSIX PBA RAM Debug Mode. You can also use the dbg_pba input
to activate debug mode. Debug mode turns off the PF/VF/Offset- based addressing into the RAM and maps the entire table linearly from the base address of the BAR (indicated by the BIR) in function 0. Note: This register field is sticky.
- RW
0x0 MSIX_RAM_CTRL_DBG_TABLE:
- MSIX Table RAM Debug Mode. You can also use the dbg_table
input to activate debug mode. Debug mode turns off the PF/VF/
- Offset-based addressing into the RAM and maps the entire table
linearly from the base address of the BAR (indicated by the BIR) in function 0. Note: This register field is sticky. 23:17
- RO
0x0 MSIX_RAM_CTRL_RESERVED_17_23: Reserved. Note: This register field is sticky.
- RW
0x0 MSIX_RAM_CTRL_BYPASS:
- MSIX RAM Control Bypass. It is up to the application to ensure the
RAMs are in the proper power state before trying to access them.
- Moreover, the application needs to observe all timing requirements
of the RAM low power signals before trying to use the MSIX functionality. Note: This register field is sticky. 15:10
- RO
0x0 MSIX_RAM_CTRL_RESERVED_10_15: Reserved. Note: This register field is sticky.
- RW
0x0 MSIX_RAM_CTRL_PBA_SD: MSIX PBA RAM Shut Down. Note: This register field is sticky.
- RW
0x0 MSIX_RAM_CTRL_PBA_DS: MSIX PBA RAM Deep Sleep. Note: This register field is sticky. 7:2
- RO
0x0 MSIX_RAM_CTRL_RESERVED_2_7: Reserved. Note: This register field is sticky.
- RW
0x0 MSIX_RAM_CTRL_TABLE_SD: MSIX Table RAM Shut Down. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x0 MSIX_RAM_CTRL_TABLE_DS: MSIX Table RAM Deep Sleep. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_SAFETY_MASK_OFF_0
where <i> = 1, 4, 8. Description: This registers holds the masks for functional safety interrupt events.
- PCIE_X1_RC_PF0_PORT_LOGIC_SAFETY_MASK_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_SAFETY_MASK_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_SAFETY_MASK_OFF_0
- Offset: 0x960
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:6
- RO
0x0 RSVDP_6: Reserved for future use.
- RW
0x0 SAFETY_INT_MASK_5:
- Mask for functional safety interrupt event 5 (RASDP
correctable). Note: This register field is sticky.
- RW
0x0 SAFETY_INT_MASK_4:
- Mask for functional safety interrupt event 4 (PCIe
correctable). Note: This register field is sticky.
- RW
0x0 SAFETY_INT_MASK_3:
- Mask for functional safety interrupt event 3 (PCIe
uncorrectable). Note: This register field is sticky.
- RW
0x0 SAFETY_INT_MASK_2:
- Mask for functional safety interrupt event 2 (Interface
timers). Note: This register field is sticky.
- RW
0x0 SAFETY_INT_MASK_1:
- Mask for functional safety interrupt event 1 (CDM register
checker). Note: This register field is sticky.
- RW
0x0 SAFETY_INT_MASK_0: Mask for functional safety interrupt event 0 (RASDP). Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_PORT_LOGIC_SAFETY_STATUS_OFF_0
where <i> = 1, 4, 8. Description: This register provides the functional safety interrupt events status.
- PCIE_X1_RC_PF0_PORT_LOGIC_SAFETY_STATUS_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_SAFETY_STATUS_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_SAFETY_STATUS_OFF_0
- Offset: 0x964
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:6
- RO
0x0 RSVDP_6: Reserved for future use.
- RW
0x0 SAFETY_INT_STATUS_5:
- Status for functional safety interrupt event 5 (RASDP
correctable). This register field is sticky.
- RW
0x0 SAFETY_INT_STATUS_4:
- Status for functional safety interrupt event 4 (PCIe
correctable). This register field is sticky.
- RW
0x0 SAFETY_INT_STATUS_3:
- Status for functional safety interrupt event 3 (PCIe
uncorrectable). This register field is sticky.
- RW
0x0 SAFETY_INT_STATUS_2:
- Status for functional safety interrupt event 2 (Interface
timers). This register field is sticky.
- RW
0x0 SAFETY_INT_STATUS_1:
- Status for functional safety interrupt event 1 (CDM register
checker). This register field is sticky.
- RW
0x0 SAFETY_INT_STATUS_0:
- Status for functional safety interrupt event 0 (RASDP). This
register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_PL_APP_BUS_DEV_NUM_STATUS_OFF_0
where <i> = 1, 4, 8.

- PCIe x1/x4/x8 Root Complex
Description: This register reflects the application driven bus and device number.
- PCIE_X1_RC_PF0_PORT_LOGIC_PL_APP_BUS_DEV_NUM_STATUS_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_PL_APP_BUS_DEV_NUM_STATUS_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_PL_APP_BUS_DEV_NUM_STATUS_OFF_0
- Offset: 0xb10
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:16 0x0 RSVDP_16: Reserved for future use. 15:8 0x0 RC_DSW_BUS_NUM:
- This field reflects the value of bus number driven on app_bus_num
input signal by your application. Note: This register field is sticky. 7:3 0x0 RC_DSW_DEV_NUM:
- This field reflects the value of device number driven on
app_device_num input signal by your application. Note: This register field is sticky. 2:0 0x0 RSVDP_0: Reserved for future use.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_PCIPM_TRAFFIC_CTRL_OFF_0
where <i> = 1, 4, 8. Description: This register provides control over TLP Traffic during Non-D0 States.
- PCIE_X1_RC_PF0_PORT_LOGIC_PCIPM_TRAFFIC_CTRL_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_PCIPM_TRAFFIC_CTRL_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_PCIPM_TRAFFIC_CTRL_OFF_0
- Offset: 0xb1c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N

- PCIe x1/x4/x8 Root Complex
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:8
- RO
0x0 RSVDP_8: Reserved for future use. 7:4
- RO
0x0 PCIPM_RESERVED_4_7: Reserved. Note: This register field is sticky.
- RW
0x0 PCIPM_NEW_TLP_CLIENT2_BLOCKED:
- This field indicates that all TLPs transmitted by Client 2
interface are blocked during non-D0 states. Note: This register field is sticky.
- RW
0x0 PCIPM_NEW_TLP_CLIENT1_BLOCKED:
- This field indicates that all TLPs transmitted by Client 1
interface are blocked during non-D0 states. Note: This register field is sticky.
- RW
0x0 PCIPM_NEW_TLP_CLIENT0_BLOCKED:
- This field indicates that all TLPs transmitted by Client 0
interface are blocked during non-D0 states. Note: This register field is sticky.
- RW
0x0 PCIPM_VDM_TRAFFIC_BLOCKED:
- This field indicates that VDM Message TLPs are blocked during
non-D0 states. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_PL_CHK_REG_CONTROL_STATUS_OFF_0
where <i> = 1, 4, 8. Description: Controls register checking and displays status of register checking.
- PCIE_X1_RC_PF0_PORT_LOGIC_PL_CHK_REG_CONTROL_STATUS_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_PL_CHK_REG_CONTROL_STATUS_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_PL_CHK_REG_CONTROL_STATUS_OFF_0
- Offset: 0xb20
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:19
- RO
0x0 RSVDP_19: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x0 CHK_REG_COMPLETE: The system has completed a checking cycle.
- RW
0x0 CHK_REG_LOGIC_ERROR:
- The system has detected an error in its own checking
logic.
- RW
0x0 CHK_REG_COMPARISON_ERROR:
- The system has detected that there is a bit error in the
CDM Register Data. 15:2
- RO
0x0 RSVDP_2: Reserved for future use.
- RW
0x0 CHK_REG_CONTINUOUS:
- Set Continuous Checking Sequence. Note: This register
field is sticky.
- RW
0x0 CHK_REG_START:
- Begins a checking sequence. Note: This register field is
sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_PL_CHK_REG_START_END_OFF_0
where <i> = 1, 4, 8. Description: This register holds the first and last address to check.
- PCIE_X1_RC_PF0_PORT_LOGIC_PL_CHK_REG_START_END_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_PL_CHK_REG_START_END_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_PL_CHK_REG_START_END_OFF_0
- Offset: 0xb24
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0bff0000 (0b0000,1011,1111,1111,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:16 0xbff CHK_REG_END_ADDR:
- The last address that is checked by the system. Note: This register
field is sticky. 15:0 0x0 CHK_REG_START_ADDR:
- The first address that is checked by the system. Note: This register
field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_PORT_LOGIC_PL_CHK_REG_ERR_ADDR_OFF_0
where <i> = 1, 4, 8. Description: This register holds the CDM register checking error address.
- PCIE_X1_RC_PF0_PORT_LOGIC_PL_CHK_REG_ERR_ADDR_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_PL_CHK_REG_ERR_ADDR_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_PL_CHK_REG_ERR_ADDR_OFF_0
- Offset: 0xb28
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 CHK_REG_ERR_ADDR:
- The address at which an error has been detected. Valid only when the CDM
Register Checker Comparison Error bit is set in the status register. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_PL_CHK_REG_ERR_PF_VF_OFF_0
where <i> = 1, 4, 8. Description: This register holds the CDM Register checking error PF and VF numbers.
- PCIE_X1_RC_PF0_PORT_LOGIC_PL_CHK_REG_ERR_PF_VF_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_PL_CHK_REG_ERR_PF_VF_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_PL_CHK_REG_ERR_PF_VF_OFF_0
- Offset: 0xb2c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
31:28 0x0 RSVDP_28: Reserved for future use. 27:16 0x0 CHK_REG_VF_ERR_NUMBER:
- The VF number at which the error was detected. Valid only when the CDM
Register Checker Comparison Error bit is set in the status register. Note: This register field is sticky. 15:5 0x0 RSVDP_5: Reserved for future use. 4:0 0x0 CHK_REG_PF_ERR_NUMBER:
- The PF number at which the error was detected. Valid only when the CDM
Register Checker Comparison Error bit is set in the status register. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_PL_LTR_LATENCY_OFF_0
where <i> = 1, 4, 8. Description: The function of this register field (and all other fields in this register) differs between an upstream port and a downstream port. For an upstream port, the register fields capture the corresponding fields in the LTR messages that are transmitted by the port. For a downstream port, the register fields capture the corresponding fields in the LTR messages that are received by the port. The full content of the register is reflected on the app_ltr_latency[31:0] output.
- PCIE_X1_RC_PF0_PORT_LOGIC_PL_LTR_LATENCY_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_PL_LTR_LATENCY_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_PL_LTR_LATENCY_OFF_0
- Offset: 0xb30
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RW
0x0 NO_SNOOP_LATENCY_REQUIRE:
- No Snoop Latency Requirement. Note: The access attributes
of this field are as follows: - Wire: No access. - Dbi: R/W 30:29
- RO
0x0 RSVDP_29: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
28:26
- RW
0x0 NO_SNOOP_LATENCY_SCALE:
- No Snoop Latency Scale. Note: The access attributes of this
field are as follows: - Wire: No access. - Dbi: R/W 25:16
- RW
0x0 NO_SNOOP_LATENCY_VALUE:
- No Snoop Latency Value. Note: The access attributes of this
field are as follows: - Wire: No access. - Dbi: R/W
- RW
0x0 SNOOP_LATENCY_REQUIRE:
- Snoop Latency Requirement. Note: The access attributes of
this field are as follows: - Wire: No access. - Dbi: R/W 14:13
- RO
0x0 RSVDP_13: Reserved for future use. 12:10
- RW
0x0 SNOOP_LATENCY_SCALE:
- Snoop Latency Scale. Note: The access attributes of this field
are as follows: - Wire: No access. - Dbi: R/W 9:0
- RW
0x0 SNOOP_LATENCY_VALUE:
- Snoop Latency Value. Note: The access attributes of this field
are as follows: - Wire: No access. - Dbi: R/W
- PCIE_X<i>_RC_PF0_PORT_LOGIC_AUX_CLK_FREQ_OFF_0
where <i> = 1, 4, 8. Description: This register controls the auxiliary clock frequency.
- PCIE_X1_RC_PF0_PORT_LOGIC_AUX_CLK_FREQ_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_AUX_CLK_FREQ_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_AUX_CLK_FREQ_OFF_0
- Offset: 0xb40
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000013 (0b0000,0000,0000,0000,0000,0000,0001,0011)
- Bit
R/W
- Reset
- Description
31:10
- RO
0x0 RSVDP_10: Reserved for future use. 9:0
- RW
0x13
- AUX_CLK_FREQ

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_PORT_LOGIC_L1_SUBSTATES_OFF_0
where <i> = 1, 4, 8. Description: This register holds L1 substates timing information.
- PCIE_X1_RC_PF0_PORT_LOGIC_L1_SUBSTATES_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_L1_SUBSTATES_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_L1_SUBSTATES_OFF_0
- Offset: 0xb44
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x000000d2 (0b0000,0000,0000,0000,0000,0000,1101,0010)
- Bit
R/W
- Reset
- Description
31:9
- RO
0x0 RSVDP_9: Reserved for future use.
- RW
0x0 L1SUB_LOW_POWER_CLOCK_SWITCH_MODE:
- If the bit is set to 1'b1 the controller will delay the switching of
aux_clk to the slow platform clock until it detects that the link partner has de-asserted CLKREQ#. Note: This register field is sticky. 7:6
- RW
0x3 L1SUB_T_PCLKACK:
- Max delay (in 1us units) between a MAC request to remove the
clock on mac_phy_pclkreq_n and a PHY response on phy_mac_pclkack_n. If the PHY does not respond within this time the request is aborted. Range is 1..4 Note: This register field is sticky. 5:2
- RW
0x4 L1SUB_T_L1_2:
- Duration (in 1us units) of L1.2. Range is 1..16. Note: This register
field is sticky. 1:0
- RW
0x2 L1SUB_T_POWER_OFF:
- Duration (in 1us units) of L1.2.Entry. Range is 1..4. Note: This
register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_POWERDOWN_CTRL_STATUS_OFF_0
where <i> = 1, 4, 8. Description: This is the Powerdown Control and Status register.

- PCIe x1/x4/x8 Root Complex
- PCIE_X1_RC_PF0_PORT_LOGIC_POWERDOWN_CTRL_STATUS_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_POWERDOWN_CTRL_STATUS_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_POWERDOWN_CTRL_STATUS_OFF_0
- Offset: 0xb48
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000220 (0b0000,0000,0000,0000,0000,0010,0010,0000)
- Bit
R/W
- Reset
- Description
31:12
- RO
0x0 RSVDP_12: Reserved for future use. 11:8
- RO
0x2 POWERDOWN_PHY_POWERDOWN:
- This field represents the Powerdown value that has been
acknowledged by the PHY. It is updated with the value of
- Powerdown driven by the controller, when the PHY has returned
the Phystatus acknowledgment for the Powerdown transition. 7:4
- RO
0x2 POWERDOWN_MAC_POWERDOWN:
- This field represents the Powerdown value driven by the controller
to the PHY. 3:2
- RO
0x0 RSVDP_2: Reserved for future use.
- RW
0x0 POWERDOWN_VMAIN_ACK:
- Set this bit to 1 if you do not want to perform the handshake with
the power-switch after PERST# assertion. By default the controller will perform the handshake with the power-switch if L1 power gating is enabled Note: This register field is sticky.
- WO
0x0 POWERDOWN_FORCE:
- This field is a one shot field. This field could be used for debug
purposes in event that the P2 Powerdown transition does not complete. It will allow the controller to proceed with the transition to the P1 Powerdown state. This field always reads back as 1'b0.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_GEN4_LANE_MARGINING_1_OFF_0
where <i> = 1, 4, 8. Description: This is the Gen4 Lane Margining 1 Register.
- PCIE_X1_RC_PF0_PORT_LOGIC_GEN4_LANE_MARGINING_1_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_GEN4_LANE_MARGINING_1_OFF_0

- PCIe x1/x4/x8 Root Complex
- PCIE_X8_RC_PF0_PORT_LOGIC_GEN4_LANE_MARGINING_1_OFF_0
- Offset: 0xb80
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x05201407 (0b0000,0101,0010,0000,0001,0100,0000,0111)
- Bit
R/W
- Reset
- Description
31:30
- RO
0x0 RSVDP_30: Reserved for future use. 29:24
- RW
0x5 MARGINING_MAX_VOLTAGE_OFFSET: M(MaxVoltageOffset) for Lane Margining at the Receiver. This parameter is defined in "Electrical Sub-Block" section of the PCI Express Base Specification. Note: This register field is sticky.
- RO
0x0 RSVDP_23: Reserved for future use. 22:16
- RW
0x20 MARGINING_NUM_VOLTAGE_STEPS: M(NumVoltageSteps) for Lane Margining at the Receiver. This parameter is defined in "Electrical Sub-Block" section of the PCI Express Base Specification. Note: This register field is sticky. 15:14
- RO
0x0 RSVDP_14: Reserved for future use. 13:8
- RW
0x14 MARGINING_MAX_TIMING_OFFSET: M(MaxTimingOffset) for Lane Margining at the Receiver. This parameter is defined in "Electrical Sub-Block" section of the PCI Express Base Specification. Note: This register field is sticky. 7:6
- RO
0x0 RSVDP_6: Reserved for future use. 5:0
- RW
0x7 MARGINING_NUM_TIMING_STEPS: M(NumTimingSteps) for Lane Margining at the Receiver. This parameter is defined in "Electrical Sub-Block" section of the PCI Express Base Specification. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_GEN4_LANE_MARGINING_2_OFF_0
where <i> = 1, 4, 8. Description: This is the Gen4 Lane Margining 2 Register.
- PCIE_X1_RC_PF0_PORT_LOGIC_GEN4_LANE_MARGINING_2_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_GEN4_LANE_MARGINING_2_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_GEN4_LANE_MARGINING_2_OFF_0

- PCIe x1/x4/x8 Root Complex
- Offset: 0xb84
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x180f0f0f (0bx001,1000,0000,1111,0000,1111,0000,1111)
- Bit
R/W
- Reset
- Description
30:29
- RO
0x0 RSVDP_29: Reserved for future use.
- RW
0x1 MARGINING_IND_ERROR_SAMPLER: M(IndErrorSampler) for Lane Margining at the Receiver. This parameter is defined in "Electrical Sub-Block" section of the PCI Express Base Specification. Note: This register field is sticky.
- RW
0x1 MARGINING_SAMPLE_REPORTING_METHOD: M(SampleReportingMethod) for Lane Margining at the Receiver.
- This parameter is defined in "Electrical Sub-Block" section of the
PCI Express Base Specification. Note: This register field is sticky.
- RW
0x0 MARGINING_IND_LEFT_RIGHT_TIMING: M(IndLeftRightTiming) for Lane Margining at the Receiver. This parameter is defined in "Electrical Sub-Block" section of the PCI Express Base Specification. Note: This register field is sticky.
- RW
0x0 MARGINING_IND_UP_DOWN_VOLTAGE: M(IndUpDownVoltage) for Lane Margining at the Receiver. This parameter is defined in "Electrical Sub-Block" section of the PCI Express Base Specification. Note: This register field is sticky.
- RW
0x0 MARGINING_VOLTAGE_SUPPORTED: M(VoltageSupported) for Lane Margining at the Receiver. This parameter is defined in "Electrical Sub-Block" section of the PCI Express Base Specification. Note: This register field is sticky. 23:21
- RO
0x0 RSVDP_21: Reserved for future use. 20:16
- RW
0xf MARGINING_MAXLANES: M(MaxLanes) for Lane Margining at the Receiver. This parameter is defined in "Electrical Sub-Block" section of the PCI Express Base Specification. Note: This register field is sticky. 15:14
- RO
0x0 RSVDP_14: Reserved for future use. 13:8
- RW
0xf MARGINING_SAMPLE_RATE_TIMING: M(SamplingRateTiming) for Lane Margining at the Receiver. This parameter is defined in "Electrical Sub-Block" section of the PCI
- Express Base Specification. Note: This value is not used when
- MARGINING_IND_ERROR_SAMPLER is 0b. The
M(SamplingRateTiming) is fixed to 63 internally. Note: This register field is sticky. 7:6
- RO
0x0 RSVDP_6: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
5:0
- RW
0xf MARGINING_SAMPLE_RATE_VOLTAGE: M(SamplingRateVoltage) for Lane Margining at the Receiver. This parameter is defined in "Electrical Sub-Block" section of the PCI
- Express Base Specification. Note: This value is not used when
- MARGINING_IND_ERROR_SAMPLER is 0b. The
M(SamplingRateVoltage) is fixed to 63 internally. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_PIPE_RELATED_OFF_0
where <i> = 1, 4, 8. Description: This register controls the PIPE's capabitity, control, and status parameters.
- PCIE_X1_RC_PF0_PORT_LOGIC_PIPE_RELATED_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_PIPE_RELATED_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_PIPE_RELATED_OFF_0
- Offset: 0xb90
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,xxxx,xxxx)
- Bit
R/W
- Reset
- Description
31:9
- RO
0x0 RSVDP_9: Reserved for future use.
- RW
0x0 PIPE_GARBAGE_DATA_MODE:
- PIPE Garbage Data Mode. - RxValid is deasserted - a valid
- RxStartBlock is received at 128b/130b encoding - a valid COM
symbol is received at 8b/10b encoding Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_MSIX_CAP_DBI2_SHADOW_PCI_MSIX_CAP_ID_NEXT_CTRL_REG_0
where <i> = 1, 4, 8. Description: This is the shadow register of the MSI-X Capability ID, Next Pointer, and Control Register.

- PCIe x1/x4/x8 Root Complex
- Offset: 0x10b0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_MSIX_CAP_DBI2_SHADOW_PCI_MSIX_CAP_ID_NEXT_CTRL_REG_0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:27 0x0 PCI_MSIX_RESERVED1: reserved field 1 in the shadow register. Note: This register field is sticky. 26:16 0x0 PCI_MSIX_TABLE_SIZE:
- MSI-X Table Size in the shadow register. Note: The access attributes of
this field are as follows: - Wire: No access - Dbi: No access - Dbi2: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky. 15:0 0x0 PCI_MSIX_RESERVED0: reserved field 0 in the shadow register. Note: This register field is sticky.
- PCIE_X4_RC_PF0_MSIX_CAP_DBI2_SHADOW_PCI_MSIX_CAP_ID_NEXT_CTRL_REG_0
- PCIE_X8_RC_PF0_MSIX_CAP_DBI2_SHADOW_PCI_MSIX_CAP_ID_NEXT_CTRL_REG_0
- Reset: 0x00070000 (0b0000,0000,0000,0111,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:27 0x0 PCI_MSIX_RESERVED1: reserved field 1 in the shadow register. Note: This register field is sticky. 26:16 0x7 PCI_MSIX_TABLE_SIZE:
- MSI-X Table Size in the shadow register. Note: The access attributes of
this field are as follows: - Wire: No access - Dbi: No access - Dbi2: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky. 15:0 0x0 PCI_MSIX_RESERVED0: reserved field 0 in the shadow register. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_MSIX_CAP_DBI2_SHADOW_MSIX_TABLE_OFFSET_REG_0
where <i> = 1, 4, 8. Description: This register provides Table BIR and MSI-x Table offset select.
- Offset: 0x10b4
- Read/Write: R/W
- Parity Protection: N

- PCIe x1/x4/x8 Root Complex
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_MSIX_CAP_DBI2_SHADOW_MSIX_TABLE_OFFSET_REG_0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:3 0x0 PCI_MSIX_TABLE_OFFSET:
- MSI-X Table Offset. Used as an offset from the address contained by one of the
- Function's Base Address Registers to point to the base of the MSI-X Table. The
lower 3 Table BIR bits are masked off (set to zero) by software to form a 32-bit
- QWORD-aligned offset. Note: The access attributes of this field are as follows: -
- Wire: No access - Dbi: No access - Dbi2: if (DBI_RO_WR_EN == 1 &&
MSIX_CAP_ENABLE=1 ) then R/W else R Note: This register field is sticky. 2:0 0x0 PCI_MSIX_BIR:
- MSI-X Table BAR Indicator Register Field. This field indicates which one of a
- Function's Base Address Registers , located beginning at 10h in Configuration
- Space, or entry in the Enhanced Allocation capability with a matching BEI , is used
to map the Function's MSI-X Table into Memory Space. All encodings other than the defined encodings are reserved. For a 64-bit Base Address Register , the
- Table BIR indicates the lower DWORD. For Functions with Type 1 Configuration
- Space headers, BIR values 2 through 5 are also Reserved. Note: The access
attributes of this field are as follows: - Wire: No access - Dbi: No access - Dbi2: if (DBI_RO_WR_EN == 1 && MSIX_CAP_ENABLE=1 ) then R/W else R Note: This register field is sticky.
- PCIE_X4_RC_PF0_MSIX_CAP_DBI2_SHADOW_MSIX_TABLE_OFFSET_REG_0
- PCIE_X8_RC_PF0_MSIX_CAP_DBI2_SHADOW_MSIX_TABLE_OFFSET_REG_0
- Reset: 0x00000002 (0b0000,0000,0000,0000,0000,0000,0000,0010)
- Bit
- Reset
- Description
31:3 0x0 PCI_MSIX_TABLE_OFFSET:
- MSI-X Table Offset. Used as an offset from the address contained by one of the
- Function's Base Address Registers to point to the base of the MSI-X Table. The
lower 3 Table BIR bits are masked off (set to zero) by software to form a 32-bit
- QWORD-aligned offset. Note: The access attributes of this field are as follows: -
- Wire: No access - Dbi: No access - Dbi2: if (DBI_RO_WR_EN == 1 &&
MSIX_CAP_ENABLE=1 ) then R/W else R Note: This register field is sticky. 2:0 0x2 PCI_MSIX_BIR:
- MSI-X Table BAR Indicator Register Field. This field indicates which one of a
- Function's Base Address Registers , located beginning at 10h in Configuration
- Space, or entry in the Enhanced Allocation capability with a matching BEI , is used
to map the Function's MSI-X Table into Memory Space. All encodings other than the defined encodings are reserved. For a 64-bit Base Address Register , the
- Table BIR indicates the lower DWORD. For Functions with Type 1 Configuration
- Space headers, BIR values 2 through 5 are also Reserved. Note: The access
attributes of this field are as follows: - Wire: No access - Dbi: No access - Dbi2: if (DBI_RO_WR_EN == 1 && MSIX_CAP_ENABLE=1 ) then R/W else R Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_MSIX_CAP_DBI2_SHADOW_MSIX_PBA_OFFSET_REG_0
where <i> = 1, 4, 8. Description: This register provides PBA Offset and PBA BIR value.
- Offset: 0x10b8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_MSIX_CAP_DBI2_SHADOW_MSIX_PBA_OFFSET_REG_0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:3 0x0 PCI_MSIX_PBA_OFFSET:
- MSI-X PBA Offset. Used as an offset from the address contained by one of the
- Function's Base Address Registers to point to the base of the MSI-X PBA. The
lower 3 PBA BIR bits are masked off (set to zero) by software to form a 32-bit
- QWORD-aligned offset. Note: The access attributes of this field are as follows: -
- Wire: No access - Dbi: No access - Dbi2: if (DBI_RO_WR_EN == 1 &&
MSIX_CAP_ENABLE=1 ) then R/W else R Note: This register field is sticky. 2:0 0x0 PCI_MSIX_PBA_BIR:
- MSI-X PBA BIR. This field indicates which one of a Function's Base Address
- Registers , located beginning at 10h in Configuration Space, or entry in the
- Enhanced Allocation capability with a matching BEI, is used to map the
- Function's MSI-X PBA into Memory Space. The PBA BIR value definitions are
identical to those for the Table BIR . Note: The access attributes of this field are as follows: - Wire: No access - Dbi: No access - Dbi2: if (DBI_RO_WR_EN == 1 && MSIX_CAP_ENABLE=1 ) then R/W else R Note: This register field is sticky.
- PCIE_X4_RC_PF0_MSIX_CAP_DBI2_SHADOW_MSIX_PBA_OFFSET_REG_0
- PCIE_X8_RC_PF0_MSIX_CAP_DBI2_SHADOW_MSIX_PBA_OFFSET_REG_0
- Reset: 0x00010002 (0b0000,0000,0000,0001,0000,0000,0000,0010)
- Bit
- Reset
- Description
31:3 0x2000 PCI_MSIX_PBA_OFFSET:
- MSI-X PBA Offset. Used as an offset from the address contained by one of the
- Function's Base Address Registers to point to the base of the MSI-X PBA. The
lower 3 PBA BIR bits are masked off (set to zero) by software to form a 32-bit QWORD-aligned offset. Note: The access attributes of this field are as follows:
- Wire: No access - Dbi: No access - Dbi2: if (DBI_RO_WR_EN == 1 &&
MSIX_CAP_ENABLE=1 ) then R/W else R Note: This register field is sticky.

- PCIe x4/x8 Endpoint
- Bit
- Reset
- Description
2:0 0x2 PCI_MSIX_PBA_BIR:
- MSI-X PBA BIR. This field indicates which one of a Function's Base Address
- Registers , located beginning at 10h in Configuration Space, or entry in the
- Enhanced Allocation capability with a matching BEI, is used to map the
- Function's MSI-X PBA into Memory Space. The PBA BIR value definitions are
identical to those for the Table BIR . Note: The access attributes of this field are as follows: - Wire: No access - Dbi: No access - Dbi2: if (DBI_RO_WR_EN == 1 && MSIX_CAP_ENABLE=1 ) then R/W else R Note: This register field is sticky.
