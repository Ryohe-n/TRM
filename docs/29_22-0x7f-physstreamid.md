# 29 :22 0x7f PhysStreamID:

- RWGL:Physical StreamID: This field specifies the StreamID output when
the physical stream Is is enabled for a region. 0x0 CarveOutLock:
- RW1:Carveout Lock: This bit prevents writes to all Carve Out controls when
set to 1. 0 = FALSE 1 = TRUE 0x1 DefPhysical:
- RWGL:Default Physical Select: Specifies the default how the StreamID is
selected for default accesses. 0=DefVMIndx is used to select the
- StreamID, 1 = PhysStreamID is used

