# 4 :0 0x0 INT_CODE:

- Eight interrupt codes. If the code is 0, logging of the next interrupt is
enabled 0 = INT_CODE_CLEAR: Clear interrupt code 1 = INT_CODE_INI_SLVERR: Interrupt code for MPCORE AXI SLVERR response to IPFS 2 = INT_CODE_INI_DECERR: Interrupt code for MPCORE AXI DECERR response to IPFS 3 = INT_CODE_TGT_SLVERR: Interrupt code for PCIe endpoint FPCI target abort or data error response to IPFS 4 = INT_CODE_TGT_DECERR: Interrupt code for PCIE2 FPCI master abort response to IPFS 5 = INT_CODE_TGT_WRERR: Interrupt code for bufferable write to non- posted write address region 6 = RSVD1: Reserved 7 = INT_CODE_DFPCI_DECERR: Interrupt code for PCIE2 response to downstream request when downstream FPCI address does not fall in a claimable downstream region 8 = INT_CODE_AXI_DECERR: Interrupt code for IPFS response to downstream request when AXI target AXI address does not fall in any of
- IPFS downstream BARs

