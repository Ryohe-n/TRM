## 7.7 Audio Processing Engine (APE)
### 7.7.1 Overview
The Audio Processing Engine (APE) in the SoC can perform audio processing with minimal supervision from the main CPUs if required. It can also split audio processing tasks with the main CPUs, in which case the APE is generally used for more latency critical processes. The APE contains an Audio DSP (ADSP), an internal Audio RAM (ARAM) with a dedicated Audio Memory Controller (AMC), an Audio Hub (AHUB) equipped with multiple hardware accelerators for audio signal pre-processing and post-processing, and an Audio DMA engine (ADMA). As shown in its block diagram below, the APE comprises these major functional blocks: ADSP based on an Arm Cortex®-A9 version r4p1 processor with L1 and L2 Caches AHUB containing the audio hardware accelerators, as well as all the required audio I/O interfaces Audio Client Interface Inter-IC Sound Interfaces (I2S) Digital Microphone Interfaces Digital Speaker Interfaces Mixers Audio Multiplexers Audio De-Multiplexers Sampling Frequency Converters Audio Flow Controllers Output Processing Engines Master Volume Controllers Arbitrary Sample Rate Converters Audio Sampling Rate Detectors Audio Direct Memory Access Interfaces ADMA responsible for moving data between AHUB and DRAM/ARAM REGDEC serving as the register interface for the ADSP and CBB to access registers in AHUB or ADMA

Audio Processing Engine (APE) ACONNECT functioning as an AXI-based backbone directing requests from different Masters to the targeted Slaves in APE AMC providing the local memory controls for the local memory residing in APE AGIC providing all audio-related Interrupt controls as the name declares AMISC containing the configuration registers, decryption key slot registers, and timestamp ACAST providing address translation and the memory interface from ADSP to DRAM ADAST providing address translation and the memory interface from ADMA to DRAM AAS converting APB transactions from the CCPLEX via CBB to AXI transactions in APE AHSP consisting of synchronization registers for mailbox communications between ADSP and CCPLEX ATKE as the time keeper of the APE, and consisting of general-purpose timers and a watchdog timer Note that the SPDIF interface is not supported in the SoC, and references to controls for it below should be treated as reserved.

Audio Processing Engine (APE)
**Figure 7.61 APE Block Diagram**
#### 7.7.1.1 Standard and Compatibility
I2S (Inter-IC Sound) Interface AMBA APB Protocol AMBA AXI Protocol

Audio Processing Engine (APE)
#### 7.7.1.2 List of Reference
This chapter makes the implicit use of the following document available from Arm® based on the assumption that readers are familiar with the Arm Architecture and have access to the documents for reference. Refer to the Arm website to download the document. Arm Cortex®-A9 version r4p1 http://infocenter.arm.com/help/topic/com.arm.doc.100486_0401_10_en/ cortex_a9_mpcore_trm_100486_0401_10_en.pdf
#### 7.7.1.3 Glossary
Note that different names may end up in the same acronym when the entire TRM is put in perspective. The acronyms listed here are within the context of the Audio Processing Engine chapter. Term Definition AAS APB/AXI Shim ACAST Audio CPU AST ACIF Audio Client Interface ADAST Audio Data AST ADMA Audio Direct Memory Access ADSP Audio Digital Signal Processor ADX Audio De-Multiplexer AFC Audio Flow Controller AGIC Audio Generic Interrupt Controller AHC Audio Hub Configuration AHUB Audio Hub AHSP Audio Hardware Synchronization Primitives AMC Audio Memory Controller AMISC Audio Miscellaneous AMX Audio Multiplexer ARAD Audio Sampling Rate Detector ASRC Arbitrary Sample Rate Converter AST Address Space Translation

