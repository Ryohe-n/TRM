# 31 :16 0x0 MASK_RADM_1:

- Filter Mask 1. The Filter Mask 1 Register modifies the RADM filtering and error
handling rules. For more details, see the "Receive Filtering" section. In each case, '0' applies the associated filtering rule and '1' masks the associated filtering rule. [31]:
- CX_FLT_MASK_RC_CFG_DISCARD - 0: For RADM RC filter to not allow CFG
transaction being received - 1: For RADM RC filter to allow CFG transaction being received [30]: CX_FLT_MASK_RC_IO_DISCARD - 0: For RADM RC filter to not allow IO transaction being received - 1: For RADM RC filter to allow IO transaction being received [29]: CX_FLT_MASK_MSG_DROP - 0: Drop MSG TLP (except for Vendor
- MSG). Send decoded message on the SII. - 1: Do not Drop MSG (except for Vendor
- MSG). Send message TLPs to your application on TRGT1 and send decoded message
on the SII. - The default for this bit is the inverse of FLT_DROP_MSG. That is, if
- FLT_DROP_MSG =1, then the default of this bit is '0' (drop message TLPs). This bit
only controls message TLPs other than Vendor MSGs. Vendor MSGs are controlled by
- Filter Mask Register 2, bits [1:0]. The controller never passes ATS Invalidate messages
to the SII interface regardless of this filter rule setting. The controller passes all ATS Invalidate messages to TRGT1 (or AXI bridge master), as they are too big for the SII. [28]: CX_FLT_MASK_CPL_ECRC_DISCARD - Only used when completion queue is advertised with infinite credits and is in store-and-forward mode. - 0: Discard completions with ECRC errors - 1: Allow completions with ECRC errors to be passed up - Reserved field for SW. [27]: CX_FLT_MASK_ECRC_DISCARD - 0: Discard TLPs with ECRC errors - 1: Allow TLPs with ECRC errors to be passed up [26]:
- CX_FLT_MASK_CPL_LEN_MATCH - 0: Enforce length match for completions; a
violation results in cpl_abort, and possibly AER of unexp_cpl_err - 1: Mask length match for completions [25]: CX_FLT_MASK_CPL_ATTR_MATCH - 0: Enforce attribute match for completions; a violation results in a malformed TLP error, and possibly AER of unexp_cpl_err, cpl_rcvd_ur, cpl_rcvd_ca - 1: Mask attribute match for completions [24]: CX_FLT_MASK_CPL_TC_MATCH - 0: Enforce Traffic Class match for completions; a violation results in a malformed TLP error, and possibly AER of unexp_cpl_err, cpl_rcvd_ur, cpl_rcvd_ca - 1: Mask Traffic Class match for completions [23]:
- CX_FLT_MASK_CPL_FUNC_MATCH - 0: Enforce function match for completions; a
violation results in cpl_abort, and possibly AER of unexp_cpl_err, cpl_rcvd_ur, cpl_rcvd_ca - 1: Mask function match for completions [22]:
- CX_FLT_MASK_CPL_REQID_MATCH - 0: Enforce Req. Id match for completions; a
violation result in cpl_abort, and possibly AER of unexp_cpl_err, cpl_rcvd_ur, cpl_rcvd_ca - 1: Mask Req. Id match for completions [21]:
- CX_FLT_MASK_CPL_TAGERR_MATCH - 0: Enforce Tag Error Rules for completions; a
violation result in cpl_abort, and possibly AER of unexp_cpl_err, cpl_rcvd_ur, cpl_rcvd_ca - 1: Mask Tag Error Rules for completions [20]:
- CX_FLT_MASK_LOCKED_RD_AS_UR - 0: Treat locked Read TLPs as UR for EP;
Supported for RC - 1: Treat locked Read TLPs as Supported for EP; UR for RC [19]:
- CX_FLT_MASK_CFG_TYPE1_REQ_AS_UR - 0: Treat CFG type1 TLPs as UR for EP;
- Supported for RC - 1: Treat CFG type1 TLPs as Supported for EP; UR for RC - When
- CX_SRIOV_ENABLE is set then this bit is set to allow the filter to process Type 1
Config requests if the EP consumes more than one bus number. [18]:
- CX_FLT_MASK_UR_OUTSIDE_BAR - 0: Treat out-of-bar TLPs as UR - 1: Do not treat
out-of-bar TLPs as UR [17]: CX_FLT_MASK_UR_POIS - 0: Treat poisoned request TLPs as UR - 1: Do not treat poisoned request TLPs as UR - The native controller always passes poisoned completions to your application except when you are using the DMA read channel. [16]: CX_FLT_MASK_UR_FUNC_MISMATCH - 0: Treat Function
- MisMatched TLPs as UR - 1: Do not treat Function MisMatched TLPs as UR Note: This
register field is sticky. 0x0 DISABLE_FC_WD_TIMER: Disable FC Watchdog Timer. Note: This register field is sticky. 14:11 0x0 EIDLE_TIMER:
- EIDLE_TIMER is an internally reserved field. Do not use. Note: This register field is
sticky.

- PCIe x4/x8 Endpoint
- Bit
- Reset
- Description

