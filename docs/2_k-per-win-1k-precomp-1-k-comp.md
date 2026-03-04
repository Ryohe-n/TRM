# 2 k per WIN (1K precomp, 1 K comp)

- NV_PDISP_FE_SW
0x00030FFF:0x00030000 4 k 0x1000 Software read/write capability registers.
- Must be 4K aligned so that they can be
mapped to DD.
- Reserved
0x0003FFFF:0x00031000
- NV_PDISP_FE_EC
0x00040FFF:0x00040000 4 k 0x1000
- Error Collator

- Display Controller
- Table 7.102 Display User Registers
- Name
- Byte Address
- Size
- Description
- NV_UDISP_PRIVATE
0x0006FFFF:0x0006 64 K Assembly and Armed state cache for all private channels. (Name is confusing) 16 K: Precalc 1 K per WinPvt 1 K per WrbkPvt 1 K for Core Variables 1 K for Local variables
- NV_UDISP_CORE
0x0007FFFF:0x0007 64 K Assembly and Armed state for the core channel.
- NV_UDISP_REMAP
0x000EFFFF:0x0008 448 K (7 64 K pages)
- This is the full size of the remappable area. It should be aligned
to a 256 KB boundary to make address decode and remapping easier.
- The non-remapped default order of channels already extends
into the 0xC0000 range, so we need at least five 64 K pages
- NV_UDISP_WIN0_ASY
0x000807FF:0x0008 2 K
- The assembly and armed state caches (including PUT, GET, and
immediate methods) for each Window channel are mapped to a single 4K page.
- NV_UDISP_WIN0_ARM
0x00080FFF:0x0008 2 K (repeat 31 times for each window)
- NV_UDISP_WINIM0_AS
Y 0x000A07FF:0x000
- A0000

