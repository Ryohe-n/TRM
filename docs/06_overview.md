# 6 Overview

## 6.1 Overview
- The Orin™ SoC has an NVIDIA Ampere GPU with two Graphics Processing Clusters (GPCs)
responsible for all the compute/graphics processing including:
- Graphics-related computation
- Rasterization
- Rendering
- Ray Tracing
- Pixel generation
To achieve the above, the Ampere GPC features: 4x Texture Processing Clusters (TPCs), each consisting of: 2x Streaming Multiprocessors (SMs), each with its own Ray Tracing (RT) core 1x PolyMorph Engine (PE) 1x Raster Engine To interact with the SoC for tasks to do and completed, the Ampere GPU features:
- Level-2 (L2) Cache
- MSS Interface
- Host Interface

- GPU
**Figure 6.1 Ampere GPU in Orin**
The key functional blocks and features in the Orin's Ampere GPU are summarized in the following sub-sections.
### 6.1.1 Streaming Multiprocessor (SM)
- The Ampere Streaming Multiprocessor (SM) has 128 CUDA cores. As shown in the following
diagram, the SM is partitioned in four processing blocks, with each containing: 3rd-generation Tensor core 64-KiB Register Files (in 16,384 x 32 organization)

- GPU
- Texture (TEX) unit
- L0 I-Cache
- Warp Scheduler
- Dispatch (32 threads/clk) unit
All four SM share: 192-KiB for L1 Data Cache / Shared Memory a 2nd-generation Ray Tracing (RT) core

- GPU
**Figure 6.2 Ampere Streaming Multiprocessor (SM)**
#### 6.1.1.1 Third-Generation Tensor Core
- The third-generation Tensor Core supports various data types for improved performance,
efficiency, and programming flexibility. These data types are:

