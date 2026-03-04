# 26 :0 (U20. 7) 0.0 Output offset for this knee point.

- VI_CHn PIXFMT_ENABLE _(paged)
- ENABLE
- Whether PIXFMT writes non-pixels for this
channel.
- COMPAND
- Whether PIXFMT enables the companding unit
for this channel.
- PDAF
- Whether PDAF separation is enabled for this
channel.
- VI_CHn PIXFMT_PDAF_CROP_X
_(paged)
- LEFT
- Within a line, pixel position at which PDAF
separation begins.
- RIGHT
- Within a line, pixel position at which PDAF
separation ends.
- VI_CHn PIXFMT_PDAF_CROP_Y
_(paged)
- TOP
Line at which PDAF separation begins.
- BOTTOM
Line at which PDAF separation ends.
- VI_CHn_PIXFMT_PDAF_LAST_PIX
- EL
X X coordinate of the last PDAF pixel. Y Y coordinate of the last PDAF pixel.
- VI_PIXFMT_PDAF_PATTERN[0…31]
NOTE: Register is global.
- ENABLE
- Pixel bitmap, by line. (PATTERN[y0][x0] is set if
the pixel (x % 32) == x0, (y % 32) == y0 should be output to the PDAF surface.)
- VI_CHn PIXFMT_PDAF_REPLACE
_(paged)
- ENABLE
- Whether to replace PDAF pixels sent to the
primary surface with an alternative value.
- VALUE
- Value to replace PDAF pixels with (in pixel bus
format).
- VI_PIXFMT_PDAF_PATTERN_REPL
- ACE [0...31]
NOTE: Register is global.
- REPLACE_ENAB
- LE
- Pixel bitmap, by line. (PATTERN_REPLACE[y0]
[x0] is set if the pixel (x % 32) == x0, (y % 32) == y0 should be replaced.)

- Video Input (VI)
- Register
- Field
- Bits
- Rese
t
- Description
- VI_CHn
- PIXFMT_PDAF_REPLACE_CROP_X
_(paged)
- LEFT
- Within a line, pixel position at which PDAF
replacement begins.
- RIGHT
- Within a line, pixel position at which PDAF
replacement ends.
- VI_CHn
- PIXFMT_PDAF_REPLACE_CROP_Y
_(paged)
- TOP
Line at which PDAF replacement begins.
- BOTTOM
Line at which PDAF replacement ends.
- Differential Pulse Code Modulation
- The Differential Pulse Code Modulation (DPCM) module implements lossless variable-bit-rate
compression. The basic scheme is a familiar differential PCM encoding wrapped in an optimal code; two pixel differences are processed at a time to reduce overhead, allowing encoding complexity reductions while maintaining a reasonable bit rate savings. The DPCM line codec supports RAW10, RAW12, RAW16, and RAW20 data. The entire DPCM datapath is shown below. The DPCM module is responsible for emitting bytes, rather than bits to ATOMP; when sufficient bits are not available for a whole number of bytes, the remainder is stored in a buffer. A VI channel with DPCM enabled, for the most part, can be treated like a VI channel without DPCM. However, compression is not fully transparent. Notably, the DPCM scheme can result in expansion for sufficiently pessimal input; so, the line stride in the atom packer must be set to account for this. With the current encoding formulation, the worst case expansion is an additional three bits per two RAW10 pixels or 15%. The line stride must then be 15% larger than it would be for fully packed RAW data.

- Video Input (VI)
**Figure 7.18 Overview of DPCM Block**
- Strip Mode Restart Points
Variable-rate compression systems that require applications to seek to particular regions within a DPCM line – for instance, an MR decoding a strip mode frame – cannot directly do so, in a crude implementation, without having previously decoded all prior pixels. To make this more efficient, VI provides "restart points" which behave like virtual line breaks. VI implements this by synthesizing an end of line after a variable number of input pixel packets, causing each restart to occur at the channel's line stride boundary. VI is not capable of synthesizing restarts within a pixel packet, since that would result in emitting two atoms for one input packet, and the pipeline must move in lock-step. As a result, restart widths must be a multiple of eight pixels.
- Deferred Atom-Count Write
- Another aspect of the DPCM system is that a reader cannot know in advance how many atoms
consist of a DPCM chunk, and hence cannot know how many atoms it needs to prefetch from the

- Video Input (VI)
memory subsystem. VI solves this by preallocating space for the count of atoms written, but deferring the actual write until the end of the chunk has been written, as described in Algorithm 3. In the strip-mode case, the reader may not need to read a full chunk, but instead may only need to read a configurable overfetch region; to support this, VI also writes out an atom count corresponding to the number of atoms that a reader would need to fetch to read both the left and right overfetch region. This is computed from the VI_DPCM_STRIP register programming.
- Algorithm 3: DPCM Data Placement
We refer to each atom as atom n, where the atom that is located at the base address for the chunk is atom 0, the atom that immediately follows that in memory is atom 1, and so on. The first data from each chunk are written into atom 1 (not atom 0), and data proceeds upwards into subsequent atoms until the final input packet for the chunk has been reached. Once the final input packet for the chunk has been concatenated into an atom, the next step depends on the number of bytes remaining in the atom. If there are at least four bytes remaining in the atom, the final four bytes take on the value {atom count counter, overfetch atom counter}, and the atom is written into atom 0. If not, the atom is written into its normal place in memory, and atom 0 is written as being empty with only the final four bytes set as previously described. The counters are formatted such that the MR unit can efficiently determine how many atoms it needs to prefetch. The counters contain the number of atoms that are not atom 0; if data for that counter is stored in atom 0, the most significant bit is additionally set. For instance, if data are stored in atoms 1, 2, 3, 4, 5, and 0, then the atom counter would be 0x8005; if only in 1, 2, 3, and 4, then the atom counter would be 0x0004.
- MODE Register Programming
Since the SoC has modes that overlap in functionality, for instance backwards-compatible RAW12 mode and new run-length-encoding RAW12 mode, the incoming data-type is insufficient to select a mode alone. Unless noted, selecting a mode that is incompatible with its native data-type is undefined behavior that shall not be validated.
- Table 7.28 DPCM Register Description
- Register
- Field
- Bits
- Reset
- Description
- VI_CHn DPCM_STRIP
_(paged)
- OVERFETCH
undef
- Number of packets in overfetch
region. Usually set to the sum of maximum left and maximum right overfetch. (0 to disable.)
- VI_CHn
- DPCM_CHUNK_FIRST
_(paged)
- PACKETS
undef
- Number of packets in first-
generated chunk (no OVERFETCH region in first chunk).
- VI_CHn
- DPCM_CHUNK_BODY
_(paged)
- PACKETS
undef
- Number of packets in "body" chunks
(including OVERFETCH region, if enabled).
- COUNT
undef Number of "body" chunks to emit.

- Video Input (VI)
- Register
- Field
- Bits
- Reset
- Description
- VI_CHn
- DPCM_CHUNK_PENULTIM
- ATE _(paged)
- PACKETS
undef
- Number of packets in chunk
immediately after "body" chunks (including OVERFETCH region, if enabled).
- VI_CHn
- DPCM_CHUNK_LAST
_(paged)
- PACKETS
undef
- Number of packets in final-
generated chunk (including OVERFETCH region, if enabled).
- VI_CHn DPCM_STATISTICS
_(paged)
- LAST_ COMPRESSED
undef
- Number of compressed bits output
in previous frame.
- TOTAL_
- COMPRESSED
undef Number of bits output total. (Register is writable.)
- VI_CHn_DPCM_MODE
- MODE

