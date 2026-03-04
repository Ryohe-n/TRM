# 0 = Trigger on Falling Edge. 1 = Trigger on Raising Edge.

- When (GPIO_<i>_ENABLE_ CONFIG_0<j>_0.TRIGGER_TYPE == BOTH EDGES),
this field is irrelevant. 3:2 0x0 TRIGGER_TYPE: This field selects the GPIO Input trigger type (condition).
- It is effective only when
(GPIO_<i>_ENABLE_ CONFIG_0<j>_0.GPIO_ENABLE == ENABLE). 0 = NO_TRIGGER. 1 = LEVEL. 2 = SINGLE EDGE. 3 = DOUBLE_EDGE (i.e. both Low-High, High-Low edges are detected as event). 0x0 IN_OUT: This field configures the GPIO for Input or Output.
- It is effective only when
(GPIO_<i>_ENABLE_ CONFIG_0<j>_0.GPIO_ENABLE == ENABLE). 0 = IN. 1 = OUT. 0x0 GPIO_ENABLE:
- This field is the GPIO functionality selection control required for output/input
selection. It acts as a global qualifier for all the functions of the specific GPIO. It is also used for SLCG (Second Level Clock Gating) per pin-based GPIO logic. 0 = DISABLE. 1 = ENABLE.
- When Disabled, the GPIO is floated, i.e. both input and output are disabled. At
this point, If PinMux selects the GPIO, the I/O is in High-Z state.
- GPIO_<iii>_DEBOUNCE_THRESHOLD_0<j>_0,
where <iii> = S, T, W, U, V and <j> ∈ {0, 1, 2, 3, 4, 5, 6, 7}.
- GPIO_S_DEBOUNCE_THRESHOLD_00_0
- Offset: 0x1004
- GPIO_S_DEBOUNCE_THRESHOLD_01_0
- Offset: 0x1024

- GPIO FSI Control Registers
- GPIO_S_DEBOUNCE_THRESHOLD_02_0
- Offset: 0x1044
- GPIO_S_DEBOUNCE_THRESHOLD_03_0
- Offset: 0x1064
- GPIO_S_DEBOUNCE_THRESHOLD_04_0
- Offset: 0x1084
- GPIO_S_DEBOUNCE_THRESHOLD_05_0
- Offset: 0x10a4
- GPIO_S_DEBOUNCE_THRESHOLD_06_0
- Offset: 0x10c4
- GPIO_S_DEBOUNCE_THRESHOLD_07_0
- Offset: 0x10e4
- GPIO_T_DEBOUNCE_THRESHOLD_00_0
- Offset: 0x1204
- GPIO_T_DEBOUNCE_THRESHOLD_01_0
- Offset: 0x1224
- GPIO_W_DEBOUNCE_THRESHOLD_00_0
- Offset: 0x1404
- GPIO_W_DEBOUNCE_THRESHOLD_01_0
- Offset: 0x1424
- GPIO_U_DEBOUNCE_THRESHOLD_00_0
- Offset: 0x1004
- GPIO_U_DEBOUNCE_THRESHOLD_01_0
- Offset: 0x1024
- GPIO_U_DEBOUNCE_THRESHOLD_02_0
- Offset: 0x1044
- GPIO_U_DEBOUNCE_THRESHOLD_03_0
- Offset: 0x1064
- GPIO_U_DEBOUNCE_THRESHOLD_04_0
- Offset: 0x1084
- GPIO_U_DEBOUNCE_THRESHOLD_05_0
- Offset: 0x10a4

- GPIO FSI Control Registers
- GPIO_U_DEBOUNCE_THRESHOLD_06_0
- Offset: 0x10c4
- GPIO_U_DEBOUNCE_THRESHOLD_07_0
- Offset: 0x10e4
- GPIO_V_DEBOUNCE_THRESHOLD_00_0
- Offset: 0x1204
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: GPIO_<iii>_SCR_0<j>_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000,0000)
- Bit
- Reset
- Description

