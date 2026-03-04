# 20 GB/s

- Heads
- Windows
- 1 GB = 1000 * 1000 * 1000 bytes
- Minimum hblank
Pixel processing within the Display pipeline can introduce bubbles between each line of pixels. The output protocol may incur additional overhead on top of the pixel stream. Hblank of the raster must absorb the overhead bubbles and encoding.
- Table 7.99 Minimum Hblank Requirement
- Unit
- Worst-case per-line gap
- Reason
- ISO Hub
- Packed: 6
- Planar/Semi-planar: 16
- Unused data at the beginning and end of a line needs
to be dropped.
- Planar Format: Worst case: 16 disp-clks
- SP Format: Worst case: 16 disp-clks
- Packed Format: Worst case: 6 disp-clks
- Precomp
- RGB: 34
- YUV: 40
- YUV chroma up-conversion: 2 cycles
- PXCTL state machines in PXGEN: 8 cycles
- Horizontal Scaler: 11 cycles
- Vertical Scaler: 15 cycles
- Extra pixels from YUVCrop: 4
- Comp
Cursor inserts a 6-cycle bubble.

- Display Controller
- Unit
- Worst-case per-line gap
- Reason
- Post-comp
- Horizontal Chroma Low-Pass filter: 8
- RG
- RG requires at least 3 pixels of hblank for HFP, HSYNC,
and HBP, but it does not introduce any bubbles of its own.
- SF/SOR
- DisplayPort min hblank can be up to 52 for single-head
DSC.
- HDMI min hblank, no audio, no HDCP 1.3: 14
- HDMI min hblank, w/audio, no HDCP1.3: 64
- HDMI min hblank, w/audio, and HDCP 1.3: 106
- FE
- FE is not directly involved with the line-to-line behavior
of the pipeline. The minimum hblank refers to the size of hblank programmed in the RG methods. When 2head1Or is enabled, DD halves the RG’s horizontal raster parameters. A configuration that requires N pixels of blanking requires a resolution with 2N pixels of blanking when this mode is used. The pessimistic minimum hblank for a YUV planar or semiplanar surface is:
- MAX (SOR min hblank, (ISO Hub + precomp + comp + post-comp + RG))
- MAX (SOR min hblank, 70)
If some features are not enabled, the minimum hblank may be smaller.
- Minimum vblank
To do an mclk switch during vblank, fetching must be stopped for the duration of the mclk switch or DVFS event. A complete spool up before the active region begins when fetching starts. If precomp scaling, post-comp scaling, all LUTs, DSC, 2head1Or, and mempool compression are enabled, then 22.5 scan lines are needed to complete spool up. Vblank should be greater than <fb stop time> + 22.5 lines. The 22.5 lines may be reduced if some features are not in use or if dispclk is running faster than the minimum dispclk required for the current mode.
##### 7.5.1.4.6 Max Resolutions
- The maximum pixel clock is 1,190 MHz. With the 2head1Or feature, the maximum targeted
resolution is 7680 x 4320 @ 60 Hz (pclk 2,376 MHz).
##### 7.5.1.4.7 State Management
Most method state in Display is triple buffered.
- Assembly: This state is set when a method is processed. The assembly value is sent on the
bundle bus to the appropriate submodule. This state does not directly affect functionality.
- This state is needed because each new Display configuration requires multiple methods,

- Display Controller
which are not atomic. This state permits software to assemble the next Display configuration over multiple methods.
- Armed: An update promotion bundle on the bundle bus atomically copies the assembly state
for a single channel to armed. This intermediate state is needed so that software can change the Display configuration multiple times per frame. After the promotion to Armed, software is free to overwrite the Assembly state and potentially perform another Update before the next frame begins.
- Active: At the start of each frame, a LoadV on the pixel bus promotes the current Armed
state to Active for all channels associated with that head. Active state controls the functionality of Display. All pixels that are processed before the LoadV use the Active state from the previous frame. All pixels that are processed after the LoadV use the Active state from the new frame. Software controls the location of update in the method stream. Multiple channels may be updated at the same time using interlocked updates. During every frame, hardware generates LoadV.
##### 7.5.1.4.8 Software Interfaces
Methods and registers control the display configuration state. Methods are triple buffered. Registers are typically single buffered and take effect immediately. There are exceptions to both rules. Methods enter the Display hardware through pushbuffers. The display itself manages the pushbuffers, rather than Host. Register programming is done through private register accesses (MMIO) through APB. Sets of methods are collected into channels, which all promote (update) at the same time. Updates on one channel do not affect other channels. The channels are defined below.
- Core Channel
The Core channel controls all shared resources like OR ownership and Window ownership. It also controls all per-head state such as raster parameters and post-comp pipe settings. There is only one Core channel. Core channel controls:
- Core Completion notifier
- Lockpins
- OR state
- OR ownership
- OR protocol
- Core Window state
- Window Usage Bounds
- Window Ownership
- Core Head state
- Raster parameters

