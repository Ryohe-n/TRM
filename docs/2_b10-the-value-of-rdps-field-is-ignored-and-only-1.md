# 2 'b10: The value of RDPS field is ignored and only 1 Descriptor is fetched at a time from the System Memory. The next descriptor is fetched only after the data transfer corresponding to current descriptor is completed.

- The Descriptor close and the next descriptor fetch can still happen in
parallel. - 2'b11: All operations are sequential. Descriptor is fetched, data transfer is completed, descriptor is closed; then the next descriptor is fetched. The value of RDPS is ignored in this mode. 29:3
- RO
0x0 Reserved_29_y: Reserved. 2:0
- RW
0x0 RDPS:
- Rx Descriptor Pre-Fetch Threshold Size. This field controls the threshold in
the Descriptor cache after which the DMA starts pre-fetching the RxDMA descriptors. The DMA engine for all RxDMA channels initiate requests for the descriptor fetches as soon as the number of descriptors in the cache memory for that DMA channel, falls lower than or equal to the programmed threshold (each descriptor is 16 bytes). - 3'b000: Threshold of 0 descriptors. Descriptor pre-fetch is triggered only when cache is empty. - 3'b001: Threshold is 4 descriptors. Descriptor pre-fetch is triggered when 4 descriptors are left in the cache. - 3'b010: Threshold is 8 descriptors.
- Descriptor pre-fetch is triggered when 8 descriptors are left in the cache. -

