# 28 -bit word-aligned transfer size that can be configured up to 1 GiB 30-bit word-aligned source and target addresses

- Page or 4 KiB boundary alignment
- Per channel configurable burst size up to 16 words for all transfers
- Auto initialization of transfer size, source and target addresses on completion of
programmed words transfer in continuous mode
- Scatter/Gather through linked list for accessing non-contiguous memory regions
Software may use this feature in two scenarios:
- When requiring streaming of audio samples spread across the memory
- When requiring less intervention from CPU
- CPU need not attend the end of Interrupts transfer from ADMA on a regular basis. It
can occasionally write a bunch of descriptors into memory and attend other high priority tasks.
- Descriptor is a set of four registers (SOURCE_ADDR, TARGET_ADDR,
- TRANSFER_COUNT and NEXT_DESCRIPTOR_ADDR) located in consecutive 32-bit
entries of DRAM/ARAM starting with SOURCE_ADDR. ADMA fetches next descriptor (SOURCE_ADDR, TARGET_ADDR, TRANSFER_COUNT and NEXT_DESCRIPTOR_ADDR) pointed to by the "NEXT_DESCRIPTOR_ADDR" of current descriptor for the next transfer while current transfer is in progress and these values are loaded at the end of the current transfer.
- Initially, it is loaded by software while setting up the channel and then automatically
loaded by hardware prior to end of each block transfer to enable seamless streaming.
- ADMA keeps fetching the descriptor from ARAM/DRAM pointed to by
"NEXT_DESCRIPTOR_ADDR" until either software disables the channel or "NEXT_DESCRIPTOR_ADDR" register value of current descriptor is "0". Configurable address wrapping window in multiples of burst size for source and target in all modes
- Up to eight buffers in all three transfer modes (linked list, once and continuous modes)
- Source and target addresses initialized on completion of all programmed buffers transfer,
then Interrupt is generated on completion of every buffer transfer in continuous and linked list modes
- Interrupt generated on every buffer completion and channel would be disabled on
completion of all buffers in once mode
- Up to eight outstanding reads and writes

- Audio Processing Engine (APE)
- ADMA allowing a maximum of eight reads to source memory and that many writes to the
target memory to be outstanding at any given point of time
- ADMA issuing read/write requests to ARAM/DRAM by mapping channel number to the
- ARID/AWID of AXI interface so that requests from different channels can pass each other
and requests from same channel are handled in order or on first-come-first-serve basis en route to the target elements
- Weighted Round Robin arbitration scheme for selecting read requests to AHUB and Memory
- Each DMA channel programmed to a weight/request count so that it gets the grant for
issuing that many requests back-to-back. (This is applicable for all flow-controlled (AHUB) and non-flow-controlled transfers (ARAM/
- DRAM).)
- Separate WRR arbiters used for AHUB and Memory Reads to enable un-interrupted full
duplex transfer
- Configurable triggers for initiating DMA transfer
- Triggers for each channel mapped to end of channel Interrupt of all other DMA channels so
that software can choose one of them to instruct the channel to initiate the transfer upon assertion of that particular Interrupt
- Cut-through data transfers
ADMA converting the returned data for the read requests issued to source element into write requests to the target element and forwarding them on AXI write channels in cut-through mode 32 channels where each channel can be configured for DMA transfer in any of four possible directions
- MEMORY-to-AHUB
- AHUB-to-MEMORY
- AHUB-to-AHUB
- MEMORY-to-MEMORY
- Threshold-based flow-control for VI/I2C triggered DMA transfer
- ADMA Channel Virtualization
- Virtualization of ADMA channel registers in to four 64K pages
- Separation of ADMA Config registers into another 64K pages
- APR region and ADAST support
- Preventing secured data from writing into non-APR region
- Unsecure ADMA channel (APR disabled) blocking the writing of secure data (APR set) to
memory
- One ADMA error Interrupt per OS page
- Timestamp capture support

