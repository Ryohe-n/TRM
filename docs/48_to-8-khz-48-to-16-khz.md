# 48 to 8 kHz 48 to 16 kHz

#### 7.7.3.16 AFC Programming Guidelines
Ensure that the AFC is in a disabled state (after being used in a previous use case): Check if (AFC_STATUS_ENABLE_STATUS == 0). Configure the AFC: 1. 2.
- Configure the receive and transmit ACIF parameters (see "ACIF Programming Guidelines"
for more details) Populate AFC_XBAR_RX_CIF_CTRL and AFC_XBAR_TX_CIF_CTRL registers.
- Configure the maximum expected PPM difference between the two clock sources that AFC
is used to control the flow between Configure the AFC_CLK_PPM_DIff register. a. b.
- Configure the I2S FIFO thresholds and AFC TxCIF thresholds that are used by the AFC logic
Configure the AFC_CLK_PPM_DIff register*. c. Enable the AFC module: Set (AFC_ENABLE = 1). Ensure the module initialization is complete before sending data to AFC: Ensure (AFC_STATUS_ENABLE_STATUS == 1). After using the module, disable the module: Set (AFC_ENABLE = 0). 3. 4. 5.

- Audio Processing Engine (APE)
The following table shows the guidelines to follow for setting the threshold values under various conditions. In the table below, the numbers in parentheses are example values.
- Table 7.114 Threshold Settings
- AFC_THRESHOLDS_I2S_0
- AFC_THRESHOLDS_AFC_0
- Destination I2S
- FIFO Threshold
(Programmed in
- I2S_AUDIOCIF_I2
SRX_CTRL_0.
- FIFO_THRESHOL
D)
- Use
- Cas
e
- HIGH_THRE
- SHOLD
- START_TH
- RESHOLD
- LOW_THRE
- SHOLD
- HIGH_THRE
- SHOLD
- START_TH
- RESHOLD
- LOW_THRE
- SHOLD
- Actu
al (Typ .)
- Valu
e
- I2S
→
- AFC
→
- I2S
(START_THR
- ESHOLD + 1)
(8)
- START_THRE
- SHOLD
(7) (START_THR
- ESHOLD – 1)
(6) (START_THRE
- SHOLD + 1)
(8)
- START_THRE
- SHOLD
(7) (START_THR
- ESHOLD – 1)
(6) (START_THRESHOL D + 1)
- AFC_THRESHOLDS
_I2S_0 (8)
- I2S
→
- SFC
→
- AFC
→
- I2S
(2 * SRC-
- BURST + 1)
(1 * SRC-
- BURST + 2)
(1 * SRC-
- BURST)
(1 * SRC-
- BURST + 1)
(1 * SRC-
- BURST + 1)
(1 * SRC-
- BURST + 1)
(START_THRESHOL D + 1)
- AFC_THRESHOLDS
_I2S_0
- I2S
→
- AFC
→
- AMX
→
- I2S
(START_THR
- ESHOLD + 1)
(8)
- START_THRE
- SHOLD
(7) (START_THR
- ESHOLD – 1)
(6) (START_THRE
- SHOLD + 1)
(8)
- START_THRE
- SHOLD
(7) (START_THR
- ESHOLD – 1)
(6) (START_THRESHOL D + 1)
- AFC_THRESHOLDS
_I2S_0 (8)
- I2S
→
- SFC
→
- AFC
→
- AMX
→
- I2S
(2 * SRC-
- BURST +1)
(1 * SRC-
- BURST + 2)
(1 * SRC-
- BURST)
(2 * SRC-
- BURST + 4)
(1 * SRC-
- BURST + 4)
(4) (START_THRESHOL D + 1)
- AFC_THRESHOLDS
_I2S_0
#### 7.7.3.17 OPE Programming Guidelines
- Ensure that OPE is in a disabled state (after being used in a previous use case)
Check if (OPE_STATUS.ENABLE_STATUS == 0). Configure OPE: 1. 2.

