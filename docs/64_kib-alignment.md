# 64 KiB Alignment

- Arm Architecture recommends aligning all peripheral address ranges along the MMU page
sizes. This enables each device to occupy a single entry in the Page Table and makes it possible to uniquely identify and describe device access attributes. The page can be uniquely classified under a non-normal memory type such as nGnRnE (for SO) or nGnRE (for DEV). Refer to the ARMv8 Architecture Reference Manuals for more information.
- Page-alignment of peripherals also improves security across virtualized guest Operating
Systems. Armv8 supports three types of page sizes in its MMU: 4 KiB, 16 KiB, and 64 KiB.
- By aligning with 64 KiB, all three implementations are supported and sufficient MMIO for
each device is allocated. 40-bit Address Map The SoC supports a one Terabyte AMAP (1 TiB or 40 bits of addressing).
- PCIe Aperture
- The SoC offers two apertures for PCIe: one for a 32-bit address OS and the other for a
greater-than 32-bit address OS. Each PCIe controller is provided with a 32 MiB aperture. The PCIe aperture for greater-than 32-bit address OS handles situations with large AMAP requirements, which cannot be addressed by drivers running on a 32-bit address OS.

- Address Map
#### 3.2.1.2 AMAP and Aperture
The SoC supports a 1-Terabyte AMAP (40 bits). See below for a high-level overview of the AMAP.
- Table 3.6 AMAP Overview
- Name
- Address Range
- Reserved (1023 GiB - 1024 GiB)
0xFF_C000_0000 - 0xFF_FFFF_FFFF
- Off-Chip Aperture (256 GiB - 1023 GiB)
0x40_0000_0000 - 0xFF_BFFF_FFFF
- PCIe Reconfigurable Aperture for > 32-bit OS (130 GiB - 256
- GiB)(1)
0x20_8000_0000 - 0x3F_FFFF_FFFF
- DRAM Aperture (2 GiB - 130 GiB)
0x00_8000_0000 - 0x20_7FFF_FFFF
- On-Chip Data/Sync Plane (1 GiB - 2 GiB)
0x00_4000_0000 - 0x00_7FFF_FFFF
- PCIe Reconfigurable Aperture for 32-bit OS (640 MB - 1 GiB)
0x00_3000_0000 - 0x00_3FFF_FFFF
- MMIO Aperture (0 GiB - 640 MB)
0x00_0000_0000 - 0x00_3FFF_FFFF 1. The control plane extends beyond 4 GiB for PCIe controllers controlled by > 32-bit OS.

- Address Map
**Figure 3.4 AMAP Diagram**
#### 3.2.1.3 MMIO Aperture
The MMIO aperture begins at the bottom of memory (0x0) and extends to 1 GiB.

- Address Map
**Figure 3.5 MMIO Aperture**
This region houses the following apertures:
- Configuration register apertures of all IPs of the SoC

