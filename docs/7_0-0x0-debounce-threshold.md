# 7 :0 0x0 DEBOUNCE_THRESHOLD:

- This field holds the Debounce threshold in msec to specify the debounce
interval. 0 = No Debounce. 1 ~ N-1: Debouncing interval of 1 msec to (N-1) msec. NOTE: The actual Debounce interval has an accuracy granularity of 1 msec.
- Hence, when programmed to "1", the actual Debouncing interval is
between 1 msec and 2 msec.
- GPIO_<iii>_INPUT_0<j>_0,
where <iii> = S, T, W, U, V and <j> ∈ {0, 1, 2, 3, 4, 5, 6, 7}.
- GPIO_S_INPUT_00_0
- Offset: 0x1008
- GPIO_S_INPUT_01_0
- Offset: 0x1028
- GPIO_S_INPUT_02_0
- Offset: 0x1048
- GPIO_S_INPUT_03_0
- Offset: 0x1068
- GPIO_S_INPUT_04_0
- Offset: 0x1088

- GPIO FSI Control Registers
- GPIO_S_INPUT_05_0
- Offset: 0x10a8
- GPIO_S_INPUT_06_0
- Offset: 0x10c8
- GPIO_S_INPUT_07_0
- Offset: 0x10e8
- GPIO_T_INPUT_00_0
- Offset: 0x1208
- GPIO_T_INPUT_01_0
- Offset: 0x1228
- GPIO_W_INPUT_00_0
- Offset: 0x1408
- GPIO_W_INPUT_01_0
- Offset: 0x1428
- GPIO_U_INPUT_00_0
- Offset: 0x1008
- GPIO_U_INPUT_01_0
- Offset: 0x1028
- GPIO_U_INPUT_02_0
- Offset: 0x1048
- GPIO_U_INPUT_03_0
- Offset: 0x1068
- GPIO_U_INPUT_04_0
- Offset: 0x1088
- GPIO_U_INPUT_05_0
- Offset: 0x10a8
- GPIO_U_INPUT_06_0
- Offset: 0x10c8
- GPIO_U_INPUT_07_0
- Offset: 0x10e8
- GPIO_V_INPUT_00_0
- Offset: 0x1208

- GPIO FSI Control Registers
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: GPIO_<iii>_SCR_0<j>_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description
X GPIO_IN:
- This field holds the GPIO Input value sampled after the specified
Debouncing interval.
- It is effective only when
(GPIO_<i>_ENABLE_ CONFIG_0<j>_0.GPIO_ENABLE == ENABLE).
- It reflects the external value regardless of (GPIO_<i>_ENABLE_
- CONFIG_0<j>_0.IN_OUT) setting, so that the externally driven value is
present in this field to aid debugging.
- GPIO_<iii>_OUTPUT_CONTROL_0<j>_0,
where <iii> = S, T, W, U, V and <j> ∈ {0, 1, 2, 3, 4, 5, 6, 7}.
- GPIO_S_OUTPUT_CONTROL_00_0
- Offset: 0x100c
- GPIO_S_OUTPUT_CONTROL_01_0
- Offset: 0x102c
- GPIO_S_OUTPUT_CONTROL_02_0
- Offset: 0x104c
- GPIO_S_OUTPUT_CONTROL_03_0
- Offset: 0x106c
- GPIO_S_OUTPUT_CONTROL_04_0
- Offset: 0x108c
- GPIO_S_OUTPUT_CONTROL_05_0
- Offset: 0x10ac
- GPIO_S_OUTPUT_CONTROL_06_0
- Offset: 0x10cc
- GPIO_S_OUTPUT_CONTROL_07_0
- Offset: 0x10ec

- GPIO FSI Control Registers
- GPIO_T_OUTPUT_CONTROL_00_0
- Offset: 0x120c
- GPIO_T_OUTPUT_CONTROL_01_0
- Offset: 0x122c
- GPIO_W_OUTPUT_CONTROL_00_0
- Offset: 0x140c
- GPIO_W_OUTPUT_CONTROL_01_0
- Offset: 0x142c
- GPIO_U_OUTPUT_CONTROL_00_0
- Offset: 0x100c
- GPIO_U_OUTPUT_CONTROL_01_0
- Offset: 0x102c
- GPIO_U_OUTPUT_CONTROL_02_0
- Offset: 0x104c
- GPIO_U_OUTPUT_CONTROL_03_0
- Offset: 0x106c
- GPIO_U_OUTPUT_CONTROL_04_0
- Offset: 0x108c
- GPIO_U_OUTPUT_CONTROL_05_0
- Offset: 0x10ac
- GPIO_U_OUTPUT_CONTROL_06_0
- Offset: 0x10cc
- GPIO_U_OUTPUT_CONTROL_07_0
- Offset: 0x10ec
- GPIO_V_OUTPUT_CONTROL_00_0
- Offset: 0x120c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: GPIO_<iii>_SCR_0<j>_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)

