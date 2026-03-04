# 19 :12 0x0 CFG_PBUS_NUM:

- The primary bus number assigned to the function. The number of bits
depends the value of MULTI_DEVICE_AND_BUS_PER_FUNC_EN:
- If MULTI_DEVICE_AND_BUS_PER_FUNC_EN =0, there are eight bits of
cfg_pbus_num ([7:0]).
- If MULTI_DEVICE_AND_BUS_PER_FUNC_EN =1, there are eight bits of
cfg_pbus_num. 11:7 0x0 CFG_PBUS_DEV_NUM:
- The device number assigned to the function. The number of bits
depends the value of MULTI_DEVICE_AND_BUS_PER_FUNC_EN 0x0 CFG_MEM_SPACE_EN:
- The state of the Memory Space Enable bit in the PCI-compatible
- Command register. There is 1 bit of cfg_mem_space_en assigned

