# 31 :0 0x0 STATUS: High priority interrupt status.

- It shows the latched value of the high priority interrupts. Only to be cleared
by the Safety Software. Software should write 1 to clear the status after the interrupt has been handled at the source or by the Safety Software.
- FSI_HSM_LP_INT_STATUS_0
This is an array of 32 identical register entries; the register fields below apply to each entry. Full register list is: FSI_HSM_LP_INT_STATUS_<i>, among which <i> belongs to <0..31>.
- Offset: 0x180,..,0x1fc
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