- GPIO FSI Control Registers
- Bit
- Reset
- Description
0x1 GPIO_OUT_CONTROL:
- This field Indicates whether the GPIO as an output is Floated or Actively
driven.
- It is effective only when
((GPIO_<i>_ENABLE_ CONFIG_0<j>_0.GPIO_ENABLE == ENABLE) && (GPIO_<i>_ENABLE_ CONFIG_0<j>_0.IN_OUT == OUT)).
- It is floated regardless of the value specified here, When
((GPIO_<i>_ENABLE_ CONFIG_0<j>_0.GPIO_ENABLE == DISABLE) || (GPIO_<i>_ENABLE_ CONFIG_0<j>_0.IN_OUT == IN)). 0 = DRIVEN. 1 = FLOATED.
- GPIO_<iii>_OUTPUT_VALUE_0<j>_0,
where <iii> = S, T, W, U, V and <j> ∈ {0, 1, 2, 3, 4, 5, 6, 7}.
- GPIO_S_OUTPUT_VALUE_00_0
- Offset: 0x1010
- GPIO_S_OUTPUT_VALUE_01_0
- Offset: 0x1030
- GPIO_S_OUTPUT_VALUE_02_0
- Offset: 0x1050
- GPIO_S_OUTPUT_VALUE_03_0
- Offset: 0x1070
- GPIO_S_OUTPUT_VALUE_04_0
- Offset: 0x1090
- GPIO_S_OUTPUT_VALUE_05_0
- Offset: 0x10b0
- GPIO_S_OUTPUT_VALUE_06_0
- Offset: 0x10d0
- GPIO_S_OUTPUT_VALUE_07_0
- Offset: 0x10f0
- GPIO_T_OUTPUT_VALUE_00_0
- Offset: 0x1210

- GPIO FSI Control Registers
- GPIO_T_OUTPUT_VALUE_01_0
- Offset: 0x1230
- GPIO_W_OUTPUT_VALUE_00_0
- Offset: 0x1410
- GPIO_W_OUTPUT_VALUE_01_0
- Offset: 0x1430
- GPIO_U_OUTPUT_VALUE_00_0
- Offset: 0x1010
- GPIO_U_OUTPUT_VALUE_01_0
- Offset: 0x1030
- GPIO_U_OUTPUT_VALUE_03_0
- Offset: 0x1070
- GPIO_U_OUTPUT_VALUE_04_0
- Offset: 0x1090
- GPIO_U_OUTPUT_VALUE_05_0
- Offset: 0x10b0
- GPIO_U_OUTPUT_VALUE_06_0
- Offset: 0x10d0
- GPIO_U_OUTPUT_VALUE_07_0
- Offset: 0x10f0
- GPIO_V_OUTPUT_VALUE_00_0
- Offset: 0x1210
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: GPIO_<iii>_SCR_0<j>_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 GPIO_OUT_VAL:
- This field holds the GPIO output value to be driven out when
(GPIO_<i>_OUTPUT_CONTROL_<j>_0.GPIO_OUT_CONTROL == DRIVEN).
- It is effective only when
((GPIO_<i>_ENABLE_ CONFIG_0<j>_0.GPIO_ENABLE == ENABLE) && (GPIO_<i>_ENABLE_ CONFIG_0<j>_0.IN_OUT == OUT)).

