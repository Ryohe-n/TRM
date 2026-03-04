# 24 -bit fixed output bit width

##### 7.7.2.2.4 Mixer
The Mixer supports mixing up to ten 7.1 channel audio input streams and five outputs (each of which can be a mix of any combination of the 10 input streams). Examples include mixing system tones with voice calls, mixing two audio playbacks to create a transition effect, mixing system announcements with audio playback.
- Mixer Features
- Support of mixing up to 10 input streams of 7.1 channel audio each
- Support of five outputs each of which can be a mix of any combination of 10 input streams
- Time ramp-up/ramp-down volume control provided for each stream

- Audio Processing Engine (APE)
- Fixed gain for each stream is also available
A 32-bit sample counter is provided for each input stream to count the number of samples consumed A peak meter for each input stream is available. It can give peak values for non-overlapping frames of samples or can do continuous reset-on-read peak metering
##### 7.7.2.2.5 Audio Multiplexer Block
The Audio Multiplexer (AMX) block can multiplex up to four input streams of up to 16 channels each and generate an output stream of up to 16 channels A byte RAM helps to form an output frame by any combination of bytes from the four input frames Two modes for data synchronization between input frames are available. This feature only starts the data transfer. Once data transfer starts (if at least one frame is sent out), the AMX works in “Wait for all mode” (if auto disable mode is NOT enabled) Waiting for All mode: At the beginning, wait for all enabled input streams to have data before forming the very first frame.
- Waiting for Any mode
Start whenever data is available in any one of the enabled input streams. In either mode, once the first output frame is sent out, AMX always waits for all active streams to have data available before forming and sending subsequent frames. The AMX supports the Auto disable and Auto enable feature of IDLE streams.
##### 7.7.2.2.6 Audio Demultiplexer Block
- The Audio Demultiplexer (ADX) block takes an input stream with up to 16 channels and
demultiplexes it into four output streams of up to 16 channels each. A byte RAM helps to form output frames by any combination of bytes from the input frame. Its design is identical to that of the byte RAM in the AMX except that the data flow direction is reversed. The ADX provides an automatic stream activation/deactivation mechanism.
##### 7.7.2.2.7 Sampling Frequency Converter
The Sampling Frequency Converter (SFC) converts the sampling frequency of the input signal from one frequency to another. The SFC is an AXBAR client and hence interacts with other AHUB modules using the Audio Client Interface (ACIF) protocol.

- Audio Processing Engine (APE)
- SFC Features
- Support of sampling frequency conversion of streams of up to two channels (stereo)
- Very low latency with the maximum latency of < 125 µs
- Support of the following frequency conversions
- Table 7.109 Supported Frequency Conversions (in kHz)
- FsIn/
- FsOut

