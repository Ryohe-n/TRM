# 0 = FALSE 1 = TRUE 0x0 SOR_VPR_SECURE_MODE:

- Write once sticky bit, broadcast to sor0 and sor1. It is used to
control SOR VPR policy registers protection, can be either TSEC protection or TZ protection. 0 = TSEC_SECURE 1 = TZ_SECURE 0x0 SOR1_ASSR_FORCE_INTERNAL:
- Write 1 once sticky bit, connect to sor1. When it is set to TRUE,
SOR1 ASSR will be forced to internal. 0 = FALSE 1 = TRUE 0x0 SOR0_ASSR_FORCE_INTERNAL:
- Write 1 once sticky bit, connect to sor0. When it is set to TRUE,
SOR0 ASSR will be forced to internal. 0 = FALSE 1 = TRUE 0x0 SOR_HDCP1_1_SECURE_MODE: Write once sticky bit, broadcast to sor0 and sor1. This bit limits the number of engines that can access HDCP1.x registers.
- For more details refer to
//hw/doc/mmplex/display/4.0/Functional_Descriptions/
- NVD_Security_PLM_Reg.xlsx

