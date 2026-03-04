# 12 :10 0x4 0x2 TRIM_CAL_CNT_SEL_TRIO0_B:

- Trimmer calibration counter selection
[0]: counter1 (coarse tune) clock cycle. 0: 64T (128UI) 1: 128T (256UI) [2:1]: counter2 (fine tune) clock cycle. 00: 32T (64UI) 01: 64T (128UI) 10: 96T (192UI) 11: 128T (256UI) For high data rate (>3.5GS/s): 64T(cnt1)+96T(cnt2)=160T(320ui) -> cnt_sel=3'b100 For low data rate (<=3.5GS/s): 128T(cnt1)+32T(cnt2)=160T(320ui) -> cnt_se=3'b001 0x1 _NONE_ TRIM_CAL_CPHY_ED_LOOPMODE_TRIO0_B:
- Trimmer calibration and cphy edge detector loop mode control