- GPIO FSI Control Registers
- GPIO_<iii>_INTERRUPT_CLEAR_0<j>_0,
where <iii> = S, T, W, U, V and <j> ∈ {0, 1, 2, 3, 4, 5, 6, 7}.
- GPIO_S_INTERRUPT_CLEAR_00_0
- Offset: 0x1014
- GPIO_S_INTERRUPT_CLEAR_01_0
- Offset: 0x1034
- GPIO_S_INTERRUPT_CLEAR_02_0
- Offset: 0x1054
- GPIO_S_INTERRUPT_CLEAR_03_0
- Offset: 0x1074
- GPIO_S_INTERRUPT_CLEAR_04_0
- Offset: 0x1094
- GPIO_S_INTERRUPT_CLEAR_05_0
- Offset: 0x10b4
- GPIO_S_INTERRUPT_CLEAR_06_0
- Offset: 0x10d4
- GPIO_S_INTERRUPT_CLEAR_07_0
- Offset: 0x10f4
- GPIO_T_INTERRUPT_CLEAR_00_0
- Offset: 0x1214
- GPIO_T_INTERRUPT_CLEAR_01_0
- Offset: 0x1234
- GPIO_W_INTERRUPT_CLEAR_00_0
- Offset: 0x1414
- GPIO_W_INTERRUPT_CLEAR_01_0
- Offset: 0x1434
- GPIO_U_INTERRUPT_CLEAR_00_0
- Offset: 0x1014
- GPIO_U_INTERRUPT_CLEAR_01_0
- Offset: 0x1034

- GPIO FSI Control Registers
- GPIO_U_INTERRUPT_CLEAR_02_0
- Offset: 0x1054
- GPIO_U_INTERRUPT_CLEAR_03_0
- Offset: 0x1074
- GPIO_U_INTERRUPT_CLEAR_04_0
- Offset: 0x1094
- GPIO_U_INTERRUPT_CLEAR_05_0
- Offset: 0x10b4
- GPIO_U_INTERRUPT_CLEAR_06_0
- Offset: 0x10d4
- GPIO_U_INTERRUPT_CLEAR_07_0
- Offset: 0x10f4
- GPIO_V_INTERRUPT_CLEAR_00_0
- Offset: 0x1214
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: GPIO_<iii>_SCR_0<j>_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 GPIO_INTERRUPT_CLEAR:
- This field holds the Interrupt clear control bit for clearing the Interrupt at
GPIO Pin <j> in GPIO Port <i>/<iii>.
- It is effective only when
((GPIO_<i>_ENABLE_ CONFIG_0<j>_0. (GPIO_<i>_ENABLE_ CONFIG_0<j>_0.INTERRUPT_FUNCTION == ENABLE)). 0 = DON’T CLEAR. 1 = CLEAR.
- GPIO_<iii>_INTERRUPT_STATUS_G<jj>_0,
where <iii> = S, T, W, U, V and <jj> = 0, 1, 2, 3, 4, 5, 6, 7.
- GPIO_S_INTERRUPT_STATUS_G0_0
- Offset: 0x1100

- GPIO FSI Control Registers
- GPIO_S_INTERRUPT_STATUS_G1_0
- Offset: 0x1104
- GPIO_S_INTERRUPT_STATUS_G2_0
- Offset: 0x1108
- GPIO_S_INTERRUPT_STATUS_G3_0
- Offset: 0x110c
- GPIO_S_INTERRUPT_STATUS_G4_0
- Offset: 0x1110
- GPIO_S_INTERRUPT_STATUS_G5_0
- Offset: 0x1114
- GPIO_S_INTERRUPT_STATUS_G6_0
- Offset: 0x1118
- GPIO_S_INTERRUPT_STATUS_G7_0
- Offset: 0x111c
- GPIO_U_INTERRUPT_STATUS_G0_0
- Offset: 0x1100
- GPIO_U_INTERRUPT_STATUS_G1_0
- Offset: 0x1104
- GPIO_U_INTERRUPT_STATUS_G2_0
- Offset: 0x1108
- GPIO_U_INTERRUPT_STATUS_G3_0
- Offset: 0x110c
- GPIO_U_INTERRUPT_STATUS_G4_0
- Offset: 0x1110
- GPIO_U_INTERRUPT_STATUS_G5_0
- Offset: 0x1114
- GPIO_U_INTERRUPT_STATUS_G6_0
- Offset: 0x1118
- GPIO_U_INTERRUPT_STATUS_G7_0
- Offset: 0x111c
- Read/Write: RO
- Parity Protection: N
- Shadow: N

- GPIO FSI Control Registers
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000,0000)
- Bit
- Reset
- Description

