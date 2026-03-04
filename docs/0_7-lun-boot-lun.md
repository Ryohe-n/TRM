# 0 -7 Lun |Boot Lun

- Enabled
0x0 x2 config, HS G1 mode
- PLLP_OUT0,
- PLLREFE, PLL3
- HS G1 Rate Mbps/
- Lane x 2 Lanes
0x1 x2 config, PWM G1 mode
- PLLP_OUT0,
- PLLREFE, PLL3
- PWM G1 Rate Mbps/
- Lane x 2 Lanes
0x2 x1 config (UPHY 6), HS
- G1 mode
- PLLP_OUT0,
- PLLREFE, PLL3
- HS G1 Rate Mbps/
- Lane x 1 Lane
0x3 x1 config (UPHY 6),
- PWM G1 mode
- PLLP_OUT0,
- PLLREFE, PLL3
- PWM G1 Rate Mbps/
- Lane x 1 Lane

- Boot Process
- Table 4.11 MB1-BCT based UFS modes in MB1
- Configurations
- In-Use PLLs
- X2-Config HS_G3 Fast/Fast_Auto Rate B series
- PLLP_OUT0, PLLREFE, CLK_M
- X2-Config HS_G2 Fast/Fast_Auto Rate B series
- PLLP_OUT0, PLLREFE, CLK_M
- X2-Config HS_G1 Fast/Fast_Auto Rate B series
- PLLP_OUT0, PLLREFE, CLK_M
- X2-Config HS_G3 Fast/Fast_Auto Rate A series
- PLLP_OUT0, PLLREFE, CLK_M
- X2-Config HS_G2 Fast/Fast_Auto Rate A series
- PLLP_OUT0, PLLREFE, CLK_M
- X2-Config HS_G1 Fast/Fast_Auto Rate A series
- PLLP_OUT0, PLLREFE, CLK_M
- X2-Config HS_G4 Fast/Fast_Auto Rate A series
- PLLP_OUT0, PLLREFE, CLK_M
- X2-Config HS_G4 Fast/Fast_Auto Rate B series
- PLLP_OUT0, PLLREFE, CLK_M
- X2-Config PWM_G1 to G4 Slow mode
- PLLP_OUT0, PLLREFE, CLK_M
- X2-Config PWM_G1 to G4 Slow_Auto mode
- PLLP_OUT0, PLLREFE, CLK_M
##### 4.1.1.4.4 NVME over PCIe
Boot PCIe controller C4 is mapped in two configurations X2/X4 with PLL2/PLL3 as clock sources.
- X2 config with UPHY Lanes 6/7
- X4 config with UPHY Lanes 4/5/6/7
- Table 4.12 Strap-based PCIe/NVMe mode in Boot ROM (default)
- PCIe/NVMe Configs
- Configurations
- Speed-mode
- Configs (UPHY Lane), Partition
0x0
- X2 (6/7), Name Space ID1
- Gen1
- Table 4.13 Fuse-based PCIe/NVMe modes in Boot ROM
- PCIe/NVMe Configs
- Configurations
- Speed-mode
- Configs (UPHY Lane), Partition
0x0
- X2 (6/7), Name Space ID1
- Gen1
0x1
- X2 (6/7), Boot Partition 0
- Gen1
0x2
- X4 (4/5/6/7), Name Space ID1
- Gen1
0x3
- X4 (4/5/6/7), Boot Partition 0
- Gen1

- Boot Process
- Table 4.14 MB1-BCT based PCIe/NVMe modes in MB1
- Configurations
- In-use PLLs
- Speed-mode
- Configs (UPHY Lane), Partition
- X2 (6/7), Gen3, Boot Partition 0
- PLLE, PLL0/PLL2
- Gen3
- X2 (6/7), Gen1 Name Space ID1
- PLLE, PLL2/PLL3
- Gen1
- X2 (6/7), Gen3, Name Space ID1
- PLLE, PLL2/PLL3
- Gen3
- X2 (6/7), Gen1, Boot Partition 0
- PLLE, PLL2/PLL3
- Gen1
- X4 (4/5/6/7), Gen3, Boot Partition 0
- PLLE, PLL2/PLL3
- Gen3
- X4 (4/5/6/7), Gen1, Name Space ID1
- PLLE, PLL2/PLL3
- Gen1
- X4 (4/5/6/7), Gen3, Name Space ID1
- PLLE, PLL2/PLL3
- Gen3
- X4 (4/5/6/7), Gen1, Boot Partition 0
- PLLE, PLL2/PLL3
- Gen1
- X2 (6/7), Gen4, Boot Partition 0
- PLLE, PLL2/PLL3
- Gen4
- X2 (6/7), Gen4, Name Space ID1
- PLLE, PLL2/PLL3
- Gen4
- X4 (4/5/6/7), Gen4, Boot Partition 0
- PLLE, PLL2/PLL3
- Gen4
- X4 (4/5/6/7), Gen4, Name Space ID1
- PLLE, PLL2/PLL3
- Gen4
- Table 4.15 Strap-based Boot Device Select Encoding
- Location
- Bits Used
- Function
- Values / Notes
- MISCREG_STRAP_STRAPPING_
- OPT_A

