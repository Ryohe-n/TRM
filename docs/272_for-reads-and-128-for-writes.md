# 272 for reads and 128 for writes

- True completion
- Maintains Order
The DMA block exists as a sub-IP component in PVA, one per VPU. Since the first instance of PVA has two VPU's, there are two instances of the DMA per PVA. Each of these instances brings out a master port. Hence at the boundary of DMA, there is one AXI 256-bit master port (data) and one AXI 32-bit slave port (control and configuration). The diagram below shows the CV cluster with two PVAs and two DMAs in one PVA.
- The CCPLEX core in the SoC serves as a task sequencer (operates at the frame or sub-frame
boundary) and launch frame level algorithms. Cortex-R5 and VPU firmware sequencing should be used to implement various dynamic/static data transfer scenarios with little regularity. Both Cortex-R5 and VPU have a low latency path to program the DMA. The Cortex-R5 sets up the DMA descriptors at the beginning of a task and starts the VPU. Most of the time and for regular processing, it is the VPU that triggers the DMA and synchronize with DMA transfers at a tile level. The VPU triggers the DMA to copy next data tiles into VMEM (or copy previous processed tiles from VMEM to outside) while it is working on the current tile. In some cases, the VPU needs to copy data from a run-time computed address. In this case, the VPU configures the DMA descriptors to collect data from a region with a newly computed address.

- Programmable Computer-Vision Accelerator (PVA)
##### 8.2.2.5.2 DMA Description
- The DMA block has four main components: DMA Channel Control, DMA AXI Control, DMA VMEM
Control, and DMA Configuration. DMA Channel Control:
- DMA has 16 channels and each channel controller (DMA engine) is responsible for processing
descriptors via a DMA descriptor processor block per channel.
- DMA has 64 descriptors stored in a RAM and each descriptor has 64 Bytes of information to
capture the attributes of:
- Source/destination address
- Trigger control
- Pad control per channel
- Buffer control

