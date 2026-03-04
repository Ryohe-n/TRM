# 10 -tap filters with filter kernel specified using the

- FilterStruct
- Table 7.79 FILTER_TYPE
- Enumerant
- Value
- Description
- FILTER_TYPE_NORMAL
Filter kernel that is used for regular scaling.
- FILTER_TYPE_NOISE
- Filter kernel that is used for spatial smoothing. The weight of
this filter is specified using the FilterNoise/ChromaNoise parameters in the SlotConfig structure.
- FILTER_TYPE_DETAIL
- Filter kernel that is used for spatial sharpening. The weight of
this filter is specified using the FilterDetail/ChromaDetail parameters in the SlotConfig structure.

- VIC Programming Guidelines
#### 7.3.2.3 Application Memory Structures
##### 7.3.2.3.1 Config Structure
The Config structure is read from the frame buffer by the surface cache unit and is stored in small memories inside each subunit. The entire ConfigStruct is the concatenation of the Surface Cache, Surface List, Color Conversion, Blending and Fetch Control structs (in this order). The structs are read in 128-bit units from memory and sent to the according subunits memory with the correct memory address by the Surface Cache. The config structure is broken up into smaller structs that are used depending on the active slots and their content. Each structure is a multiple of 128 bits in size, and the start of the struct needs to be aligned to a 256 byte boundary. Note: NV12 and NV24 share the same pixel format but can be distinguished by the fact that NV24 is a field based format (i.e., every surface contains a single field) whereas NV12 is frame based (i.e., every surface contains an entire frame). Note: For highest quality, filter override mode as defined in FetchControlCoeffStruct should always be used.
- Table 7.80 ConfigStruct Substructures
- Name
- Data Type
- Offset
- Notes
pipeConfig
- PipeConfig (128 bits)
outputConfig
- OutputConfig (128 bits)
outputSurfaceConfig
- OutputSurfaceConfig (128
bits) outColorMatrixStruct
- MatrixStruct (256 bits)
clearRectStruct[4]
- ClearRectStruct (128 bits)

