# 38 = INIT 0x0 TRBFETCH_RDPASSPW: 0 = INIT 0x1

- ASYNC_EP_IDLE: Check to include Async EPs Idle condition for U1/U2. If
this bit is 1, Async EPs Idle is based on PP bit indication by host. If it is 0, Async EPs always flags idle. 1 = INIT 0x1
- LOCAL_ROTATE: Enabled Performance mode in Thread logic where it
does not evict and Endpoint if there are no other endpoints waiting 0 = DIS 1 = EN 1 = INIT 0x1
- TRBFETCH_RINGEND_CHK: Setting this to 1, makes TRB Fetch always
fetch one extra TRB to check for End of Ring. 1 = EN 0x0
- TRBFETCH_IDT_IN: Check to allow IDT TRBs for an OUT Endpoint

