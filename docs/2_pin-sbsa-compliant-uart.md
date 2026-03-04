# 2 pin SBSA Compliant UART.

##### 9.13.2.16.13 PWM
- The AON cluster implements one PWM. The details of the PMW can be found in the Pulse Width
Modulator (PWM) chapter of this document.
##### 9.13.2.16.14 GPIO Controllers
- The AON cluster implements a GPIO controller and pinmux module. Both modules have separate
APB interfaces. There are four interrupts (two functional and two time-stamp interrupts) from the GPIO controller. One functional interrupt and one timestamp interrupt is sent from the GPIO block to the AON interrupt controller. All functional and timestamp interrupts is sent to LIC.

- AON Programming Guidelines
##### 9.13.2.16.15 DMIC
The AON cluster implements a DMIC controller for supporting voice wake functionality. The AON DMIC controller is optimized for low power voice wake requirements.
##### 9.13.2.16.16 CEC
The Consumer Electronic Controller (CEC) unit is added in the AO domain. The motivation for adding the controller to AON is to be able to wake the system up from SC7 only on messages indicated to the SoC and not to wake up on unintended or spurious toggles of the input (wake capable pad).

