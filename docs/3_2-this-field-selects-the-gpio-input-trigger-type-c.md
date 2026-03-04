# 3 :2 This field selects the GPIO Input trigger type (condition).

- It is effective only when
(GPIO_<i>_ENABLE_ CONFIG_0<j>_0.GPIO_ENABLE == ENABLE). 0 = NO_TRIGGER. 1 = LEVEL. 2 = SINGLE EDGE. 3 = DOUBLE_EDGE (i.e. both Low-High, High-Low edges are detected as event).
- IN_OUT
This field configures the GPIO for Input or Output.
- It is effective only when
(GPIO_<i>_ENABLE_ CONFIG_0<j>_0.GPIO_ENABLE == ENABLE). 0 = IN. 1 = OUT.
- GPIO_ENABLE
- This field is the GPIO functionality selection control required for output/
input selection. It acts as a global qualifier for all the functions of the specific GPIO. It is also used for SLCG (Second Level Clock Gating) per pin-based GPIO logic. 0 = DISABLE. 1 = ENABLE.
- When Disabled, the GPIO is floated, i.e. both input and output are
disabled. At this point, if PinMux selects the GPIO, the I/O is in High-Z state.
- GPIO_<i>/<iii>_DEBOUNCE_THRESHOLD_0<j>_0
where <i> = A, B, C, D, E, F, G, H, I, J, K, L, M, N, P, Q, R, X, Y, Z, AA, AC, AD, AE, AF, AG, BB, CC,
- DD, EE, GG,

- GPIO Controllers
<iii> = S, T, W, U, V, and <j> ∈ {0, 1, 2, 3, 4, 5, 6, 7}. This register, available for each GPIO Pin (<j>) in a GPIO Port (<i>, <iii>), specifies the Debounce threshold of the given GPIO Pin.
- Field
- Bit
- Reset
- Description
- DEBOUNCE_
- THRESHOLD