### OCR (Page 5575) ~~~text Technical Reference Manual
Audio Processing Engine (APE)
7.7.1.2 List of Reference
This chapter makes the implicit use of the following document available from Arm’ baSed on the
assumption that readers are familiar with the Arm Architecture and have access to. the documents
for reference. Refer to the Arm website to download the document.
* Arm Cortex -A9 version r4p]
http://infocenter.arm.com/help/topic/com.arm.doc. 100486_0401_10.én/
cortex_a9_mpcore_trm_100486_0401_10_en.pdf
7.7.1.3 Glossary
Note that different names may end up in the same acronym when-the entire TRM is put in
perspective. The acronyms listed here are within the context.of.the Audio Processing Engine
chapter.
Term Definition
AAS APB/AXI Shim
ACAST Audio CPU AST
ACIF Audio Client Interface
ADAST Audio Data AST
ADMA Audio Direct Memory Access
ADSP Audio Digital Signal Processor
ADX Audio De-Multiplexer
AFC Audio Flow Controller
AGIC Audio.Generic Interrupt Controller
AHC Audio Hub Configuration
AHUB Audio Hub
AHSP Audio Hardware Synchronization Primitives
AMC Audio Memory Controller
AMISC Audio Miscellaneous
AMX Audio Multiplexer
ARAD Audio Sampling Rate Detector
ASRC Arbitrary Sample Rate Converter
AST Address Space Translation ~~~

Audio Processing Engine (APE) Term Definition ATKE Audio Time Keeping Element AXBAR Audio Crossbar CIF Client Interface CTI Cross Trigger Interface DMIC Digital Microphone DSM Delta Sigma Modulation/Modulator I2S Inter-IC Sound Controller LIC Legacy Interrupt Controller MBDRC Multiband Dynamic Range Compression Mixer Device for merging input audio signals to produce a combined audio output MVC Master Volume Control OPE Output Processing Engine PCM Pulse Code Modulation/Modulator PDM Pulse Density Modulation/Modulator PEQ Parametric Equalizer SFC Sampling Frequency Converter SPI Shared Peripheral Interrupts TSC Timestamp System Counter
#### 7.7.1.4 Relevant Chapters in the TRM
Address Map Control BackBone (CBB) Clock Controller and Reset (CAR) CPU Complex (CCPLEX) Hardware Synchronization Primitives High Definition Audio (HDA) Interrupt Controllers Introduction Memory SubSystem (MSS) Multi-Purpose I/O Pins and Pin Multiplexing (PinMux) Timers

Audio Processing Engine (APE)
#### 7.7.1.5 Features
The following is highlight of the APE features. Arbitrary Sample Rate Conversion Audio Flow Control Audio RAM (96 KiB) by Audio Direct Memory Access Audio Multiplexer Audio De-Multiplexer Mixer Audio Output Processing Sampling Frequency Conversion Master Volume Control Digital Speaker (x 2) Digital MIC (x 4) Inter-IC Sound (I2S) Interface (x 6) Advanced Peripheral Bus (APB) for fast and directed Control/Data flow in APE and the SoC Advanced eXensible Interface (AXI) for fast and directed Control/Data flow in APE and the SoC Interrupts to CCPLEX (via IRQ and FIQ) Debug Port using CoreSight™ interface to ADSP Multiple Clock domains MC_CLK APE_CLK ADSP_CLK AHUB_CLK Multiple Resets APE_reset ADSP_reset Memory Controller Interface Interface for MMIO Requests TSC interface
### 7.7.2 Functional Descriptions
The functional descriptions of the APE are detailed in the following sections based on the functional blocks.

Audio Processing Engine (APE)
#### 7.7.2.1 Audio Digital Signal Processor
The Audio Digital Signal Processor (ADSP) is an Arm Cortex®-A9 version r4p1 processor, configured with an L1 I-Cache and an L1 D-Cache each of 32 KiB, and a 128 KiB L2 I/D shared Cache, plus the Arm NEON Advanced SIMD extensions. Its main functions are: Algorithm-based Audio Processing Audio Decoding and Encoding, e.g., MP3 Managing and Scheduling the programming of registers in Hardware Accelerators Managing Interrupts originated from Hardware Accelerators with Low Latency
#### 7.7.2.2 Audio Hub
The Audio Hub (AHUB) comprises a collection of hardware accelerators for audio pre-processing and post-processing and a programmable full crossbar for routing audio data across these accelerators in time and in parallel. The main purpose of AHUB is to off load most repetitive tasks that do not require central decisions from the ADSP. The AHUB also supports multiple interfaces to different audio devices in the host system, e.g., cellular baseband, audio codecs, Bluetooth modules, A/V receivers, etc. The AHUB provides six Inter-IC Sound (I2S) Interfaces together with two Digital Speakers (DSPK) and four Digital Microphone (DMIC) interfaces. Audio signals routed to the HDMI interface are not going through APE, however, but delivered by the HDA interface. Refer to the High Definition Audio (HDA) chapter in this TRM for more details. Besides supporting the multiple interfaces, the AHUB is also capable of handling all necessary protocols and signal quality requirements of these audio devices. The AHUB consists of the following key modules as depicted in the diagram below. Inter-IC Sound Controller (I2S) Digital MIC Controller (DMIC) Mixer Audio Multiplexer (AMX) Audio De-Multiplexer (ADX) Sampling Frequency Converter (SFC) Audio Flow Controller (AFC) Output Processing Engine (OPE) Master Volume Control (MVC) Audio Direct Memory Access Interface (ADMA I/F) Audio Radio Detection (ARAD) Arbitrary Sample Rate Conversion (ASRC)