- Display Controller
- Head Usage bounds
- Raster lock
- Output Scaler
- Cursor size and surface
- Output LUT, Output Color Space, Output Dynamic Range
- Dither / output color depth
- Head CRCs
- DSC settings
2Head1Or controls
- Chroma downsampling
- Head semaphores
- Window Channel
The window channels control all of the per-window state other than window position. There is one window channel per window supported by the chip. Window channel controls:
- Window Semaphores and Notifiers
- Composition controls (such as blend mode, depth)
- Window scaler
- Window size
- Window surface
- Input LUT
- Tone Mapping
- Surface format
- Presentation controls
- CSC0/CSC1 settings (matrix coefficients, LUT settings)
- WindowImmediate Channel
The WindowImmediate channel controls the position of the window surface on the Desktop. This is a separate channel so that the window position can be changed even if the Window channel is blocked for some reason allowing a smoother user experience. The WindowImmediate channel is a pushbuffer channel. This permits software to queue up several updates simultaneously.
- Cursor Channel
The Cursor channel defines the position of the cursor surface. The cursor surface itself is defined in the Core channel. Much like the Window Immediate channel, the purpose of this channel is to permit the cursor position to change even if the core channel is blocked or stalled for some reason.

- Display Controller
The Cursor channel is the only channel not controlled by the pushbuffer. Register writes to the UDISP address range to program the Cursor channel that is a PIO channel. Writes to this range generates cursor methods within Display. No pushbuffer or FIFO is associated with this channel, so software must take care not to generate new methods when the hardware is still busy with the previous method. Display hardware reports a “Free” value to report if there is free space to generate another method.
- Interlock / Fliplock
While normally the update methods on each channel are handled individually, Display provides the ability to interlock updates between (almost) any set of channels. With each update software can define the set of other channels that it wants to interlock. Display hardware waits for updates to be ready on all specified channels before permitting all of the updates to complete. The Window Immediate channels can only be interlocked with their associated Window channel. This is done to simplify the hardware implementation. Fliplock is a special case of Interlock, which uses an internal or external lock pin. This imposes additional restrictions on the timing of the Update to ensure that flips happen on the same frame even across multiple heads. Fliplocked heads must be rasterlocked.
- Register Ranges
- The Display address range is 0x138EFFFF: 0x13800000 (no VGA range). All addresses in the
following tables are zero-based, before adding the Display Base Address.
- Table 7.100 Major Display Register Ranges
- Name
- Byte Address
- Description
- Non-VGA Display Address Range
0x000EFFFF:0x00000000 Host allocates 1 MB of address range for DISP. The first 64 K is reserved for VGA I/O accesses.
- PDISP
0x0003FFFF:0x00000000 256 K
- DISP Error Collator
0x00040FFF:0x00040000 4 K used for the Error Collator registers
- Reserved
0x0005FFFF:0x00041000 124 K Unused for now
- UDISP
0x000EFFFF:0x00060000 576 K
- Mostly user registers. Private state cache also
defined in this range.
- Table 7.101 Display Private Register Ranges
- Name
- Byte Address
- Size
- Description
- NV_PDISP_FE
0x00005FFF:0x00000000 24 K 0x6000
- Front End registers

- Display Controller
- Name
- Byte Address
- Size
- Description
- NV_PDISP_HEAD
0x00009FFF:0x00006000 16 K 0x4000
- Head registers

