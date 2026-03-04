# 31 :0 0x0 RawMap:

- Currently asserted internal interrupts
The mapping of the Internal Interrupts is defined as follows:
- Bits[00 + [nT-1:0]] are the interrupts of the nT instantiated timers
- Bits[16 + {w} * 4 + [2:0]] are the sets of three interrupts of the nW
instantiated watchdog timers
- TKE_TOP_TIMER_TMR0_TMRCR_0
- Register name Offset Description
- TMRCR{t} BT + P*{t} + 0 Timer Configuration Register
- TMRSR{t} BT + P*{t} + 4 Timer Status Register
- TMRCSSR{t} BT + P*{t} + 8 Timer Clock Source Selection Register
- TMRATR{t} BT + P*{t} + 12 Timer Absolute Target Register
- Timer Configuration Register
- Offset: 0x10000
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: TKE_TOP_SCR_TMRSCR0_0
- Reset: 0x40000000 (0b01x0,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 EN: Enable, when set, enables the countdown process. 0 = DISABLE 1 = ENABLE

- Time Keeping Element: TOP Registers
- Bit
- Reset
- Description
0x1 PER:
- Periodic, when set, the internal counter is automatically reloaded after
reaching 0 0 = DISABLE 1 = ENABLE 28:0 0x0 PTV:
- Timer Present Trigger Value. When TMRCR is written and EN is 1b, the
internal counter is loaded with PTV+1 and starts counting down at each timing reference pulse. An interrupt is set when the internal counter reaches 0. Note that writing TMRCR with EN=1 while EN was already 1 restarts the counter.
- Once the timer is started, TARGET can be used to either
- observe the value of the reference counter when the next interrupt
will be generated (read)
- select the exact reference counter value at which the next interrupt
will be generated (write) 536870911 = MAX
- TKE_TOP_TIMER_TMR0_TMRSR_0
- Timer Status Register
- Offset: 0x10004
- Read/Write: See table below
- Parity Protection: See table below
- Shadow: N
- SCR Protection: TKE_TOP_SCR_TMRSCR0_0
- Reset: 0x00000000 (0bx0x0,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Parity Protection
- Reset
- Description
- RW
Y 0x0 INTR_CLR:
- Clears the interrupt when written as 1b,
read always returns 0 0 = DISABLE 1 = ENABLE 28:0
- RO
N 0x0 PCV:
- Current counter value, writing to this field
has no effect
- TKE_TOP_TIMER_TMR0_TMRCSSR_0
- Timer Clock Source Selection Register

- Time Keeping Element: TOP Registers
- Offset: 0x10008
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: TKE_TOP_SCR_TMRSCR0_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description

