# 31 :

- NA
GET: Writing bit i to 1b is a request for ownership of resource i from aperture {a}. All pending requests are accumulated in an internal register visible as HSP_ARB_SEM{a}_{as}_REQ_ST_0. Requests cannot be canceled; a request bit gets cleared when ownership is acquired.
##### 9.7.4.4.3 HSP_ARB_SEM{a}_{as}_SMP_PUT_0
There are four Arbitrated Semaphore Put registers, where {as} = semaphore 0 through 3 and {a} = aperture 0 or 1. Use this register to relinquish ownership.
- Offset: Base + 0x8 | Read/Write: WO | SCR Protection: AS_{as}_REG_0 | Reset: 0x00000000
(0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

