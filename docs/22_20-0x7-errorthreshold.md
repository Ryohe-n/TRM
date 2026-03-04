# 22 :20 0x7 ErrorThreshold:

- The WDT logic asserts an error signal to HSM when ExpirationLevel >=
ErrorThreshold. 0x0 TscReferenceEnable: Select as timing reference transitions on a configured TSC bit. 0x0 ChallengeResponseEnable:
- Enable the Challenge Response mode of operation. When 1b, the
Unlock register operates as a Challenge Response register. 0x0 WindowedOperationEnable:
- Enable the windowed mode of operation. When 1b, a restart command
is rejected when the current expiration level is identified as disallowed in the WindowedRestartDisableMap or the current time is below the window threshold.
- The rejection is either silent or performs a reset based on
- RestartErrorAction
0x0 SystemPOResetEnable: Enable internal full system reset at fifth expiration of the counter.
- This reset cannot be intercepted and acts as a Power On Reset

