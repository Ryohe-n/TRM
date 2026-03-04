# 0 ns

- Allow EQ to turn off training circuits
before entering SLEEP state.
- Save/Restore

10G Ethernet Controller Functional Description During link initialization, the PHY is required to perform an extensive EQ training sequence to optimize properly its equalization parameters according to specific channel and chip combinations. The PHY has the capability to support save and restore operation for critical EQ parameters. During the “save” operation, the PHY must be powered down before the CFG reads to PHY registers are performed to ensure that PHY parameters are static and that they are consistent with each corresponding to the last EQ event. During the “restore” operation, the restoration of the previously saved parameters should be performed immediately after the normal PHY CFG initialization. This is according to the mask for each restore register to ensure desired values before the PHY training starts.
##### 10.8.3.4.8 Static Controls
The MGBE clocks are not changed on the fly and are defined only at the startup. Therefore, during chip operation they can be treated as static. Clock divider ratio is selected by configuring the following two registers per MGBE port are used for this operation.
- CLK_RST_CONTROLLER_GBE_UPHY_MGBE0/1/2/3_CLK_CTRL_0. GBE_UPHY_MGBE0_TX/
- RX_CLK_DIV_RATIO
; Divide by [N+1]. For 10G speeds, set it to 0x1 and for 5G, set it to 0x3.
- CLK_RST_CONTROLLER_GBE_UPHY_MGBE0/1/2/3_CLK_CTRL_0. GBE_UPHY_MGBE0_TX/
- RX_CLK_ENABLE
- Table 10.56 Static Logic Controls
- Name
- Dir
- Description
- TX_RATE_DIV[1:0]
I
- Divider selection for transmitter block
- RX_RATE_DIV[1:0]
I
- Divider selection for receiver block
- RX_CDR_EN
I Receiver CDR enable, connect to 1’b1.
#### 10.8.3.5 Descriptors
The DMA in the Ethernet subsystem transfers data based on a linked list of descriptors. The application creates the descriptors in the system memory. The DWC_xgmac supports the following two types of descriptors:
- Normal Descriptor: Normal descriptors are used for exchanging packet data and packet
control or status information applicable between the application and the DWC_xgmac controller.
- Context Descriptor: Context descriptors are used to provide additional control information
applicable to the packets to be transmitted or additional status information for received packets.

10G Ethernet Controller Functional Description Tx side: The application prepares the context descriptors and puts the context descriptors in the linked list before the Normal Descriptor. The XGMAC-AXI interface processes the controls given in the Context Descriptor for one or more packets following the context descriptor. Rx side: The application does not create context descriptors. It creates a linked-list of normal descriptors. When the Rx DMA has additional status information for a received packet, it closes the next descriptor with this additional status and marks it as “context descriptor”. Each normal descriptor contains two buffers and two address pointers. These buffers enable the adapter port to be compatible with various types of memory management schemes.
##### 10.8.3.5.1 Descriptor Structure
The following figure shows the descriptor ring structure used in XGMAC.
**Figure 10.87 Descriptor Structure**
In the ring structure, descriptors are separated by the Word, DWord, or LWord number programmed in the DSL field of the DMA_CH(#i)_Control register. The application needs to program the total ring length, that is, the total number of descriptors in ring span in the following registers of a DMA channel:
- Transmit Descriptor Ring Length Register (DMA_CH(#i)_Tx_Control2)

10G Ethernet Controller Functional Description
- Receive Descriptor Ring Length Register (DMA_CH(#i)_Rx_Control2)) The Descriptor Tail
Pointer Register contains the pointer to the descriptor address (i). The DMA owns the descriptors up to one location less than the one indicated by the descriptor tail pointer (i – 1). The DMA continues to process the descriptors until the following condition occurs:
- Current Descriptor Pointer == Descriptor Tail Pointer
The DMA goes into the Suspend mode when this condition occurs. The application must perform a write to the Descriptor Tail pointer register and increase the offset so that the following condition is true:
- Current Descriptor < Pointer Descriptor Tail Pointer
The DMA automatically wraps around the base address when the last descriptor in the ring is processed, as shown in the following figure.
**Figure 10.88 DMA Descriptor Ring**
For descriptors owned by the application, the OWN bit of DES3 is reset to 0. For descriptors owned by the DMA, the OWN bit is set to 1. If the application has only two descriptors in the beginning, the application sets the last descriptor address (tail pointer) to Descriptor Base Address + 1. The DMA processes the first descriptor and then waits for the application to change the tail pointer back to Descriptor Base Address.

10G Ethernet Controller Functional Description
##### 10.8.3.5.2 Transmit Descriptor
The DMA in DWC_xgmac requires at least one descriptor for a transmit packet. In addition to two buffer length fields, and two address pointers, the transmit descriptor has control fields, which can be used to control the packet processing on per-transmit packet basis. The Transmit Normal descriptor has the following two formats: Read format and Write-Back format. Transmit Normal Descriptor (Read Format). The diagram below shows the Read Format for a Transmit normal descriptor. This is the format in which the software can prepare the descriptor contents and hand it over to the DMA Engines of the DWC_xgmac.
**Figure 10.89 Transmit Normal Descriptor (Read Format).**
The field description is as follows:
- TDES0 Normal Descriptor (Read Format)
- Bits
- Name
- Description

