# 0 ). E_PULLU

- In
- VDD_SOC/VDD_RTC
Enables weak pull-up (20 KΩ ± 35%). E_PULLD
- In
- VDD_SOC/VDD_RTC
Enables weak pull-down (20 KΩ ± 35%). E_PBIAS_BUF
- In
- VDD_SOC/VDD_RTC
Enables internally generated bias for driver PMOS in 3.3 V mode.
- Selects strong driver with internally generated 0.5*VDDP when VDDP
is LOW and VCLAMP is HIGH. Wrong setting combination with VREF_SEL may cause electrical stress resulting in pad damage.
- VREF_SEL_[3:0]
- In
- VDD_SOC/VDD_RTC
- Select different bias levels for driver PMOS, when (E_PBIAS_BUF ==

