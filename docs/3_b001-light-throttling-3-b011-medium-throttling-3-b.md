# 3 ’b001: Light throttling 3’b011: Medium throttling 3’b111: Heavy throttling It is the decision of the respective clock domains in terms of what to do with the signals. For example, the respective clock domains will need to make sure to update their clocks in a safe manner. Ultimately, they decide how to go from light/medium/heavy to an actual frequency value.

#### 9.8.1.5 FSI_THERM
- There is another instance of SOC_THERM located in the Functional Safety Island named
FSI_THERM. FSI_THERM aids in the thermal management of Functional Safety Island (FSI). It processes data from the thermal sensors placed within FSI and signals events based on software configuration. These events are used by software to take appropriate actions (i.e., reset by PMC, Error Handling by Safety CPU) based on the nature of the event generated. FSI houses two thermal sense macros. FSI_THERM compares the two sensors for consistency and notifies an error if the difference between the sensors is beyond the programmed temperature range.

