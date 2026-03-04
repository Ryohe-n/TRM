# 32 ,768 Hz reference clock

- TSC RefClk
- OSC clock (for the microsecond and reference pulse generation)
GTE uses the following clocks:
- APB clock

- Timers
- TSC RefClk
FSI-TSC and FSI-TKE use the following clocks:
- FSI crystal clock for operation
- FSI APB clock for register access
- For safety reasons, the FSI crystal clock must be protected by an FMON that acts as an
independent clock source.
#### 9.3.1.5 Resets
Most modules have an associated software reset control in CAR. FSI-TSC and FSI-TKE use the FSI system reset. The following time-related modules do not have a software reset:
- TSC and RTC
- As they maintain the notion of secure time and may be used to generate corresponding
secure interrupts, their operations should not be impeded by non-secure software. This requirement applies to the microsecond counter (USEC) inside TSC as well.
- Top TKE
- Top TKE can also be used to expose secure time, so has no software reset. Other TKEs,
however, still have software resets. The TSC terminal nodes are always associated with a logic block that consumes the TSC value. The TSC terminal node may share their reset with other logic block it is tightly coupled with. The following table summarizes the TSC terminal nodes and their reset logic.
- Table 9.17 Terminal Nodes Reset Logic
- Terminal Node
- Reset Logic
- In AON (used for AON TKE)
- By software reset, CLK_RST_CONTROLLER_RST_DEV_TSCTNAON;
must be enabled by software at boot time for cold boot.
- Disabled and restarted by software when terminal node is power
gated.
- ADSP and ADMA TSC in APE
On same reset as ADSP and ADMA, no special action needed.
- BPMP, SCE, RCE, and DCE
- By software reset,
- CLK_RST_CONTROLLER_RST_DEV_TSCTN<BPMP, SCE, RCE, DCE>;
must be enabled by software during respectively BPMP, SCE, RCE, and DCE startup sequence.
- GPU
On same reset as GPU, no special action needed.
- CCPLEX
On CCPLEX reset, no special action needed.
- Backbone (Top TKE and GTE)
On system reset, no special action needed.

- Timers
- Terminal Node
- Reset Logic
- Coresight
On same reset as Coresight, no special action needed.
- VI
- By software reset, CLK_RST_CONTROLLER_RST_DEV_TSCTNVI;
must be enabled by software during VI startup sequence.

