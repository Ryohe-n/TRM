# 100 MHz or 156.25 MHz 100 MHz for PCIe endpoint mode, 156.25 MHz if MGBE refernce is platform sourced.

- MIPI CSI Clock Inputs
The CSI Bricks receive one clock input per two data pairs. In DPHY mode, these clocks are used to receive the data and are used to derive the brick-sourced clocks for the NVCSI_CIL. In CPHY mode, the clock is recovered from the data.

- Clock Controller Functional Description
- Clock Name
- Frequency
- Usage
- CSI_A_CLK_P/N
Camera Sensor mode dependent. CSI Controller Input Clock.
- CSI_B_CLK_P/N
Camera Sensor mode dependent. CSI Controller Input Clock.
- CSI_C_CLK_P/N
Camera Sensor mode dependent. CSI Controller Input Clock.
- CSI_D_CLK_P/N
Camera Sensor mode dependent. CSI Controller Input Clock.
- CSI_E_CLK_P/N
Camera Sensor mode dependent. CSI Controller Input Clock.
- CSI_F_CLK_P/N
Camera Sensor mode dependent. CSI Controller Input Clock.
- CSI_G_CLK_P/N
Camera Sensor mode dependent. CSI Controller Input Clock.
- CSI_H_CLK_P/N
Camera Sensor mode dependent. CSI Controller Input Clock.
- Reference Clock Outputs
- Generic Reference Output Clocks in Platform
Orin, as the application processor in platforms, has clock outputs that are used as the reference clock for various platform components in the system. The various platform components that typically source a reference clock from the SoC include camera sensors, touch controllers, and audio CODEC chips. For supporting the clock generation for the same, there are four generic clock switches, AUD_MCLK and TOUCH_CLK whose clock outputs are routed to various pads allocated for reference clock out in the system through pinmux.
- Interface Reference Clock Outputs
- UFS Device Reference Clock
UFS devices have strict clock quality requirements. A 19.2 MHz reference clock for the UFS device is generated from the 38.4 MHz OSC reference clock. This is done by selecting the default of clk_m_sys_clk as the clock source and the default divider of 1.
- Clock Name
- Frequency
- Usage
- UFSDEV_REF_CLK

