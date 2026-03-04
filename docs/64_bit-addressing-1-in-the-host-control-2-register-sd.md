# 64 -bit Addressing =1 in the Host Control 2 register. SDMA can be used and ADMA2 uses 128-bit Descriptor. 1 64-bit System Address for V4 is Supported 0 64-bit System Address for V4 is not Supported


- SDMMCA Registers
- VOLTAGE_SUPPORT_1_8_V - Voltage Support 1.8V,The Voltage Support to Card is dependent on
System & Slot.The platfrom datasheet has this.
- VOLTAGE_SUPPORT_3_0_V - Voltage Support 3.0V,The Voltage Support to Card is dependent on
System & Slot.The platfrom datasheet has this.
- VOLTAGE_SUPPORT_3_3_V - Voltage Support 3.3V,The Voltage Support to Card is dependent on
System & Slot.The platfrom datasheet has this.
- SUSPEND_RESUME_SUPPORT - Suspend/Resume Support
- This bit indicates whether the Host Controller supports Suspend / Resume
functionality. If this bit is 0, the Host Driver shall not issue either Suspend or
- Resume commands because the Suspend and Resume mechanism (Refer to

