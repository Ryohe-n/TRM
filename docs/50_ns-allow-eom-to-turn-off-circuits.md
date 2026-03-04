# 50 ns Allow EOM to turn off circuits.

- Periodic

10G Ethernet Controller Functional Description
- Due to system and environmental variations, it is required to perform periodic adaptation
sequences to keep equalization settings optimal and maximize design margins. To minimize the impact to live data, the periodic adaptation is expected to occur during normal data transmission so the adaptation sequence would use existing settings as starting point and perform small incremental changes. For design flexibility, the logic should be able to enable/disable periodic adaptation and use a programmable timer to determine the time interval between equalization events. If the link enters the recovery state due to potential electrical errors, the logic should have the option to expire the periodic timer and start EQ training immediately.
- Table 10.53 Power-up Sequence: Transmitter
- Name
- Event
- Signal
- Description
- EQ setup
- Request
- Training Data
- Send normal data on active lanes and
scrambled 0s on inactive lanes.
- Wait
- Internal
- Wait X µs to allow settling based on TX
setting.
- EQ training
- Set
- RX_EQ_TRAIN_EN
Start the EQ adaptation process.
- Wait
- RX_EQ_TRAIN_DONE
Wait for the EQ adaptation to finish.
- EQ cleanup
- Clear
- RX_EQ_TRAIN_EN
Stop the EQ adaptation process.
- Wait
- RX_EQ_TRAIN_DONE
Wait for EQ to stop.
- Finish
- Proceed
- Start periodic equalization timer
**Figure 10.85 Receiver Equalization (Periodic)**
- Table 10.54 Receiver Equalization
- Symbol
- Parameter
- Min
- Max
- Notes
- TEQ-TRAIN
- EQ training time

