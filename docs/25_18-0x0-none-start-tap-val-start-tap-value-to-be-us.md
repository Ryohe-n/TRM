# 25 :18 0x0 _NONE_ START_TAP_VAL: start tap value to be used by tuning; start_tap should be multiple of step_size chosen and its valid range is 0-255;

- Not valid when TAP_VAL_UPDATED_BY_HW is set to
zero.
- Tuning algorithm uses this as the start tap value for
scanning through trimmer taps. 0x1 _NONE_ TAP_VAL_UPDATED_BY_HW:
- This bit is functional only in tunable modes (SDR50,
- SDR104 and HS200)
- SW can choose to update the tap val by itself by
clearing this bit; Preferred value is 1 - tap val is updated by HW. If this bit is cleared, HW does not update tap_val per every tuning iteration. SW can update it as desired.
- Tuning pattern match is indicated by
sampling_clock_select per every tuning iteration.
- SW has to maintain the status of each tuning iteration
and determine the best PASS window to fix the final sampling point. And SW can program NUM_TUNING_ITERATIONS as desired.
- Once the number of tuning commands issued reaches
number of tuning iterations programmmed, execute_tuning bit will be cleared to indicate the completion of tuning procedure.
- Please note that using this option violates Host Spec
but provided for legacy reasons.
- It helps us in using legacy SW tuning solution incase
HW solution does not work. 15:13
- TRIES_40
_NONE_ NUM_TUNING_ITERATIONS:
- The number of tuning iterations to be used by tuning
circuit. 0 = TRIES_40 1 = TRIES_64 2 = TRIES_128 3 = TRIES_192 4 = TRIES_256 12:6 0x2 0x1 MUL_M: implements a multipler - M+1
- Final tap value is derived from best passing window
and calculated as follows.
- Final tap value = first_pass + ( (last_pass -
first_pass)*Q); where Q = percentage of pass window;default-75% Q = M+1/(2^N); N:1...7 M:should be in range [0:2^N-1]; 5:3 0x2 _NONE_ DIV_N: implements a divider - 2^N; max div is 2^7 =>128

- SDMMCA Registers
- Bit
- Reset
- PROD
- Description

