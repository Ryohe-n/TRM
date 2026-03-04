# 1 msec and 2 msec.

- GPIO_<i>/<iii>_INPUT_0<j>_0
where <i> = A, B, C, D, E, F, G, H, I, J, K, L, M, N, P, Q, R, X, Y, Z, AA, AC, AD, AE, AF, AG, BB, CC,
- DD, EE, GG,
<iii> = S, T, W, U, V, and <j> ∈ {0, 1, 2, 3, 4, 5, 6, 7}. This register, available for each GPIO Pin (<j>) in a GPIO Port (<i>, <iii>), specifies the GPIO Input value of the given GPIO Pin.
- Field
- Bit
- Reset
- Description
- GPIO_IN
X
- This field holds the GPIO Input value sampled after the specified
Debouncing interval.
- It is effective only when
(GPIO_<i>_ENABLE_ CONFIG_0<j>_0.GPIO_ENABLE == ENABLE).
- It reflects the external value regardless of (GPIO_<i>_ENABLE_
- CONFIG_0<j>_0.IN_OUT) setting, so that the externally driven value is
present in this field to aid debugging.
- GPIO_<i>/<iii>_OUTPUT_CONTROL_0<j>_0
where <i> = A, B, C, D, E, F, G, H, I, J, K, L, M, N, P, Q, R, X, Y, Z, AA, AC, AD, AE, AF, AG, BB, CC,
- DD, EE, GG,
<iii> = S, T, W, U, V, and <j> ∈ {0, 1, 2, 3, 4, 5, 6, 7}.

- GPIO Controllers
This register, available for each GPIO Pin (<j>) in a GPIO Port (<i>, <iii>), enables the given GPIO Pin to be Output.
- Field
- Bit
- Reset
- Description
- GPIO_OUT_CONTROL
- This field Indicates whether the GPIO as an output is Floated or Actively
driven.
- It is effective only when
((GPIO_<i>_ENABLE_ CONFIG_0<j>_0.GPIO_ENABLE == ENABLE) && (GPIO_<i>_ENABLE_ CONFIG_0<j>_0.IN_OUT == OUT)).
- It is floated regardless of the value specified here, When
((GPIO_<i>_ENABLE_ CONFIG_0<j>_0.GPIO_ENABLE == DISABLE) || (GPIO_<i>_ENABLE_ CONFIG_0<j>_0.IN_OUT == IN)). 0 = DRIVEN. 1 = FLOATED.
- GPIO_<i>/<iii>_OUTPUT_VALUE_0<j>_0
where <i> = A, B, C, D, E, F, G, H, I, J, K, L, M, N, P, Q, R, X, Y, Z, AA, AC, AD, AE, AF, AG, BB, CC,
- DD, EE, GG,
<iii> = S, T, W, U, V, and <j> ∈ {0, 1, 2, 3, 4, 5, 6, 7}. This register, available for each GPIO Pin (<j>) in a GPIO Port (<i>, <iii>), specifies the GPIO Output value of the given GPIO Pin.
- Field
- Bit
- Rese
t
- Description
- GPIO_OUT_VALUE
- This field holds the GPIO output value to be driven out when
(GPIO_<i>_OUTPUT_CONTROL_<j>_0.GPIO_OUT_CONTROL == DRIVEN).
- It is effective only when
((GPIO_<i>_ENABLE_ CONFIG_0<j>_0.GPIO_ENABLE == ENABLE) && (GPIO_<i>_ENABLE_ CONFIG_0<j>_0.IN_OUT == OUT)).
- GPIO_<i>/<iii>_INTERRUPT_CLEAR_0<j>_0
where <i> = A, B, C, D, E, F, G, H, I, J, K, L, M, N, P, Q, R, X, Y, Z, AA, AC, AD, AE, AF, AG, BB, CC,
- DD, EE, GG,
<iii> = S, T, W, U, V, and <j> ∈ {0, 1, 2, 3, 4, 5, 6, 7}. This register, available for each GPIO Pin (<j>) in a GPIO Port (<i>, <iii>), clears the Interrupt at the given GPIO Port/Pin.

- GPIO Controllers
- Field
- Bit
- Reset
- Description
- GPIO_INTERRUPT_CLEAR
- This field holds the Interrupt clear control bit for clearing the Interrupt at
GPIO Pin <j> in GPIO Port <i>/<iii>.
- It is effective only when
((GPIO_<i>_ENABLE_ CONFIG_0<j>_0. (GPIO_<i>_ENABLE_ CONFIG_0<j>_0.INTERRUPT_FUNCTION == ENABLE)). 0 = DON’T CLEAR. 1 = CLEAR.
- Per-Port Status Registers
This sub-section covers the GPIO Status Registers for one instance of the GPIO Port in response to all the 8 Security Masters, NVG0 through NVG7.
- GPIO_<i>/<iii>_INTERRUPT_STATUS_G<jj>_0,
where <i> = A, B, C, D, E, F, G, H, I, J, K, L, M, N, P, Q, R, X, Y, Z, AA, AC, AD, AE, AF, AG, BB, CC,
- DD, EE, GG,
<iii> = S, T, W, U, V, and <jj> = 0, 1, 2, 3, 4, 5, 6, 7. This register, available for each GPIO Port (<i>) and Security Master (<jj>), indicates whether a GPIO Pin in the GPIO Port (<i>) has caused the assertion of the given Interrupt originated from a Security Master (<jj>).
- Field
- Bit
- Rese
t
- Description
- GPIO_INTERRUPT_STATU
S [<j >*:0]
- This field has as many bits as the number of GPIO Pins in the given GPIO
- Port, with each such bit indicating whether the corresponding GPIO Input
change has resulted in Interrupt.
- Bit 0 is for Pin 0,
- Bit 1 is for Pin 1,
... Bit <j> is for Pin <j>. 0 = Interrupt not set. 1 = Interrupt set.
- It is effective only when
((GPIO_<i>_ENABLE_ CONFIG_0<j>_0.GPIO_ENABLE == ENABLE) && (GPIO_<i>_ENABLE_ CONFIG_0<j>_0.INTERRUPT_FUNCTION == ENABLE)).
- The bit in this field is cleared based on GPIO_<i>/
<iii>_INTERRUPT_CLEAR_0<j>_0.GPIO_INTERRUPT_CLEAR.
- In a Virtualized environment, the status reflects only the GPIOs belonging
to VM. For the GPIO bit positions not mapped to VM, the corresponding bit in this field is written with "0" by hardware for software to read this register correctly.
- : <j> = (p -1), where p is the number of GPIO Pins in a given GPIO Port <i>. And <j> ∈ {0, 1, 2, 3, 4,

