# 0 R1 (Memory) 1 R5 (SDIO)

- MULTI_BLOCK_SELECT - Multi / Single Block Select
- This bit is set when issuing multiple-block transfer commands using DAT line. For
any other commands, this bit shall be set to 0. If this bit is 0, it is not necessary to set the Block Count register. (Refer to Table 2-8) 1 Multiple Block 0 Single Block
- DATA_XFER_DIR_SEL - Data Transfer Direction Select
- This bit defines the direction of DAT line data transfers. The bit is set to 1 by the
- Host Driver to transfer data from the SD card to the SD Host Controller and it is
set to 0 for all other commands. 1 Read (Card to Host) 0 Write (Host to Card)
- AUTO_CMD12_EN - Auto CMD Enable
This field determines use of auto command functions. 00b Auto Command Disabled 01b Auto CMD12 Enable 10b Auto CMD23 Enable 11b Auto CMD Auto Select There are three methods to stop Multiple-block read/write operation by CMD23 or CMD12. In the other operations (ex. single read/write operation), this field is set to 00b. (1) Auto CMD12 Enable
- When this field is set to 01b, the Host Controller issues CMD12 automatically when last
block transfer is completed. Auto CMD12 error is indicated to the Auto CMD Error Status register.

- SDMMCA Registers
The Host Driver shall not set this bit if the command does not require CMD12. In particular, secure commands defined in the Part 3 File Security specification do not require CMD12. When Host Version 4 Enable =0, CMD12 is issued when 16-bit Block Count is expired. When Host Version 4 Enable =1, CMD12 is issued when 16-bit Block Count or 32-bit Block Count is expired. (2) Auto CMD23 Enable
- When this bit field is set to 10b, the Host Controller issues a CMD23
automatically before issuing a command specified in the Command Register.
- The Host Controller Version 3.00 and later shall support this function. The
following conditions are required to use the Auto CMD23.
- Auto CMD23 Supported (Host Controller Version is 3.00 or later)
A memory card that supports CMD23 (SCR[33]=1) If DMA is used, it shall be ADMA.
- Only when CMD18 or CMD25 is issued
(Note, the Host Controller doesnt check command index.)
- Auto CMD23 can be used with or without ADMA. By writing the Command
register, the Host Controller issues a CMD23 first and then issues a command specified by the Command Index in Command register. If response errors of
- CMD23 are detected, the second command is not issued. A CMD23 error is
indicated in the Auto CMD Error Status register. 32-bit block count value for CMD23 is set to 32-bit Block Count (SDMA System Address) register. (3) Auto CMD Auto Select (Version 4.10)
- As CMD23 is optional for SD Memory Card except UHS104 Card, If card
supports CMD23, Auto CMD23 should be used instead of Auto CMD12. Host Controller Version