- Audio Processing Engine (APE)
a.
- Configure the receive and transmit ACIF parameters (see "ACIF Programming Guidelines"
for more details) Populate OPE_XBAR_RX_CIF_CTRL and OPE_XBAR_TX_CIF_CTRL registers.
- Configure MBDRC and PEQ
b. 3. Enable OPE module: Set (OPE_ENABLE = 1). Ensure the module initialization is complete before sending data to MBDRC: Ensure (OPE_STATUS.ENABLE_STATUS == 1). After using the module, disable the module: Set (OPE_ENABLE = 0). 4. 5. If an output device is changing, or the coefficients and other settings need to be changed: 1. 2. Disable OPE.
- Wait for (OPE_STATUS_ENABLE_STATUS == 0) for datapath flushed out, or OPE_SOFT_RESET
if immediate disable is needed. Reprogram all coefficients and configuration registers as required. Trigger OPE_SOFT_RESET. Enable OPE as before. 3. 4. 5. Note: Coefficient Data programmed takes care of the signs, i.e., hardware will always do add, so to implement a BiQuad operation: b0 * x[n] + b1 * x[n-1] + b2 * x[n-2] + (-a1) * y[n-1] + (-a2) * y[n-2]. Software needs to provide b0, b1, b2, -a1, -a2 as the coefficients.
#### 7.7.3.18 MVC Programming Guidelines
1. Ensure that the MVC is in a disabled state (after being used in a previous use case): Check if (MVC_STATUS == 0). Configure the MVC: 2. a.
- Configure the receive and transmit ACIF parameters (see "ACIF Programming Guidelines"
for more details). Program MVC_CONFIG registers.
- Program all Volume related settings (Target Volume, Duration, Polynomial Coefficients in
Polynomial mode). b. c. 3. Enable MVC module: Set (MVC_ENABLE = 1).
- Ensure the module initialization is complete before sending data to MVC: Ensure
MVC_STATUS is 1. After using the module, disable the module: Set (MVC_ENABLE = 0). 4. 5.

- Audio Processing Engine (APE)
If software wants to change polynomial coefficients, duration parameters, or volume parameters (target volume and mute_unmute) on the fly while MVC is in enable state: 1. 2. Check the status of switching: COEFF_SWITCH, DURATION_SWITCH and VOLUME_SWITCH.
- Program new parameters (For coefficient switching, hardware handles whether that goes to
Ping or Pong).
- Set COEFF_SWICTH/DURATION_SWITCH/VOLUME_SWITCH to let hardware know new
parameters are ready. 3.
**Figure 7.78 Programming Timeline for Updated Software Configuration**
- Note: If software wants to program polynomial coefficients, duration parameters and volume
parameters at the same time, then software should first program all the required fields for polynomial coefficients, duration parameters, and volume parameters, then set COEFF_SWITCH, DURATION_SWITCH, and VOLUME SWITCH together (they all belong to the same register). If an output device is changing, or the settings need to be changed: 1. 2. 3. 4. Disable the MVC. Reprogram all registers. Trigger Soft Resets for MVC and CIFs. Enable – in same order above. If the software is changing parameters while MVC is in disable state, following points should be kept in consideration: 1.
- If software wants to retain history between disable and enable stages, then when software
disables the MVC, it should also set the INIT_VOL register to the last set Volume value by software. Examples: a.
- If software sets the volume to T1 and then disables the module, INIT_VOL should be set to
T1.
- If software sets the volume to T1, then press Mute button and then disables the module,
INIT_VOL should be set to T1.
- If software sets the volume to T1 and then disables the module, INIT_VOL should be set to
- T1. Now if during the disable stage, if software changes the volume to T2, INIT_VOL should
b. c.

- Audio Processing Engine (APE)
be set to T2 Exception: The only exception to the above case is if the last set volume was 0. If the last set volume was 0, then the INIT_VOL register should be set to the INIT_VOL during boot-up. 2.
- If software unmutes a channel while in the disabled stage, it needs to update the
TARGET_VOL register to the last set volume value by software.
#### 7.7.3.19 DSPK Programming Guidelines
- DSPK Controller Programming
1. Ensure that DSPK is in disabled state (after being used in previous use case). Check if (DSPK_STATUS.RX_ENABLED == 0). Apply soft-reset to DSPK to flush out all the FIFOs. (DSPK_SOFT_RESET.SOFT_RESET = 1). Program CIF CTRL register. Configure DSPK_RX_CIF_CTRL register. Only mono and stereo channels are supported. Program DSPK_CORE CTRL register.
- Configure STAGE1_GAIN, STAGE2_GAIN, STAGE3_GAIN, LOWDELAY_FILTER_MODE,
CHANNEL_SELECT, OSR and LRSEL_POLARITY bits. Program SDM COEF registers.
- Based on the value of OSR, program these registers appropriately. Specific values are
mentioned in next column. Enable the Module. Program (DSPK_ENABLE = 1). Disable the Module. After using, disable dspk. (DSPK_ENABLE = 0). Wait for module to get disabled. Poll for (RX_DONE == 1); wait until it is asserted. 2. 3. 4. 5. 6. 7. 8.
- CODEC Programming
1. Program DSPK_CODEC_CTRL register. Configure CHANNEL_SELECT for either mono/stereo channels. Configure BIT_ORDER to specify LSB/MSB bit to be sent first. Configure (CODEC_CONFIG_MODE = 1). Configure CNFG_REP_NUM for repetition number. Program DSPK_CODEC_DATA register. Configure CH1_CONTROL_WORD and CH0_CONTROL_WORD. Enable dspk module. Program (DSPK_ENABLE = 1). Enable CODEC_ENABLE bit. Program (CONFIG_START = 1). Wait until codec programming is done. Poll for CONFIG_DONE bit. 2. 3. 4. 5.

