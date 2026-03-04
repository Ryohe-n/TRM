# 144 MiB iGPU aperture

- PCIe aperture for 32-bit OS in its top 384 MiB. This is used for configuration, MMIO, IOIO
space and is accessible by 32-bit OS. (Note: the APE only decodes apertures below 0.75 GiB to the control backbone, so it cannot access PCIe. Since the High Definition Audio (HDA) controller sits under the 0.75 GiB range, there is no need for APE to ever access any PCIe controller.) Each PCIe controller is provided with a 32 MiB aperture.
- PCIe APB configuration space is disjointed from this space and can live anywhere outside
this range.
#### 3.2.1.4 On-Chip Data/Sync Plane Aperture
The following figure shows the On-Chip Data/Sync Plane aperture.

- Address Map
**Figure 3.6 On-Chip Data/Sync Plane Aperture**
This region houses the following: The SysRAM region starting at 1 GiB. A 256 MiB region is reserved, although physical SysRAM
- Size is 512 KiB. 256 MiB allows for a higher steering granularity at the System Coherency
Fabric (SCF) in the CCPLEX. All CPUs should access SysRAM at this physical location, without the need of any address translation.
- The 4 MiB Compute Vision SRAM (CV-SRAM), used by Programmable Vision Accelerators
(PVAs) and Deep Learning Accelerators. A 256 MiB region is reserved for this similarly to SysRAM.
- The dGPU Host Controller Sync Point aperture. This is a 64 MiB Sync Point Region that is
used to convert the dGPU's semaphores into Host Controller sync points. Note that this region can also be used by any non Host Controller clients. This region shadows the Sync
- Point RAM in Host Controller using a sideband interface between Host Controller and
- Memory. Previously, the GPU needed a sideband interface into the Host Controller Sync
Point to talk to any other Host Controller client. With this Sync Point region, the sideband with Host Controller is removed from the GPU. Reserved region beyond the dGPU Sync Point aperture.
#### 3.2.1.5 DRAM Aperture
- The DRAM aperture is used for the Physical Address of the off-chip local DRAM. The AMAP
supports up to 128 GiB of DRAM. A 32-bit OS can access the lower 2 GiB Physical DRAM location (AMAP region from 2 GiB to 4 GiB). In order to access DRAM above 4 GiB in the AMAP, a 32-bit OS must use an additional address translation capability like AST or the SMMU.

- Address Map
#### 3.2.1.6 PCIe Aperture (32-bit OS)
The SoC has two apertures for PCIe: one for 32-bit OS (a sub-aperture within the MMIO aperture) and the other for >32-bit OS (see figure below).
**Figure 3.7 PCIe Aperture (32-bit OS)**
The PCIe aperture for a 64-bit OS handles situations with large AMAP requirements. When a PCIe controller is connected to a device that has multiple functions, where each function can in turn be a switch, it presents large AMAP requirements. Such large AMAP requirements cannot be met under 4 GiB and hence cannot be addressed by drivers running on 32-bit CPUs.

- System Address Map
**Figure 3.8 PCIe Controller Connection Example**
The SoC platforms can present a similar large AMAP requirement. PCIe x8/x4 controllers are used to connect SoC devices to dGPUs or NVSwitch. There are also three PCIe x1 controllers that present a 1 GiB per controller requirement. An 8 GiB space is reserved for the PCIe x1 controllers to allow for future expansion.
#### 3.2.1.7 Off-Chip Aperture
This configurable (BOM/TOM registers in SCF and MCF) aperture allows the AMAP to be adjusted to the required platform. This region can be used to access
- Peer DRAM Dual SoC platforms
dGPUs VIDMEM in SoC with Discrete GPU platforms
- Other dGPUs VIDMEMs and other DRAMs in Single/Multiple SoC with Multiple dGPUs
platform