Audio Processing Engine (APE)
**Figure 7.62 AHUB Block Diagram**
The proprietary interface Audio Client Interface (ACIF) is employed to route audio samples through these accelerators and hence forms the fabric of AHUB. A switch called Audio Crossbar (AXBAR) is used to configure/modify the audio routing path between these accelerators. The accelerator modules and the audio routing are both configured via an AHUB Configuration (AHC) unit.
##### 7.7.2.2.1 Audio Client Interface
Audio streams are routed through the AHUB by interconnecting various modules using the ACIF. In the register programming, a receive ACIF is referred to as RxCIF, and a transmit ACIF is referred to as TxCIF.

Audio Processing Engine (APE) ACIF Protocol Before a session starts, both Tx and Rx clients should know the frame length by their register configurations. The frame length is determined by the number of bits in each sample and the number of channels that the audio data carries. In the case of stereo audio data with 16 bit, a frame is 32 bits long. Whenever Tx has data available to transmit to the Rx, it raises the FSYNC signal. Simultaneously the first bit of the data is put out on the data bus. The Tx should hold this FSYNC active for at least one clock but until the Rx client is ready. Similarly, it should also hold the data bus to the first bit of the frame until the Rx client is ready. When the Rx asserts ready, the Tx should lower the FSYNC at the end of that clock cycle. From the next clock cycle, Tx should transmit the rest of the frame (from the second bit onwards), one bit for each bit clock. The figure below shows the transmission ordering of two-channel 8-bit audio data. Note that the bit ordering is each channel is big-endian.
**Figure 7.63 Bit Ordering**
Frame Length The frame length is a product of the bit width and the number of channels in an audio stream. The register fields of the Tx and Rx clients should be programmed accordingly before the transmission starts to avoid incorrect frame parsing. Clocking Since all sessions are AHUB run under an AHUB clock, the clock should be fast enough to transmit audio stream data in all sessions. If a session is used for sending 8 kHz, stereo 16-bit audio stream, the AHUB clock should be at least 256 kHz. While a faster clock is better for data transmission, it is not necessarily good for power consumption. For the typical audio application like MP3 music playing, using the clock directly from the crystal without going through PLLs is recommended. Depending on the applications, users can program the clock registers to satisfy the requirement of clock frequency. The following table shows the various minimum clock frequencies for AHUB. Table 7.107 AHUB Clock Frequencies This table shows the minimum clock frequencies required for various operating modes. Higher frequencies may also be used. Clock Frequency Description 64 kHz Slowest clock to carry 8-bit mono voice data in 8 kHz sampling

Audio Processing Engine (APE) Clock Frequency Description
## 1.4112 MHz
Clock to carry 16-bit stereo audio data in 44.1 kHz sampling
## 1.536 MHz
Clock to carry 16-bit stereo audio data in 48 kHz sampling
## 4.608 MHz
Clock to carry 24-bit stereo audio data in 96 kHz sampling or 16-bit six-channel audio data in 48 kHz sampling 12 MHz Minimum crystal frequency
## 18.432 MHz
Clock to carry 24-bit eight-channel audio data in 96 kHz sampling
## 36.864 MHz
Clock to carry 24-bit eight-channel audio data in 192 kHz sampling (HDMI maximum) While AHUB runs under one clock, AHUB_CLK, its clients have their own clocks. AHUBCIF is the clock boundary in the clients. The following figure shows the clocking scheme around AHUB.
**Figure 7.64 Clock Domains**
Packing/Unpacking Data This feature is available only for the ADMA Interface. 32-bit packets coming from ADMA can be unpacked to 8- or 16-bit words before being transmitted to the AXBAR. The reverse path has the capability of packing 8- or 16-bit words in 32-bit packets. The caveat is that the packing can only be done for incoming words of 8- or 16-bits, but not 24 bits, as a single 24-bit word cannot be placed (packed) in two different packets. So AXBAR_BITS in both cases can only be for 8- or 16-bits.