- Audio Processing Engine (APE)
6. Disable CODEC_CONFIG mode.
- DSM Coefficients Programming for Different OSR's
- Table 7.115 DSM Coefficients for Different OSR's
- DSMCOEFS_5_256
- DSMCOEFS_5_128
- DSMCOEFS_5_64
- DSMCOEFS_5_32
a = [a2,a3,a4,a5] [5208,7652,11087,158 85] [5268,7819,11157,170 72] [5051,7359,10711,142 10] [4935,7489,10794,164 29] c= [c1,c2,c3,c4] [168,6622,11092,1839 2] [171,6675,10927,1961 8] [166,6489,11167,1692 0] [175,6494,11136,1901 5] g = [g1,g2] [7,7] [28,27] [116,125] [462,446]
#### 7.7.3.20 ASRC Programming Guidelines
For enabling a stream, Global and Stream specific registers need to be configured as mentioned below. Global registers are to be configured only once after a "hard reset" and not required for every time a new stream is enabled or disabled.
##### 7.7.3.20.1 Configure ASRC's Global Registers
- Configure Intermediate buffer location using ASRC_GLOBAL_SCRATCH_ADDR register
Address needs to be aligned to at least 64 bits. Size of the Buffer required is calculated using 12288 + 1792 * NUM_CHANNELS. For all 12 channels, Size = 12288 + 1792 * 12 = 33792 Bytes.
- Set ASRC_GLOBAL_ENB to "1"
Check if (ASRC_GLOBAL_STATUS.GLOBAL_ENABLED == 1).
##### 7.7.3.20.2 Configure ASRC's Stream Specific Registers
- Ensure that particular stream is in not active by checking
(STREAM<i>_STATUS.ENABLE_STATUS == 0).
- Configure STREAM<i>_CONFIG.RATIO_TYPE based on whether stream receives on-the-fly
ratio updates from software or from ARAD hardware module.
- Configure Input and Output CIF using STREAM<i>_RX_CIF_CTRL and
STREAM<i>_TX_CIF_CTRL registers. AXBAR_CHANNELS and AXBAR_BITS fields need to be configured for the receive ACIF. AXBAR_BITS field needs to be configured for the transmit ACIF. Enable the stream using STREAM<i>_ENB register. Ensure (STREAM<i>_STATUS.ENABLE_STATUS == 1). After the processing is done, disable the stream using STREAM<i>_ENB register. Ensure (STREAM<i>_STATUS_ENABLE_STATUS == 0).

- Audio Processing Engine (APE)
Note: i = 1, 2, 3, 4, 5, or 6 for the stream number.
##### 7.7.3.20.3 ASRC Ratio
- For doing the conversion, ASRC expects a scalar value which is the ratio of Input Sampling
Frequency (Fs_in) to Output Sampling Frequency (Fs_out) expressed in Q32 format. Thus:
- Ratio = Fs_in / Fs_out
Example:
- If Fs_in = 48 kHz, Fs_out = 44.1 kHz
- Ratio = 48000 ÷ 44100 = 1.0884353741496598639455782312925
- Integer portion of the ratio is, RATIO_INT = "1"
Fractional portion of the ratio is, Frac_real = "0.0884353741496598639455782312925". In Q32 format, Fractional portion, RATIO_FRAC = Round (Frac_real * 232) = 379827040 rounds the result to nearest integer. Note: there is a precision loss while forming the ratio value itself. Some more examples are listed in the table below.
- Table 7.116 ASRC Ratio Examples
- Fsin (in kHz)
- Fsout (in kHz)
- Ratio (in real)
- RATIO_INT
- RATIO_FRAC

