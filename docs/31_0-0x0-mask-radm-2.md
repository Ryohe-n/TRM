# 31 :0 0x0 MASK_RADM_2:

- Filter Mask 2. This field modifies the RADM filtering and error handling rules. For
more details, see the "Receive Filtering" in the Databook. In each case, '0' applies the associated filtering rule and '1' masks the associated filtering rule. [31:10]: Reserved [9]: CX_FLT_MASK_CPL_IN_LUT_CHECK - 0: Disable masking of checking if the tag of CPL is registered in LUT - 1: Enable masking of checking if the tag of CPL is registered in LUT [8]: CX_FLT_MASK_POIS_ERROR_REPORTING - 0: Disable masking of error reporting for Poisoned TLPs - 1: Enable masking of error reporting for
- Poisoned TLPs [7]: CX_FLT_MASK_PRS_DROP - 0: Allow PRS message to pass
through - 1: Drop PRS Messages silently - This bit is ignored when the
- CX_FLT_MASK_MSG_DROP bit in the MASK_RADM_1 field of the
SYMBOL_TIMER_FILTER_1_OFF register is set to '1'. [6]: CX_FLT_UNMASK_TD - 0:
- Disable unmask TD bit if CX_STRIP_ECRC_ENABLE - 1: Enable unmask TD bit if
- CX_STRIP_ECRC_ENABLE [5]: CX_FLT_UNMASK_UR_POIS_TRGT0 - 0: Disable
unmask CX_FLT_MASK_UR_POIS with TRGT0 destination - 1: Enable unmask CX_FLT_MASK_UR_POIS with TRGT0 destination [4]:
- CX_FLT_MASK_LN_VENMSG1_DROP - 0: Allow LN message to pass through - 1: Drop
- LN Messages silently [3]: CX_FLT_MASK_HANDLE_FLUSH - 0: Disable controller
Filter to handle flush request - 1: Enable controller Filter to handle flush request [2]:
- CX_FLT_MASK_DABORT_4UCPL - 0: Enable DLLP abort for unexpected completion -