Audio Processing Engine (APE)
##### 7.7.2.2.2 I2S Controller
The Inter-IC Sound (I2S) controller implements full-duplex and bidirectional and single direction point-to-point serial interfaces. It can interface with I2S-compatible devices. I2S Interaction with External Device The I2S controller can operate both as master and slave. It supports the following data transfer modes: I2S mode Left Justified Mode (LJM) Right Justified Mode (RJM) DSP mode, as defined in the Philips inter-IC-sound (I2S) bus specification PCM mode with short (one-bit-clock wide) and long-FSYNC (two bit-clocks wide) Network (Telephony) mode with independent slot selection for both Tx and Rx TDM mode with flexibility in number of slots with up to 16 slots. Capability to drive-out a High-Z outside the prescribed slot for transmission The I2S controller can transmit and receive word lengths of 8, 16, 24, and 32. It supports u-Law and A-Law compression/decompression. The I2S controller can control the flow of traffic from another I2S controller operating on an independent bit clock (with a ppm difference compared with its own bit clock). Transmission/Reception Data Formats LRCK Modes This subsection illustrates three LRCK modes: Basic I2S mode, Right Justified mode, and Left Justified mode. Basic I2S Mode: In Basic I2S mode, data starts one SCLK after the LRCK edge (Offset = 1).

Audio Processing Engine (APE)
**Figure 7.65 Basic I2S Mode Illustrated**
Right Justified (RJ) Mode: In RJ mode, data starts (r/2 – n) SCLKs after the LRCK edge (Offset = r/2 – n, where r = number of SCLKs per LRCK, n = number of bits/sample).
**Figure 7.66 RJ Mode Illustrated**
Left Justified (LJ) Mode: In LJ mode, data starts 0 SCLKs after the LRCK edge (Offset = 0).
**Figure 7.67 LJ Mode Illustrated**
FSYNC Modes

Audio Processing Engine (APE) The width of the FSYNC, the Offset value, number of slots and number of SCLKs per 1/Fs are all configurable. The slots are always contiguous.
**Figure 7.68 FSYNC Mode Illustrated**
The width of the FSYNC, the Offset value, number of slots (n), and number of SCLKs per 1/Fs are configurable. But the slots are always be contiguous. Besides these, there is also the concept of "Slot Enables" which is used to specify which slots within one FSYNC actually contain data. The table below shows register fields corresponding to the parameters mentioned above. Table 7.108 FSYNC Register Fields and Their Corresponding Parameters Parameter Name Register Field Name FSYNC width I2S_CTRL_0_FSYNC_WIDTH Offset I2S_AXBAR_RX_CTRL_0_DATA_OFFSET I2S_AXBAR_TX_CTRL_0_DATA_OFFSET Number of slots I2S_SLOT_CTRL_0_TOTAL_SLOTS Number of sclks per 1/Fs I2S_TIMING_CHANNEL_0_BIT_CNT Slot Enables I2S_AXBAR_RX_SLOT_CTRL_0_SLOT_ENABLES The following set of diagrams shows the timing relationship between FSYNC, SCLK, and DATA lines for some sample parameter value sets.

Audio Processing Engine (APE)
**Figure 7.69 Relationship between SCLK, FSYNC, and DATA for Different FSYNC Widths and**
Offset Values Sometimes CODEC/MODEM manufacturers specify a unique set of values for these parameters and refer to it using proprietary names like PCM mode, NW mode, etc. The following diagram shows the relationship between SCLK, FSYNC, and DATA lines for these modes that the audio hardware team has encountered in the past. These names are proprietary and are not standardized. So it is possible that two CODEC manufacturers have DSP mode, but they each specify completely different set of values for the FSYNC mode parameters. Hence, these following diagrams need to be taken as examples that can help you understand what set of parameter values result in what kind of timing diagrams, that is instead of literally taken as the set of parameter values/timing diagrams for the various mode names listed for them. Always refer to the CODEC/MODEM/external chip datasheet to find out what kind of relationship is expected between SCLK, FSYNC, and DATA lines in the I2S and accordingly use the following examples as a knowledge base and figure out the correct parameter configuration.