- GPU
- INT1
- INT4 (2's complement and magnitude)
- INT8 (2's complement and magnitude)
- INT16 (2's complement and magnitude)
- INT32 (2's complement and magnitude)
- FP16 (standard IEEE Half-precision FP format, with 1 Sign bit, 5 Exponent bits, and 10
- Mantissa bits)
- FP32 (standard IEEE Single-precision FP format, with 1 Sign bit, 8 Exponent bits, and 23
- Mantissa bits)
- FP64 (standard IEEE Double-precision FP format, with 1 Sign bit, 11 Exponent bits, and 52
- Mantissa bits)
- BF16 (an alternative to FP16, with 1 Sign bit, 8 Exponent bits, and 7 Mantissa bits)
- TF32 (1 Sign bit, 8 Exponent bits, and 10 Mantissa bits)
Its new Sparsity feature can take advantage of fine-grained structured sparsity in deep learning networks to double the throughput of its operations compared to its predecessor. In addition, the new Tensor Float 32 (TF32) precision provides up to 5x throughput compared to the previous generation to accelerate AI and data science model training without any code changes. It also significantly accelerates the following operations:
- AI denoising
- NVIDIA DLSS for AI super resolution (now with support for up to 8K)
- NVIDIA Broadcast apps for AI-enhanced video and voice communications
- NVIDIA Canvas app for AI-powered painting
#### 6.1.1.2 2x FP32 Processing
Most graphics workloads are composed of 32-bit Floating point (FP32) operations. The Streaming
- Multiprocessor (SM) in the Ampere GPU Architecture is designed to support double-speed
processing of FP32 operations by adopting the FP32 processing capability on both of the two datapaths within an SM partition, thus doubling the peak processing rate for FP32 operations. In particular, one datapath in the partition consists of the equivalence of 16 FP32 CUDA Cores capable of executing 16 FP32 operations per clock, while the other consists of 16 INT32 Cores and the equivalence of 16 FP32 CUDA Cores capable of executing either 16 INT32 operations or 16 FP32 operations per clock. Consequently, each SM partition can execute either 32 FP32 operations per clock, or 16 FP32 and 16 INT32 operations per clock. Typical graphics workloads have a mixture of FP32 arithmetic instructions such as:
- Full single-precision Floating-point Multiplication and Addition (FFMA)

- GPU
- Floating-point Addition (FADD)
- Floating-point Multiplication (FMUL)
- Floating-point Compare or Min/Max for processing results
Many simpler Integer instructions such as Additions for addressing and fetching data, etc. Having the floating-point capability in both datapaths significantly improves the workloads processing.
- The Ampere SM continues to support double-speed FP16 Half single-precision Floating-point
- Multiplication and Addition (HFMA) operations. Standard FP16 operations are handled by the
Tensor Cores. The 2x FP32 processing provides significant performance improvements for graphics workflows such as 3D model development and workloads compute acceleration for complex 3D simulation critical in Computer-Aided Design (CAD) and Computer-Aided Engineering (CAE) applications.
- Also worth noting is that the SM features 2 FP64 units to ensure programs with FP64 codes
(including FP64 Tensor Core code) operate correctly.
#### 6.1.1.3 Second-Generation Ray Tracing (RT) Core
The second-generation Ray Tracing (RT) Core includes a number of enhancements combined with improvements of the Cache subsystems to effectively deliver up to 2x performance improvement over its predecessor.
- The Ampere SM allows RT Core and graphics, or RT Core and compute workloads to run
concurrently to significantly accelerate many Ray Tracing operations. In addition to the Ray-Traced game rendering benefits, the second-generation RT Core also delivers enormous improvements in workloads acceleration for:
- Photorealistic rendering of movie content
- Architectural design evaluations
- Virtual prototyping of product designs
Other improvements include: Rendering of Ray-Traced motion blur for faster results and greater visual accuracy.
- Rendering of complex models with physically accurate shadows, reflections, and refractions
to empower users with instant insight.
- Powering truly interactive design workflows to provide immediate feedback for
unprecedented levels of productivity, when working in concert with applications leveraging APIs such as NVIDIA OptiX, Microsoft DXR, and Vulkan Ray Tracing.

- GPU
#### 6.1.1.4 Larger and Faster Unified Shared Memory and L1 Data Cache
The Ampere SM used in the Orin SoC features a unified 192-KiB memory architecture for L1 Cache and Shared Memory. This unified structure is configurable to optimally allocate the most suitable L1 Cache and Shared Memory size for the workload at hand. For compute mode, the L1 Cache/Shared Memory configurations are: 192-KiB L1 Cache + 0-KiB Shared Memory 184-KiB L1 Cache + 8-KiB Shared Memory 176-KiB L1 Cache + 16-KiB Shared Memory 160-KiB L1 Cache + 32-KiB Shared Memory 128-KiB L1 Cache + 64-KiB Shared Memory 92-KiB L1 Cache + 100-KiB Shared Memory 60-KiB L1 Cache + 132-KiB Shared Memory 28-KiB L1 cache + 164-KiB Shared Memory For graphics and asynchronous compute mode, the 128-KiB memory structure is configured for: 128-KiB L1 Cache (data/texture) 48-KiB Shared Memory 16-KiB Reserved Usage (for various graphics pipeline operations) The memory bandwidth of the unified memory structure is 128 bytes/clock.
#### 6.1.1.5 Texture (TEX) unit
The TEX unit performs texture fetching and filtering. Beyond plain texture memory access, the TEX unit is also responsible for the following operations necessary to convert a texture Read request to a result:
- Addressing
- Level of Detail (LOD)
- Wrap
- Filter
- Format conversion

- GPU
### 6.1.2 PolyMorph Engine
The PolyMorph Engine performs several primitives, typically triangle-based functions that occur at different stages of the graphics pipe. These functions include:
- Fetching per Vertex Attributes from Memory
- Topology Generation for Tessellation
- Viewport Clipping and Culling
- Attribute Plane Interpolation
### 6.1.3 Raster Engine
The Raster Engine deals with the realm of pixels in the graphics pipe. It takes the primitive vertices (typically triangles) from the PolyMorph Engine then determines which pixels on the screen are covered. In addition, the Raster Engine also performs the following:
- Depth testing to compute visibility of overlapping primitives (ZROP)
- Writing of final pixel colors (CROP)
- The CROP unit is a fixed function unit that performs color blending of pixels/samples. The
ZROP unit is a fixed function unit that performs depth testing of pixels/samples.
### 6.1.4 L2 Cache
All GPU units communicate to memory through the Level-2 (L2) Cache, also known as the L2. The L2 Cache sits between on-chip memory clients and the framebuffer. It is connected to the XBAR (to communicate with GPC units), the CROP, and ZROP units. In addition to providing the caching functionality, the L2 also includes hardware to perform compression and global atomics.
### 6.1.5 Host Interface
The Host Interface provides a path to assign work to do for the GPU.
### 6.1.6 MSS Interface
The MSS interface provides a full bandwidth path for the GPU to read from and write to system memory.

- Multimedia Complex
7. Multimedia Complex
## 6.75 GHz from 270 MHz (multiplier = 25). Can be used only if the eDP
panel reports support for it in the DPCD registers. 18 = EDP_6_48GHZ: Selects the 6.48 GHz link clock; PLL generates
## 6.48 GHz from 270 MHz (multiplier = 24). Can be used only if the eDP
panel reports support for it in the DPCD registers. 19 = EDP_5_94GHZ: Selects the 5.94 GHz link clock; PLL generates
### 6.2.6 of PCI Express Base Specification). For a Multi-Function Device, this
bit controls error reporting for each Function from point-of-view of the respective Function.
- RW
0x0 PCIE_CAP_FATAL_ERR_REPORT_EN:
- Fatal Error Reporting Enable. This bit, in conjunction with other bits,
controls sending ERR_FATAL Messages (for more details, see section 6.2.5 and section 6.2.6 of of PCI Express Base Specification). For a Multi-
- Function device, this bit controls error reporting for each function from
point-of-view of the respective function. For a Root Port, the reporting of
- Fatal errors is internal to the root. No external ERR_FATAL Message is
generated.
- RW
0x0 PCIE_CAP_NON_FATAL_ERR_REPORT_EN:
- Non-Fatal Error Reporting Enable. This bit, in conjunction with other bits,
controls sending ERR_NONFATAL Messages (for more details, see section
### 6.2.5 and Section 6.2.6 of PCI Express Base Specification). For a Multi-
- Function Device, this bit controls error reporting for each function from
point-of-view of the respective Function. For a Root Port, the reporting of
- Non-fatal errors is internal to the root. No external ERR_NONFATAL
Message is generated.
- RW
0x0 PCIE_CAP_CORR_ERR_REPORT_EN:
- Correctable Error Reporting Enable. This bit, in conjunction with other
bits, controls sending ERR_COR Messages (for more details, see section 6.2.5, section 6.2.6, and section 6.2.10.2 of PCI Express Base
- Specification). For a Multi-Function device, this bit controls error
reporting for each function from point-of-view of the respective function. For a Root Port, the reporting of correctable errors is internal to the root. No external ERR_COR Message is generated.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_PCIE_CAP_LINK_CAPABILITIES_REG_0
where <i> = 1, 4, 8. Description: The Link Capabilities register identifies PCI Express Link specific capabilities.
- Offset: 0x7c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_PCIE_CAP_LINK_CAPABILITIES_REG_0
- Reset: 0x007b4c14 (0b0000,0000,0111,1011,0100,1100,0001,0100)
- Bit
R/W
- Reset
- Description
31:24
- RW
0x0 PCIE_CAP_PORT_NUM:
- Port Number. This field indicates the PCI Express Port number for the
given PCI Express Link. Multi-Function Devices associated with an Upstream Port must report the same value in this field for all functions.
- Note: The access attributes of this field are as follows: - Wire: No access. -
- Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
- RO
0x0 RSVDP_23: Reserved for future use.
- RW
0x1 PCIE_CAP_ASPM_OPT_COMPLIANCE: ASPM Optionality Compliance. This field must be set to 1b in all functions.
- Components implemented against certain earlier versions of this
specification will have this bit set to 0b. Software is permitted to use the value of this bit to help determine whether to enable ASPM or whether to run ASPM compliance tests. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
- RW
0x1 PCIE_CAP_LINK_BW_NOT_CAP:
- Link Bandwidth Notification Capability. A value of 1b indicates support for
the Link Bandwidth Notification status and interrupt mechanisms. This capability is required for all Root Ports and Switch Downstream Ports supporting Links wider than x1 and/or multiple Link speeds. This field is not applicable and is Reserved for Endpoints, PCI Express to PCI/PCI-X bridges, and Upstream Ports of Switches. For functions that do not implement the Link Bandwidth Notification Capability the controller hardwires this bit to 0b. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RO
0x1 PCIE_CAP_DLL_ACTIVE_REP_CAP:
- Data Link Layer Link Active Reporting Capable. For a Downstream Port, the
controller hardwires this bit to 1b if the component supports the optional capability of reporting the DL_Active state of the Data Link Control and
- Management State Machine. For a hot-plug capable Downstream Port (as
indicated by the Hot-Plug Capable bit of the Slot Capabilities register) or a
- Downstream Port that supports Link speeds greater than 5.0 GT/s, the
controller hardwires this bit to 1b. For Upstream Ports and components that do not support this optional capability, the controller hardwires this bit to 0b.
- RW
0x1 PCIE_CAP_SURPRISE_DOWN_ERR_REP_CAP:
- Surprise Down Error Reporting Capable. For a Downstream Port, this bit
must be set if the component supports the optional capability of detecting and reporting a Surprise Down error condition. For Upstream Ports and components that do not support this optional capability, the controller hardwires this bit to 0b. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky.
- RO
0x0 PCIE_CAP_CLOCK_POWER_MAN:
- Clock Power Management. For Upstream Ports, a value of 1b in this bit
indicates that the component tolerates the removal of any reference clock(s) via the "clock request" (CLKREQ#) mechanism when the Link is in the L1 and L2/L3 Ready Link states. A value of 0b indicates the component does not have this capability and that reference clock(s) must not be removed in these Link states. L1 PM Substates defines other semantics for the CLKREQ# signal, which are managed independently of Clock Power
- Management. This Capability is applicable only in form factors that
support "clock request" (CLKREQ#) capability. For a Multi-Function device associated with an Upstream Port, each Function indicates its capability independently. Power Management configuration software must only permit reference clock removal if all functions of the Multi-Function device indicate a 1b in this bit. For ARI Devices, all Functions must indicate the same value in this bit. For Downstream Ports, the controller hardwires this bit to 0b. Note: This register field is sticky. 17:15
- RW
0x6 PCIE_CAP_L1_EXIT_LATENCY:
- L1 Exit Latency. This field indicates the L1 exit latency for the given PCI
- Express Link. The value reported indicates the length of time this Port
requires to complete transition from ASPM L1 to L0. If ASPM L1 is not supported, the value is undefined. Note: Exit latencies may be influenced by PCI Express reference clock configuration depending upon whether a component uses a common or separate reference clock. Multi-Function
- Devices associated with an Upstream Port must report the same value in
this field for all functions. There are two each of these register fields, this one and a shadow one at the same address. The Common Clock bit (PCIE_CAP_COMMON_CLK_CONFIG) of the Link Control Register (LINK_CONTROL_LINK_STATUS_REG) determines which one is used by the controller and which one is accessed by a read request. Common Clock operation is supported (possible) in the controller when one or more of the following expressions is true: - CX_NFTS !=CX_COMM_NFTS -
- DEFAULT_L0S_EXIT_LATENCY !=DEFAULT_COMM_L0S_EXIT_LATENCY -
- DEFAULT_L1_EXIT_LATENCY !=DEFAULT_COMM_L1_EXIT_LATENCY
- Common Clock operation is enabled in the controller when you set the
- Common Clock bit (PCIE_CAP_COMMON_CLK_CONFIG) of the Link Control
- Register (LINK_CONTROL_LINK_STATUS_REG). The assertion of CS2 (that
is, assert the dbi_cs2 input, or the CS2 address bit for the AXI bridge) is required to write to the shadow field at this location. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
14:12
- RW
0x4 PCIE_CAP_L0S_EXIT_LATENCY:
- L0s Exit Latency. This field indicates the L0s exit latency for the given PCI
- Express Link. The value reported indicates the length of time this Port
requires to complete transition from L0s to L0. If L0s is not supported, the value is undefined; however, see the Implementation Note "Potential Issues
- With Legacy Software When L0s is Not Supported" in section 5.4.1.1 of PCI
- Express Base Specification for the recommended value. Note: Exit
latencies may be influenced by PCI Express reference clock configuration depending upon whether a component uses a common or separate reference clock. Multi-Function Devices associated with an Upstream Port must report the same value in this field for all functions. There are two each of these register fields, this one and a shadow one at the same address. The Common Clock bit (PCIE_CAP_COMMON_CLK_CONFIG) of the Link Control Register (LINK_CONTROL_LINK_STATUS_REG) determines which one is used by the controller and which one is accessed by a read request. Common Clock operation is supported (possible) in the controller when one or more of the following expressions is true: - CX_NFTS ! =CX_COMM_NFTS - DEFAULT_L0S_EXIT_LATENCY ! =DEFAULT_COMM_L0S_EXIT_LATENCY - DEFAULT_L1_EXIT_LATENCY ! =DEFAULT_COMM_L1_EXIT_LATENCY Common Clock operation is enabled in the controller when you set the Common Clock bit (PCIE_CAP_COMMON_CLK_CONFIG) of the Link Control Register (LINK_CONTROL_LINK_STATUS_REG). The assertion of CS2 (that is, assert the dbi_cs2 input, or the CS2 address bit for the AXI bridge) is required to write to the shadow field at this location. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky. 11:10
- RW
0x3 PCIE_CAP_ACTIVE_STATE_LINK_PM_SUPPORT:
- Active State Power Management (ASPM) Support. This field indicates the
level of ASPM supported on the given PCI Express Link. For more details on
- ASPM support requirements, see section 5.4.1 of PCI Express Base
- Specification. Multi-Function devices associated with an Upstream Port
must report the same value in this field for all functions. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky. 9:4
- RW
0x1 PCIE_CAP_MAX_LINK_WIDTH:
- Maximum Link Width. This field indicates the maximum Link width (xN -
corresponding to N Lanes) implemented by the component. This value is permitted to exceed the number of Lanes routed to the slot (Downstream
- Port), adapter connector (Upstream Port), or in the case of component-to-
component connections, the actual wired connection width. All encodings other than the defined encodings are reserved. Multi-Function devices associated with an Upstream Port must report the same value in this field for all functions. In M-PCIe mode, the reset and dynamic values of this field are calculated by the controller. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky. 3:0
- RW
0x4 PCIE_CAP_MAX_LINK_SPEED:
- Max Link Speed. This field indicates the maximum Link speed of the
associated Port. The encoded value specifies a bit location in the
- Supported Link Speeds Vector (in the Link Capabilities 2 register) that
corresponds to the maximum Link speed. All encodings other than the defined encodings are reserved. Multi-Function Devices associated with an
- Upstream Port must report the same value in this field for all functions. In
M-PCIe mode, the reset and dynamic values of this field are calculated by the controller. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This
register field is sticky.
- PCIE_X4_RC_PF0_PCIE_CAP_LINK_CAPABILITIES_REG_0

- PCIe x1/x4/x8 Root Complex
- Reset: 0x007b4c44 (0b0000,0000,0111,1011,0100,1100,0100,0100)
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
31:24
- RW
0x0 PCIE_CAP_PORT_NUM:
- Port Number. This field indicates the PCI Express Port number for the
given PCI Express Link. Multi-Function Devices associated with an Upstream Port must report the same value in this field for all functions.
- Note: The access attributes of this field are as follows: - Wire: No access. -
- Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
- RO
0x0 RSVDP_23: Reserved for future use.
- RW
0x1 PCIE_CAP_ASPM_OPT_COMPLIANCE: ASPM Optionality Compliance. This field must be set to 1b in all functions.
- Components implemented against certain earlier versions of this
specification will have this bit set to 0b. Software is permitted to use the value of this bit to help determine whether to enable ASPM or whether to run ASPM compliance tests. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
- RW
0x1 PCIE_CAP_LINK_BW_NOT_CAP:
- Link Bandwidth Notification Capability. A value of 1b indicates support for
the Link Bandwidth Notification status and interrupt mechanisms. This capability is required for all Root Ports and Switch Downstream Ports supporting Links wider than x1 and/or multiple Link speeds. This field is not applicable and is Reserved for Endpoints, PCI Express to PCI/PCI-X bridges, and Upstream Ports of Switches. For functions that do not implement the Link Bandwidth Notification Capability the controller hardwires this bit to 0b. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky.
- RO
0x1 PCIE_CAP_DLL_ACTIVE_REP_CAP:
- Data Link Layer Link Active Reporting Capable. For a Downstream Port, the
controller hardwires this bit to 1b if the component supports the optional capability of reporting the DL_Active state of the Data Link Control and
- Management State Machine. For a hot-plug capable Downstream Port (as
indicated by the Hot-Plug Capable bit of the Slot Capabilities register) or a
- Downstream Port that supports Link speeds greater than 5.0 GT/s, the
controller hardwires this bit to 1b. For Upstream Ports and components that do not support this optional capability, the controller hardwires this bit to 0b.
- RW
0x1 PCIE_CAP_SURPRISE_DOWN_ERR_REP_CAP:
- Surprise Down Error Reporting Capable. For a Downstream Port, this bit
must be set if the component supports the optional capability of detecting and reporting a Surprise Down error condition. For Upstream Ports and components that do not support this optional capability, the controller hardwires this bit to 0b. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky.

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
0x0 PCIE_CAP_CLOCK_POWER_MAN:
- Clock Power Management. For Upstream Ports, a value of 1b in this bit
indicates that the component tolerates the removal of any reference clock(s) via the "clock request" (CLKREQ#) mechanism when the Link is in the L1 and L2/L3 Ready Link states. A value of 0b indicates the component does not have this capability and that reference clock(s) must not be removed in these Link states. L1 PM Substates defines other semantics for the CLKREQ# signal, which are managed independently of Clock Power
- Management. This Capability is applicable only in form factors that
support "clock request" (CLKREQ#) capability. For a Multi-Function device associated with an Upstream Port, each Function indicates its capability independently. Power Management configuration software must only permit reference clock removal if all functions of the Multi-Function device indicate a 1b in this bit. For ARI Devices, all Functions must indicate the same value in this bit. For Downstream Ports, the controller hardwires this bit to 0b. Note: This register field is sticky. 17:15
- RW
0x6 PCIE_CAP_L1_EXIT_LATENCY:
- L1 Exit Latency. This field indicates the L1 exit latency for the given PCI
- Express Link. The value reported indicates the length of time this Port
requires to complete transition from ASPM L1 to L0. If ASPM L1 is not supported, the value is undefined. Note: Exit latencies may be influenced by PCI Express reference clock configuration depending upon whether a component uses a common or separate reference clock. Multi-Function
- Devices associated with an Upstream Port must report the same value in
this field for all functions. There are two each of these register fields, this one and a shadow one at the same address. The Common Clock bit (PCIE_CAP_COMMON_CLK_CONFIG) of the Link Control Register (LINK_CONTROL_LINK_STATUS_REG) determines which one is used by the controller and which one is accessed by a read request. Common Clock operation is supported (possible) in the controller when one or more of the following expressions is true: - CX_NFTS !=CX_COMM_NFTS -
- DEFAULT_L0S_EXIT_LATENCY !=DEFAULT_COMM_L0S_EXIT_LATENCY -
- DEFAULT_L1_EXIT_LATENCY !=DEFAULT_COMM_L1_EXIT_LATENCY
- Common Clock operation is enabled in the controller when you set the
- Common Clock bit (PCIE_CAP_COMMON_CLK_CONFIG) of the Link Control
- Register (LINK_CONTROL_LINK_STATUS_REG). The assertion of CS2 (that
is, assert the dbi_cs2 input, or the CS2 address bit for the AXI bridge) is required to write to the shadow field at this location. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
14:12
- RW
0x4 PCIE_CAP_L0S_EXIT_LATENCY:
- L0s Exit Latency. This field indicates the L0s exit latency for the given PCI
- Express Link. The value reported indicates the length of time this Port
requires to complete transition from L0s to L0. If L0s is not supported, the value is undefined; however, see the Implementation Note "Potential Issues
- With Legacy Software When L0s is Not Supported" in section 5.4.1.1 of PCI
- Express Base Specification for the recommended value. Note: Exit
latencies may be influenced by PCI Express reference clock configuration depending upon whether a component uses a common or separate reference clock. Multi-Function Devices associated with an Upstream Port must report the same value in this field for all functions. There are two each of these register fields, this one and a shadow one at the same address. The Common Clock bit (PCIE_CAP_COMMON_CLK_CONFIG) of the Link Control Register (LINK_CONTROL_LINK_STATUS_REG) determines which one is used by the controller and which one is accessed by a read request. Common Clock operation is supported (possible) in the controller when one or more of the following expressions is true: - CX_NFTS ! =CX_COMM_NFTS - DEFAULT_L0S_EXIT_LATENCY ! =DEFAULT_COMM_L0S_EXIT_LATENCY - DEFAULT_L1_EXIT_LATENCY ! =DEFAULT_COMM_L1_EXIT_LATENCY Common Clock operation is enabled in the controller when you set the Common Clock bit (PCIE_CAP_COMMON_CLK_CONFIG) of the Link Control Register (LINK_CONTROL_LINK_STATUS_REG). The assertion of CS2 (that is, assert the dbi_cs2 input, or the CS2 address bit for the AXI bridge) is required to write to the shadow field at this location. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky. 11:10
- RW
0x3 PCIE_CAP_ACTIVE_STATE_LINK_PM_SUPPORT:
- Active State Power Management (ASPM) Support. This field indicates the
level of ASPM supported on the given PCI Express Link. For more details on
- ASPM support requirements, see section 5.4.1 of PCI Express Base
- Specification. Multi-Function devices associated with an Upstream Port
must report the same value in this field for all functions. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky. 9:4
- RW
0x4 PCIE_CAP_MAX_LINK_WIDTH:
- Maximum Link Width. This field indicates the maximum Link width (xN -
corresponding to N Lanes) implemented by the component. This value is permitted to exceed the number of Lanes routed to the slot (Downstream
- Port), adapter connector (Upstream Port), or in the case of component-to-
component connections, the actual wired connection width. All encodings other than the defined encodings are reserved. Multi-Function devices associated with an Upstream Port must report the same value in this field for all functions. In M-PCIe mode, the reset and dynamic values of this field are calculated by the controller. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky. 3:0
- RW
0x4 PCIE_CAP_MAX_LINK_SPEED:
- Max Link Speed. This field indicates the maximum Link speed of the
associated Port. The encoded value specifies a bit location in the
- Supported Link Speeds Vector (in the Link Capabilities 2 register) that
corresponds to the maximum Link speed. All encodings other than the defined encodings are reserved. Multi-Function Devices associated with an
- Upstream Port must report the same value in this field for all functions. In
M-PCIe mode, the reset and dynamic values of this field are calculated by the controller. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This
register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X8_RC_PF0_PCIE_CAP_LINK_CAPABILITIES_REG_0
- Reset: 0x007b4c84 (0b0000,0000,0111,1011,0100,1100,1000,0100)
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
31:24
- RW
0x0 PCIE_CAP_PORT_NUM:
- Port Number. This field indicates the PCI Express Port number for the
given PCI Express Link. Multi-Function Devices associated with an Upstream Port must report the same value in this field for all functions.
- Note: The access attributes of this field are as follows: - Wire: No access. -
- Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
- RO
0x0 RSVDP_23: Reserved for future use.
- RW
0x1 PCIE_CAP_ASPM_OPT_COMPLIANCE: ASPM Optionality Compliance. This field must be set to 1b in all functions.
- Components implemented against certain earlier versions of this
specification will have this bit set to 0b. Software is permitted to use the value of this bit to help determine whether to enable ASPM or whether to run ASPM compliance tests. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
- RW
0x1 PCIE_CAP_LINK_BW_NOT_CAP:
- Link Bandwidth Notification Capability. A value of 1b indicates support for
the Link Bandwidth Notification status and interrupt mechanisms. This capability is required for all Root Ports and Switch Downstream Ports supporting Links wider than x1 and/or multiple Link speeds. This field is not applicable and is Reserved for Endpoints, PCI Express to PCI/PCI-X bridges, and Upstream Ports of Switches. For functions that do not implement the Link Bandwidth Notification Capability the controller hardwires this bit to 0b. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky.
- RO
0x1 PCIE_CAP_DLL_ACTIVE_REP_CAP:
- Data Link Layer Link Active Reporting Capable. For a Downstream Port, the
controller hardwires this bit to 1b if the component supports the optional capability of reporting the DL_Active state of the Data Link Control and
- Management State Machine. For a hot-plug capable Downstream Port (as
indicated by the Hot-Plug Capable bit of the Slot Capabilities register) or a
- Downstream Port that supports Link speeds greater than 5.0 GT/s, the
controller hardwires this bit to 1b. For Upstream Ports and components that do not support this optional capability, the controller hardwires this bit to 0b.
- RW
0x1 PCIE_CAP_SURPRISE_DOWN_ERR_REP_CAP:
- Surprise Down Error Reporting Capable. For a Downstream Port, this bit
must be set if the component supports the optional capability of detecting and reporting a Surprise Down error condition. For Upstream Ports and components that do not support this optional capability, the controller hardwires this bit to 0b. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky.

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
0x0 PCIE_CAP_CLOCK_POWER_MAN:
- Clock Power Management. For Upstream Ports, a value of 1b in this bit
indicates that the component tolerates the removal of any reference clock(s) via the "clock request" (CLKREQ#) mechanism when the Link is in the L1 and L2/L3 Ready Link states. A value of 0b indicates the component does not have this capability and that reference clock(s) must not be removed in these Link states. L1 PM Substates defines other semantics for the CLKREQ# signal, which are managed independently of Clock Power
- Management. This Capability is applicable only in form factors that
support "clock request" (CLKREQ#) capability. For a Multi-Function device associated with an Upstream Port, each Function indicates its capability independently. Power Management configuration software must only permit reference clock removal if all functions of the Multi-Function device indicate a 1b in this bit. For ARI Devices, all Functions must indicate the same value in this bit. For Downstream Ports, the controller hardwires this bit to 0b. Note: This register field is sticky. 17:15
- RW
0x6 PCIE_CAP_L1_EXIT_LATENCY:
- L1 Exit Latency. This field indicates the L1 exit latency for the given PCI
- Express Link. The value reported indicates the length of time this Port
requires to complete transition from ASPM L1 to L0. If ASPM L1 is not supported, the value is undefined. Note: Exit latencies may be influenced by PCI Express reference clock configuration depending upon whether a component uses a common or separate reference clock. Multi-Function
- Devices associated with an Upstream Port must report the same value in
this field for all functions. There are two each of these register fields, this one and a shadow one at the same address. The Common Clock bit (PCIE_CAP_COMMON_CLK_CONFIG) of the Link Control Register (LINK_CONTROL_LINK_STATUS_REG) determines which one is used by the controller and which one is accessed by a read request. Common Clock operation is supported (possible) in the controller when one or more of the following expressions is true: - CX_NFTS !=CX_COMM_NFTS -
- DEFAULT_L0S_EXIT_LATENCY !=DEFAULT_COMM_L0S_EXIT_LATENCY -
- DEFAULT_L1_EXIT_LATENCY !=DEFAULT_COMM_L1_EXIT_LATENCY
- Common Clock operation is enabled in the controller when you set the
- Common Clock bit (PCIE_CAP_COMMON_CLK_CONFIG) of the Link Control
- Register (LINK_CONTROL_LINK_STATUS_REG). The assertion of CS2 (that
is, assert the dbi_cs2 input, or the CS2 address bit for the AXI bridge) is required to write to the shadow field at this location. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
14:12
- RW
0x4 PCIE_CAP_L0S_EXIT_LATENCY:
- L0s Exit Latency. This field indicates the L0s exit latency for the given PCI
- Express Link. The value reported indicates the length of time this Port
requires to complete transition from L0s to L0. If L0s is not supported, the value is undefined; however, see the Implementation Note "Potential Issues
- With Legacy Software When L0s is Not Supported" in section 5.4.1.1 of PCI
- Express Base Specification for the recommended value. Note: Exit
latencies may be influenced by PCI Express reference clock configuration depending upon whether a component uses a common or separate reference clock. Multi-Function Devices associated with an Upstream Port must report the same value in this field for all functions. There are two each of these register fields, this one and a shadow one at the same address. The Common Clock bit (PCIE_CAP_COMMON_CLK_CONFIG) of the Link Control Register (LINK_CONTROL_LINK_STATUS_REG) determines which one is used by the controller and which one is accessed by a read request. Common Clock operation is supported (possible) in the controller when one or more of the following expressions is true: - CX_NFTS ! =CX_COMM_NFTS - DEFAULT_L0S_EXIT_LATENCY ! =DEFAULT_COMM_L0S_EXIT_LATENCY - DEFAULT_L1_EXIT_LATENCY ! =DEFAULT_COMM_L1_EXIT_LATENCY Common Clock operation is enabled in the controller when you set the Common Clock bit (PCIE_CAP_COMMON_CLK_CONFIG) of the Link Control Register (LINK_CONTROL_LINK_STATUS_REG). The assertion of CS2 (that is, assert the dbi_cs2 input, or the CS2 address bit for the AXI bridge) is required to write to the shadow field at this location. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky. 11:10
- RW
0x3 PCIE_CAP_ACTIVE_STATE_LINK_PM_SUPPORT:
- Active State Power Management (ASPM) Support. This field indicates the
level of ASPM supported on the given PCI Express Link. For more details on
- ASPM support requirements, see section 5.4.1 of PCI Express Base
- Specification. Multi-Function devices associated with an Upstream Port
must report the same value in this field for all functions. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky. 9:4
- RW
0x8 PCIE_CAP_MAX_LINK_WIDTH:
- Maximum Link Width. This field indicates the maximum Link width (xN -
corresponding to N Lanes) implemented by the component. This value is permitted to exceed the number of Lanes routed to the slot (Downstream
- Port), adapter connector (Upstream Port), or in the case of component-to-
component connections, the actual wired connection width. All encodings other than the defined encodings are reserved. Multi-Function devices associated with an Upstream Port must report the same value in this field for all functions. In M-PCIe mode, the reset and dynamic values of this field are calculated by the controller. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky. 3:0
- RW
0x4 PCIE_CAP_MAX_LINK_SPEED:
- Max Link Speed. This field indicates the maximum Link speed of the
associated Port. The encoded value specifies a bit location in the
- Supported Link Speeds Vector (in the Link Capabilities 2 register) that
corresponds to the maximum Link speed. All encodings other than the defined encodings are reserved. Multi-Function Devices associated with an
- Upstream Port must report the same value in this field for all functions. In
M-PCIe mode, the reset and dynamic values of this field are calculated by the controller. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This
register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_PCIE_CAP_LINK_CONTROL_LINK_STATUS_REG_0
where <i> = 1, 4, 8. Description: This register controls and provides information about PCI Express Link specific parameters.
- PCIE_X1_RC_PF0_PCIE_CAP_LINK_CONTROL_LINK_STATUS_REG_0
- PCIE_X4_RC_PF0_PCIE_CAP_LINK_CONTROL_LINK_STATUS_REG_0
- PCIE_X8_RC_PF0_PCIE_CAP_LINK_CONTROL_LINK_STATUS_REG_0
- Offset: 0x80
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x10110000 (0b0001,0000,0001,0001,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RW
0x0 PCIE_CAP_LINK_AUTO_BW_STATUS:
- Link Autonomous Bandwidth Status. This bit is set by hardware to indicate
that hardware has autonomously changed Link speed or width, without the Port transitioning through DL_Down status, for reasons other than to attempt to correct unreliable Link operation. This bit must be set if the
- Physical Layer reports a speed or width change was initiated by the
Downstream component that was indicated as an autonomous change.
- The write value is gated with the PCIE_CAP_LINK_BW_NOT_CAP field in
- LINK_CAPABILITIES_REG. This bit is not applicable and is Reserved for
- Endpoints, PCI Express-to-PCI/PCI-X bridges, and Upstream Ports of
- Switches. For functions that do not implement the Link Bandwidth
Notification Capability, the controller hardwires this bit to 0b.
- RW
0x0 PCIE_CAP_LINK_BW_MAN_STATUS:
- Link Bandwidth Management Status. This bit is set by hardware to
indicate that either of the following has occurred without the Port transitioning through DL_Down status: - A Link retraining has completed following a write of 1b to the Retrain Link bit. Note: This bit is set following any write of 1b to the Retrain Link bit, including when the Link is in the process of retraining for some other reason. - Hardware has changed Link speed or width to attempt to correct unreliable Link operation, either through an LTSSM timeout or a higher level process. This bit must be set if the Physical Layer reports a speed or width change was initiated by the
- Downstream component that was not indicated as an autonomous
change. This bit is not applicable and is Reserved for Endpoints, PCI
- Express-to-PCI/PCI-X bridges, and Upstream Ports of Switches. For
functions that do not implement the Link Bandwidth Notification
- Capability, the controller hardwires this bit to 0b. The default value of this
bit is 0b. The write value is gated with the PCIE_CAP_LINK_BW_NOT_CAP field in LINK_CAPABILITIES_REG.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RO
0x0 PCIE_CAP_DLL_ACTIVE:
- Data Link Layer Link Active. This bit indicates the status of the Data Link
- Control and Management State Machine. It returns a 1b to indicate the
- DL_Active state, 0b otherwise. This bit must be implemented if the Data
- Link Layer Link Active Reporting Capable bit is 1b. Otherwise, the
controller hardwires it to 0b.
- RW
0x1 PCIE_CAP_SLOT_CLK_CONFIG:
- Slot Clock Configuration. This bit indicates that the component uses the
same physical reference clock that the platform provides on the connector. If the device uses an independent clock irrespective of the presence of a reference clock on the connector, this bit must be clear. For a Multi-Function Device, each Function must report the same value for this bit. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
- RO
0x0 PCIE_CAP_LINK_TRAINING:
- Link Training. This read-only bit indicates that the Physical Layer LTSSM is
in the Configuration or Recovery state, or that 1b was written to the
- Retrain Link bit but Link training has not yet begun. Hardware clears this
bit when the LTSSM exits the Configuration/Recovery state. This bit is not applicable and Reserved for Endpoints, PCI Express to PCI/PCI-X bridges, and Upstream Ports of Switches, and the controller hardwires it to 0b.
- RO
0x0 RSVDP_26: Reserved for future use. 25:20
- RO
0x1 PCIE_CAP_NEGO_LINK_WIDTH:
- Negotiated Link Width. This field indicates the negotiated width of the
given PCI Express Link. All encodings other than the defined encodings are reserved. The value in this field is undefined when the Link is not up. 19:16
- RO
0x1 PCIE_CAP_LINK_SPEED:
- Current Link Speed. This field indicates the negotiated Link speed of the
given PCI Express Link. The encoded value specifies a bit location in the
- Supported Link Speeds Vector (in the Link Capabilities 2 register) that
corresponds to the current Link speed. All encodings other than the defined encodings are reserved. The value in this field is undefined when the Link is not up. 15:14
- RW
0x0 PCIE_CAP_DRS_SIGNALING_CONTROL:
- DRS Signaling Control. Indicates the mechanism used to report reception
of a DRS message. Must be implemented for Downstream Ports with the
- DRS Supported bit Set in the Link Capabilities 2 Register. Encodings are: If
- DRS Supported is set, receiving a DRS Message will set DRS Message
- Received in the Link Status 2 Register but will otherwise have no effect If
the DRS Message Received bit in the Link Status 2 Register transitions from 0 to 1, and either MSI or MSI-X is enabled, an MSI or MSI-X interrupt is generated using the vector in Interrupt Message Number (section 7.5.3.2) If the DRS Message Received bit in the Link Status 2 Register transitions from 0 to 1, the Port must send an FRS Message Upstream with the FRS Reason field set to DRS Message Received. Behavior is undefined if this field is set to 10b and the FRS Supported bit in the
- Device Capabilities 2 Register is Clear. Behavior is undefined if this field is
set to 11b. For Downstream Ports with the DRS Supported bit clear in the
- Link Capabilities 2 register, the controller hardwires this field to 00b. This
field is Reserved for Upstream Ports. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi:
- LINK_CAPABILITIES2_REG.DRS_SUPPORTED ? RW : RO
13:12
- RO
0x0 RSVDP_12: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x0 PCIE_CAP_LINK_AUTO_BW_INT_EN:
- Link Autonomous Bandwidth Management Interrupt Enable. When set,
this bit enables the generation of an interrupt to indicate that the Link
- Autonomous Bandwidth Status bit has been set. The write value is gated
with the PCIE_CAP_LINK_BW_NOT_CAP field in LINK_CAPABILITIES_REG.
- This bit is not applicable and is Reserved for Endpoints, PCI Express-to-
- PCI/PCI-X bridges, and Upstream Ports of Switches. For functions that do
not implement the Link Bandwidth Notification Capability, the controller hardwires this bit to 0b. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi:
- LINK_CAPABILITIES_REG.PCIE_CAP_LINK_BW_NOT_CAP ? RW : RO
- RW
0x0 PCIE_CAP_LINK_BW_MAN_INT_EN:
- Link Bandwidth Management Interrupt Enable. When set, this bit enables
the generation of an interrupt to indicate that the Link Bandwidth
- Management Status bit has been set. The write value is gated with the
- PCIE_CAP_LINK_BW_NOT_CAP field in LINK_CAPABILITIES_REG. This bit is
not applicable and is Reserved for Endpoints, PCI Express-to-PCI/PCI-X bridges, and Upstream Ports of Switches. For functions that do not implement the Link Bandwidth Notification Capability, the controller hardwires this bit to 0b. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi:
- LINK_CAPABILITIES_REG.PCIE_CAP_LINK_BW_NOT_CAP ? RW : RO
- RW
0x0 PCIE_CAP_HW_AUTO_WIDTH_DISABLE:
- Hardware Autonomous Width Disable. When set, this bit disables
hardware from changing the Link width for reasons other than attempting to correct unreliable Link operation by reducing Link width. For a Multi-
- Function Device associated with an Upstream Port, the bit in Function 0 is
of type RW, and only Function 0 controls the component's Link behavior. In all other Functions of that device, this bit is of type RsvdP. For components that do not implement the ability autonomously to change
- Link width, the ciontroller hardwires this bit to 0b. Note: The access
attributes of this field are as follows: - Wire: No access. - Dbi: R/W
- RW
0x0 PCIE_CAP_EN_CLK_POWER_MAN:
- Enable Clock Power Management. Applicable only for Upstream Ports and
with form factors that support a "Clock Request" (CLKREQ#) mechanism, this bit operates as follows: For a non-ARI Multi-Function Device, power- management-configuration software must only Set this bit if all Functions of the Multi-Function Device indicate a 1b in the Clock Power
- Management bit of the Link Capabilities register. The component is
permitted to use the CLKREQ# signal to power manage Link clock only if this bit is Set for all Functions. For ARI Devices, Clock Power Management is enabled solely by the setting in Function 0. The settings in the other
- Functions always return whatever value software programmed for each,
but otherwise are ignored by the component. The CLKREQ# signal may also be controlled via the L1 PM Substates mechanism. Such control is not affected by the setting of this bit. For Downstream Ports and components that do not support Clock Power Management (as indicated by a 0b value in the Clock Power Management bit of the Link Capabilities register), the controller hardwires this bit to 0b. The write value is gated with the PCIE_CAP_CLOCK_POWER_MAN field in LINK_CAPABILITIES_REG. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi:
- LINK_CAPABILITIES_REG.PCIE_CAP_CLOCK_POWER_MAN ? RWS : ROS
Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x0 PCIE_CAP_EXTENDED_SYNCH:
- Extended Synch. When set, this bit forces the transmission of additional
- Ordered Sets when exiting the L0s state (see section 4.2.4.5 of PCI
- Express Base Specification) and when in the Recovery state (see section
### 6.2.6 of PCI Express Base Specification). For a Multi-Function Device, this
bit controls error reporting for each Function from point-of-view of the respective Function.
- RW
0x0 PCIE_CAP_FATAL_ERR_REPORT_EN:
- Fatal Error Reporting Enable. This bit, in conjunction with other bits,
controls sending ERR_FATAL Messages (for more details, see section 6.2.5 and section 6.2.6 of of PCI Express Base Specification). For a Multi-
- Function device, this bit controls error reporting for each function from
point-of-view of the respective function. For a Root Port, the reporting of
- Fatal errors is internal to the root. No external ERR_FATAL Message is
generated.

- PCIe x4/x8 Endpoint
- Bit
R/W
- Reset
- Description
- RW
0x0 PCIE_CAP_NON_FATAL_ERR_REPORT_EN:
- Non-Fatal Error Reporting Enable. This bit, in conjunction with other bits,
controls sending ERR_NONFATAL Messages (for more details, see section
### 6.2.5 and Section 6.2.6 of PCI Express Base Specification). For a Multi-
- Function Device, this bit controls error reporting for each function from
point-of-view of the respective Function. For a Root Port, the reporting of
- Non-fatal errors is internal to the root. No external ERR_NONFATAL
Message is generated.
- RW
0x0 PCIE_CAP_CORR_ERR_REPORT_EN:
- Correctable Error Reporting Enable. This bit, in conjunction with other
bits, controls sending ERR_COR Messages (for more details, see section 6.2.5, section 6.2.6, and section 6.2.10.2 of PCI Express Base
- Specification). For a Multi-Function device, this bit controls error
reporting for each function from point-of-view of the respective function. For a Root Port, the reporting of correctable errors is internal to the root. No external ERR_COR Message is generated.
- PCIE_X<j>_EP_PF0_PCIE_CAP_LINK_CAPABILITIES_REG_0
where <j> = 4, 8. Description:The Link Capabilities register identifies PCI Express Link specific capabilities.
- Offset: 0x7c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X4_EP_PF0_PCIE_CAP_LINK_CAPABILITIES_REG_0
- Reset: 0x00474c44 (0b0000,0000,0100,0111,0100,1100,0100,0100)
- Bit
R/W
- Reset
- Description
31:24
- RW
0x0 PCIE_CAP_PORT_NUM:
- Port Number. This field indicates the PCI Express Port number for the
given PCI Express Link. Multi-Function Devices associated with an Upstream Port must report the same value in this field for all functions. Note: The access attributes of this field are as follows: - Wire: HWINIT - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
- RO
0x0 RSVDP_23: Reserved for future use.
- RW
0x1 PCIE_CAP_ASPM_OPT_COMPLIANCE: ASPM Optionality Compliance. This field must be set to 1b in all functions.
- Components implemented against certain earlier versions of this
specification will have this bit set to 0b. Software is permitted to use the value of this bit to help determine whether to enable ASPM or whether to run ASPM compliance tests. Note: The access attributes of this field are as follows: - Wire: HWINIT - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R

- PCIe x4/x8 Endpoint
- Bit
R/W
- Reset
- Description
- RO
0x0 PCIE_CAP_LINK_BW_NOT_CAP:
- Link Bandwidth Notification Capability. A value of 1b indicates support for
the Link Bandwidth Notification status and interrupt mechanisms. This capability is required for all Root Ports and Switch Downstream Ports supporting Links wider than x1 and/or multiple Link speeds. This field is not applicable and is Reserved for Endpoints, PCI Express to PCI/PCI-X bridges, and Upstream Ports of Switches. For functions that do not implement the Link Bandwidth Notification Capability the controller hardwires this bit to 0b. Note: This register field is sticky.
- RO
0x0 PCIE_CAP_DLL_ACTIVE_REP_CAP:
- Data Link Layer Link Active Reporting Capable. For a Downstream Port, the
controller hardwires this bit to 1b if the component supports the optional capability of reporting the DL_Active state of the Data Link Control and
- Management State Machine. For a hot-plug capable Downstream Port (as
indicated by the Hot-Plug Capable bit of the Slot Capabilities register) or a
- Downstream Port that supports Link speeds greater than 5.0 GT/s, the
controller hardwires this bit to 1b. For Upstream Ports and components that do not support this optional capability, the controller hardwires this bit to 0b.
- RO
0x0 PCIE_CAP_SURPRISE_DOWN_ERR_REP_CAP:
- Surprise Down Error Reporting Capable. For a Downstream Port, this bit
must be set if the component supports the optional capability of detecting and reporting a Surprise Down error condition. For Upstream Ports and components that do not support this optional capability, the controller hardwires this bit to 0b. Note: This register field is sticky.
- RW
0x1 PCIE_CAP_CLOCK_POWER_MAN:
- Clock Power Management. For Upstream Ports, a value of 1b in this bit
indicates that the component tolerates the removal of any reference clock(s) via the "clock request" (CLKREQ#) mechanism when the Link is in the L1 and L2/L3 Ready Link states. A value of 0b indicates the component does not have this capability and that reference clock(s) must not be removed in these Link states. L1 PM Substates defines other semantics for the CLKREQ# signal, which are managed independently of Clock Power
- Management. This Capability is applicable only in form factors that
support "clock request" (CLKREQ#) capability. For a Multi-Function device associated with an Upstream Port, each Function indicates its capability independently. Power Management configuration software must only permit reference clock removal if all functions of the Multi-Function device indicate a 1b in this bit. For ARI Devices, all Functions must indicate the same value in this bit. For Downstream Ports, the controller hardwires this bit to 0b. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.

- PCIe x4/x8 Endpoint
- Bit
R/W
- Reset
- Description
17:15
- RW
0x6 PCIE_CAP_L1_EXIT_LATENCY:
- L1 Exit Latency. This field indicates the L1 exit latency for the given PCI
- Express Link. The value reported indicates the length of time this Port
requires to complete transition from ASPM L1 to L0. If ASPM L1 is not supported, the value is undefined. Note: Exit latencies may be influenced by PCI Express reference clock configuration depending upon whether a component uses a common or separate reference clock. Multi-Function
- Devices associated with an Upstream Port must report the same value in
this field for all functions. There are two each of these register fields, this one and a shadow one at the same address. The Common Clock bit (PCIE_CAP_COMMON_CLK_CONFIG) of the Link Control Register (LINK_CONTROL_LINK_STATUS_REG) determines which one is used by the controller and which one is accessed by a read request. Common Clock operation is supported (possible) in the controller when one or more of the following expressions is true: - CX_NFTS !=CX_COMM_NFTS -
- DEFAULT_L0S_EXIT_LATENCY !=DEFAULT_COMM_L0S_EXIT_LATENCY -
- DEFAULT_L1_EXIT_LATENCY !=DEFAULT_COMM_L1_EXIT_LATENCY
- Common Clock operation is enabled in the controller when you set the
- Common Clock bit (PCIE_CAP_COMMON_CLK_CONFIG) of the Link Control
- Register (LINK_CONTROL_LINK_STATUS_REG). The assertion of CS2 (that
is, assert the dbi_cs2 input, or the CS2 address bit for the AXI bridge) is required to write to the shadow field at this location. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky. 14:12
- RW
0x4 PCIE_CAP_L0S_EXIT_LATENCY:
- L0s Exit Latency. This field indicates the L0s exit latency for the given PCI
- Express Link. The value reported indicates the length of time this Port
requires to complete transition from L0s to L0. If L0s is not supported, the value is undefined; however, see the Implementation Note "Potential Issues
- With Legacy Software When L0s is Not Supported" in section 5.4.1.1 of PCI
- Express Base Specification for the recommended value. Note: Exit
latencies may be influenced by PCI Express reference clock configuration depending upon whether a component uses a common or separate reference clock. Multi-Function Devices associated with an Upstream Port must report the same value in this field for all functions. There are two each of these register fields, this one and a shadow one at the same address. The Common Clock bit (PCIE_CAP_COMMON_CLK_CONFIG) of the Link Control Register (LINK_CONTROL_LINK_STATUS_REG) determines which one is used by the controller and which one is accessed by a read request. Common Clock operation is supported (possible) in the controller when one or more of the following expressions is true: - CX_NFTS ! =CX_COMM_NFTS - DEFAULT_L0S_EXIT_LATENCY ! =DEFAULT_COMM_L0S_EXIT_LATENCY - DEFAULT_L1_EXIT_LATENCY ! =DEFAULT_COMM_L1_EXIT_LATENCY Common Clock operation is enabled in the controller when you set the Common Clock bit (PCIE_CAP_COMMON_CLK_CONFIG) of the Link Control Register (LINK_CONTROL_LINK_STATUS_REG). The assertion of CS2 (that is, assert the dbi_cs2 input, or the CS2 address bit for the AXI bridge) is required to write to the shadow field at this location. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky. 11:10
- RW
0x3 PCIE_CAP_ACTIVE_STATE_LINK_PM_SUPPORT:
- Active State Power Management (ASPM) Support. This field indicates the
level of ASPM supported on the given PCI Express Link. For more details on
- ASPM support requirements, see section 5.4.1 of PCI Express Base
- Specification. Multi-Function devices associated with an Upstream Port
must report the same value in this field for all functions. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky.

- PCIe x4/x8 Endpoint
- Bit
R/W
- Reset
- Description
9:4
- RW
0x4 PCIE_CAP_MAX_LINK_WIDTH:
- Maximum Link Width. This field indicates the maximum Link width (xN -
corresponding to N Lanes) implemented by the component. This value is permitted to exceed the number of Lanes routed to the slot (Downstream
- Port), adapter connector (Upstream Port), or in the case of component-to-
component connections, the actual wired connection width. All encodings other than the defined encodings are reserved. Multi-Function devices associated with an Upstream Port must report the same value in this field for all functions. In M-PCIe mode, the reset and dynamic values of this field are calculated by the controller. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky. 3:0
- RW
0x4 PCIE_CAP_MAX_LINK_SPEED:
- Max Link Speed. This field indicates the maximum Link speed of the
associated Port. The encoded value specifies a bit location in the
- Supported Link Speeds Vector (in the Link Capabilities 2 register) that
corresponds to the maximum Link speed. All encodings other than the defined encodings are reserved. Multi-Function Devices associated with an
- Upstream Port must report the same value in this field for all functions. In
M-PCIe mode, the reset and dynamic values of this field are calculated by the controller. Note: The access attributes of this field are as follows: -
- Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This
register field is sticky.
- PCIE_X8_EP_PF0_PCIE_CAP_LINK_CAPABILITIES_REG_0
- Reset: 0x00474c84 (0b0000,0000,0100,0111,0100,1100,1000,0100)
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
31:24
- RW
0x0 PCIE_CAP_PORT_NUM:
- Port Number. This field indicates the PCI Express Port number for the
given PCI Express Link. Multi-Function Devices associated with an Upstream Port must report the same value in this field for all functions. Note: The access attributes of this field are as follows: - Wire: HWINIT - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
- RO
0x0 RSVDP_23: Reserved for future use.
- RW
0x1 PCIE_CAP_ASPM_OPT_COMPLIANCE: ASPM Optionality Compliance. This field must be set to 1b in all functions.
- Components implemented against certain earlier versions of this
specification will have this bit set to 0b. Software is permitted to use the value of this bit to help determine whether to enable ASPM or whether to run ASPM compliance tests. Note: The access attributes of this field are as follows: - Wire: HWINIT - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
- RO
0x0 PCIE_CAP_LINK_BW_NOT_CAP:
- Link Bandwidth Notification Capability. A value of 1b indicates support for
the Link Bandwidth Notification status and interrupt mechanisms. This capability is required for all Root Ports and Switch Downstream Ports supporting Links wider than x1 and/or multiple Link speeds. This field is not applicable and is Reserved for Endpoints, PCI Express to PCI/PCI-X bridges, and Upstream Ports of Switches. For functions that do not implement the Link Bandwidth Notification Capability the controller hardwires this bit to 0b. Note: This register field is sticky.

- PCIe x4/x8 Endpoint
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
- RO
0x0 PCIE_CAP_DLL_ACTIVE_REP_CAP:
- Data Link Layer Link Active Reporting Capable. For a Downstream Port, the
controller hardwires this bit to 1b if the component supports the optional capability of reporting the DL_Active state of the Data Link Control and
- Management State Machine. For a hot-plug capable Downstream Port (as
indicated by the Hot-Plug Capable bit of the Slot Capabilities register) or a
- Downstream Port that supports Link speeds greater than 5.0 GT/s, the
controller hardwires this bit to 1b. For Upstream Ports and components that do not support this optional capability, the controller hardwires this bit to 0b.
- RO
0x0 PCIE_CAP_SURPRISE_DOWN_ERR_REP_CAP:
- Surprise Down Error Reporting Capable. For a Downstream Port, this bit
must be set if the component supports the optional capability of detecting and reporting a Surprise Down error condition. For Upstream Ports and components that do not support this optional capability, the controller hardwires this bit to 0b. Note: This register field is sticky.
- RW
0x1 PCIE_CAP_CLOCK_POWER_MAN:
- Clock Power Management. For Upstream Ports, a value of 1b in this bit
indicates that the component tolerates the removal of any reference clock(s) via the "clock request" (CLKREQ#) mechanism when the Link is in the L1 and L2/L3 Ready Link states. A value of 0b indicates the component does not have this capability and that reference clock(s) must not be removed in these Link states. L1 PM Substates defines other semantics for the CLKREQ# signal, which are managed independently of Clock Power
- Management. This Capability is applicable only in form factors that
support "clock request" (CLKREQ#) capability. For a Multi-Function device associated with an Upstream Port, each Function indicates its capability independently. Power Management configuration software must only permit reference clock removal if all functions of the Multi-Function device indicate a 1b in this bit. For ARI Devices, all Functions must indicate the same value in this bit. For Downstream Ports, the controller hardwires this bit to 0b. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 17:15
- RW
0x6 PCIE_CAP_L1_EXIT_LATENCY:
- L1 Exit Latency. This field indicates the L1 exit latency for the given PCI
- Express Link. The value reported indicates the length of time this Port
requires to complete transition from ASPM L1 to L0. If ASPM L1 is not supported, the value is undefined. Note: Exit latencies may be influenced by PCI Express reference clock configuration depending upon whether a component uses a common or separate reference clock. Multi-Function
- Devices associated with an Upstream Port must report the same value in
this field for all functions. There are two each of these register fields, this one and a shadow one at the same address. The Common Clock bit (PCIE_CAP_COMMON_CLK_CONFIG) of the Link Control Register (LINK_CONTROL_LINK_STATUS_REG) determines which one is used by the controller and which one is accessed by a read request. Common Clock operation is supported (possible) in the controller when one or more of the following expressions is true: - CX_NFTS !=CX_COMM_NFTS -
- DEFAULT_L0S_EXIT_LATENCY !=DEFAULT_COMM_L0S_EXIT_LATENCY -
- DEFAULT_L1_EXIT_LATENCY !=DEFAULT_COMM_L1_EXIT_LATENCY
- Common Clock operation is enabled in the controller when you set the
- Common Clock bit (PCIE_CAP_COMMON_CLK_CONFIG) of the Link Control
- Register (LINK_CONTROL_LINK_STATUS_REG). The assertion of CS2 (that
is, assert the dbi_cs2 input, or the CS2 address bit for the AXI bridge) is required to write to the shadow field at this location. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky.

- PCIe x4/x8 Endpoint
- Bit
R/W
- Reset
- Description
- Bit
R/W
- Reset
- Description
14:12
- RW
0x4 PCIE_CAP_L0S_EXIT_LATENCY:
- L0s Exit Latency. This field indicates the L0s exit latency for the given PCI
- Express Link. The value reported indicates the length of time this Port
requires to complete transition from L0s to L0. If L0s is not supported, the value is undefined; however, see the Implementation Note "Potential Issues
- With Legacy Software When L0s is Not Supported" in section 5.4.1.1 of PCI
- Express Base Specification for the recommended value. Note: Exit
latencies may be influenced by PCI Express reference clock configuration depending upon whether a component uses a common or separate reference clock. Multi-Function Devices associated with an Upstream Port must report the same value in this field for all functions. There are two each of these register fields, this one and a shadow one at the same address. The Common Clock bit (PCIE_CAP_COMMON_CLK_CONFIG) of the Link Control Register (LINK_CONTROL_LINK_STATUS_REG) determines which one is used by the controller and which one is accessed by a read request. Common Clock operation is supported (possible) in the controller when one or more of the following expressions is true: - CX_NFTS ! =CX_COMM_NFTS - DEFAULT_L0S_EXIT_LATENCY ! =DEFAULT_COMM_L0S_EXIT_LATENCY - DEFAULT_L1_EXIT_LATENCY ! =DEFAULT_COMM_L1_EXIT_LATENCY Common Clock operation is enabled in the controller when you set the Common Clock bit (PCIE_CAP_COMMON_CLK_CONFIG) of the Link Control Register (LINK_CONTROL_LINK_STATUS_REG). The assertion of CS2 (that is, assert the dbi_cs2 input, or the CS2 address bit for the AXI bridge) is required to write to the shadow field at this location. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky. 11:10
- RW
0x3 PCIE_CAP_ACTIVE_STATE_LINK_PM_SUPPORT:
- Active State Power Management (ASPM) Support. This field indicates the
level of ASPM supported on the given PCI Express Link. For more details on
- ASPM support requirements, see section 5.4.1 of PCI Express Base
- Specification. Multi-Function devices associated with an Upstream Port
must report the same value in this field for all functions. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky. 9:4
- RW
0x8 PCIE_CAP_MAX_LINK_WIDTH:
- Maximum Link Width. This field indicates the maximum Link width (xN -
corresponding to N Lanes) implemented by the component. This value is permitted to exceed the number of Lanes routed to the slot (Downstream
- Port), adapter connector (Upstream Port), or in the case of component-to-
component connections, the actual wired connection width. All encodings other than the defined encodings are reserved. Multi-Function devices associated with an Upstream Port must report the same value in this field for all functions. In M-PCIe mode, the reset and dynamic values of this field are calculated by the controller. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky. 3:0
- RW
0x4 PCIE_CAP_MAX_LINK_SPEED:
- Max Link Speed. This field indicates the maximum Link speed of the
associated Port. The encoded value specifies a bit location in the
- Supported Link Speeds Vector (in the Link Capabilities 2 register) that
corresponds to the maximum Link speed. All encodings other than the defined encodings are reserved. Multi-Function Devices associated with an
- Upstream Port must report the same value in this field for all functions. In
M-PCIe mode, the reset and dynamic values of this field are calculated by the controller. Note: The access attributes of this field are as follows: -
- Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This
register field is sticky.

- PCIe x4/x8 Endpoint
- PCIE_X<j>_EP_PF0_PCIE_CAP_LINK_CONTROL_LINK_STATUS_REG_0
where <j> = 4, 8. Description:This register controls and provides information about PCI Express Link specific parameters.
- PCIE_X4_EP_PF0_PCIE_CAP_LINK_CONTROL_LINK_STATUS_REG_0
- PCIE_X8_EP_PF0_PCIE_CAP_LINK_CONTROL_LINK_STATUS_REG_0
- Offset: 0x80
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x10110000 (0b0001,0000,0001,0001,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RO
0x0 PCIE_CAP_LINK_AUTO_BW_STATUS:
- Link Autonomous Bandwidth Status. This bit is set by hardware to indicate
that hardware has autonomously changed Link speed or width, without the Port transitioning through DL_Down status, for reasons other than to attempt to correct unreliable Link operation. This bit must be set if the
- Physical Layer reports a speed or width change was initiated by the
Downstream component that was indicated as an autonomous change.
- The write value is gated with the PCIE_CAP_LINK_BW_NOT_CAP field in
- LINK_CAPABILITIES_REG. This bit is not applicable and is Reserved for
- Endpoints, PCI Express-to-PCI/PCI-X bridges, and Upstream Ports of
- Switches. For functions that do not implement the Link Bandwidth
- Notification Capability, the controller hardwires this bit to 0b. Note: The
access attributes of this field are as follows: - Wire: RSVDP - Dbi: R
- RO
0x0 PCIE_CAP_LINK_BW_MAN_STATUS:
- Link Bandwidth Management Status. This bit is set by hardware to
indicate that either of the following has occurred without the Port transitioning through DL_Down status: - A Link retraining has completed following a write of 1b to the Retrain Link bit. Note: This bit is set following any write of 1b to the Retrain Link bit, including when the Link is in the process of retraining for some other reason. - Hardware has changed Link speed or width to attempt to correct unreliable Link operation, either through an LTSSM timeout or a higher level process. This bit must be set if the Physical Layer reports a speed or width change was initiated by the
- Downstream component that was not indicated as an autonomous
change. This bit is not applicable and is Reserved for Endpoints, PCI
- Express-to-PCI/PCI-X bridges, and Upstream Ports of Switches. For
functions that do not implement the Link Bandwidth Notification
- Capability, the controller hardwires this bit to 0b. The default value of this
bit is 0b. The write value is gated with the PCIE_CAP_LINK_BW_NOT_CAP field in LINK_CAPABILITIES_REG. Note: The access attributes of this field are as follows: - Wire: RSVDP - Dbi: R

- PCIe x4/x8 Endpoint
- Bit
R/W
- Reset
- Description
- RO
0x0 PCIE_CAP_DLL_ACTIVE:
- Data Link Layer Link Active. This bit indicates the status of the Data Link
- Control and Management State Machine. It returns a 1b to indicate the
- DL_Active state, 0b otherwise. This bit must be implemented if the Data
- Link Layer Link Active Reporting Capable bit is 1b. Otherwise, the
controller hardwires it to 0b.
- RW
0x1 PCIE_CAP_SLOT_CLK_CONFIG:
- Slot Clock Configuration. This bit indicates that the component uses the
same physical reference clock that the platform provides on the connector. If the device uses an independent clock irrespective of the presence of a reference clock on the connector, this bit must be clear. For a Multi-Function Device, each Function must report the same value for this bit. Note: The access attributes of this field are as follows: - Wire:
- HWINIT - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
- RO
0x0 PCIE_CAP_LINK_TRAINING:
- Link Training. This read-only bit indicates that the Physical Layer LTSSM is
in the Configuration or Recovery state, or that 1b was written to the
- Retrain Link bit but Link training has not yet begun. Hardware clears this
bit when the LTSSM exits the Configuration/Recovery state. This bit is not applicable and Reserved for Endpoints, PCI Express to PCI/PCI-X bridges, and Upstream Ports of Switches, and the controller hardwires it to 0b. Note: The access attributes of this field are as follows: - Wire: RSVDP - Dbi: R
- RO
0x0 RSVDP_26: Reserved for future use. 25:20
- RO
0x1 PCIE_CAP_NEGO_LINK_WIDTH:
- Negotiated Link Width. This field indicates the negotiated width of the
given PCI Express Link. All encodings other than the defined encodings are reserved. The value in this field is undefined when the Link is not up. 19:16
- RO
0x1 PCIE_CAP_LINK_SPEED:
- Current Link Speed. This field indicates the negotiated Link speed of the
given PCI Express Link. The encoded value specifies a bit location in the
- Supported Link Speeds Vector (in the Link Capabilities 2 register) that
corresponds to the current Link speed. All encodings other than the defined encodings are reserved. The value in this field is undefined when the Link is not up. 15:14
- RO
0x0 PCIE_CAP_DRS_SIGNALING_CONTROL:
- DRS Signaling Control. Indicates the mechanism used to report reception
of a DRS message. Must be implemented for Downstream Ports with the
- DRS Supported bit Set in the Link Capabilities 2 Register. Encodings are: If
- DRS Supported is set, receiving a DRS Message will set DRS Message
- Received in the Link Status 2 Register but will otherwise have no effect If
the DRS Message Received bit in the Link Status 2 Register transitions from 0 to 1, and either MSI or MSI-X is enabled, an MSI or MSI-X interrupt is generated using the vector in Interrupt Message Number (section 7.5.3.2) If the DRS Message Received bit in the Link Status 2 Register transitions from 0 to 1, the Port must send an FRS Message Upstream with the FRS Reason field set to DRS Message Received. Behavior is undefined if this field is set to 10b and the FRS Supported bit in the
- Device Capabilities 2 Register is Clear. Behavior is undefined if this field is
set to 11b. For Downstream Ports with the DRS Supported bit clear in the
- Link Capabilities 2 register, the controller hardwires this field to 00b. This
field is Reserved for Upstream Ports. 13:12
- RO
0x0 RSVDP_12: Reserved for future use.

- PCIe x4/x8 Endpoint
- Bit
R/W
- Reset
- Description
- RW
0x0 PCIE_CAP_LINK_AUTO_BW_INT_EN:
- Link Autonomous Bandwidth Management Interrupt Enable. When set,
this bit enables the generation of an interrupt to indicate that the Link
- Autonomous Bandwidth Status bit has been set. The write value is gated
with the PCIE_CAP_LINK_BW_NOT_CAP field in LINK_CAPABILITIES_REG.
- This bit is not applicable and is Reserved for Endpoints, PCI Express-to-
- PCI/PCI-X bridges, and Upstream Ports of Switches. For functions that do
not implement the Link Bandwidth Notification Capability, the controller hardwires this bit to 0b. Note: The access attributes of this field are as follows: - Wire: LINK_CAPABILITIES_REG.PCIE_CAP_LINK_BW_NOT_CAP ?
- RW : RO - Dbi: LINK_CAPABILITIES_REG.PCIE_CAP_LINK_BW_NOT_CAP ?
- RW : RO
- RW
0x0 PCIE_CAP_LINK_BW_MAN_INT_EN:
- Link Bandwidth Management Interrupt Enable. When set, this bit enables
the generation of an interrupt to indicate that the Link Bandwidth
- Management Status bit has been set. The write value is gated with the
- PCIE_CAP_LINK_BW_NOT_CAP field in LINK_CAPABILITIES_REG. This bit is
not applicable and is Reserved for Endpoints, PCI Express-to-PCI/PCI-X bridges, and Upstream Ports of Switches. For functions that do not implement the Link Bandwidth Notification Capability, the controller hardwires this bit to 0b. Note: The access attributes of this field are as follows: - Wire: LINK_CAPABILITIES_REG.PCIE_CAP_LINK_BW_NOT_CAP ?
- RW : RO - Dbi: LINK_CAPABILITIES_REG.PCIE_CAP_LINK_BW_NOT_CAP ?
- RW : RO
- RW
0x0 PCIE_CAP_HW_AUTO_WIDTH_DISABLE:
- Hardware Autonomous Width Disable. When set, this bit disables
hardware from changing the Link width for reasons other than attempting to correct unreliable Link operation by reducing Link width. For a Multi-
- Function Device associated with an Upstream Port, the bit in Function 0 is
of type RW, and only Function 0 controls the component's Link behavior. In all other Functions of that device, this bit is of type RsvdP. For components that do not implement the ability autonomously to change
- Link width, the ciontroller hardwires this bit to 0b. Note: The access
attributes of this field are as follows: - Wire: R/W - Dbi: R/W
- RW
0x0 PCIE_CAP_EN_CLK_POWER_MAN:
- Enable Clock Power Management. Applicable only for Upstream Ports and
with form factors that support a "Clock Request" (CLKREQ#) mechanism, this bit operates as follows: For a non-ARI Multi-Function Device, power- management-configuration software must only Set this bit if all Functions of the Multi-Function Device indicate a 1b in the Clock Power
- Management bit of the Link Capabilities register. The component is
permitted to use the CLKREQ# signal to power manage Link clock only if this bit is Set for all Functions. For ARI Devices, Clock Power Management is enabled solely by the setting in Function 0. The settings in the other
- Functions always return whatever value software programmed for each,
but otherwise are ignored by the component. The CLKREQ# signal may also be controlled via the L1 PM Substates mechanism. Such control is not affected by the setting of this bit. For Downstream Ports and components that do not support Clock Power Management (as indicated by a 0b value in the Clock Power Management bit of the Link Capabilities register), the controller hardwires this bit to 0b. The write value is gated with the PCIE_CAP_CLOCK_POWER_MAN field in LINK_CAPABILITIES_REG. Note: The access attributes of this field are as follows: - Wire:
- LINK_CAPABILITIES_REG.PCIE_CAP_CLOCK_POWER_MAN ? RWS : ROS -
Dbi: LINK_CAPABILITIES_REG.PCIE_CAP_CLOCK_POWER_MAN ? RWS : ROS Note: This register field is sticky.

- PCIe x4/x8 Endpoint
- Bit
R/W
- Reset
- Description
- RW
0x0 PCIE_CAP_EXTENDED_SYNCH:
- Extended Synch. When set, this bit forces the transmission of additional
- Ordered Sets when exiting the L0s state (see section 4.2.4.5 of PCI
- Express Base Specification) and when in the Recovery state (see section
