# 1 - 17 none none

- I2C1
i2c1_intr (AVIC) / i2c1_rupt (LIC)
- NV_SCE_INTERRUPT_I2C1 (AVIC) / I2C
(LIC) 1 - 19 none
- I2C3
i2c3_intr (AVIC) / i2c3_rupt (LIC)
- NV_SCE_INTERRUPT_I2C3 (AVIC) / I2C3
(LIC) 1 - 20 none
- AON - I2C8
i2c8_intr (AVIC) / aon2lic_i2c3int (LIC)
- NV_SCE_INTERRUPT_I2C8 (AVIC) / I2C8
(LIC) 1 - 21 none
- SCE - HSP2
hsp2_shrd_intr[0]
- NV_SCE_INTERRUPT_HSP2_SI_0
(AVIC) / NV_FSI_GIC_SCE_HSP2_SI0 (FSI GIC) 1 - 24 none
- SCE - HSP2
hsp2_shrd_intr[1]
- NV_SCE_INTERRUPT_HSP2_SI_1
(AVIC) / NV_FSI_GIC_SCE_HSP2_SI1 (FSI GIC) 1 - 25 none
- SCE - HSP2
hsp2_shrd_intr[2]
- NV_SCE_INTERRUPT_HSP2_SI_2
(AVIC) / NV_FSI_GIC_SCE_HSP2_SI2 (FSI GIC) 1 - 26 none

- Interrupt Controllers
- FSI - GIC
- Connecti
on
- LIC
- Connecti
on
- Source
- Interrupt Name
- Software Name
- AVIC
- Connecti
on
- SCE - HSP2
hsp2_shrd_intr[3]
- NV_SCE_INTERRUPT_HSP2_SI_3
(AVIC) / NV_FSI_GIC_SCE_HSP2_SI3 (FSI GIC) 1 - 27 none
- SCE - HSP2
hsp2_shrd_intr[4]
- NV_SCE_INTERRUPT_HSP2_SI_4
(AVIC) / NV_FSI_GIC_SCE_HSP2_SI4 (FSI GIC) 1 - 28 none
- SCE - HSP2
hsp2_shrd_intr[5]
- NV_SCE_INTERRUPT_HSP2_SI_5
(AVIC) / NV_FSI_GIC_SCE_HSP2_SI5 (FSI GIC) 1 - 29 none
- SCE - HSP2
hsp2_shrd_intr[6]
- NV_SCE_INTERRUPT_HSP2_SI_6
(AVIC) / NV_FSI_GIC_SCE_HSP2_SI6 (FSI GIC) 1 - 30 none
- SCE - HSP2
hsp2_shrd_intr[7]
- NV_SCE_INTERRUPT_HSP2_SI_7
(AVIC) / NV_FSI_GIC_SCE_HSP2_SI7 (FSI GIC) 1 - 31 none
- SCE - HSP
sce2licmbox_int_out[0]
- SCE_MBOX_OUT_0
none none
- SCE - HSP
sce2licmbox_int_out[1]
- SCE_MBOX_OUT_1
none none
- SCE - HSP
sce2licmbox_int_out[2]
- SCE_MBOX_OUT_2
none none
- SCE - HSP
sce2licmbox_int_out[3]
- SCE_MBOX_OUT_3
none none
- SCE - TKE
sce_tke_wdt_remoteint errupt
- SCE_WDT_REMOTE
none none For further information of the SCE Cluster Interrupt controller, refer to the Safety Cluster Engine (SCE) chapter of this TRM.
##### 9.2.2.5.5 RCE Cluster Interrupt Controller
The RCE is a duplicate instance of the Safety Cluster Engine (SCE) module; internally both SCE and RCE are the same, however, some I/O connections are different. All the RCE-related Interrupts are listed in the table below.
- Table 9.8 RCE Interrupts Connection
- Source
- Interrupt Name
- Software Name
- AVIC
- Connection
- LIC
- Connection
- RCE - TKE
tke_wdt_nfiq
- NV_RCE_INTERRUPT_WDTFIQ