Audio Processing Engine (APE)
**Figure 7.70 Proprietary FSYNC Modes – TDM Mode**

Audio Processing Engine (APE)
**Figure 7.71 Proprietary FSYNC Modes – NW Mode**
**Figure 7.72 Proprietary FSYNC Modes – DSP Mode**

Audio Processing Engine (APE)
**Figure 7.73 Proprietary FSYNC Modes – PCM Mode**
##### 7.7.2.2.3 Digital MIC Controller
The Digital MIC (DMIC) Controller is used to interface with Pulse Density Modulation (PDM) input devices. The DMIC controller implements a converter to convert PDM signals to PCM (Pulse Code Modulation) signals. From the signal flow perspective, the DMIC can be viewed as a PDM receiver. DMIC Features Sample rate support: 8 to 48 kHz Input PCM bit width: 16 to 24 bits Oversampling Ratio: 64, 128, 256 24-bit fixed output bit width
##### 7.7.2.2.4 Mixer
The Mixer supports mixing up to ten 7.1 channel audio input streams and five outputs (each of which can be a mix of any combination of the 10 input streams). Examples include mixing system tones with voice calls, mixing two audio playbacks to create a transition effect, mixing system announcements with audio playback. Mixer Features Support of mixing up to 10 input streams of 7.1 channel audio each Support of five outputs each of which can be a mix of any combination of 10 input streams Time ramp-up/ramp-down volume control provided for each stream

Audio Processing Engine (APE) Fixed gain for each stream is also available A 32-bit sample counter is provided for each input stream to count the number of samples consumed A peak meter for each input stream is available. It can give peak values for non-overlapping frames of samples or can do continuous reset-on-read peak metering
##### 7.7.2.2.5 Audio Multiplexer Block
The Audio Multiplexer (AMX) block can multiplex up to four input streams of up to 16 channels each and generate an output stream of up to 16 channels A byte RAM helps to form an output frame by any combination of bytes from the four input frames Two modes for data synchronization between input frames are available. This feature only starts the data transfer. Once data transfer starts (if at least one frame is sent out), the AMX works in “Wait for all mode” (if auto disable mode is NOT enabled) Waiting for All mode: At the beginning, wait for all enabled input streams to have data before forming the very first frame. Waiting for Any mode Start whenever data is available in any one of the enabled input streams. In either mode, once the first output frame is sent out, AMX always waits for all active streams to have data available before forming and sending subsequent frames. The AMX supports the Auto disable and Auto enable feature of IDLE streams.
##### 7.7.2.2.6 Audio Demultiplexer Block
The Audio Demultiplexer (ADX) block takes an input stream with up to 16 channels and demultiplexes it into four output streams of up to 16 channels each. A byte RAM helps to form output frames by any combination of bytes from the input frame. Its design is identical to that of the byte RAM in the AMX except that the data flow direction is reversed. The ADX provides an automatic stream activation/deactivation mechanism.
##### 7.7.2.2.7 Sampling Frequency Converter
The Sampling Frequency Converter (SFC) converts the sampling frequency of the input signal from one frequency to another. The SFC is an AXBAR client and hence interacts with other AHUB modules using the Audio Client Interface (ACIF) protocol.

