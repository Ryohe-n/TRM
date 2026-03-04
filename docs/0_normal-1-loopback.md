# 0 = NORMAL 1 = LOOPBACK

- DISABLE
ETHER_QOS_CLK_OVR_ON:
- SLCG clock overide, Currently only TX & AXI clocks can be SLCGed based
on output ports from Synopsys core setting to ENABLE would overide the SLCG enable equation and there by keeps clocks freely oscillating as long as the module clocks are enabled. 0 = DISABLE 1 = ENABLE

1G Ethernet Controller QoS Registers
- ETHER_QOS_AXI_LPI_CTRL_0
Setting to ENABLE is the last resort when enable equation misbehaves, as this setting contributes to power. AXI Low Power Interface Control Programming Guideline to second-level clock gate AXI clock: 1. Program ETHER_QOS_AXI_LPI_CTRL_0.CSYSREQ to 1'b0 to enable AXI clock gating. 2. Poll ETHER_QOS_AXI_LPI_CTRL_0.CSYSACK signal until it is 1'b0. 3. Check the value of ETHER_QOS_AXI_LPI_CTRL_0.CACTIVE, if 1'b1 AXI low power request was not accepted and clock was not gated, if 1'b0, request was accepted and AXI clock was gated internally. 3.a. If CACTIVE was set to 1'b1 in step 3, SW needs to program CSYSREQ to 1'b1 to exit the Low power request before initiating another request.
- Offset: 0x8004
- Read/Write: See table below
- Parity Protection: See table below
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
R/W
- Parity Protection
- Reset
- Description
- RO
N
- NOT_ACCEPTED
CACTIVE:
- This signal indicates whether the AXI low-
power request was accepted by HW or not : 1 :
- Not accepted, requires Clock, 0 : Accepted,
- Clock can be gated