Audio Processing Engine (APE) SFC Features Support of sampling frequency conversion of streams of up to two channels (stereo) Very low latency with the maximum latency of < 125 µs Support of the following frequency conversions Table 7.109 Supported Frequency Conversions (in kHz) FsIn/ FsOut 11.02 22.05 44.1 88.2 176.4 Bypass x x x x x x x x x 11.025 x Bypass x x x x x x x x x x Bypass x x x x x x x x x 22.05 x x x Bypass x x x x x x x x x x x x Bypass x x x x x x x x x x x x Bypass x x x x x x 44.1 x x x x x x Bypass x x x x x x x x x x x x Bypass x x x x 88.2 x x x x x x x x Bypass x x x x x x x x x x x x Bypass x x 176.4 x x x x x x x x Bypass x x x x x x x x x x Bypass
##### 7.7.2.2.8 Audio Flow Controller
The Audio Flow Controller (AFC) can control the flow of traffic between two I2S interfaces running at different clocks that are up to 100 ppm apart. The AFC implements high fidelity interpolation and decimation algorithms that compensate for clock differences. It can control traffic flow anywhere in the audio route, even to the inputs of AMX blocks. The AFC can handle burst traffic from SFCs.
##### 7.7.2.2.9 Output Processing Engine
The Output Processing Engine (OPE) has scalable number of BiQuad stages to support stereo, 5p1, and 7p1 channels meeting Ultra-Low Power (ULP) audio requirements.

Audio Processing Engine (APE)
##### 7.7.2.2.10 Master Volume Control
The Master Volume Control (MVC) provides gain or attenuation to a digital signal path. It can be used in input or output digital signal path for per-stream volume control as well as master volume control. The MVC block has one input and one output. The input digital stream can be mono- or multi- channel (up to 7.1 channels) stream. The output digital stream has the same format as the input stream. Therefore, the sample rate, number of channels, number of bits per sample in the output stream are the same as those in the input stream. An independent mute/unmute control is also included in the MVC block. In addition, whenever the gain or mute setting is changed, the gain applied in digital volume control block is ramped up or down to the new setting. The parameters of the ramp, such as the duration and ramp-curve are programmable. In addition to linear ramp this design also provides hardware acceleration for the Windows audio curve type fade. The windows audio curve type fade is typically implemented using a programmable processor. The MVC block also has a built-in peak meter detector. Peak meter detector is used as a feedback to the user. It is located after volume application and provides the peak output data for each channel. The duration used for the peak meter calculation is programmable. MVC Features Programmable range and steps for volume control Programmable Curve Ramp for volume control Independent mute/unmute controls Default gain values Peak meter detector
##### 7.7.2.2.11 Digital Speaker Controller
The Digital Speaker Controller (DSPK) converts the multi-bit Pulse Code Modulation (PCM) audio input to oversampled 1-bit Pulse Density Modulation (PDM) output. From the signal flow perspective, the DSPK can be viewed as a PDM transmitter that up-samples the input to the desired sampling rate by interpolation then converts the oversampled PCM input to the desired 1- bit output via Delta Sigma Modulation (DSM). DSPK Features Sample rate support: 8 to 48 kHz Input PCM bit-width: 16 to 24 bits Oversampling Ratio: 32, 64, 128, 256 Passband frequency response: <= 0.5 dB peak-to-peak in 10 Hz to 20 kHz range THD+N: <= -80 dB @ -10 dBFS Dynamic Range: >= 105 dB

Audio Processing Engine (APE)
##### 7.7.2.2.12 Arbitrary Sample Rate Converter
Audio systems may require high fidelity sample rate conversion because of the plurality of the audio sources. The sample rate may not be known at the stream set-up time, or is potentially time varying. In addition, ratio between input and output sample rate can be any arbitrary number and the input and output clocks could be derived from asynchronous clocks. For this, an Arbitrary Asynchronous Sample Rate Converter (HQ-AASRC) is required. AASRC consists of two parts. First part is the High Quality Arbitrary Sample Rate Converter (HQ-ASRC) or ASRC module. Arbitrary Sample Rate Converter (ASRC) can convert the input samples at input sample rate (fs_in) to output samples at output sample rate (fs_out). This design can handle over a wide-range of sampling-rate ratios from 1:24 to 24:1. Second part is the Ratio-Estimator module. This block estimates the ratio fs_in/fs_out. Ratio-Estimator can be implemented in hardware using the clocks to derive the sampling rate ratios or it can be implemented in software using the input and output buffer fullness.
##### 7.7.2.2.13 ASRC Features
Support of input sample rates in the range 8 to 192 kHz Support of output sample rates in the range 8 to 192 kHz Support of any sampling ratio from 1:24 to 24:1 Provision of THD+N (0 dBFS @1 kHz, 24-bit samples), i.e., 140 dB or better
