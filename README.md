<!-- Page 1 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Abstract

The Technical Reference Manual focuses on the logical organization and control of the NVIDIA Orin Series System-on-Chip. It provides information for those modules that interface to external devices, or those that control fundamental chip operations. The modules detailed in this document provide an overview, any necessary programming guidelines, and a register listing for that module. Internal functional units such as video and graphics hardware acceleration are controlled by NVIDIA provided software and are not documented here.

Version: 1.2

Date: 29-September-2023

ID: DP-10508-001


<details>

<summary>OCR (Page 1)</summary>


```text

Abstract
The Technical Reference Manual focuses on the logical organization and control of the
interface to external devices, or those that control fundamental chip operations. The
modules detailed in this document provide an overview, any necessary programming
guidelines, and a register listing for that module. Internal functional units such as video
and graphics hardware aceeleration are controlled by NVIDIA provided software and are
not documented here.
Version: 1.2
Date: 29-September-2023
ID::\DP-10508-001

```
</details>


<!-- Page 2 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

##### Table of Contents

1. Revision History............................................................................................................................................... 37

1.1 About this Release........................................................................................................................................37

1.2 Change Log......................................................................................................................................................39

1.2.1 20230930 (Version 1.2)............................................................................................................................39

2. Getting Started................................................................................................................................................ 41

2.1 Overview............................................................................................................................................................41

2.1.1 Reading Register Tables..........................................................................................................................42

2.1.2 Units.................................................................................................................................................................45

2.1.3 Glossary..........................................................................................................................................................45

3. Memory Architecture and Memory Mapped I/O................................................................................ 55

3.1 Memory Subsystem (MSS)........................................................................................................................55

3.1.1 Overview.........................................................................................................................................................55

3.1.1.1 Features...................................................................................................................................56

3.1.1.2 Block Diagram.........................................................................................................................57

3.1.1.3 Speeds and Feeds...................................................................................................................58

3.1.2 Functional Description.............................................................................................................................58

3.1.2.1 MSS Data Backbone ...............................................................................................................58

3.1.2.2 Client Hubs..............................................................................................................................58

3.1.2.3 Arm SMMU-500.......................................................................................................................63

3.1.2.4 NVLink Hub (Connection to the iGPU)...................................................................................64

3.1.2.5 MSS Clients .............................................................................................................................64

3.1.2.6 MCF..........................................................................................................................................66

3.1.2.7 SCF...........................................................................................................................................67

3.1.2.8 SysRAM ...................................................................................................................................67

3.1.2.9 SyncPoint Interface.................................................................................................................68

3.1.2.10 Memory Controller (DRAM) Channels ...................................................................................68

3.1.2.11 Addressing ..............................................................................................................................69

3.1.2.12 Address-based Steering .........................................................................................................70

3.1.2.13 Virtual Channels......................................................................................................................73


<details>

<summary>OCR (Page 2)</summary>


```text

Table of Contents
1.2
1.2.1
wWwnnnn hp
3.1.1.1
3.1.1.2
3.1.1.3
3.1.2
3.1.2.1
3.1.2.2
3.1.2.3
3.1.2.4
3.1.2.5
3.1.2.6
3.1.2.7
3.1.2.8
3.1.2.9
3.1.2.10
3.1.2.11
3.1.2.12
3.42.13
ReViISION HiStOy .......eseecsecsessesssessessessessessncsseesessncsueesecseceuecaesseesussuesatesessuseanssnssusesnsatssesseeqamagettgfletsesseeeateeneeeeees 37
About this RElCASC Qo... eecescceessesstecsseesntesseessesstecssecsatessesseesatecsuessntesueesseerstessuessnfbageagecestessueeseessecseeenateene 37
Change Log
20230930 (Version 1.2).
Getting Started
OVELVICW....sceesseesstecssccsseesseesseestecsuccsseesseesseesatecsuessntesueesseesatessuessneeaneesubage Uvedcsseessecsucesanesueesseeeatesseeesntesneesseenasees 41
Reading Register Tables ou... essecsesessseessessnecsseesnteafcradasatessesseesuesstesatecseessuessuesseeseeesseesnennieess 42
UNIS. eeceeeseeesseeestecssecsueesseesstesatecssessseesecsueesatesseesstessecssesbagesupesutesatecsessueesueesueesatesseesseeatecsessutesneesunenaeese 45
GIOSSALY ...seceecseesecsessessssesesseccucceceseseucsuceaeeenceueeaesanceussacsasecag lgeaneenssuesaeeeassuseaeeseseusseseseesussateaeeessuteateanseseaneenees 45
Memory Architecture and Memory Mapped I/O. vc.csccccssssscsssecssssscssseessssessssecssssecssseesssecessecssnecesneees 55
Memory Subsystem (MSS).....cssccsssscsssessssseess¥oendbpecssssscsssecssssccssseessssecssssessasecesscssnsecssuecssssecssuecesssecesueesanee 55
OVELVICW.. nc essecsecsstesseesseeestecsseesntesseesstesateeg@llpantdecsutesasesseecsueesmecsuecsutesseesutessuecssessuessneesutesatessessueesuecsseenanesees 55
FOAtUIeS oo. eee ce cecee ects ccesceceecsecacupeadcssesecscecscecsesscsesacsesscecsceecaceecsesacseeacaesaeeeeaceeeeseaeateesaeees
Block Diagram
Speeds and Feeds.......c cece LDagleccsccscsceseeceseeceseseeseeseseeseseeecsecseseesesecsenecseeecseceeeeseeeeeeeeseeesaee 58
Functional D@SCriPtion .......2edceseecsecsecsecssessessecssessessuceseesessseuceseeaeseucsueeaeesnssueeaeeeassueeaneansesseteateeeeeteateeees 58
MSS Data Backbone 28.22. ececececceceseseseseseeseseseseseseeeeseseseaeeeseeseseseseseeseeeaeaeaeeeeeeeeseseaeeeeeeetaras 58
Client HUDS 220... cece eceseeeeeeeesestseseseseseeeesesesesesesseacsesesesessescaeseseseeeacaeeceeeeseseseaeeeeeeenaees 58
ArT SMMU-500. oa ae eeeeececeesesecececesecscacseseseeeencececacacacsesesuesescecscaeseenenesseacacaeseaceeensesecaeaeacaeeeeees 63
NVLink Hub (Gonnection to the iGPU)..........eeeeecesecseeseseseceeececseseseseseseeseseaceceeseeeeneseeeaeatees 64
MSS Clients sect... eeccececescececeseseseseseeeesesesesescecseeeseseseeeseacscsceeseseseseaeseeecseacaeaeeeeeseseseaeeeeeeetaas 64
MCE... ceacecesccsesecesecscscscsesesscecscecscsesacsessnsseacscecsescssusessescacaesesesecneesecscacacaesesesueaeecesaeseensnetenseeaeatees 66
SOB rn toelecececececscsescsesesessscscecsesesesnesessnescacseseseesusesseacacacsesesneneacecscaesesesesueacacaeaceeeeenseseseeaeacaeeneees 67
SYSRAM oo .eeeeccscseseseseescececsesesecscecssscscscsessesssnsesecacacacaesessnescecscaeseeeseeseecaeaeseseeeenseseeeeaeatateeeees
SyncPoint Interface.
Memory Controller (DRAM) Channels ............:.s:cecececsssssesesecesececseseeesesesesescacaeeeseeeenseseeeaeatees 68
ACreSSING ........:ceccccesesesceseeceseceseesesecseseceseeseseeseseseeeseeeseesesecseseesesessesecaeeecaeceeeeseseeeeeeeseeeeates 69
Address-based Steering ..........ccccccccccessssessesseseseeseseeseseeseseeceecseseeseseeseeeseecsesaeseeeeseeeesesaeeesaee 70
Virtual Channels «0... .cceeececesesesceseesesesesesescecsceeeeacaeseseseeecscaeeceeseseeacaeaeeeeeeevaceeeceeeeneeecaeeteeeees 73

```
</details>


<!-- Page 3 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

3.1.2.14 Arbitration, Throttling, and Deadlines ....................................................................................74

3.1.2.15 Logical Transaction Pipeline..................................................................................................81

3.1.2.16 Transaction Ordering..............................................................................................................84

3.1.2.17 Error Checking and Reporting ................................................................................................86

3.1.2.18 Access Checks (DECERRs) ....................................................................................................88

3.1.2.19 Reporting of Functional Errors...............................................................................................89

3.1.2.20 Clocking...................................................................................................................................93

3.1.2.21 Software Interfaces ................................................................................................................93

3.1.3 MSS Registers .............................................................................................................................................93

3.2 Address Map ...................................................................................................................................................96

3.2.1 Overview.........................................................................................................................................................96

3.2.1.1 Features...................................................................................................................................96

3.2.1.2 AMAP and Aperture ................................................................................................................97

3.2.1.3 MMIO Aperture........................................................................................................................98

3.2.1.4 On-Chip Data/Sync Plane Aperture........................................................................................99

3.2.1.5 DRAM Aperture .....................................................................................................................100

3.2.1.6 PCIe Aperture (32-bit OS) .....................................................................................................101

3.2.1.7 Off-Chip Aperture ..................................................................................................................102

3.2.2 System Address Map.............................................................................................................................102

3.3 Address Space Translation (AST).........................................................................................................187

3.3.1 Overview......................................................................................................................................................187

3.3.1.1 Features.................................................................................................................................188

3.3.2 Functional Description..........................................................................................................................189

3.3.2.1 Address Generation Blocks..................................................................................................190

3.3.2.2 Read Error Response ............................................................................................................190

3.3.2.3 Write Error Response............................................................................................................190

3.3.2.4 Decode Error Generation ......................................................................................................190

3.3.2.5 Clocks and Resets ................................................................................................................191

3.3.2.6 AST Software Requirements................................................................................................191

3.3.2.7 Programming Examples.......................................................................................................191

3.3.3 Programming Guidelines......................................................................................................................192

3.3.3.1 Steps to Configure Region #i in AST ...................................................................................192

3.3.4 AST Registers............................................................................................................................................193


<details>

<summary>OCR (Page 3)</summary>


```text

3.1.2.14 Arbitration, Throttling, and Deadline ........ eee eccecesceseseeeceeeseeeeseeeeseeeeseeecseeeeseeseseeeeeeesapenaees 74
3.1.2.15 Logical Transaction Pipeline .......... ce ceccceccssescesseecseseeseseeseeecseseeseesesesseseesseecseeecssershans poses 81
3.1.2.16 Transaction Ordering .........cccccecccccscssesesseseeseseeceseeeseeseseecesesseecseeesesecseeesseeecsecseeeseaateapafeesessees 84
3.1.2.17 Error Checking and Reporting ............c:ccceccssecsseceseesesseseseeseeeeseescseecesecseseseeseesegfeaedbcrseeeseeeeaeees 86
3.1.2.18 Access Checks (DECERRs) .88
3.1.2.19 Reporting of Functional Errors .........cccccceccssesssseseeescsecseseesecesceccseecesesasalgsuspiseceseeeeseeecseeeeseees 89
3.1.2.20 CLOCKING 00... eeeececcsceceseescscesesecesecsesessesesacsecsesecsesecsessesecsesecsesecseeecseseepeat pessecseeeeseeeaeeeeseeeeaeees 93
3.1.2.21 Software Interfaces 0.00... ececeseccsesseseseseecsescececeeeecacaeeeeeeeeetscececetslgsfeghiceeseseesseeeeeeeeeeeeaeaeeeeeees 93
3.1.3 MSS ReGIStELS oo. eseeceesseessseesstesstecsessseessecsseesatesseesssesstecssecsuesssessstesseadllbosesMccsueesatesseesneeatecseesueesaeesntenseess 93
3.2 ACCreSS Map ......secseessecsessesssessessssuesseeeucsuesaeesuceueeanssnceuseaneseeeucseesaseeseqgesDbaggbcseeseeansenseaneaseeeseaneateeesseeeateeeseaseatees 96
3.2.1 OVELVICW.. nc essecstecsstesseesseestecsseesutesseesstesatecsuessueessecsutesasesssessseesmfllleagesesseesuteestecsuessuessueesutesatessessueesuessseenaeenees 96
3.2.1.1 FOAtUIeS oo. ec ecceessceececeecseeecsecaceesaceesacsecsceecscsecsssdensslpessecacscecsceecsesacsesesaecaeeeaceeeseeeaeeasaeees 96
3.2.1.2 AMAP and Aperture .........ccecccceccceescsseseseesecesceceseseesMpessesccseseceecaeseeacsecaeecaeecaeceeseeseseeeseeeaeesaeee 97
3.2.1.3 MMIO Aperture... ee ceceecceceseeseeseeseeseeseeeag@¥ensanl cesecseesecsececeeceeeeecaeeaesaesaeseaeeeeeeseeseeeeeeneeaees 98
3.2.1.4 On-Chip Data/Sync Plane Aperture.........c.kececeseeesseseseseseseeeseseseseseseeeeseseaeaeseeeeeeseseeeeeeeeetees 99
3.2.1.5 DRAM Aperture ...
3.2.1.6 PCle Aperture (32-bit OS) .....e.eeeeececsssets Mesceseeseseseseseseseeseacsescseseeeensecsescacaeaeseensnenseeeseeeeecateneees 101
3.2.1.7 Off-Chip APerture 0... ee eceeeccesimpececescescecescscesesecseceseccseesesecseseeaesecsesecseeeceeseseeseeeseeeeaeees 102
3.2.2 System Address Map......sesseesGphetecsessesseessessesssesessescussaeesessucsueeacsenssuesaeeaseuseanesseseeseansssseeaseeseeteatees 102
3.3 Address Space Translation (AST).....sssssssscssssecsssssssssecsssscssssccssssessssecssssessssecssnsesssuecssseesssuecssssensssecssnes 187
3.3.1 OVELVICW....essecseesstecssssanpalige Wecsasecasessuessecsuccestesssessneessecsucesatesnsesaeesatecsuessnsesuessseesanessuessneesueesecerseesaneeseeenees 187
3.3.1.1 Feature oo. eee alee ccceeesceeeseeecseeeescacseescseeecsacaeeecseesaeeassececseeaeeesaeeesaeeesseeaseeeeseeaeeetaeees 188
3.3.2 Functional D@SCriPtiOn 00... ceccecsecssessessesssessessessuessessucsusesessnceueeseeaeseussuseaeesuseneeateeaseuseateaneeeeeteaneeeeeeeases 189
3.3.2.1 Address Generation BIOCKS «0.2... ceecesessseseseseseseseeeeeeeseeeseseeceeeeseaceeeeeeeenseaceeeeeeeeeeeeeeeeneees 190
3.3.2.2 Read Error.Response
3.3.2.3 Write Error-Response
3.3.2.4 Decode Error Generation... eeeeecsesseseesesesesesesessesesesesesesceeeceseseseseeeeeeseaeaeaeeeescseaeeeeeeeeeeaees 190
3.3.2.5 GIOCKS and ReSets ....... ee eeececeseseseeeeeeseseseseseceseseseseseseseeseseaescececeseseaeseeececaeaeaeaeeseseseaeeeeeeeeetaas 191
3.3.2.6 AST Software RequireMent ..........ccccccccccesessesessesescesceecsesesseeecseeecseeeeseesesecsesesseeeeseeecseeaeeesaeee 191
3.3.2.7 Programming Examples ...........ccccccccssssessesseseseesesesecseeceseescseesesecaeseeaeeeseeecseecseeseeeseeeseeeeaeees 191
3.3.3 Programming GUICeliNeS ...... ee eceesseeseesstecsessseesseesseesstecssessnesssecsseceatessuessneeseesscerstesssesseesaeeseeeenteene 192
3.3.3.1 Steps to Configure Region #i iN AST oo... ce eeccceecsceesceseseeeeeeseseeeeecseeecsesesseeessenesseeeseeeaeee 192
3.34 AST ReGIStELS......esecseesestetessesesseteesseeesstessseresseneessenessteesstessueesstessueeesuaessueeessatessneeesnntessseeesnntessseeesnnsenss 193

```
</details>


<!-- Page 4 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

3.4 Control Plane................................................................................................................................................222

3.4.1 Overview......................................................................................................................................................222

3.4.2 Control Backbone (CBB) Error Monitor..........................................................................................223

3.4.2.1 Error Monitor .........................................................................................................................223

3.5 General Purpose Direct Memory Access (DMA) Engines ..........................................................229

3.5.1 Overview......................................................................................................................................................229

3.5.1.1 Features.................................................................................................................................230

3.5.1.2 New Hardware Features.......................................................................................................230

3.5.1.3 Support for Legacy MMIO DMA Hardware Features..........................................................231

3.5.1.4 Supported Legacy Software Features .................................................................................231

3.5.2 Functional Description..........................................................................................................................232

3.5.2.1 DMA Functionality: Mem-MMIO...........................................................................................233

3.5.2.2 Peripheral Rx Mode: DMA Read from MMIO Peripheral to Memory .................................233

3.5.2.3 Peripheral Tx Mode: DMA Write from Memory to MMIO ...................................................233

3.5.2.4 MEM-MEM DMA Mode.........................................................................................................234

3.5.3 Programming Guidelines......................................................................................................................234

3.5.3.1 Main Programming Steps ....................................................................................................234

3.5.3.2 GPC-DMA Address Space ....................................................................................................235

3.5.3.3 Pause Mode ..........................................................................................................................235

3.5.3.4 Abrupt Channel Disable........................................................................................................235

3.5.3.5 Busy Bit..................................................................................................................................236

3.5.3.6 Enable (ENB) Bit....................................................................................................................236

3.5.3.7 DMA Interrupt........................................................................................................................236

3.5.3.8 Controller FIFO Size ..............................................................................................................236

3.5.3.9 Transfer Alignment...............................................................................................................236

3.5.3.10 WCOUNT Register.................................................................................................................236

3.5.3.11 Continuous Mode..................................................................................................................237

3.5.3.12 HOL Blocking.........................................................................................................................237

3.5.3.13 Non-continuous SPI Mode ...................................................................................................237

3.5.4 GPC-DMA Registers...............................................................................................................................238

3.5.4.1 COMMON Registers..............................................................................................................238

3.5.4.2 CHANNEL Registers .............................................................................................................323

3.6 System Memory Management Unit (SMMU) .................................................................................579


<details>

<summary>OCR (Page 4)</summary>


```text

3.4 CONtLOl PLANE oon. eeseeseecsesseessessesscsseesecssceuccuscssceucsuesaceucsuesassncsuseaeseesussuesseseessuesanesussueesessseueeateateeeeseeeeecegemase 222
3.4.1 OVEFVICW...ecseccecseessessesssessessessucsuseseceucsueeacecuceueesessncsuseaseseceussuteacesassuesaeesassuseaesaseuseansatssassetsatssessatsateseetageolpee 222
3.4.2 Control Backbone (CBB) Error MOnitor ...c.cesessesscssessssssesssesstssesseesstssesseesetssesssssansstssessagantestadiesseese 223
3.4.2.1 Error Monitor
3.5 General Purpose Direct Memory Access (DMA) Engines... 229
3.5.1 Overview
3.5.1.1 Features
3.5.1.2 New Hardware Features... .cceecscessseececesesesesceeeeeseseacscaceesescaleedegitecseaeaeaeeeeeeseseeeeeeeeeesees 230
3.5.1.3 Support for Legacy MMIO DMA Hardware Features ............4).eceeseseseeeseeeeeeeeeeeeeeseeeeeees 231
3.5.1.4 Supported Legacy Software Features ...........cececesceceseseseges Deadecesesesceeeeeeeeeseeceeeeeeeeeeeseeeeeeees 231
3.5.2 Functional D@SCriPtion uu... ceccecseessecsessesssessessessessessscsseesessnflileageseesussueeseesussesaeeeesseseaeeaeseeseateeteeeseateases 232
3.5.2.1 DMA Functionality: M@Mm-MMIO............cecececeseseesedbersDpececscececesesencecseeeeseaeaeaeseeseseseaeeeereeteees 233
3.5.2.2 Peripheral Rx Mode: DMA Read from MMIO Periphéral to Memofy ...........:sceceseeeeeeeeeeee 233
3.5.2.3 Peripheral Tx Mode: DMA Write from Memory to MMIO ..........eeeeeeeceeeceeeeeceseseeeeeeeereeees 233
3.5.2.4 MEM-MEM DMA Mode
3.5.3 Programming Guidelines...
3.5.3.1 Main Programming Steps ....
3.5.3.2 GPC-DMA Address Space ..........Cimpecscsseccesesecesesecseeceseccsecsesecseseaesceseecseecseeseeeseeeseeeeaeees
3.5.3.3 PaUS@ MOO... eeecsesescecesesefopep eceeecesesescecececeseseseseseseeseseaeseseeseseseaeseeececaeaeaeeeeeeecseaeaeeeeeseaees
3.5.3.4 Abrupt Channel Disable ....2..g)......ceccccecccceseseesceeseeeesesecsesecseeecseeecseecsessesesseeecseeesseeeseesaeeeeaeee
3.5.3.5 BUSY Bit... eee aD Die cece cneeecaceeesecseseescseescsacaeeecseeevaeeasseescseeaeeecseeesaeeceeeeseeeseeseeeeatees
3.5.3.6 Enable (ENB) Bit.....005 5. eceseceeeecseseseseseescececseseceeecseeseseaesescseceeensecsescacaeaesnenenensesesseetatateneees
3.5.3.7 DMA Interrupt... 2.cc..cececeeccesceccesceseeseeseesceececeececeesecaecaesaeceececaseesaesaecaeeaesaeseeseeseetereeaeeateas
3.5.3.8 Controller FIFO SiZ@ oo... eeeeseseesecesesesesesceeesesesesesesesseseseseseneesseseseeeeceeseaeaeaeeeeeseseaeeeeeeeeeeas
3.5.3.9 Transfer AliQNment ..........cccccecccccsceseseseeseeseseeeesesceseesesessesesseeecseecsesecsessesecsesecseeesseeessesaeeesaee
3.5.3.10 WCOUNT Register...
3.5.3.11 COmtinUOUS MOE... eee ecececeseseseeeeeeseseseseseecececesesesesesesseseaeseeeecseseaeseeeeetscaeaeaeseseseaeeeeeeeeeteas
3.5.3.12 HOLSBIOCKING 0.0... .eeecceeccecesesceseeseseecesescesessesesscscssesecsesecsesecseesesecseseeseeesesecseeeceeeseeeseseeseeeeaeees
3.5.3.13 NOn-Continuous SPI MOde oe eeeeeeeseseececeseseseseseseseseseseseeeeseseseaeeeeeeeeaeaeacaeeeeseseaeaeeeeeeetaees
3.5.4 GPC-DMA ReGIStePS .......eeseesstsssseesstesstessseesstessesseestecsucesatesnesseesatecsueesanesueesseesaessuesantesueeseeerstessuessntenees 238
3.5.4.1 COMMON ReGiStePS............:ceccecceecesceseeseesceesceeceeeeeeeseeseesecsessecaeeceeeaecaesaesaecaeeeeseeseeeereeeeateas 238
3.5.4.2 CHANNEL ReGiStePrs ...........eeeceseeseceseseseseseeceseseseseetseseseseseseeeesscseseseeeeecataeaeaeeeseseseaeeeeeeeeaees 323
3.6 System Memory Management Unit (SMMU) .......sssssssssssssssesssseescessssesesssnseseessntesessnnteeesanteeeseenees 579

```
</details>


<!-- Page 5 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

3.6.1 Overview......................................................................................................................................................579

3.6.1.1 SMMU Configuration ............................................................................................................579

3.6.1.2 StreamID................................................................................................................................580

4. Boot and Power Management .................................................................................................................581

4.1 Boot Process ................................................................................................................................................581

4.1.1 Overview......................................................................................................................................................581

4.1.1.1 Boot Code Terms..................................................................................................................581

4.1.1.2 Boot Flow and Branches.......................................................................................................582

4.1.1.3 Boot Code Stages .................................................................................................................582

4.1.1.4 Boot Devices (Boot Sources) ...............................................................................................588

4.2 Power Management Controller (PMC)...............................................................................................593

4.2.1 Overview......................................................................................................................................................593

4.2.2 PMC Functional Description...............................................................................................................595

4.2.2.1 Reset Generation Logic ........................................................................................................595

4.2.2.2 PMC System Reset Generation............................................................................................599

4.2.2.3 Reset Generation Logic ........................................................................................................604

4.2.2.4 SC7 Hardware Sequencers ..................................................................................................624

4.2.2.5 Wake Engine..........................................................................................................................627

4.2.2.6 Pad Controls..........................................................................................................................642

4.2.2.7 Voltage Monitoring Support.................................................................................................643

4.2.2.8 Clock Monitoring...................................................................................................................643

4.2.2.9 FSI Rail Clamp.......................................................................................................................644

4.2.2.10 AO Power State.....................................................................................................................645

4.2.2.11 CV Power State .....................................................................................................................645

4.2.2.12 CCPLEX Power State ............................................................................................................645

4.2.2.13 GPU SRAM Control ...............................................................................................................645

4.2.2.14 SRAM Controls......................................................................................................................646

4.2.2.15 Power-on-Detector (POD).....................................................................................................646

4.2.2.16 Security Canary Path Monitor (SCPM) ................................................................................647

4.2.2.17 Storage Space.......................................................................................................................648

4.2.2.18 LED Blink and Breathing .......................................................................................................649

4.2.3 PMC Programming Guidelines...........................................................................................................650

4.2.3.1 SC7 Hardware Sequencer ....................................................................................................650


<details>

<summary>OCR (Page 5)</summary>


```text

3.6.1
3.6.1.1
3.6.1.2
4.1
4.1.1
4.1.1.1
4.1.1.2
4.1.1.3
4.1.1.4
4.2
4.2.1
4.2.2
4.2.2.1
4.2.2.2
4.2.2.3
4.2.2.4
4.2.2.5
4.2.2.6
4.2.2.7
4.2.2.8
4.2.2.9
4.2.2.1
4.2.2.1
4.2.2.1
4.2.2.1
4.2.2.1
4.2.2.1
4.2.2.1
4.2.2.1
4.2.2.1
4.2.3
4.2371
ont Ona sr WN | OC
Boot and Power Management
Boot Process
OVEFVICW...ecsecseeseessesseessessessecsuccuseseceucsueeaceeuceueesessnccueesseseccussueeacesucsuesaceseseusesesanseueeaeesesseseeseateeeeseeeateeeseeegsnge
SMMU Configuration ...........ccccccccesesceseseeseseeseseeeeseesesecsesecseeecseecseecsesseecsesesseeesseeeseeectaenlyes
Str@@MI Do... ceceececceecescesceeseecceceeceeseeseesecaececeececeeecaecsecsecseseeeeeeeeeeeeeesseeaeeaesaeeeeteesegsatettgfeceaees
Overview......
Boot Code Terms
Boot Flow and Branches. ...........ccececeeessseececeseseseseeeeseseseaescacecsescsleedegiuecseseseaeeeeseseseeeeeeeeeeeees 582
Boot Code Stage ......ccccccccecescssessesesseseseeseeeeseecescecseesessescseeseplecet@hcsceseeseseeeeseeseeeeseeeeseeeeseees 582
Boot Devices (Boot SOUFCES) .........ceceececsceseeeeseseseceseeeescacanaeDbaadecececsescacaeseseseseseseeeseeeeeeateneees 588
Power Management Controller (PMC).....ssscssssssssssssessafitieqgeessecesneesesssssseeesntesessnneesesnneesessnnaeeetees 593
OVELVICW....cesseessessstecstessneesecsseeeatecasecsnessecssceranesssessnesatecsucedhesntbpaeesatecsuessntesueesseesatessuessntesueeseeeraeessseesseenees 593
PMC Functional D@SCriPtion .0.....ceccecseeseessessesstesseesesee Mecsesescesesaeeeucsuseseeeuseueeateeeseeeaeeanseseneeeteeseeteases 595
Reset Generation LOGIC ..0.........cecceeescesceeceespeteecanlececeseeseeseeeeceececeeeaeesecaeeaeeaeeeeseeseesereeeeateas 595
PMC System Reset Generation ............ seas kecneesceecseeseseeeesecseeescseeseseeseeesaeeeseeeseeesseeeeeeeaeees 599
Reset Generation Logic ....
SC7 Hardware Sequence’ ..........:.cccieMecesessesesceceseesceceseseeseeseseeecseeecsecsesecsesecseeseseeesseeaeeesatee 624
Wake Engine........ecccecccceccssescssesesslofipucescescescseeseseeeceecsesecsesesseeecseecsesaesecsesecaesesaeeesseeeesesaeeeeate 627
Pad Comtrols.........cecscsssscecesesefiepleceeesesesescecececeseseseeeseeeseseaescecaeseseaeseeececseaeaeeeeeeseseaeaeneeeeeeaeas 642
Voltage Monitoring SUPPOPta 0.0... cecccceecsescseeseseeseeecseeecseeeeseeeeseeececsesecsesesseeesseeesseeaeeeeaeee 643
COCK MONitoring.......... Dae eeccceccccesesceceseeseseeseseesesecseccseccseeseseeseseeseeecsesecseeecseeseseesseeseeeeaeees 643
FSI Rail Clarmp 0.20... ee ececccceceseeceseesesesesceseseescsecsecesesecseesesecscseaesceseecseeeseeseeeseeeeaeeeeaeees 644
AO Power State . 22cei...cecececccscesceesseeessceesseescseeecseecesaceesaceesseeecseeecseaeeesaeeesaceesaeeeseeeessesaeeetate 645
CV POWE Stat@ yn... cece ecsceseeecseeseseescseescsecscsacaeeecseeesaeeacseeseseeeeeesaeeasaeeesseeeseeeeseeeaeeesaeees 645
CCPLEX Power State oo... eee ccccseeeeseesceeesesecscsecaeeecseeecseeecseeseseeeeeesaeeesaeeeseeeeseeeeeseeaeeeeaeees 645
GPU SRAM Control .
SRAM COmntrols 00... eceecceseceeececesescseseeeeescececscecsceecacaceeseseecaeececsescescaeaeeeeeetsceeeeeeeeeeeeeaeeeeeeees
PRower-on-Detector (POD) .........:.:cecsssecesssssesesseseceseseseseseaesescseseeensecsescacaeseseensesnseeesaeetaceteeeees 646
Security Canary Path Monitor (SCPM) .........::s:secscesscseseseseseeecececseseecaeseseeseseacecseeeseeneeeeeeees 647
StOraGe SPACE 0... eeeeeeccecesceseesesseeseesecseceeececeeeaecsecsecsesseeeeeeeeeeeeeeeesecaeeeeeeeeeeeeseeeeaeeeeates 648
LED Blink and Breathing ...........ccccccccceessecceseseesesesecseeceseeccsecsesecseseeeesecseecseesseeseseeseseeseeeeaeees 649
PMC Programming Guidelines... eecsessesssessesseecsecsueesseesseesasecsesseeseesseeratesssesseeneeseeenntesse 650
SC7 Hardware SQquencer ............ccecccsesssessesseseseeceseesesecseseeseeeeseeecseeecsesseeecsesesseeeeseeessesaeeeeaeee 650

```
</details>


<!-- Page 6 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

4.2.3.2 Wake Engine Programming..................................................................................................655

4.2.3.3 Thermtrip Programming Guidelines ....................................................................................661

4.2.3.4 Power Gating Controller .......................................................................................................662

4.2.3.5 Pad Control Programming....................................................................................................666

4.2.3.6 Voltage Monitor Reset and Interrupt Enabling Guidelines .................................................667

4.2.3.7 Frequency Monitor Programming Guidelines .....................................................................668

4.2.4 PMC Registers..........................................................................................................................................670

4.2.4.1 PMC IMPL Registers.............................................................................................................670

4.2.4.2 PMC Wake Registers ............................................................................................................874

4.2.4.3 Scratch Registers..................................................................................................................887

4.2.4.4 PMC Miscellaneous Registers .............................................................................................941

4.3 Boot and Power Management Processor (BPMP) ........................................................................951

4.3.1 Overview......................................................................................................................................................951

4.3.2 BPMP Functional Description ............................................................................................................951

4.3.2.1 Conventions of Units ............................................................................................................951

4.3.2.2 Glossary.................................................................................................................................952

4.3.2.3 Arm Cortex-R5F Processor Overview ..................................................................................953

4.3.2.4 CCPLEX Power Management Interaction............................................................................965

4.3.2.5 BPMP Cluster Reset and Clocking.......................................................................................966

5. CPU Complex (CCPLEX)..............................................................................................................................969

5.1 Overview.........................................................................................................................................................969

5.1.1 Reference Documentation ..................................................................................................................969

5.1.1.1 List of References.................................................................................................................969

5.1.2 Glossary.......................................................................................................................................................970

5.1.3 Conventions of Units .............................................................................................................................972

5.2 CCPLEX Functional Description ...........................................................................................................972

5.2.1 Architecture Overview...........................................................................................................................972

5.2.1.1 Key Features..........................................................................................................................973

5.2.1.2 Architecture Summary..........................................................................................................973

5.2.1.3 CPU Clusters .........................................................................................................................975

6. GPU .....................................................................................................................................................................982

6.1 Overview.........................................................................................................................................................982

6.1.1 Streaming Multiprocessor (SM)........................................................................................................983


<details>

<summary>OCR (Page 6)</summary>


```text

4.2.3.2
4.2.3.3
4.2.3.4
4.2.3.5
4.2.3.6
4.2.3.7
4.24
4.2.4.1
4.2.4.2
4.2.4.3
4.2.4.4
4.3.1
4.3.2
4.3.2.1
4.3.2.2
4.3.2.3
4.3.2.4
4.3.2.5
5.1
5.1.1
5.1.1.1
5.1.2
5.1.3
5.2
5.2.1
5.2.1.1
5.2.1.2
5.2.1.3
6.1
Gel
Wake Engine Programming. .........ccccccecscsssessesesseseeeseecesesesseeseseeecseeecessesessesecaeeesseeeceeeaeeagenge 655
Thermtrip Programming Guidelines ............ccceccecccceseseeeeseeeeeeseseeseeeeseecseeesseeesseeeeseestenlyes 661
Power Gating Controller ...........cccccccccesessesceseseeseseeecseeeeseeecsecsesecseseeeeeecseeecseeessecseeenaateatgfeeseees 662
Pad Control Programming. ...........ccccccecessescesesceseseeecseeceseeccsecseseeseseeseeceseeecseeeesegfenscseseeeeseees 666
Voltage Monitor Reset and Interrupt Enabling Guidelines .........0.... cect degteeeseeeeeeeeeeeee 667
Frequency Monitor Programming Guidelines ............:.csssceseseseeeeeeesedpelecpieteseseseeeeeeeeeeeees 668
PMC ReGIStEIS .... se eecseecssessseesseesstecsseesstessesseeeseecsuccsatssueesseesstessuessneesuessueesatessuggafundslpeseesatesseesseesaeesseesnteate 670
PMC IMPL ReGiSters..............ecceccescescesceseeceeseeececceeecsecaeesecaeeeceeeeecelpeleaputeaeeseeaeeeeeeeeeesereeeeateas 670
PMC Wake R@GiStefPs .........:.cccccecessesesseseseeseecescecesesecseeccsseccstesepllecet@hceeseescseeesseeseeeeseeeeseeeeaeees 874
Scratch ReGiSters..........cccccccesesecssesesseseseeseseescseesesecsesecsesaqectbagbeceseeseeesseesseeecseeeseeeseeeaeeeeaee 887
PMC Miscellaneous ReGiSters ............cccccccecessecesceecseesq{ibeqeeeseseeseseeseseeseeecseeeeseeseeeseeeseeeeaeees 941
Boot and Power Management Processor (BPMP) .4....)-csssssssssssstssssssessesssteesessnetteceeseesessnnsseetees 951
OVELVICW....cesseesecsstecsessueessecsueeeatecssessnessecssccsanesssessseeasecsie Mesesutesseesaecsuessntesueesseesanessuesaneesueesuceranessueesneeaees 951
BPMP Functional De@SCIription «20... cccecseecsessessptPecccnedcccsessecseeesesseeencsueeseesseeeateseseueeseeseseeseeeeeteeeenteases 951
Conventions Of Units 0... eee eeeeeeeesesesesmman Mbesecseseseeeeseseaeseecececescseeeeeeceeaeaeacaeeeeeeseseaeeeeeeetaees 951
GOSSALY oo. eeeececeeesesesescecececesesencecseseagn Mta(heceseseseseeseseseseaeseeeseseseaeseeeceeseaeaeeeeeescseseaeeeeeeeeeeas 952
Arm Cortex-RSF Processor OVErVieW 4.8... eceeeeceesesceesseeesseeeeeeeecseeeseesaeeesaeeesaeeeseeeeseeeaeeetaee 953
CCPLEX Power Management INteraction.............ecceeceecesceecceseeseeeeeeecaeeseeaeeaeeeeeeeeeeeereeaeeaeeas 965
BPMP Cluster Reset and CIOCKING.............cccccecescescssesesseseseeseeseseseeseseeseeecseeeeseeseseeseeeseeeeseees 966
CPU Complex (CCPLEX) ....ccssssDeasesssssecssseessssecssseessssecsssesssssecssusessssecssnsessssecssasessuuscssasesssnecssnsessanecesssessaneces 969
OVELVICW....ceeesseesstecssessetessesnnlapDoecssuessnecssecsnsecseesseesecsueesutesueesseesanecsuessueesueesusessnecaessueeauecsueesutesneesuieeaeeaneeses 969
Reference DoCUMENtation ........cssescssssscsseesesssscssneecssesessnteessueeesneessueessaseessueeesneessneeesneeesuteesneeeesnneesase 969
List Of ReferenCeSyce oe. ceeeceseseeseseseseseseeceseseseseseseseseseseseaeecseseseaeseeeeecaeaeaeaeeeeecseseaeeeeeeetaees 969
GIOSSALY....eesseeaeeeg Pecseecsesseeseecuccueescecucsuesasecuceueesesanccuscasesecussaeeaeeeassuesacesussusesessseusseeesessaseeteateessteateaneeseatees 970
CONVENTIONS.OF UN its... eeeeessseeessseessseeeesseessneecsnseesssscesnseessnscessueeessseersueesnscessuteesaseersuteesaseensuteesaseessnsss 972
CCPLEX Funtetional D@SCription .......ceccecsesseessessesstessessessessesseseusesesseseessaeeaeesesseeaeeeeseeseanesnseeseaneateeneeees 972
Architecture OVErViOW.....esseessessseesstecseesseeseesseesntesssessneeseesucesstessessessecsucesatesuiesieesnieesuessntesuieseeennnees 972
K@Yy FOatures eee ceeecseesceecseeecseeecsececseescseescsacseesseeesaeeaseeeaseeeaeeasaeeasaeeeceesseeesseesaeeesatees 973
Architecture SUMIMALY...........ecccecescecesssesesesceeeceeeeesesceceeeseceeseseeeseeeseaceeeeeeeeestaceeeeeeeeeseeeeeeeeees 973
CPU CIUStErS oon. eeceececeseseseseseeesesesesesescecececeseaeseseseeseacaescuseseseseaeseeessrstacaeseeeecseseaeeeeeeetetas 975
Overview......
Streaming Multiprocessor (SM) ....sssscssssssssssssssseessesssseessessnseseecssssseessuseeeesnuesssessnteseenneseessnsteessaees 983

```
</details>


<!-- Page 7 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

6.1.1.1 Third-Generation Tensor Core..............................................................................................985

6.1.1.2 2x FP32 Processing..............................................................................................................986

6.1.1.3 Second-Generation Ray Tracing (RT) Core .........................................................................987

6.1.1.4 Larger and Faster Unified Shared Memory and L1 Data Cache.........................................988

6.1.1.5 Texture (TEX) unit.................................................................................................................988

6.1.2 PolyMorph Engine...................................................................................................................................989

6.1.3 Raster Engine............................................................................................................................................989

6.1.4 L2 Cache .....................................................................................................................................................989

6.1.5 Host Interface...........................................................................................................................................989

6.1.6 MSS Interface...........................................................................................................................................989

7. Multimedia Complex....................................................................................................................................990

7.1 Host Controller............................................................................................................................................990

7.1.1 Overview......................................................................................................................................................990

7.1.1.1 List of References.................................................................................................................990

7.1.1.2 Glossary.................................................................................................................................990

7.1.1.3 Relevant Chapters in the TRM..............................................................................................993

7.1.1.4 Features.................................................................................................................................993

7.1.2 Functional Description..........................................................................................................................994

7.1.2.1 Channels................................................................................................................................994

7.1.2.2 Classes ..................................................................................................................................994

7.1.2.3 AXI Interface Block ...............................................................................................................996

7.1.2.4 Syncpt (Sync Points) Block ..................................................................................................997

7.1.2.5 Unit Activity Monitor (ACTMON)..........................................................................................999

7.1.2.6 Command Processor............................................................................................................999

7.1.2.7 Command DMA Block ........................................................................................................1000

7.1.2.8 Interrupt Logic.....................................................................................................................1000

7.1.2.9 Filtering out Kernel Commands from the Gather Buffer ..................................................1002

7.1.2.10 SMMU Context Protection (StreamID Protection)............................................................1002

7.1.2.11 Direct Register Access .......................................................................................................1004

7.1.2.12 Error Detection ....................................................................................................................1007

7.1.3 Programming Guidelines................................................................................................................... 1008

7.1.3.1 Channel Programming Model ............................................................................................1008

7.1.3.2 Priority between Channels..................................................................................................1015


<details>

<summary>OCR (Page 7)</summary>


```text

6.1.1.1
6.1.1.2
6.1.1.3
6.1.1.4
6.1.1.5
NN DDD
ou BR Ww
7.1.1.1
7.1.1.2
7.1.1.3
7.1.1.4
7.1.2
7.1.2.1
7.1.2.2
7.1.2.3
7.1.2.4
7.1.2.5
7.1.2.6
7.1.2.7
7.1.2.8
7.1.2.9
7.1.2.10
7.1.2.11
7.1.2.12
7.1.3
7.1.3.1
7.We322
Third-Generation Tensor Core........cccceccccsscssesesseseseeseescsesesseeseseeecseeeceecseecsesesseeeeseeesseeaeeagenne 985
2X FP32 PrOC@SSING .........ecceccesceseeseeseeseeseeeceececceceaeesecsecsecseceeeeceeeeeecseeseesesaeeeeseeseesersetstaeslpes 986
Second-Generation Ray Tracing (RT) Core ..........ccccecsssesesesesesesecseseeeseseseseescacecseegaateatafesesees 987
Larger and Faster Unified Shared Memory and L1 Data Cache.............:seegeesMeneeeeeereeeee 988
Texture (TEX) unit...
PolyMorph Engine...
Raster Engine
L2 CACHE ooo eeseeesseeeesseeessseeessseeessetessseesssntessseeessnesssneessaesssueessaesssueessaecssnensalgeljegiisatecsseeessstecsseenesneeesssenssaee
HOSt INter face... ecceccsesssesssssssesssecsscsssecssessseeeseecsuccssecsuesesecessecsuscsnecsssaghibessstlecssneessessueceneesueeeseessesesseesneeese
MSS INterface on. ecccccsessssesssessssecseecssscssecsnessseeesecsuccesecsueceseeessccsuscsnqasnlbaaglessesesessnecsueesucceseesseeeseesseeeeseesnseese
Multimedia COMplex uu... cecsecceecsecsesseessessesseessessesenseseeseseucsaesanesasepfiteeguesseeaeesnseneeaneaseeessaeeaeeessteateeeseeseateaneeees
Host Controller .....eecceccecsecssecsessesseessessesssssesscsenseaneaeseassaceanseadheesslfesssuseaesseeeassaeeaeeeussaeeaseeseeeatessenseateanseaseees
OVErVICW...ecseccecsecssesseessesseeseesuccueeseceucsueeacesucesecaesancsuesaneascens Meresteussueeacesussueeansanseueeaneaeseeseeteateesseeaseeaseeeatees
List Of REFEPENCES 0... eee eccececcesescecececeseesesegOFeccae) ceseeceseeecsecsesecseseesesecseecseeecseeseeeseeeseeeeaeees
GOSSALY ooo. eeeecececesesesescecececesesentecsesevssasssmag lbevecseseseseseeseaeaeeceesseseseaeseseeeeseaeaeeeeeeeseaeeeeeeeeeeaees
Relevant Chapters in the TRM.
FOAtUreS oo. eee eceeeeeseeeceeesceesceecaeeagsmlelicssceecscseescsacaeeevseeevseeacsecsceeeaeeasaeeesaeeeceeaseeesseeaeeeeaeees
Functional D@SCriPtion «2.2... cece Qigeeeeseecsessecsessecsesneesessseucsaeeseeeucsuteseesassueeaeeeeseueeatesesensenteateeeeeeeases
Channels... eececececesesescececesefopep eeseecsesescecececeseseseeeseseseaeaeececceseseaeseeeeeeaeaeaeeeeeeseseaeaeeeeeeeeeeas
CLASSES ooo. eecececececesesesceesDDapheseseecsessscacsceesessseseaeseseeeseseaescecesescseaeseececseaeaeeeeseseseaeaeeeeeeseeees
AXI Interface BIOCK ......0 Dye. eeeceeccecseesesesescseseececesescaeseeeeseescseseeeeeeeseaeaeeeeeeteeaceeeeeeeeeeeaeeeeeees
Synept (Sync Points) BIOCK .0......eececececseseseseseeeeeesesescsesesesceensececseaeacsesesesseaeeesceeeeseeneeeneneeees
Unit Activity Monitor (ACTMON) ..........cccceseceesesesecesesesscseseseseseeeencecscscacaesesesesteseceseeeeecateneees 999
Command ProceSSOl...........scesesesseseseseseseceseseseseseseeeeesesesescececeseseseeeeeeeeseaeaeaeeeeeeseaeaeeeeeeeeaeas 999
Command. DMA BIOCK ..0......ececeesecesesesesesesceceseseseseeeeeseseseseacecseseaeaceeeeseeacaeaeaeeeeseaeaeaeeeeatetes 1000
Interrupt Logic
Filtering out Kernel Commands from the Gather Buffer ...............cecececeseeeeeeceseseeeeeeeeeeees 1002
SMMU Context Protection (StreamID Protection) ..........:ccececscseseseseseseeeeeeeseseseeneeeeeeeees 1002
Direct Register ACCESS .........ececceccescescessessceseeseesceeeeseeseesecsesseesacecsaeaecaesaecaecaeeeeeeeseesereeaeeaes 1004
Error Detection oo... ce ceeeeeescseescesssceesscsecsceecsceecsesacsesacsesacacscecsesecsesacesseaesaeeesseeeseeeaseteaes 1007
Programming GUICeliN@S ...... ce eessecseesessseesseessecsseesetesseesstesstecseesuessueestecstessessueesueesseesateeaeennees 1008
Channel Programming Model .............cccceccesssessesesecseeeeseeeseeceseeecseeecsecsesesseseceeecseeecseeeeseeees 1008
Priority between Channel s............ccccecescsescesesesesesesteseseseseneaccesesesesceeeeeeeacaeaeaeeaeseseaeeeeeeeeeees 1015

```
</details>


<!-- Page 8 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

7.1.3.3 ACQUIRE_MLOCK ...............................................................................................................1016

7.1.3.4 Syncpt Protection................................................................................................................1016

7.1.3.5 DMA Commands.................................................................................................................1018

7.1.3.6 Progress Status...................................................................................................................1020

7.1.3.7 Programming Model for MMIO-Based Clients (Single MMIO Range).............................1020

7.1.3.8 Programming Model for MMIO-Based Clients (Multiple MMIO Range)..........................1021

7.1.3.9 Host Controller Class..........................................................................................................1026

7.1.3.10 Class-based Programming.................................................................................................1027

7.1.3.11 Context Switching...............................................................................................................1027

7.1.3.12 Specific Programming Guidelines .....................................................................................1028

7.1.4 Host Controller Registers................................................................................................................. 1032

7.1.4.1 Common Registers .............................................................................................................1032

7.1.4.2 Host Controller ACTMON Registers ..................................................................................1188

7.1.4.3 Host Controller Channel/Syncpt Registers .......................................................................1275

7.2 Camera Subsystem ................................................................................................................................ 1725

7.2.1 MIPI Camera Serial Interface (CSI)................................................................................................ 1725

7.2.1.1 NVCSI CORE ........................................................................................................................1728

7.2.1.2 NVCSI SCIL..........................................................................................................................1738

7.2.1.3 NVCSI Registers..................................................................................................................1746

7.2.2 Video Input (VI)...................................................................................................................................... 3095

7.2.2.1 Overview ..............................................................................................................................3095

7.2.2.2 Functional Description........................................................................................................3099

7.2.2.3 Video Input Registers..........................................................................................................3136

7.2.3 Real-Time Camera Engine (RCE)..................................................................................................... 4526

7.2.3.1 Overview ..............................................................................................................................4526

7.2.3.2 Interrupt Controller..............................................................................................................4530

7.2.3.3 Timers..................................................................................................................................4530

7.2.3.4 TCM Interface .....................................................................................................................4530

7.2.3.5 ATCM Interface...................................................................................................................4531

7.2.3.6 BTCM Interface ...................................................................................................................4533

7.2.3.7 Interrupts .............................................................................................................................4535

7.2.3.8 RCE Fabric ...........................................................................................................................4538

7.2.3.9 DMA Controller....................................................................................................................4541


<details>

<summary>OCR (Page 8)</summary>


```text

7.1.3.3 ACQUIRE_MLOCK occ ececececesesescseeeeeeesescecscseecesescseaeeeeecensssceeeceeeeeseaeeeeeeeseeateceeeeeeeeeseeeeeagng
7.1.3.4 SYNCpt Protection... eee ssesesseneeseeececeecseeeesesacseescsessceecseeeeseacseeesseeesaeseseseseeeeeeetaeely
7.1.3.5 DMA Command. ..........sceceseseseseseeesesesesesescececescseaesesesacaeaeaeececesescacaeeesteratacaeeeeeeseegaateatgfesees
7.1.3.6 Progress Status........ccccecccesceccecceseeseeseeseeseceeceeceeceecesecaecsecseceeeeeseeceeecaeeaesaeeaseasegfessAoeseseeaeeaes
7.1.3.7 Programming Model for MMIO-Based Clients (Single MMIO Range)....
7.1.3.8 Programming Model for MMIO-Based Clients (Multiple MMIO Range).).3=.........-
7.1.3.9 Host Controller Class... .cecececeseececeseseseseeseseseseseeeeseseseaeseaeacesesescscacapeliual peceseeeeeseseeeeeeeeeeeees
7.1.3.10 Class-based Programming. ...........ccccceccssescssesesseceeecseeecsesessescesssesslosoapitsecsesecseeeeseeeeseeeeeeees
7.1.3.11 Context SWItChiNg ........eceeceeceeeceseeceseeseseeceseeecsceccsecseecseseeseeseslecstVhcsecsesecsesesseeecseeecseeseeeeees
7.1.3.12 Specific Programming Guidelines ..............cececeeeceeessesesepeeDieadeceseeeeseeseseeeeseeseeeseeeseeeaeees
7.1.4 Host Controller REQiSters oc eeessesseestecseessesssesseeseteapllbeugeatecseeeseeesneeseeniecseessueesneesternneeaeeenne
7.1.4.1 COMMON REGISTETS ..........:ceccecceeetceseeseeeesceecceccecceeeedecsslpecsecceeeceeceeeeaecsecsecseeseeeeseesersereeaeeaes
7.1.4.2 Host Controller ACTMON ReGisters ..........::ccccceceeMessesceseseccsceccseeecsecsesessesecseeeeseeecseeeeseees
7.1.4.3 Host Controller Channel/Syncpt Registers .per..)..eseccsesceceseseseeeececeseseseseeeeceseeeeeeeeeeeeeees
7.2 Camera Subsystem
7.2.1 MIPI Camera Serial Interface (CSI)
7.2.1.1 NVCSI CORE
7.2.1.2 NVCSI SCHL. eeeecesescecececesesesthodipeesescscsceceseseseseseesescseseaeseaeseseseaeseeecacacaeaeaeeeeseseaeeeeeeetetes
7.2.1.3 NVCSI ReGiSters .........cceecees (pig becesceseeseesececceececcecsecsecsecsesseeeasceseceaecsesaesaecaeeeeseeseesereeaeeats
7.2.2 VIdEO INPUT (VI) ..cceeccsesscssesccsseDbagsccsssccssseccsssecssssccsssecssusccsssecssueccssssessusscssssessusccssssessueccssasesssueessnsesssneessnee
7.2.2.1 OVELVIOW ones eceeeeeee ened QM ecsceeceecaceecscsessesecscacsceeceesaesesacsesaceacscsassceecsesaceesacaesaeeesaceeeeesaseteaes
7.2.2.2 Functional De@ScriptiOner...........cccceccccecessescseesessecesecsesecseseesesecseecsesecsessesessesecseecseeecseeeeseeees
7.2.2.3 Video INpUt REGIStEFS........... ee eececceeeseseseseseseececeseseseseseeeeeeetstscseeeeeecescaeeeeeetetateceeeeeeeeeseaeeeeees
7.2.3 Real-Time Camera Engine (RCE)......s::sssssssssssssssesssssesssnesseesnseesesssntsesesntesesssnseessnttesessnneseeseensees
7.2.3.1 OVELVIOW jou decececeseeessceeceeseseeeesesacsesscsesscsacscsacscecsesacsesacsesacacscasscsecsesacaeeacaesaeesaceeeeseaeeteas
7.2.3.2 Interrupt Controller..
7.2.3.3 THMOTS oe eeeecceeesceeesceeesceecsceeesessesecscseescsecacsecscsecaesaesesecsesecsecsceessesacaeeesaeeesaeeaseeeseeeeeeesaeees
7.2.3.4 TOM nterface oo... eececececscesesesceeeeeesesescscscecececsceesesesensvaceeeeeeeeescaceenenesesaeaeeeeeeeeeeseeeeeeees
7.2.3.5 ATOM Interface... eececcecececssesescseeesesesessscecseececeecscseseseetsvsceeneesesescaceeeenecesareceeeeeeeseseaeeeeees
7.2.3.6 BTCM Interface oo... eeeecececeseseseeeesesesesesesesecesesesesesesacseseaeaeeseseseseaceeeeeeeacacaeaeeeeeeseaeaeeeeetetes
7.2.3.7 IMTOPPUPtS oe. eeeeeeeecesceeceeceeccececeeseeseeseeseceacsececcececsecsecsessessecsceseseceeecaecaesaeeaeceeseeseesereeeeaees
7.2.38 RCE Fabric oo... eeeeeeceseseesececeseseseseeeesesesesescececeseseaeseseescseaeaeeeeceseseseaceeeesecacaeaeaeeeeseaeeeeeeeeetees
7.2239 DMA Controller... ceeeeeeseseseseseseeeeseseseseseecsceceseacsceeseacaeaeseaeessesescaceeasacacaeaeaeseseseaeeeeeeetenes

```
</details>


<!-- Page 9 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

7.2.3.10 Address Translation............................................................................................................4542

7.2.3.11 Shared Mailboxes ...............................................................................................................4542

7.2.3.12 Timekeeping Unit ................................................................................................................4542

7.2.3.13 Interrupt Timestamp...........................................................................................................4544

7.2.3.14 Power Management Module..............................................................................................4544

7.2.3.15 Reset and Clocking .............................................................................................................4544

7.2.3.16 Clocking...............................................................................................................................4545

7.2.3.17 Debug Interface...................................................................................................................4546

7.2.3.18 RCE Debug...........................................................................................................................4546

7.2.3.19 Programming Guidelines....................................................................................................4556

7.2.3.20 RCE Registers......................................................................................................................4557

7.2.4 Image Signal Processor (ISP)........................................................................................................... 5117

7.2.4.1 Overview ..............................................................................................................................5117

7.2.4.2 Frontend ..............................................................................................................................5118

7.2.4.3 Pixel Reconstruction Unit ...................................................................................................5120

7.2.4.4 Affine Transform.................................................................................................................5121

7.2.4.5 Lens Shader.........................................................................................................................5122

7.2.4.6 Area Processor....................................................................................................................5123

7.2.4.7 Down scaler.........................................................................................................................5126

7.2.4.8 Sharp....................................................................................................................................5128

7.2.4.9 Transfer Function................................................................................................................5129

7.2.4.10 Local Average and Clip.......................................................................................................5129

7.2.4.11 Histogram............................................................................................................................5130

7.2.4.12 Flicker Band.........................................................................................................................5131

7.2.4.13 DMX .....................................................................................................................................5132

7.2.5 Display Control Engine (DCE) .......................................................................................................... 5133

7.2.5.1 Overview ..............................................................................................................................5133

7.2.5.2 Programming Guidelines....................................................................................................5163

7.3 Video Image Compositor (VIC)........................................................................................................... 5164

7.3.1 Overview................................................................................................................................................... 5164

7.3.1.1 Use Cases............................................................................................................................5166

7.3.1.2 Hardware Description.........................................................................................................5167

7.3.1.3 Pixel Format Conversion ....................................................................................................5169


<details>

<summary>OCR (Page 9)</summary>


```text

7.2.3.10 Address Translation. ..........ccceccceccsssssseseseseseeceeesesescaceeeceecensvsceeeeeeeeescaeeeeeeeeeareceeeeeeeeeseeeeeagg
7.2.3.11 Shared Mailboxes 20.0.0... eeeecececesescseesesesesesceesceeeceescaeeeeeeeetsvsceeeeeeecscaeeeeeeesetateceeeeteeseseedtesd
7.2.3.12 Timekeeping Unit... cece ccecceceseesessesesecseeecseseeseeseseescseeseecseeesesecsecseseeecsecseeeesuaateapgeeees
7.2.3.13 Interrupt TIMESTAMP «0.2... ee ceceecceeceseeseeseeeceeececeeceeaeesecseeseeaeeeeceeeesceseeseeateateaseegfeseAerseeteeaees
7.2.3.14 Power Management Module...
7.2.3.15 Reset and ClOCKING .........cccceeceecesseceseesesesseseeseseecesecsesecsesesseeceseecsesecsesatshgs spiceecseeeeseeseeeeees
7.2.3.16 CLOCKING 0... ceeeeececcsceceseescceseseecesessesecsesecsessesesecsesecsecsesecsesesseecsesecsssepelad pessesseeesseeeeseeeeeeees
7.2.3.17 Debug Interface... ccc cccceceeseeseeseseesesesseseeseseeecsesaesecsesesseeecsesesaloseapicsecsesesseescseeeceeeesesees
7.2.3.18 RCE Debug... eeeeeeeeseecececeseseseseeseseseseacscececesesescacseestsrstscaceeeahleestheseeseeseseaeestseseseeeeeeeeeteees
7.2.3.19 Programming Guidelines.............ccccceccceesessecessecceecseeeesesseges Maadecseeesecsesecsesesseeesseeecseeeeeeeees
7.2.3.20 RCE ReGISters.........eceeeeeccescesceeceeeseeseeseesececceccceeeesesamfileqecseeeeeeeeeeceaeeaeeaeeaeeaeeeeeeeseesereeaeeats
7.2.4 Image Signal Processor (ISP).....s:ssssssssssssssesssseessessserens eecesnsesessnseeeceeneesesssnseeessanteeesenneseeeseeteees
7.2.4.1 OVELVIOW 0. eecececeesseeeceescsceecsesacsesscsesaceasacacsceessdMGcnesacsesecsacscsacsceecsesaceesacaesaeeesaceeeeesaeeeeaes
7.24.2 FrOMten o.0... ee eeecececesesesescecececeseseseeeecesesescaeeesapOscsaal csseescseseaeececeseseseeeseeeeseacaeaeeeeeseseaeeeeeeetaeas
7.2.4.3 Pixel RECONStrUCTION Unit... eee eesesesenan Mbesecseseeeeseseseseseneeceseseseaceceeeeeseaeaeaeeeseseaeeeeeeetees
7.244 Affine Transform.
7.24.5 L@NS SHAM... eee eeeseseeceseeeseseseseenestbe ececececeseseseseeeeseseseseaeseseseseaceeeeeseaeaeaeaeeeeseseaeaeeeeeteees
7.2.4.6 Alea PrOC@SSOM 0... ceeeccecesseseeesessolipeseseesesecsceecscseesesaeseescsesacecsceeesesacseeesseeevaecaseeeseeeaseesatees
7.2.4.7 DOWN SCAIEP 0... eeeeeseseseseececesedopepbeeeececescsescececesesesesesesseaeseaeacseseseseaeeeeseseaeacaeaeseseaeaeeeeeeeteees
7.2.4.8 SWAMP... eeeecceccsesceccseseeseseess Diag ecescesesecseseceesecsesecseseesecaeseecsecaesecseseesesaeseceeseeessecaeeeeseeeeeeeeeaeees
7.2.4.9 Transfer FUNCTION .........0 2 ee ccecececcececeeeeesesescecsceceseseseseeesecensesceeeceeeeseaeeeeeeesetarsceeeeteeeeseseeeeees
7.2.4.10 Local Average and Clipe... cccccccceccsesscssescseescsecsesecsesesseseeseecsesecsecaesecseseseeesaeeecseeeeseeees
7.24.11 HiStOGFAIMN 0.2... Deere eeceeccecceccecceaeeseeseeseesecsccsccsacececsecsecsecsesseeasacceaeeaesaesaecaeeeeceesersereeaeeaes
7.24.12 Flicker Band... cso. eeeeceseseeseseceseseseeeesesesesesescececsseseseseseacseseaeacseseseseaceeeeacacaeaeaeeeeseseaeeeeeeeteees
7.2.4.13
7.2.5 Display Control Engine (DCE).
7.2.5.1 Overview
7.2.5.2 Programming Guidelines... cceeceesescececeseseseseeeseseseseseaeceseseseaeeeeeeseaeaeaeeeeeeseseaeaeeeeeeeees
7.3 Video Image Compositor (VIC) .....scssccsssssssssssesscsssstsscesseesesssnseseesnnsesessunsseesenseesessuesssessnteseseneseeseneess
7.3.1 OVELVICW....esseessseesseesseessseesnecsseesutesseesnesstecsueesueesueesutesatessuessueesueesueesanesaessueeanecsueesutesaeesutenaiecauessueesneeseees
7.3.1.1 USC CASS 20... eee cccccecsceeseeeseseesescescessceessesecacacscecsesaesesacsesacacscsasscsessesacsesasesaceessceeeaeeeenteaes
7.3.1.2 Hardware De@SCription ..........cccccceccecssesessescseesessescsesaesecsesessesecsesecsesecsecsesecseseeseecaeeecseeesseeaes
7.3293 Pixel Format Conversion ........:.ccccscecesesssseseseseseseseeeeseseseseacaesceseseseaceeeeeeeaeaeaeaeeeeseseaeeeeeeeeeeas

```
</details>


<!-- Page 10 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

7.3.1.4 Geometry Transform Processing.......................................................................................5187

7.3.1.5 Power Management ...........................................................................................................5190

7.3.1.6 Virtualization .......................................................................................................................5193

7.3.2 VIC Programming Guidelines........................................................................................................... 5194

7.3.2.1 Class Overview....................................................................................................................5194

7.3.2.2 Application Enumerations..................................................................................................5197

7.3.2.3 Application Memory Structures .........................................................................................5206

7.3.2.4 Application Methods...........................................................................................................5227

7.3.2.5 Method Naming and Programming...................................................................................5229

7.3.2.6 Programming Restrictions .................................................................................................5236

7.3.2.7 Performance and Power Tuning Guidelines......................................................................5238

7.3.2.8 Program Guideline ..............................................................................................................5242

7.3.3 VIC Registers.......................................................................................................................................... 5248

7.3.3.1 THI Registers.......................................................................................................................5248

7.3.3.2 FALCON Registers ..............................................................................................................5257

7.3.3.3 TFBIF Registers...................................................................................................................5353

7.3.3.4 Video Image Compositor (VIC) Registers .........................................................................5366

7.4 High Definition Audio (HDA) ............................................................................................................... 5476

7.4.1 Overview................................................................................................................................................... 5476

7.4.1.1 High-level Features .............................................................................................................5477

7.4.2 HDA Registers ....................................................................................................................................... 5478

7.4.2.1 FCPI Interface Registers.....................................................................................................5478

7.4.2.2 HDMI HDAC Registers........................................................................................................5500

7.5 Display Controller.................................................................................................................................... 5508

7.5.1 Overview................................................................................................................................................... 5508

7.5.1.1 Standards Supported..........................................................................................................5509

7.5.1.2 Glossary...............................................................................................................................5509

7.5.1.3 Relevant Chapters in the TRM............................................................................................5511

7.5.1.4 Features...............................................................................................................................5511

7.5.1.5 Modes of Operation............................................................................................................5525

7.5.2 Functional Description....................................................................................................................... 5531

7.5.2.1 Front End Host Interface ....................................................................................................5532

7.5.2.2 Clocks..................................................................................................................................5538


<details>

<summary>OCR (Page 10)</summary>


```text

7.3.1.4
7.3.1.5
7.3.1.6
7.3.2
7.3.2.1
7.3.2.2
7.3.2.3
7.3.2.4
7.3.2.5
7.3.2.6
7.3.2.7
7.3.2.8
7.3.3
7.3.3.1
7.3.3.2
7.3.3.3
7.3.3.4
7A]
7AAA
7A.2
742.1
7A.2.2
7.5
7.5.1
7.5.1.1
7.5.1.2
7.5.1.3
7.5.1.4
7.5.1.5
7.5.2
7.5.21
T5222.
Geometry Transform ProcesSing...........sscscecessseeeeeseseseseseeeeseseseseseeeeeeeeaeseaeaeeeeseseeeeeeeeesagen 5187
Power Managemen nt ...........:cecceccescesceseeeesccesceececceecsecsecsesseseeeeceeeeeaecaesaesaeeaeeeeseeseesresbaesly
VirtualiZation oo... eee cece cece ce ceecaeaeecececeeseeseseseaestensnesensssseasesssatensnsnsssassessesezendeabyasees
VIC Programming Guidelines...
Class Overview....
Application Enumeration ............ccccccccccescesseceseeseseeseseesesseccceseeceseeecsssselgelespusseeeseeeeseseeaeees
Application Memory Structures ..........ccesececesesesescseeseeeeeeesescececeeecesepeltuad fesseseeeeeeeeeeeseeeeeeees 5206
Application Methods.............cccccccessssessssesesceseeecseeceseeseseeseseeececcsseceles)eafiteseeceseeseeeeseeeeseseeaeees 5227
Method Naming and Programming ...........::ccceecccseseeeeseeeeseseMhlecstVhcseeseseeseseeseeeeseeecseeeeeeees 5229
Programming ReStrictiONns 2.0.2... cceececeeccesceccecceeeceeseeseeapes Diagdeceeeeeeecsesaeeaeeaeeeeseeeeetereeaeeaes 5236
Performance and Power Tuning Guidelines.............0. 00 ceeceeceseseeceseeseeeeseseeseeeeseeeeseeeeseeees 5238
Program Guideline 0.0.0.0... cccccccessecesceceseeceeeccsceccssedsorslpesesceccseccsesecsecsesecsesesseeecseeecseeeeeeees 5242
VIC REGISCOLS 0... eessecseeesstesstesssesssecsseesstessessssesstecsuecsueesneeslMcessecssecsuessneesseesatesaeessueestecsueesatesseesseenaecsneeses 5248
THI REQiSterS ........ ce eccceecceseeccecceceeseeseeseeseeeeeeg®¥sceag] cecseeseeseeaeeecseeeeeesaeeaeeaecaeseeeeeseeeeeeeneeaeeas 5248
FALCON ReQiSteP ...........cceccecceseeseeseeseesecanas Dbereeeceeeeseesecsecsecseeeeeecaesaecaesaecaesaeeeeseeseesereeaeeaes 5257
TFBIF Registers
Video Image Compositor (VIC) REGiSt@rs «0.0.02... scccesseceseseeesessesesesececeseseeeeacaeseseseenseeeeeeees 5366
High Definition AUdiIO (HDA) .......00-Cejecessssessssesseessessessescessseesessunseessesnseeessnneseesenneesessunateeseaneeeessnaseees 5476
OVELVICW....esseecsescsstesseessseessecsseessefinlag leeeatecsueesueesueesutesatessuessueesueesueesatesseessuesaecsueesunesneesuneeanecaesseeesneesneess 5476
High-level Features 0.0.00... 2 ececccccccescsesecseeecseeccsecaesecsesessesecsesecsesecsesaesessesesseeecseeecseeeeseeees 5477
HDA ReGISteIr oo. ee eee cc tecseesseeesseesutesntecsessseesecsueesatesseesutesstecseesueesuessutesatessuessueesueesseesateeaensee 5478
FCPI Interface ReGiSte@rs...........ccccecccceesssscssesesseseseeseecsesessesecsesecsesecsessesecsesesseeecseeecseeeeseeas 5478
HDMI HDAC ReQiStePrs «00.0.0... ceceeeeceseseseseseceseseseseseecseeseseseseaescseseaeaceeeeeeacaeacaeeeeseaeaeaeeeeetees 5500
Display COntrollety.t...ccsecseecsecsecsessessesseessessessesssesseseusseceseesucsuesseesussueeaeesesueeaneaeesesseseseesseeeeaseeeseeteateaesees 5508
Overview
Standards*Supported.
GIOSSALY oes eeeeecesecesesesececeseseseseseessseseseaeseecesseaeaessseacaeseseaeesesescacaceeeetacacaeaeaceseseseaeeeereetees
Relevant Chapters in the TRM..........cccccecssssessecesseseeecseseeseseeseeecsesecsessesecsesesseeecseeecseeeeseeas 5511
FC Ature oo. cccceecsceesecesesceecseacesscsesscsacscsacscecsesaesesacsesaseacscsacsesessesacaesacsesaeeessceeeeeeaseeeaes 5511
Modes Of Operation .........eceecccccesceseseesesesecseeseseeccsecaesecsesecseseesesecsesecsessesessesesseeecseeecseeeesesees 5525
Functional D@SCriIPtION uu... ceccecseessessesseessessecsessesseesecsuessesseeeueeseeaeeeuceueeaeeeesseeatesaseuteateanseseateateeeenees 5531
Front End Host Interface .........ceceecesesesseseseseseseseeeesesesesesenesceseseseaceeceseeacaeacaeeeseaeeeeeeeeeteees 5532
CLOCKS occ eeesesececeeesesesescecscecesesesesesessesescseseuceseacseaesesssscacaeaeeeceseseacaeseeeecacacaeaeeseseseaeeeeeeetees 5538

```
</details>


<!-- Page 11 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

7.5.2.3 Coordinate Systems ...........................................................................................................5542

7.5.3 Display Controller Registers ............................................................................................................ 5546

7.6 Consumer Electronics Control (CEC)............................................................................................... 5554

7.6.1 Overview................................................................................................................................................... 5554

7.6.2 Functional Description....................................................................................................................... 5555

7.6.3 Programming Guidelines................................................................................................................... 5555

7.6.3.1 Initialization.........................................................................................................................5555

7.6.4 CEC Registers ........................................................................................................................................ 5556

7.6.4.1 Registers..............................................................................................................................5556

7.7 Audio Processing Engine (APE).......................................................................................................... 5572

7.7.1 Overview................................................................................................................................................... 5572

7.7.1.1 Standard and Compatibility................................................................................................5574

7.7.1.2 List of Reference.................................................................................................................5575

7.7.1.3 Glossary...............................................................................................................................5575

7.7.1.4 Relevant Chapters in the TRM............................................................................................5576

7.7.1.5 Features...............................................................................................................................5577

7.7.2 Functional Descriptions..................................................................................................................... 5577

7.7.2.1 Audio Digital Signal Processor...........................................................................................5578

7.7.2.2 Audio Hub............................................................................................................................5578

7.7.2.3 ADMA...................................................................................................................................5593

7.7.2.4 REGDEC ...............................................................................................................................5596

7.7.2.5 ACONNECT..........................................................................................................................5597

7.7.2.6 Audio RAM and Audio Memory Controller ........................................................................5597

7.7.2.7 APE Interrupt Controller......................................................................................................5597

7.7.2.8 Audio Miscellaneous (AMISC) ...........................................................................................5601

7.7.2.9 ACAST and ADAST .............................................................................................................5602

7.7.2.10 APB-AXI Shim......................................................................................................................5602

7.7.2.11 APE HSP ..............................................................................................................................5602

7.7.2.12 APE TKE...............................................................................................................................5603

7.7.3 Programming Guidelines................................................................................................................... 5603

7.7.3.1 System Level Programming...............................................................................................5603

7.7.3.2 Using Interrupts...................................................................................................................5604

7.7.3.3 Programming Module RAMs..............................................................................................5604


<details>

<summary>OCR (Page 11)</summary>


```text

7.5.2.3 Coordinate SYSteM 0.0... eecececeseeseseseseseseeseeeseseseseeeeceecseseseneeseseseaeseeeeseeeaeaeaeaeeseeeseeeeeeeeesagen 5542
7.5.3 Display Controller REQiSters oe secceeesessseessesssecseesutesseessesstecseesuessueestesatessessuessneesseesatesstageel 5546
7.6 Consumer Electronics Control (CEC). ...ceccesescssssssssssessesseessessessesssessessstsstesssatsatssessessatsseegmeptesiafeeess 5554
7.6.1 Overview
7.6.2 Functional Description.. 5555
7.6.3 Programming Guidelines... 5555
7.6.3.1 Initialization
7.6.4 CEC ReGISteL ooo .ceeeceeseeesseessessstesseesstesstecsuessuessseesstesatessuessueessecsueesatesatessialgedbeghlersssesstesatecstesseeesneeseeets 5556
7.6.4.1 REGISTELS 00... eeeceececcescesececceccecceeecseeseesecseesecccccesceaeesecaeeaecaecese@hlpectdhcsecsececeeeeeeeeeeeeeeeneeaeeaes 5556
7.7 Audio Processing Engine (APE).....::s:sssssssssesssssssscsstesessssssegseobeadbccessessenseseessunseesenteeesenetesseeeess 5572
7.7.1 OVELVICW....essessseesstesseesseeestecsseesutesseesstesstecsuesssessneesutesatessnessseesalllecgeeesaeesuteeauecseesueesueesutesatecaesseeesneesneets 5572
7.7.1.1 Standard and Compatibility... eeeecececesesesedeesslbeceseeceeeceeeeescaeeeeeeeeeaeeeeeeeeeeeseeeeeees 5574
7.7.1.2 List Of RefEreNCe ou... ee eececeseseseeeeseseseseseececesesesesesMfevseaeacaescsceseseseseseeeeecaeaeaeaeeeeseseeeeeeeeetees 5575
7.7.1.3 GIOSSALY 0. eeeececeeesesesescececeseseseseseeceseseseaesesapO¥scsaal esseescaeseaeseeseseseseaeseeeeeeacaeaeaceeeseaeaeeeeeeeteees 5575
7.7.14 Relevant Chapters in the TRM............::.:sca:Messcesesscseeeeseseeseseeseeecseecsesseseseeseeseeecaeeecseeeeseeees 5576
7.7.1.5 Features
7.7.2 Functional Descriptions...
7.7.2.1 Audio Digital Signal Proc@SSOl....Ciyv.cccccccsseccsssseseeseseeseseesesceseeeseseeseeseseeeesesseseeseeeseseeaeees 5578
7.7.2.2 AUdIO HUD... eee eeeceseseseseeeseeedopepbescececececescececscscecescaeaeseseeescecseeeeeeeescaeeeeeeesetateceeeeeeeeeseeteeeees 5578
7.7.2.3 ADMA......cececesesesecececeseseseseDBaghteceacsceceeeesescecseseesesescacaeseseseeacacseeesscescaeeeeeeetetaceeeeeeeeeeeseateeeees 5593
7.7.24 REGDEC on eeeeeeeececeeeseans th gt Meeceseseseecesesesesesescecesescseseseseeacseaeaeseseseseaeseaeeseaeaeaeaeaeeeeseaeaceeeeeeeetes 5596
7.7.2.5 ACONNECT 002... ei ececececeeeseecseeceeeeesescececscececescaceeeeeeetscacseneseesescaeeeeeeeeetareeeeeeeeeeseeteeeees 5597
7.7.2.6 Audio RAM and Audio Memory Controller ..........:.ccececececeseseeeeseseseseseeeeeeeeeeseseeeeeeeeseseeeeeeees 5597
7.7.2.7 APE Interrupt Controller. .........cccccccecccessesescesceccseeceseeseseeseseeeceecsesecseeecseceeseeeesesseeecseeeseseeaeees 5597
7.7.2.8 Audio Miscellaneous (AMISC) ..........cccccecesesesecesessesceeseseseseeeeecscseseseeeceseseaeaeaceeeeeeenseeeeeeees 5601
7.7.2.9 ACAST and‘ADAST .
7.7.2.10 APB-AX1 SHIM... ceeeesececescssececeeesesceeeesescesescscscscecesescsceeeeecetavsceeeeeeeescaceeeeeseeateceeeeeeeeseateeeees
7.7.2.11 APEDHSP ue eeeeeccececesesesesescscecscecescacecsesescsacesscscecessacacaeseseseescaceeseessescaeeeeeetetaeaceeeeeeeeeseeteeeees
7.7.2.12 APE TKE......ececesescscscssesesescscececsceceecacsesesescscececscececsacacaeseseevacaceeeeesaescaceeeeeeeesateeeeeeeeeeeseeteeeees
7.7.3 Programming GUICelINES ...... ee eessecseestesseessesssessseesetesseesntesstecseesueesseesutesatessessueesieestenateeaeeenee 5603
7.7.3.1 System Level Programming .........:sccececeesseseseseseseseeeeeeeeseseseeeeceeeeeseseeeeeeeeeeaeseeeeeeeeeeseaeeneees 5603
7.7.32 USING INtErrUPts....... ee eee eceeeecceccecceseeseeseeseceeceeceeceeecsecaecsecsesseeseeseceeeaecaesaecsecaeeeeseesersereeaeeats 5604
743:3 Programming Module RAMS............ccccccesssesesseseseesceeseseeseseeseeccseecsecaeseseeseseeeeseeecseeeeseeaes 5604

```
</details>


<!-- Page 12 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

7.7.3.4 AHUB Sub-modules Soft Reset Sequence ........................................................................5605

7.7.3.5 Boot Sequence....................................................................................................................5605

7.7.3.6 Power Management Sequence..........................................................................................5609

7.7.3.7 SC7 Entry and Exit...............................................................................................................5612

7.7.3.8 AAS Programming Guidelines............................................................................................5614

7.7.3.9 ACIF Programming Guidelines...........................................................................................5614

7.7.3.10 I2S Controller Programming Guidelines............................................................................5615

7.7.3.11 DMIC Programming Guidelines..........................................................................................5617

7.7.3.12 Mixer Programming Guidelines .........................................................................................5618

7.7.3.13 AMX Programming Guidelines...........................................................................................5623

7.7.3.14 ADX Programming Guidelines ...........................................................................................5624

7.7.3.15 SFC Programming Guidelines............................................................................................5625

7.7.3.16 AFC Programming Guidelines............................................................................................5626

7.7.3.17 OPE Programming Guidelines............................................................................................5627

7.7.3.18 MVC Programming Guidelines...........................................................................................5628

7.7.3.19 DSPK Programming Guidelines .........................................................................................5630

7.7.3.20 ASRC Programming Guidelines .........................................................................................5631

7.7.3.21 ARAD Programming Guidelines.........................................................................................5634

7.7.3.22 ADMA Programming Guidelines........................................................................................5635

7.7.4 APE Registers ........................................................................................................................................ 5636

7.7.4.1 Audio Crossbar (AXBAR) Registers...................................................................................5636

7.7.4.2 Audio Hub Configuration (AHC) Registers........................................................................5680

7.7.4.3 Inter-Chip Sound (I2S) Control Registers ..........................................................................5690

7.7.4.4 Digital Microphone Control (DMIC) Registers...................................................................5705

7.7.4.5 Digital Speaker (DSPK) Control Registers.........................................................................5716

7.7.4.6 Audio Multiplexer (AMX) Control Registers ......................................................................5726

7.7.4.7 Audio De-Multiplexer (ADX) Control Registers .................................................................5747

7.7.4.8 Mixer Control Registers......................................................................................................5763

7.7.4.9 Master Volume Control (MVC) Registers..........................................................................5783

7.7.4.10 Arbitrary Sample Rate Control (ASRC) Registers..............................................................5798

7.7.4.11 Audio Sampling Rate Detector (ARAD) Control Registers................................................5852

7.7.4.12 Audio Flow Control (AFC) Registers..................................................................................5884

7.7.4.13 Sampling Frequency Converter (SFC) Control Registers .................................................5904


<details>

<summary>OCR (Page 12)</summary>


```text

7.7.3.4
7.7.3.5
7.7.3.6
7.7.3.7
7.7.3.8
7.7.3.9
7.7.3.1
7.7.3.1
7.7.3.1
7.7.3.1
7.7.3.1
7.7.3.1
7.7.3.1
7.7.3.1
7.7.3.1
7.7.3.1
7.7.3.20
7.73.21
7.73.22
7.74
7.741
7.74.2
7.74.3
774A
TITAS
7.746
7.747
7.748
7.749
7.74.10
7.7411
7.7412
TPANZ
wo ON DO FP WN HS OO
AHUB Sub-modules Soft Reset SCQUence ..........cccceecesseseeseseeseseeeeseeseseeeeseeecseeseseeseeeesagen 5605
Boot SEQUENCE 1... eeeeceeeseeseeseeseeseeseeseesecsecseceacceesecsecsecsecuecaseceeecaesaesaesaeseeesaserseredtnesly 5605
Power Management Sequence ...........ccceccesceseesceseseeseeseeseeeceesceeceeeeaeeaeeaeeaeeseeeeseegaadeaegfeeaes 5609
SC7 Entry and Exit... ec ecececccescseeseeeeesescseeccecesescaeeeeeeeeevseeceeeeeesessaceeeeeeeststsegfese(occseeeeeeees
AAS Programming Guidelines.
ACIF Programming Guidelines
12S Controller Programming Guidelines .............cccecccceesceececeseseeseapetiad ecesseeseseeeeseeeeeeeaee
DMIC Programming Guidelines..............cccccccceseseeeesceeeseeeeseecesseeeslosfespicsecsesecseeeeseeeeseeeeeeees
Mixer Programming Guidelines .......0....cccccceeseceeeeseeeeseeeeseeeMhlecstVhcsecseseeseecseeecseeeeseeeeeeees
AMX Programming Guidelines.............ccccccceeseeseseesesseseseeeDiaadeceseeeeseeseseeceseeseeecseeeeeeseeaeees
ADX Programming Guidelines ............cccccccccseseseeceseesesyfibeqececeseeseseeeseeseseeeeseeseeeeseeeeeeeeaeees
SFC Programming Guidelines ...........c.cccecccceeceseecesediesslbeseecesceseccseseeseeseseeeeseeseecseeeseeeaeees
AFC Programming Guidelines.............cccccccccseesssse Mecteceseecesceseeeseseeseeseseeeeseeseeeeseeeeeseeaeees
OPE Programming Guidelines...............ccccepeteccaedscsceccscesesesceseescseeecsecsesecsesecseeecseeecseeeeseeees
MVC Programming Guidelines. ..............ccashesncecessesceeeseseesesceseeecseeesecsesessesecaeeecseeecseeeeseeaes
DSPK Programming Guidelines ..
ASRC Programming Guidelines 0.0.0... Mieccecececcecesesseseeseseecesceseeceseseeseeseseeeeseeseeeseeeseeeaeees
ARAD Programming Guidelines ..Cayi.....c.cccccecccceceseesesseseseececeseeeeseeeeseeseseeeeseeseeeseeeeeeeaeees
ADMA Programming Guidelin@S>............c:ccceccscsceseesesseseeeceeceseeeeseeeeseeseseeeeseeeceeeseeeseeeaeees
APE ReGISteP ou... essecseeesstessee Dagtecsssecsseecssecsseestecsuccsusesseessessecauecsueesneesutesatesaessueesuecsueesatesseesseenaecsneeses
Audio Crossbar (AXBAR)REGIStETS ..........cceceseceeescecseseseseeseececseseseeeceseeseseaeaceesestenseeeeeeees
Audio Hub Configuration (AHC) Registers ...........:.:ccccscecesssesesessesesecesesesneseacaeseeeseeneneeeeeeees
Inter-Chip Sound (IZS) Control Registers ............cecscscecesessseseseseseeeeeeeeeeeceesesesceeeeeeeceeetatees
Digital Microphone Control (DMIC) Registers
Digital Speaker (DSPK) Control Registers .............ecccececseesesesecesececseeceeseceseeeeacecseeeeeeeeneeeees
Audio Multiplexer (AMX) Control Registers ...
AudioDe-Multiplexer (ADX) Control Registers ..........:.cccecessceceeseseseseseseseeseecseseeeseeeeeeeseeees 5747
Mixer Control REGisters ..........cccccceccssesesesscssesesseseseesesecsesecsesecsesecsesecsessesesseseeseeecseeecseeesseeees 5763
Master Volume Control (MVC) ReGiSters ...........cecccecscsesesesesesesesecseseacseseseeeaceceeseseeteneeeees 5783
Arbitrary Sample Rate Control (ASRC) ReGiSters.........:.:ecececesseseseseseseseeeeeseseeeeeeneeeeeeeeees 5798
Audio Sampling Rate Detector (ARAD) Control Registers............:.::eccssesssseseeseeeeeeeeeeeees 5852
Audio Flow Control (AFC) Registers .........:.ccecececsescessesesesescececseseseeeceseeneacacaeseeeeeeneeeeeeeees 5884
Sampling Frequency Converter (SFC) Control Registers ...........:.:ccesecesssesseeseseseeeeeeeeeeeees 5904

```
</details>


<!-- Page 13 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

7.7.4.14 Output Processing Engine (OPE) Control Registers.........................................................5913

7.7.4.15 Parametric Equalizer (PEQ) Control Registers..................................................................5920

7.7.4.16 Multiband Dynamic Range Compression (MBDRC) Control Registers ...........................5924

7.7.4.17 Audio Direct Memory Access Interface (ADMAIF) Control Registers .............................5934

7.7.4.18 Audio Direct Memory Access (ADMA) Control Registers ................................................6134

7.7.4.19 Audio Memory Control (AMC) Registers...........................................................................7302

7.7.4.20 Audio Digital Signal Processor Peripheral (ADSP_PERIPH) Control Registers...............7311

7.7.4.21 Audio Miscellaneous (AMISC) Control Registers .............................................................7372

7.7.4.22 Audio Generic Interrupt Control (AGIC) Registers ............................................................7384

7.8 Always On Digital Microphone (AODMIC)...................................................................................... 7436

7.8.1 Overview................................................................................................................................................... 7436

7.8.1.1 Features...............................................................................................................................7438

7.8.2 Functional Description....................................................................................................................... 7438

7.8.2.1 Receive Buffer and Differentiator ......................................................................................7438

7.8.2.2 Integrator.............................................................................................................................7439

7.8.2.3 Downsampler ......................................................................................................................7439

7.8.2.4 Physical Structure...............................................................................................................7440

7.8.3 Programming Guidelines................................................................................................................... 7441

7.8.3.1 Normal Operation (Enabling) .............................................................................................7441

7.8.3.2 Disabling..............................................................................................................................7441

7.8.3.3 Optional ...............................................................................................................................7441

7.8.4 AODMIC Registers ............................................................................................................................... 7441

7.9 Pixel Memory Formats .......................................................................................................................... 7455

7.9.1 Functional Description....................................................................................................................... 7455

7.9.1.1 Tiling Formats .....................................................................................................................7455

7.9.1.2 DRAM Organization ............................................................................................................7457

7.9.1.3 Block Linear.........................................................................................................................7458

7.9.1.4 Sub-Partitions......................................................................................................................7461

7.9.1.5 Hardware Support...............................................................................................................7462

7.9.1.6 Pixel Format Naming..........................................................................................................7462

7.9.2 Programming Guidelines................................................................................................................... 7499

7.9.2.1 Software Guidelines............................................................................................................7499

7.9.2.2 Block Height Limitations ....................................................................................................7500


<details>

<summary>OCR (Page 13)</summary>


```text

7.74.14
7.74.15
7.74.16
7.7417
7.74.18
7.7419
7.74.20
7.74.21
7.74.22
7.8
7.8.1
7.8.1.1
7.8.2
7.8.2.1
7.8.2.2
7.8.2.3
7.8.2.4
7.8.3
7.8.3.1
7.8.3.2
7.8.3.3
7.8.4
7.9
7.9.1
7.9.1.1
7.9.1.2
7.9.1.3
7.9.1.4
7.9.1.5
7.9.1.6
7.9.2
7.9.21
79222.
Output Processing Engine (OPE) Control Registers ............::ececessesceeseseseseeeeeeeseseeeeneeagen 5913
Parametric Equalizer (PEQ) Control RegiSters............cccsceseseseseeeeeeeeesesesestesceceeeeeeeeetarely 5920
Multiband Dynamic Range Compression (MBDRC) Control Registers .............jctst fe 5924
Audio Direct Memory Access Interface (ADMAIF) Control Registers .......... 240m 5934
Audio Direct Memory Access (ADMA) Control Registers ..
Audio Memory Control (AMC) ReGisters ...........::cscscsssscesesesesesecseseseeesesebgelespiceeseseeneeeeseeees
Audio Digital Signal Processor Peripheral (ADSP_PERIPH) Control\Registers............... 7311
Audio Miscellaneous (AMISC) Control Registers ...........ecceceeeeGo}eoSieeseeeseeseseseseeeeeseeeeeees 7372
Audio Generic Interrupt Control (AGIC) Registers «2.0.2... beheececeseeeeeeeseseeeeeeeeeeeees 7384
Always On Digital Microphone (AODMIC).......ssssssssssesssesseeesegeenteadbecessesssseesesssssssessnnteseseneeeeeeneess 7436
OVELVICW....esseecseeesstesseesseestecsseesutesseesseesstecssecsnessueesutesatessuessueesafllleagesesatesueeaiecsueesuessneesuiesatecsuesseeesneesseets 7436
FOAtUreS ooo... eccceecseeeceeeseeceececesceesacsesscsacsceecsceeceesdgueslpeeseceecscsecscsecsesacsesacsesaeeesseeeeeeeaeeteaes 7438
Functional D@SCriPtion uu... ceccecsecssecsecseessessecsesesseeseces Mgecesseuceseeaeeeucsueeaeesassteatesessuseateanseeseateateeneenes 7438
Receive Buffer and Differentiator 0.0.0.2... peteecendeccseseeseseececeseseseeeeeeeeseseseaeaeeeeseseeeeeeeeetetes 7438
IIMT@QFAtON eee ceeeeeceeceeceeceeccecceeeeseeseesessmens Mheseteececaeesecsesaesseeeeceseeeeaecsesaeeaeeaeceeeeeseesereeaeeaees
Downsampler...
Physical Structure ...........ccceceseseseesesestfeniecececeseseseseeeeeescaeseseseseseseaeseeeeeceeacaeaeaeeeseseaeaeeeeeeeees 7440
Programming Guidelines... Ciiecceesseesseesseesssecseeesneessessntesstecseesueesueesteeatecstessueesneestennteeaeeenees 744)
Normal Operation (Emabling) (p.->.....-..secccececseceseseeesescecseseseseeesecececsescsesesesteeesececeeseeeeteeeees 7441
1D) ISy-] 0) a ee ee 7441
(0) 0) (0) p<] eee OS ee 7441
AODMIC ReGiSters oo ec esesseesseesseesseessecssecsutesseesstecsecsuecsueessecsutesatessessueesneesueesesesseesneeaeesseeses 744)
Pixel MEMory FOrats .......:csecceeccessesseessessessesesesseseecseeesessecsueeseesucsuesaessesueeanesseusseseaeeeeseeeeateeseeteateaneeess 7455
FUNCtIONAl DESCHIPTION oo. ec eceessesseeesstesstesseessseesnecsutesutesseesnsesstecaueesueesseesutesatesaessueesueesitesatesaeeenee 7455
Tiling FOrmMats ........eeecccecccecesceeeseeseseeseseesesccsesecsescesesaesesecsesecsecsesecacsecaeceeseecsecseeeeseeeseeeaeees
DRAM Organization
BIOCK LING AF... eee eeeeeseeeececeseseseseccesesesescscecssescseeesesscaeseaeaeuseseseaeacaeeeeaeacaeaeaeeeseseaeeeereetees
SUb*PartitiOns oe cecececeeesesceeeeeeeeesesescscscecsescscseeeeecensvsceeeeeesescaceeeeeeceeaeeeeeeeeeeeeseateeees
Hardware SUPPOSt au... cecccseessesceseseeeesesecsesecsesecsecaesessesessesecsesecsesecsesaesessesesseeecseeecseeeeseeaes
Pixel Format Naming .........:.ccccccceccecsssescsesscseescseeccsecaesecsesessesecsesecseeecsesaesecseseeseeecseeecseeesseeaes 7462
Programming GUICeliNeS «0... es essecseeseesseesseeessecstesetesseessteeatecseesueesseestesniesstessueesueestesnteeaeennees 7499
Software Guidelines... ceeeeeeescesesesesesesescececeseseseeeeeseeeesescseeceeeseseseeeeeeeeeeaeaeeeeeeeeeeseaeeeeees 7499
Block Height Limitations ..........c cece cseescsseeeseecesecsesecseseeseeesesecsesecsecsesesseseeseeecaeeecseeeeseeees 7500

```
</details>


<!-- Page 14 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

8. Computer Vision Acceleration ..............................................................................................................7502

8.1 Deep Learning Accelerator (DLA)..................................................................................................... 7502

8.1.1 Overview................................................................................................................................................... 7502

8.1.1.1 Relevant Chapters in the TRM............................................................................................7503

8.1.1.2 Glossary...............................................................................................................................7503

8.1.2 DLA Functional Description ............................................................................................................. 7506

8.1.2.1 Data Formats.......................................................................................................................7506

8.1.2.2 Precision Conversion..........................................................................................................7507

8.1.2.3 Floating Point Support........................................................................................................7510

8.1.2.4 Feature Data Format...........................................................................................................7511

8.1.2.5 M-planar Format .................................................................................................................7513

8.1.2.6 Pixel Format ........................................................................................................................7513

8.1.2.7 How to Locate a ROI...........................................................................................................7515

8.1.2.8 Weight Format.....................................................................................................................7515

8.1.2.9 Falcon ..................................................................................................................................7526

8.1.2.10 Convolution Operations......................................................................................................7528

8.1.2.11 Convolution Working Modes for Convolution ...................................................................7533

8.1.2.12 CDMA...................................................................................................................................7534

8.1.2.13 Convolution Pipeline (CPIPE).............................................................................................7535

8.1.2.14 Super Data Processor.........................................................................................................7536

8.1.2.15 Unified Buffer ......................................................................................................................7537

8.1.2.16 Bridge DMA .........................................................................................................................7537

8.1.2.17 RUBIK...................................................................................................................................7538

8.1.2.18 GP and CFGDMA.................................................................................................................7542

8.1.2.19 Interface Between UBIF/MCIF and their Clients ...............................................................7543

8.1.2.20 Interrupts of Sub-Units........................................................................................................7544

8.1.2.21 Layer Switch........................................................................................................................7544

8.1.2.22 Latency Buffers...................................................................................................................7545

8.2 Programmable Computer-Vision Accelerator (PVA).................................................................. 7546

8.2.1 Overview................................................................................................................................................... 7546

8.2.1.1 Vector Processing Unit.......................................................................................................7546

8.2.1.2 Decoupled Lookup Unit (DLUT)..........................................................................................7546

8.2.1.3 DMA Controller....................................................................................................................7546


<details>

<summary>OCR (Page 14)</summary>


```text

8. Computer ViSiION ACCele ration ........cceccecssecsessesssessessessessessecsuessessssueesesseseucsueeseeeessuesatesasseseaeeenseneeaeeeagen 7502
8.1 Deep Learning Accelerator (DLA) .....sssssssssssssssssessssssssessetesesssnseessssnteeessnneseseenneetessutitseseanteeessastagedl 7502
8.1.1 OVELVICW....essecssessstesseesseeestecsueesutesseesstecsecsuecsueesueesutesatessuessueesecsueesatessesueeanecsuecsuteaneesutesatecaseganstsuegficess 7502
8.1.1.1 Relevant Chapters in the TRM..........cc:cceccssessescescseeecseeeseeseseeecseeecsecseessesesseafesedbcrseeeseeees 7503
8.1.1.2 Glossary... 7503
8.1.2 DLA Functional Description 7506
8.1.2.1 Data Formats
8.1.2.2 Precision CONVErSION ......... ce eeeeeseesesceeeseesecescseeeceeescsetscesaseecscsealosfegpicassseneseeeceeeeseseeeeeaes
8.1.2.3 Floating Point SUPPOFt........... ccc ecccecesceecseesceeeccsecseeecseseeseesepllecstVhcsecsesecsesecseeeceeecseeeseeees
8.1.2.4 Feature Data Format... ceceeceesceesseeeceeeecceecsesseeessceeeneedMnadecsesesesseesseesseeesseeeeeeeeeeeeaes
8.1.2.5 M-plamar Format ..........ccccccesescscesceseseeeeseeceseeeesceccsecaese iiveqecsecseecsesecsesaesecsesesseeecaeeecseeaeesees
8.1.2.6 Pixel FOrmat ........cccececescscececeseseseeeeseseseseseececesesesesesadeesslpacsescecesesesceeseeeeseaeaeaeeeeeseseeeeeeeeeteees
8.1.2.7 How to Locate & ROI 0... eeeeeeccessceeeseeeceeeecsceecssMGceesaceesaesecscecseseesesacsesacseeseeesaeeeteeeeseneaes
8.1.2.8 Weight Formait........c.cccccecccceccsseseseesesseseseeseeeeas@¥essanl ceseesecceseeeceecseecseeecaeceeseeecsecaeecseeeeeeeeaeees
8.1.2.9 FAICON ....eeceseseseeceeeeesesesescececeseseseseeesessaeacsmmag lbevecsessecseescaeseaeecssesescaeaeseeeeecaeaeaeeeseseaeaeeeeeeeeees
8.1.2.10 Convolution Operations
8.1.2.11 Convolution Working Modes for CONVOIUtION ..0...... eee ecccecceseseseeeeseeseeeseseeseseeseeeeseeeeseeees 7533
8.1.2.12 CDMA... eeecesesescesececesesescecececeseseashosSpesesesescsceceseseseseeeseaeseaeseseseseacaeseeseecacaeaeeeeeeseseaceeeeeetates 7534
8.1.2.13 Convolution Pipeline (CPIPE) (p..>.....-.esecscesessecesesesesessescsesesesesesneececsescacseseenseeseeeceeseeeeteeeees 7535
8.1.2.14 Super Data ProCeSSor....... i eeecceccesceseeseescceseesceceeceeseeseesecaeceececeeeeeesaecaecaeeaecaeeesseeseesereeaeeas 7536
8.1.2.15 Unified Buffer 2... Dace ececcccececeseseseseeeeeeseseseseeeeeescseseaeaeeseseseaeaeeeeeeeacseaeaeeeeseseaeeeeeetaees 7537
8.1.2.16 Bridge DMA 200... eee loc ceeceeeseseseeeecesesesesesescesesescsesescscaeseaeaeeeseseseseaeeeeacacaeaeaeeeeseseaeeeeeeeteees 7537
8.1.2.17 RUBIK ooo. eeeeeecengtbeeeeecescececececesescsesescssesescseeescesescseaesesesacaeseaeseseseseacaeseseeaeacaeaeaceeseseaeeeeeeetees 7538
8.1.2.18 GP and CFGDMA®........eeeececeseseseseeeesesesesesesesceceseseseseeescseaeseneuseseseaeseeeeeaeaeaeaeaceeseacaeeeeeeetates 7542
8.1.2.19 Interface Between UBIF/MCIF and their Clients ............cceceeecececesesceeeeeeeeeeeeceeeeeeeeeeeeeaeees 7543
8.1.2.20 Interrupts of Sub-Units...
8.1.2.21 La@yer Switch oo... ccececeseeseceseseseseeeesesesesesescsceeeseseseseeeseseseaeseseseseseaeaeeeeeeacaeaeaeeeeseseaeeeeeeetenes
8.1.2.22 Latency Buffer occ eseseseseeeeseseseseseseececeseseseeeseecaeseaeaeeseseseseaeaeestacacaeaeaeeeeseseaeeceeeetetes
8.2 Programmable Computer-Vision Accelerator (PVA)...::sssssssssssssssssssscesstsessentsessettsessnneteees 7546
8.2.1 OVELVICW.. nn esseesseecsseesseessseesnessseesutessessecsecsueesueesueesutesatecsuessueesuessueesatesaeessueeamecsueesunesneesutesaiesauesseeesneeseees 7546
8.2.1.1 Vector Processing Unit..........e ce cecceccescescescceseesceseeeeeseeseeseesececsececeeeaeeaeeaeeaeeaeeeeeeeeeesereeaeeas 7546
8.2.1.2 Decoupled Lookup Unit (DLUT)....0......cccccecseesesesesescscsesesesesececececacacacaeseseseeesecsestetetenenes 7546
8.213 DMA Controller... ceeeeeeseseseseseseeeeseseseseseecsceceseacsceeseacaeaeseaeessesescaceeasacacaeaeaeseseseaeeeeeeetenes 7546

```
</details>


<!-- Page 15 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

8.2.1.4 Cortex-R5 Subsystem .........................................................................................................7547

8.2.1.5 Feature List..........................................................................................................................7548

8.2.1.6 Application Space Examples..............................................................................................7549

8.2.1.7 CV-PVA Subsystem Top Level Integration........................................................................7549

8.2.2 PVA Functional Description.............................................................................................................. 7549

8.2.2.1 PVA Interconnect................................................................................................................7549

8.2.2.2 PVA Boot Sequence............................................................................................................7550

8.2.2.3 DLUT Description ................................................................................................................7558

8.2.2.4 DLUT Features.....................................................................................................................7558

8.2.2.5 DMA Unit Description .........................................................................................................7558

8.2.2.6 PVA_PROC: Cortex-R5 Subsystem.....................................................................................7561

8.2.2.7 Timers..................................................................................................................................7563

9. System Components................................................................................................................................7564

9.1 Clock and Reset Controller (CAR)..................................................................................................... 7564

9.1.1 Overview................................................................................................................................................... 7564

9.1.2 Reset Controller.................................................................................................................................... 7564

9.1.2.1 Reset Functional Description .............................................................................................7566

9.1.2.2 Reset Programming Guidelines .........................................................................................7575

9.1.3 Clock Controller .................................................................................................................................... 7579

9.1.3.1 Clock Controller Functional Description............................................................................7579

9.1.3.2 Clock Controller Programming Guidelines........................................................................7603

9.2 Interrupt Controllers.............................................................................................................................. 7603

9.2.1 Overview................................................................................................................................................... 7603

9.2.1.1 List of References...............................................................................................................7604

9.2.1.2 Glossary...............................................................................................................................7604

9.2.1.3 Relevant Chapters in the TRM............................................................................................7605

9.2.1.4 Specifics in Reading This Chapter.....................................................................................7605

9.2.2 Functional Description....................................................................................................................... 7606

9.2.2.1 Interrupt Handling Mechanism ..........................................................................................7606

9.2.2.2 Interrupt Controllers............................................................................................................7609

9.2.2.3 Interrupt Routing .................................................................................................................7612

9.2.2.4 Interrupt Mapping ...............................................................................................................7613

9.2.2.5 Interrupt Handling by Different Cortex-R5 Clusters ..........................................................7638


<details>

<summary>OCR (Page 15)</summary>


```text

8.2.1.4
8.2.1.5
8.2.1.6
8.2.1.7
8.2.2
8.2.2.1
8.2.2.2
8.2.2.3
8.2.2.4
8.2.2.5
8.2.2.6
8.2.2.7
9.1
9.1.1
9.1.2
9.1.2.1
9.1.2.2
9.1.3
9.1.3.1
9.1.3.2
9.2
9.2.1
9.2.1.1
9.2.1.2
9.2.1.3
9.2.1.4
9.2.2
9.2.2.1
9.2.2.2
9.2.2.3
9.2.24
W225
Cortex-R5 SUBSYSTEM 0... eeceseeseeeeseseseseseeeeceseseseeeseeeseseseaeaeeseseseseaceeeeeetacaeacaceeeseaeeeeeereesagen
Feature List... eee cee ecseesceesseeessceecseeecseeecseeecsessesesacsessceesseecseeecsesacaesasaesaeeesseeeeesastaeel
Application Space Examples..........cccccccccsccssesessssesseseseesessesceecseeeeseeeeseeseseseesesseseeseaateapgeeees
CV-PVA Subsystem Top Level Integration ..
PVA Functional Description.
PVA Interconnect
PVA Boot SCQUENCE.........ceceeccecesceseeseeseesececceccecceeesseeseesecsesseesesseceesapedua feseeseeeeeeesersereeaeeaes
DLUT DeSCTiPtiOn ........ ee ee ce eceeceecesceseeeeseesccccecccneeseeaeeaecaecseesecacehpeleqputeaeeseceeeeeeeceesereeaeeaes
DLUT Features... ccceccecseesceesceesscssceceecscsessessseesscstssseeedllecstVhcssseeessenssseeeseeeeseeseeeeees
DMA Unit D@SCTIPtION ..0... eee eee ceeeeceteeeceecceceecceecaeeseesecapesDMagdeceeeeaecaecaecaecaeeeeseeeeetereeaeeaes
PVA_PROC: Cortex-R5 SUDSYStEM. 0.0... ceceeeseeeeeeeespfOveqeeeecesesesesceeeeeeeseseaeaeeeeseaeaeeceeeetetes
THMEOMS ee eeeeeeeeeceeescneeseeeesceecscecseescsecscsesscsecacecsceecsadecselpcaececsecscsecscsacseeesaeeesaeeaseeeeseeeeeeesatees
SYSTEM COMPOMNENMS .0....ececceecesseeseessesseesscesesseesucceesseeeecsuesaMcesseesessnceueeseeseesessaeeaeeeesseeeateeassseateanseeseaneasees
Clock and Reset Controller (CAR) ....c.scesccsssssssssettessenslessesssessesscssessssssssnesstssssessatssessessanssessessaneateseess
Overview
Reset Controller
Reset Functional Description...
Reset Programming Guidelines ..Ciyi....cecceccceseccsseseeeeseesesesceseeccseeeesecsesecsesecseeecseeecseeeeseeees
COCK CONTKOM EN oes eeseecseeeseflades less tecsseesseesneesutesstecsuessueesseesstesatesseesaueesuecsueesatesseesueeeanecauesseeesneeseees
Clock Controller FunctionalsDe@scription..............ccceccccecescescsseseseeseseeseeeeseeeseeeeseeecseeeeeeees
Clock Controller Programming Guidelines ............. ccc cecccceeeceseseseeeesecseseeseseeseeeeseeecseeeeseeees
Interrupt CONtrollers Co eececceecsecsecseessessecsseseesecencseeeseesucsuessessussueesessssusesteaessuseeseseeeeseeeeateseseeseateaeeees
OVELVICW.....esseeesssaptiigiicssseessecssecsutesssesstessnecsseesueesueesutecatessuessueesueesseesanesaeesauesaecsueesutesneesutesatecauesseeesneesneess
List Of ReferenCeS ......... ce eeeeeceseseeseseseseseseeseseseseseeeeeeseseseseneeseseseseaeeeeeeaeacacacaeeeeseaeaeeeeeeetees
GIOSSALY peo ide cececececesesesececeseseseseseeesesesesescscessaeaeaesesesacaeseaeaceseseseseseaeeeeecacacaeaeeeeseseaeeeeeeeteees
Relevant Chapters in the TRM
Specifics in Reading This Chapter ..............cccccccccccssessssesseceeceseeseseeeeseeseseeeeseeeceeseeeeeeeeaeees
Functional DESCIIPTION wee ec esseesseeeseesntesseesseessecstesstesseesnesatecaeesutesseesutesatesseesseeesneesetesateeaeeenee
Interrupt Handling Mechanism .............cccceecessesesseseeeeseesesesceseescseecseesesecsesecsseecseeecseeeeseeaes
Interrupt Controllers... cccceeecccscseesessesesceseseeseseeseeseseeecsesseseeseseeeesecsesecseecaeeesseeeeseeeeeeeaee
Interrupt ROUTING .........ececeeceeccescecceseeseeseesecscsececececsecsecsecaecaeeaceceececeesecaesaeeaeceeeeeseesereeaeeaees
Interrupt Mapping ........... ce cecceceeceeseeseeseeseeesceececcecesaeesecsecaecaeceaceceecececsecaesaecaeeeeeeeserseeeeaeeaees
Interrupt Handling by Different Cortex-R5 Clusters ......... ee eeeeeceeeseseseeeeeeeeeeeesceeeeeeeeeeeaeees 7638

```
</details>


<!-- Page 16 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

9.2.3 Interrupt Controller Registers ........................................................................................................ 7663

9.2.3.1 CHANNEL Registers Summary ..........................................................................................7664

9.2.3.2 COMMON Registers Summary...........................................................................................7672

9.2.3.3 Interrupt Controller Common Registers ............................................................................7674

9.2.3.4 Interrupt Controller Channel Registers ..............................................................................7685

9.3 Timers .......................................................................................................................................................... 7817

9.3.1 Overview................................................................................................................................................... 7817

9.3.1.1 Glossary and Acronyms .....................................................................................................7818

9.3.1.2 Relevant Chapters in the TRM............................................................................................7819

9.3.1.3 Address Map.......................................................................................................................7819

9.3.1.4 Clocks..................................................................................................................................7820

9.3.1.5 Resets..................................................................................................................................7821

9.3.2 Functional Description....................................................................................................................... 7822

9.3.2.1 Hierarchical Grouping.........................................................................................................7824

9.3.2.2 TSC.......................................................................................................................................7826

9.3.2.3 Main TSC Generation..........................................................................................................7827

9.3.2.4 Secondary TSC....................................................................................................................7829

9.3.2.5 External Reference Tracking ..............................................................................................7829

9.3.2.6 TSC Controlled Signals.......................................................................................................7833

9.3.2.7 TSC Distribution Logic........................................................................................................7836

9.3.2.8 Halting TSC During Debug..................................................................................................7836

9.3.2.9 Generic Timestamping Engine...........................................................................................7840

9.3.2.10 RefClk Source Change Logic..............................................................................................7842

9.3.2.11 Power Management ...........................................................................................................7842

9.3.2.12 Real Time Clock ..................................................................................................................7844

9.3.2.13 Always On WatchDog Timer...............................................................................................7846

9.3.2.14 Microsecond Counter and Time Reference Pulses Generation.......................................7846

9.3.2.15 TKE Module .........................................................................................................................7847

9.3.2.16 Generic Timers....................................................................................................................7852

9.3.2.17 Cortex-A9 Timers................................................................................................................7853

9.3.2.18 Functional Safety Island Timers ........................................................................................7853

9.3.2.19 TSC Update Frequency.......................................................................................................7860

9.3.2.20 Safety Mechanism ..............................................................................................................7861


<details>

<summary>OCR (Page 16)</summary>


```text

9.2.3
9.2.3.1
9.2.3.2
9.2.3.3
9.2.3.4
9.3
9.3.1
9.3.1.1
9.3.1.2
9.3.1.3
9.3.1.4
9.3.1.5
9.3.2
9.3.2.1
9.3.2.2
9.3.2.3
9.3.2.4
9.3.2.5
9.3.2.6
9.3.2.7
9.3.2.8
9.3.2.9
9.3.2.10
9.3.2.11
9.3.2.12
9.3.2.13
9.3.2.14
9.3.2.15
9.3.2.16
9.3.2.17
9.3.2.18
9.3.2:19
9.3:2°20
Interrupt Controller REQiSters oe esesseesseesssecseesneesseesnesstecseesueesseeseentesseesseesneesternteeeeesnge 7663
CHANNEL Registers SUMIMALY ..0....... eee ceeeeeeeeeeesseeeeeceseeeecscecsesecsesacsesacsesaeeesaceteeeeetaeel 7664
COMMON Registers SUMMALY........... cc ceececeseseeeeseseeeetsceeteceecscecscecsesacsetsceeacetsegantestgfesees 7672
Interrupt Controller COMMON ReGiSteELS ............ceecceesseseseeeceeeseseeeeeeeseeeeseeesseeafesediesteeeeaees 7674
Interrupt Controller Channel Registers .
Timers....
Overview..
Glossary and ACronyMs .........ccccececeseseseteececeseseseseetecessseseacacecescstalee)eghiceaeseaeeceseseseeeeeeeeeeeees 7818
Relevant Chapters in the TRM..........:c:cceccssesseccseeceeeseseeseeses lees tVhcsecsesecsesecseeeeseeecseeeeeeees 7819
Address Map .......ccccecsscssesseceseecesesseseeseseeseecsesecsescesseseseescseqeetbagdiseseseeseeseseeeeseeseeeeseeeeeeeeeaeees 7819
CLOCKS 000. eeeeescececeeesesesescecceceseseseeeecsesescaeececesescscaeeeesesghileqeeesseseseaeseseseseaeaeaeeeeeseseaeeeeeeetaes 7820
RESCUS ooo eeceeesceeesceeceescsceecsesaceesacesaceassceecsceesesdgueslpeeseceecscecscecsecacsesacaeseeeessceteesaeeeeaes 7821
Functional D@SCriIPtiOn uu... ceccecsecseececseessesseeseseeseeseses Mgessnssuceseeseesussaeeatesecsueeateeaseseateanseesenteateeneeeses 7822
Hierarchical Grouping
Main TSC Generation.
S@CONAArY TSC... ee eeeccecececseesescseasenelbescececseecesescaeeeeeeeceesceeeeeeeeesescaeeeeeeeseeaveceeeeeeeseseeeeeeees
External Reference Tracking .......Cipreeccsecessssseseseeseeecseseesesccseeecseecsessesecseseseeeecseeecseeeeseeees 7829
TSC Controlled Sighals 2.2.0.0...) .ccecccccsescscesseceseeceseeseseeseseesceeeseseeseeecseceeseeecsecseeeeseeeeseeeeaeees 7833
TSC Distribution LOGIC... ye eceeccecccetsesesceseeceseceseeseseeseseecceccseseeseseeseeeeseecseeaeeeseeeseeeaeees 7836
Halting TSC During DebUQy?......... ec cecccceccecesesseseseeseecseseesesceseeecsesecsecsesessesesseeecaeeecseeeeseeees 7836
Generic TimestaMmping.ENGine ..............ccceceecceccesceceeseeeeseeseeseeeeeeeceeeeeeeseeaecaecaeceeeeeserseeeeaeeaes 7840
RefClk Source Change LOGiC...........ccccccecssesesseseseeseeecseseeseseeseeecsesecsecsesecsesecseeecseeecseeeeseeees 7842
Power Managemen nt ...........:cecceccescesceseeeeseceseceeeceeessecseesecsesseeseeeeceaeeaecaesaecaesaeseeeeesersereeaeeaes
Real TiM@CLOCK 0.0... eeeeeeeseseseseseeeeseseseseseseecseseseseseseescseseseaceseseseseaeeeeeeseacaeaeaeeeeseseaeeseeeetetes
Always On-WatchDog Timer
Microsecond Counter and Time Reference Pulses Generation.............:ceeeeceeseeeeeeeeeees 7846
TRE MOdUle o.oo ecesceeeeeceeesescsesesesesesscscscscececeecscseeesesecacaceeseseeescaceeeeeesesateceeeeeeeeeseateeees 7847
GeMEFIC TIMELS 20... eee eee eeeceecteeseeeesceesscseescsecscsecsesacsesacsesasacscsacseeeesesacsesacsesaceesaceeeeeeaeaeeas 7852
Cortex-A9 TiMe’rs 00... eecescescecescessscessesececeecscsecsesacsesaesesaesacscsasscseesesaceesacsesaceesseeeeaeeeeneeaes 7853
Functional Safety Island Timers ..........:.cceceeseeseeeeseseseseseseeceseseseseeceeeeeaeseaeaeeeeseaeeeeeeeeeeees 7853
TSC Update Frequency .........eececcecesssesesesescesesesesescsceeeeeesensvsceeseeeeseseseeeeeeceeaeaeeeeeeeeeeseeeeeeees 7860
Safety Mechanism ...........:cccececeseseseesseesesesesceccecesesesceeseeecetsesceeseseesescaceeeeeeseeaeaeeeeeeeeeeseatereees 7861

```
</details>


<!-- Page 17 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

9.3.3 Programming Guidelines................................................................................................................... 7862

9.3.3.1 Use of Top TKE for CPU Core Wake ..................................................................................7862

9.3.3.2 Context Save and Restore Across Power State Transitions............................................7863

9.3.4 Timer Registers..................................................................................................................................... 7869

9.3.4.1 Time Keeping Element Shared Registers..........................................................................7870

9.3.4.2 Time Keeping Element: TOP Registers..............................................................................7928

9.3.4.3 Real-Time Clock Registers .................................................................................................7994

9.3.4.4 Time Stamp Counter System Control Registers ...............................................................8007

9.3.4.5 Time Stamp Counter System Control Registers Continued.............................................8021

9.3.4.6 Time Stamp Counter Registers..........................................................................................8044

9.3.4.7 Microsecond Counter Registers ........................................................................................8076

9.3.4.8 Generic Timestamping Engine (GTE) APS Registers .......................................................8078

9.3.4.9 Generic Timestamping Engine (GTE) GPIO Registers......................................................8084

9.3.4.10 Generic Timestamping Engine (GTE) Interrupt Controller Registers...............................8091

9.4 Multi-Purpose I/O Pins and Pin Multiplexing (PinMux) ........................................................... 8108

9.4.1 Overview................................................................................................................................................... 8108

9.4.1.1 Standard and Compatibility................................................................................................8110

9.4.1.2 Glossary...............................................................................................................................8111

9.4.1.3 Relevant Chapters in the TRM............................................................................................8112

9.4.1.4 MPIO Pad Features.............................................................................................................8113

9.4.1.5 Pad Control Unit..................................................................................................................8122

9.4.1.6 Pad Control Grouping .........................................................................................................8123

9.4.1.7 PinMux.................................................................................................................................8124

9.4.2 Functional Description....................................................................................................................... 8126

9.4.2.1 Programmable Drive Strength Capabilities.......................................................................8126

9.4.2.2 Pin-states and Default Pad Controls .................................................................................8127

9.4.2.3 I/O Electrical Capabilities and Special Handling...............................................................8128

9.4.2.4 External Wake Events .........................................................................................................8131

9.4.2.5 GPIO Controller to Ports Mapping .....................................................................................8132

9.4.2.6 DFD OBS (Observation Bus) Signals..................................................................................8133

9.4.2.7 DPD ......................................................................................................................................8134

9.4.2.8 IST and I/O Considerations ................................................................................................8140

9.4.3 Programming Guidelines................................................................................................................... 8147


<details>

<summary>OCR (Page 17)</summary>


```text

9.3.3 Programming GUICeliNeS ...... ec esessecseeseseseesseeessecseeseeesseesiesstecseeseeesneesteeatecseessueesmeeseeeateeeeesnge 7862
9.3.3.1 Use of Top TKE for CPU Core Wake o.........ccccececsseseeeeseeesesceseeceseeecsecsesecsesesaeecateeseeesbansl 7862
9.3.3.2 Context Save and Restore Across Power State Transitions «0.0.0.0... ccceeeeeeeeegaetetgfecees 7863
9.3.4 Timer Registers
9.3.4.1 Time Keeping Element Shared Registers
9.3.4.2 Time Keeping Element: TOP RegiSters............:cccccccesseesseceeceseeeeseeeeseselpelespucceeeseeeeseeeeseees
9.3.4.3 Real-Time Clock Re@Gisters ..........:ccccceccssescssesessesesecseeeeseseeseseesssecseecepeuad pecsesseeeeseeeeseeeeseeees
9.3.4.4 Time Stamp Counter System Control Registers «0.0.0.0... Gefeeiieceseseeeseeeeeeeeeeseeeeeeees 8007
9.3.4.5 Time Stamp Counter System Control Registers Continued 0.0.04... ceeeseseeeeseeeseseeeeeeees 8021
9.3.4.6 Time Stamp Counter ReGisters ...........ccccceeseeseeceeeceseeseeeenecDienDeseeeeeeaeeseeseeseeaeeeeseeseeeeeeeaeeas 8044
9.3.4.7 Microsecond Counter ReGiSters ...........ccccccceeseseseeeee fie qeeseeseeccseeceseesesecseseeseeeeseeecseeeeseeees 8076
9.3.4.8 Generic Timestamping Engine (GTE) APS Registers 2), .........ececeeeeseecseseseseseseeeeeeseeeeneeeees 8078
9.3.4.9 Generic Timestamping Engine (GTE) GPIO Registers .............ecececseseseseseseeeseseeeeseseeeeeeees 8084
9.3.4.10 Generic Timestamping Engine (GTE) Interrupt Controller Registers.............::ccceeeee 8091
9.4 Multi-Purpose I/O Pins and Pin Multiplexing (PinMux)
9.4.1 Overview
9.4.1.1 Standard and Compatibility
9.4.1.2 GOSSALY oo. eeeeeeeececesesescecececesescashoGpesescacscsceceseseseseeeseseseaeseeeseseseseeeeeearaeaeaeaeeseseseaeeeeeeetetes
9.4.1.3 Relevant Chapters in the TRM¢p..y.......c:ccceccscsccssecesseseeseseseesesceseeecseecsesaeseceesecseecseeecseeeeseeees
9.4.1.4 MPIO Pad Features .......0.. 8 geceeceeesecesescsesceseseseseseseeescseseaeaceceseseaesceeeeeeeacaeaeaceeeseeeaeeceeeetaees
9.4.1.5 Pad Control Unit... Qpeececececcecesesesesesesceseseseseseseeeseseseseneeseseseseaceeeeeeaeaeaeaeeeeseaeeeaeeeeeeetes
9.4.1.6 Pad Control Grouping ye... ececeececeeseseseeseseseseseseseeeeseseseseneeseseseseaceeeeeeeacacaeaeeaeaeseaeeeeeeeteres
9.4.1.7 PINMUX 0s tare eeeeeceeeececeececeaceesscsesscsecscsacscecsesacsesacsesacacscsacscseseesacesacsesaceesaceeeeeeaeeeeaes
9.4.2 FUNCtIONAl DESCHIPTION oo. ec eceessesseeesstesstesseessseesnecsutesutesseesnsesstecaueesueesseesutesatesaessueesueesitesatesaeeenee
9.4.2.1 Programmable Drive Strength Capabilities 0.0.0... ccc ccecceescsseseseeseeeeseeeseseeseeecseeeeseeees
9.4.2.2 Pin-states-and Default Pad Controls
9.4.2.3 1/0 Electrical Capabilities and Special Handling........0....ccccececeseseeseeeeseeeeseeeceeeeeseeeeseeaeee
94.24 External Wake Events .0......ecececcceececeseseseseceseseseseseseseeseseseaeaesesescscaceeeeseracaeaeaeeaeseseaeeeeeeeeaes
9.4.2.5 GPIO Controller to Ports Mapping ...........ccccccesescsseseeseseesesesecseeecseeeceesseseesesecseseeaeeecseeeeseeaes
9.4.2.6 DFD OBS (Observation BUS) Signals .............:::ccscesesessseeseseseseeesecececseecacseseseeeacececeeseeteneeeees
9.4.2.7 DPD ooo. eeeececeseseseeeeeesesesesesescecessesesesssseseseaesesceseaeseaesesescaeseaeacesesescacaeeeeseecaeacaeaeeseseaeaeeeereetetes
94.28 IST and 1/0 Considerations 00... .ceeececesseeseeseeseceeeseseseeeeeeeseseseeeeeseeacaeaeaeeeeesaceeeeeeeneeeeaeats
I.A3 PrograMMing GUICelINES ....... ees eeecseecsseeesseeessnteesseeesssteesseeessstecsseeesssmecssneesssecssneressecssnenesseessnenes

```
</details>


<!-- Page 18 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

9.4.3.1 PinMux Programming.........................................................................................................8147

9.4.3.2 Pad Control Programming..................................................................................................8151

9.4.3.3 I/O Safe State Programming during IST............................................................................8152

9.4.3.4 Unused I/O Programming...................................................................................................8153

9.4.3.5 DPD Sequencing .................................................................................................................8154

9.4.3.6 Wake Events Configuration................................................................................................8156

9.4.4 PinMux Registers ................................................................................................................................. 8157

9.4.4.1 Always On High Voltage PAD Control Registers...............................................................8157

9.4.4.2 Always On PAD Control Registers .....................................................................................8175

9.4.4.3 Debug PAD Control Registers ............................................................................................8189

9.4.4.4 EDP PAD Control Registers................................................................................................8200

9.4.4.5 EMMC PAD Control Registers............................................................................................8228

9.4.4.6 EQOS PAD Control Registers .............................................................................................8245

9.4.4.7 G2 PAD Control Registers ..................................................................................................8269

9.4.4.8 G3 PAD Control Registers ..................................................................................................8307

9.4.4.9 G4 PAD Control Registers ..................................................................................................8343

9.4.4.10 G5 PAD Control Registers ..................................................................................................8382

9.4.4.11 G7 PAD Control Registers ..................................................................................................8400

9.4.4.12 G8 PAD Control Registers ..................................................................................................8423

9.4.4.13 G9 PAD Control Registers ..................................................................................................8436

9.4.4.14 G10 PAD Control Registers ................................................................................................8463

9.4.4.15 G11 PAD Control Registers ................................................................................................8484

9.4.4.16 PEX_CTL_2 PAD Control Registers....................................................................................8496

9.4.4.17 PEX_CTL_3 PAD Control Registers....................................................................................8510

9.4.4.18 PEX_CTL PAD Control Registers........................................................................................8529

9.4.4.19 QSPI PAD Control Registers...............................................................................................8553

9.4.4.20 SDMMC1 High Voltage PAD Control Registers ................................................................8575

9.4.4.21 SYS PAD Control Registers ................................................................................................8593

9.4.4.22 UFS PAD Control Registers ................................................................................................8609

9.5 GPIO Controllers...................................................................................................................................... 8620

9.5.1 Overview................................................................................................................................................... 8620

9.5.1.1 Relevant Chapters in the TRM............................................................................................8621

9.5.1.2 Features...............................................................................................................................8621


<details>

<summary>OCR (Page 18)</summary>


```text

9.4.3.1 PINMUX PrOGraMMinG............:cecceccescesceseesceesceceeeceeeeseeseesecseseeeceecaeeaecaeeaeeaeeeeeeseesereereesense 8147
9.4.3.2 Pad Control Programming. ...........cccccceccsssssssssesseseseesesecseseeseseesesecsesecsesaesessesesseeecaeeecseesbansl 8151
9.4.3.3 1/0 Safe State Programming Curing IST ........ccceeceesceseseeececeseseeseseeseeeeseeecseeseseeaeateangfesees 8152
9.4.3.4 Unused 1/0 Programming. ...........ccccccceccssssessesesseseseeseeecsesesseeseseeecseeecsessesecsesessegfesedicrseseeeaes 8153
9.4.3.5 DPD Sequencing .....
9.4.3.6 Wake Events Configuration ...........cccccccccesessescsseseseeseseesesseccccseeecseeecatsselgelespussseeseeeseseeseees 8156
9.4.4 PINMUX REGISTELS oo. eects tessessneesnecsstecatesssesssessnecsueesaresseesstesstecaueesutesseapufunds poessueesneesueesateeaeeenne 8157
9.4.4.1 Always On High Voltage PAD Control Registers............:.csceeceeGefeeiteeeseseseseeeeeeeeseseneenees 8157
944.2 Always On PAD Control ReGiSters .........:.:ceesesesesesceeeeeeeseseseathlpeetheseeseeeeeseseseeeeeeeeeeseneeeees 8175
9.4.4.3 Debug PAD Control Registers ..........cccccecceseessecesecseeeesesseges Maadecseeecseesesessesecseeeeseeecseeeeseeees 8189
944.4 EDP PAD Control Registers ...........ccccecccseccssecesseceseescee five qeescesesecsesecsessesessesesseeecaeeecseeeeseeees 8200
9.4.4.5 EMMC PAD Control Registers ...........cccccecceceesseceesediersbbeseseeccscccseeccseesesessesesseeecaeeecseeeeseeees 8228
9.44.6 EQOS PAD Control Registers .........c.cccccceceseeesseseesMesseseseeseecesceecsesecsesaesesseseeaeeecaeeecseeeeseees 8245
9.4.4.7 G2 PAD Control Registers 2.0.2... cecccceccseecceegeteccaelscsceecseseeseeeeseeccsesecsecsesessesecseeecaeeecseeeeseeees 8269
9.44.8 G3 PAD Control Registers ............eccccesessenaMbesnceceeeesceeesesecseseeseecsesecsecsesesseseeseeecseeecseeeeseeees 8307
9.44.9 G4 PAD Control Registers .... 8343
9.44.10 G5 PAD Control Registers ............cccce Meeccececcssecesecseeeseseesescesesecseeecsessesessesesseeecseeecseeesseeaes 8382
9.4.4.11 G7 PAD Control Registers ...........Ceiecccsescessscsseseseeseeecseseeseseeseecsesecsessesecsesecseeecaeeecseeesseeaes 8400
9.44.12 G8 PAD Control Registers .....2.2)..cccccecccseccecesesseseseeseecseseesesecsesccsesecsecsesecsesecseeecaeeecseeeeseeaes 8423
9.44.13 GO PAD Control Registers os... cecccceccsseccesesesseseseesesecseseesesceseeecsesecsessesessesecseeecseeecseeeeseeees 8436
9.44.14 G10 PAD Control R@GiSt@rs oo... cceccccecccesesseseseeseseesesecseseesesecsesecsecsesecsesesseeesaeeecseeeeseeaes 8463
9.4415 G11 PAD Control Registers ..........ccceccceccesssesseseseesesecseseesesecsesecsesecsessesessesesseeecaeeeeseeeeseeees 8484
9.4416 PEX_CTL_2 PAD Gonttrol ReGisters ............ccccccesessesceseseesesesecseeseseecsecsesecsesesseeeeseeecseeeeseeees 8496
9.44.17 PEX_CTL_3 PAD Control Registers ............cccccccecssesceseseseesesecseescseecsessesecseseeeeseeaeeecseeeeseeaes 8510
9.44.18 PEX_CTL,PAD Control ReGiSters...........ccccccccssesesseseeseseseesesecseeccseeecsesaesecsesecseseeseeecseeeeseeas 8529
9.44.19 QSPI PAD*Control Registers
9.4.4.20 SDMMGC1 High Voltage PAD Control ReGisters ...........ccccccsccsseseseeeeseeseseeseseeeeeeeseeeeseeeaeees 8575
9.4.4.21 SYS*PAD Control REGiSters .........cceeccccescesscsseseseecesecseseeseseecesceseseescseeseeecseeeeseeseseeseseeeeseeaeees 8593
9.4.4.22 UFS PAD Control Registers ..........ccccccceessssesesseseseeseecsesecseseesesecsesecsecsesecsesesseeecaeecseeeeseeaes 8609
9.5 GPIO Controllers oo... eeceeseesssecssesseessessseeestecsucesneesnesseesatecsuecsneesueesseesanessuessneesueesuceeatessuesseesauecsucenatesssesees 8620
9.5.1 OVELVICW.. nn essesseecsstesseessseesnecsseesutessesnsesstecsuecsuessueesutessecsuessueesuessunesatesaeesaseeanecauessunesseesuteeaiecauesseeesneesnets 8620
9.5.1.1 Relevant Chapters in the TRM..........ccccccescsssccssesesseseeeeseeeseseeseeecseeecseseesecseseseesecaeeecseeeeseeaes 8621
95-12 FOQtUreS oes ssceesseeseseescsceecsesscsessceeceeacsceessesacsesacsesassasscsesscsessesacsesacaeeaseessceeeeeeeeateaes 8621

```
</details>


<!-- Page 19 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

9.5.2 Functional Description....................................................................................................................... 8623

9.5.2.1 Basic GPIO Controller Structure.........................................................................................8623

9.5.2.2 GPIO TimeStamping Interface ...........................................................................................8630

9.5.2.3 GPIO Clock and Reset Control ...........................................................................................8631

9.5.2.4 GPIO Interrupts....................................................................................................................8633

9.5.2.5 AON GPIO Controller...........................................................................................................8638

9.5.2.6 APB Slave Error support .....................................................................................................8639

9.5.2.7 Virtualization .......................................................................................................................8639

9.5.3 Registers.................................................................................................................................................. 8641

9.5.3.1 System Address Map (AMAP) ...........................................................................................8641

9.5.3.2 Registers Details .................................................................................................................8643

9.5.4 Programming Model............................................................................................................................ 8653

9.5.4.1 GPIO Pad Control Initialization...........................................................................................8653

9.5.4.2 GPIO Input Configuration ...................................................................................................8654

9.5.4.3 GPIO Output/Bi-directional Configuration.........................................................................8655

9.5.4.4 GPIO Interrupts....................................................................................................................8656

9.5.4.5 Enabling Security Attributes for GPIO Registers...............................................................8658

9.5.4.6 GPIOs in Loopback Mode...................................................................................................8658

9.5.4.7 Disabling Specific GPIO......................................................................................................8658

9.5.4.8 GPIO Programming Entities ...............................................................................................8659

9.5.4.9 Interrupt Handling Options and Guidelines .......................................................................8659

9.5.5 Platform Aspects ................................................................................................................................. 8659

9.5.5.1 De-bounce Filter Threshold Selection................................................................................8659

9.5.5.2 GPIO Usage Restrictions in Platforms...............................................................................8659

9.5.6 GPIO Registers ...................................................................................................................................... 8660

9.5.6.1 GPIO Common Control Registers ......................................................................................8660

9.5.6.2 GPIO Control Registers.......................................................................................................8693

9.5.6.3 GPIO FSI Common Control Registers................................................................................8790

9.5.6.4 GPIO FSI Control Registers ................................................................................................8796

9.6 Activity Monitor (ACTMON) ................................................................................................................ 8813

9.6.1 Overview................................................................................................................................................... 8813

9.6.1.1 Glossary...............................................................................................................................8814

9.6.1.2 Relevant Chapters...............................................................................................................8815


<details>

<summary>OCR (Page 19)</summary>


```text

9.5.2
9.5.2.1
9.5.2.2
9.5.2.3
9.5.2.4
9.5.2.5
9.5.2.6
9.5.2.7
9.5.3
9.5.3.1
9.5.3.2
9.5.4
9.5.4.1
9.5.4.2
9.5.4.3
9.5.4.4
9.5.4.5
9.5.4.6
9.5.4.7
9.5.4.8
9.5.4.9
9.5.5
9.5.5.1
9.5.5.2
9.5.6
9.5.6.1
9.5.6.2
9.5.6.3
9.5.6.4
9.6
9.6.1
9.6.1.1
96-922
Functional D@SCriPtion 0.2... ceccecsecssecessesssessesscsesseesecsueesesscsucsueeaeececsueeaeesussueeateeaseuseateanseeeenteateeneeege 8623
Basic GPIO Controller StruCture.........cesececeeseceeeeseseseseseseneeseseseseseeceeeeeacaeaeaeeeesesteeeeee heey 8623
GPIO TimeStamping Interface .........c cc ceeccccesseseseeseeeeseseesesceseeccseecseeseeeseseeseeecsenaatesegfreees 8630
GPIO Clock and Reset Control .........cscecssceceseseseeeeseseseseseseeeeseseseseececeeestacacacecegftssocnseeeeeeees 8631
GPIO Interrupts...
AON GPIO Controller... ceececeesesceseseseseseseecececesescsceeeeeeeetsrsceeeceeeeescatetselgelespaceeeeteeseseeeeeees 8638
APB Slave Error SUPPOSt ..........:ccceccesesessesescesceceseeceseeseseeseseeececcseseeaesagsbiea feceseeseeeeseeeeseeeeseees 8639
VirtlaliZation occ eceecececececesceceeeeeesescecscececesescaceteeeecstscecececstslesfegpicseseeesceeeeeeeeeseseeeeeees 8639
REGISTELS oo. eeceesstecsesseeesneesstesstecsuessseesneesseesatesaessuesaecsusesutesseesstesseadl lbosenidecstesatecstesseenmeeseesnteeaeensees 8641
System Address Map (AMAP) ..........cccscssceseseceseseeseeceesecesenaeDbnadesceeseeeceseeseecacaceeaeeeeneeeeseeees 8641
Registers Details 2.0.0... cccccccceescesesceeeseeceseeecseeecsecaee iiveqececeseeecsesecsessesecsesesaeeecseeecseeeeseeees 8643
Programming Model... ccceessecsecsesseeesestesseessessuessedhessslbesntesntecseesueesueestesntecseesseesneeseesateeaeeenees 8653
GPIO Pad Control InitialiZation 2... ec eeeeeeeeeesMecseceseeceeeceseseseeeeeeeeseseseaeeeeeeseseeeeeeeeetetes 8653
GPIO Input Configuration ............ceccccecccecceegeteccaelscsceecsesceseeecseeecseeecsecaesessesesseeecseeecseeesseeees 8654
GPIO Output/Bi-directional Configuration... 2... ceececcecsseseseeceseeseeeeseseeseeeeseeecseeeeeeees 8655
GPIO Interrupts...
Enabling Security Attributes for GPIO/REgisters ............ssececeeeseeseseseseseeeeeceseseeeeeeeeeeeees 8658
GPIOs in Loopback Mode ............Cimpeescscescesssessesesecseseeseseesescesesecsesecsessesecsesecseeecseeecseeesseeaes 8658
Disabling Specific GPIO .........p Do cecccceeseeccseesescecesecseseeseseeseseesesecsesecsessesecseseseeecaeeecseeeesesees 8658
GPIO Programming EntitieS. 2... eee cecceeesceseeceeseeseeseeseeseeeceeeeeecaeeaeeaecaeceeseetersereeaeeaes 8659
Interrupt Handling Options: and Guidelines 2.0.0.0... cccccceccseseseeseeeeeeeeseeeeseeeeseeeeseeeeeeeaeee 8659
Platform ASP@CtS 00.6 eccsescsseesssssssesssesssessseecscsssecsnecsusesncessesssseessecsusesuecsuessueeeseecseessueesnecsueesseesseessees 8659
De-bounce Filter Phreshold Selection... ececeeseceeseeseteeeeseseseseseeeeeeseseaeaeaeeeeseeeeeeeeeeeeeees 8659
GPIO Usage ReStrictions in Platforms............cccccessecesessesessceeseseeecsecseseeseseeseeeseeeeseeeeseeees 8659
GPIO Registers
GPIO Common Control Registers ..
GPIO*Control REGiSters.........ecececcecccseseseescseeeeseecesesaesecsesecsesecsesecsesecsessesecsesesseeecaeeecseeetsesees
GPIOVFS] Common Control Registers ...........:cccccccesseceseeseseeseseeseseeecseceesecsesecseseeseeeeseeeeseeees 8790
GPIO FSI Control Registers ...........cccceccccescssescsseseseeseeeseseeseseeseeecseecsessesessesesseeecseeecseeeeseeees 8796
Activity Monitor (ACTMON) .....ccscssssssssescssseccssseccssessssseccsssesssseccsssessssecssnsccesuecesssssssuecesuecssueesssnecssneeesse 8813
OVELVICW....esseesseesstesseessseessecsseesutesscsnesstecsuecsueesuesutesatessuessueesueesseesaneeaeesaseestecaueesunesseesuteeatecauesseeeaneesanets 8813
GOSSALY ...eeeeeeeeecececeseseseseececesesesesesesssesesenescessacaesesesesacacseseaeseseseseacaeeeeseacacaeaeseseseaeeeeeeetees 8814
Relevant Chapters ........c.cccccccscccsesssseseesesesscsesecseeecsesaesecsesessesecsesecsesecsesaesecsesecseeecseeecseeeeseeees 8815

```
</details>


<!-- Page 20 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

9.6.1.3 Features...............................................................................................................................8815

9.6.2 Functional Description....................................................................................................................... 8815

9.6.2.1 Location and Register Access ...........................................................................................8819

9.6.2.2 Central ACTMON Module...................................................................................................8820

9.6.2.3 Handling Overflow ..............................................................................................................8822

9.6.2.4 Features to Aid DVFS..........................................................................................................8822

9.6.2.5 Unit ACTMONs for Multimedia Engines (NVJPG, NVENC, NVENC1, NVDEC, NVDEC1, and VIC) ......................................................................................................................................8823

9.6.2.6 Unit ACTMON for BPMP/SCE/RCE/AON Cortex-R5 Processor.......................................8824

9.6.2.7 Activity Aggregation ...........................................................................................................8825

9.6.3 Programming Guidelines................................................................................................................... 8826

9.6.3.1 Global Registers..................................................................................................................8826

9.6.3.2 Central ACTMON Instance Registers ................................................................................8826

9.6.4 ACTMON Registers.............................................................................................................................. 8828

9.7 Hardware Synchronization Primitives (HSP) ................................................................................ 8871

9.7.1 Overview................................................................................................................................................... 8871

9.7.1.1 Rationale..............................................................................................................................8871

9.7.1.2 Use Cases............................................................................................................................8871

9.7.1.3 Shared Mailboxes ...............................................................................................................8872

9.7.1.4 Shared Semaphores ...........................................................................................................8872

9.7.1.5 Arbitrated Semaphores ......................................................................................................8872

9.7.1.6 Doorbells .............................................................................................................................8872

9.7.2 Functional Description....................................................................................................................... 8872

9.7.2.1 Sub-Unit Descriptions .........................................................................................................8875

9.7.2.2 Multiple Processors Access to Shared Resources...........................................................8880

9.7.2.3 Using Doorbells for Handshake During Boot Sequence...................................................8881

9.7.2.4 Shared Interrupts Configuration ........................................................................................8881

9.7.2.5 Programming Model...........................................................................................................8882

9.7.3 Programming Guidelines................................................................................................................... 8882

9.7.3.1 Shared Mailboxes ...............................................................................................................8882

9.7.3.2 Shared Semaphores ...........................................................................................................8883

9.7.3.3 Arbitrated Semaphores ......................................................................................................8884

9.7.3.4 Doorbells .............................................................................................................................8884

9.7.4 HSP Registers........................................................................................................................................ 8885


<details>

<summary>OCR (Page 20)</summary>


```text

9.6.1.3
9.6.2
9.6.2.1
9.6.2.2
9.6.2.3
9.6.2.4
9.6.2.5
9.6.2.6
9.6.2.7
9.6.3
9.6.3.1
9.6.3.2
9.6.4
9.7
9.7.1
9.7.1.1
9.7.1.2
9.7.1.3
9.7.1.4
9.7.1.5
9.7.1.6
9.7.2
9.7.2.1
9.7.2.2
9.7.2.3
9.7.2.4
9.7.2.5
9.7.3
9.7.3.1
9.7.3.2
9.7.3.3
973.4
9.7.4
FOAtUIeS ooo. eceeeecceecseeseseeeceesaceesacsesscsacscsacsceecsesacsesaceesaceacscesseecesacesasiesaeeeeseeeeeeseeeeagn 8815
Functional D@SCriPtion 00... ceccecseessessessesssessessssessessecsucesessnceucsueeaeecacsuteaeesucsuteateeaseuseateanseaseeteateeataneel 8815
Location and Register ACCESS .........cccccceccssesesseseseeseeecseseesesceseeccseecsecseseeseseeseecseaatestgfreees 8819
Central ACTMON Module .........eeesceseseseececeseseseseeeeseseseseseaceceseseseseecesseratacaeecegfessMocnsereeeeees 8820
Handling Overflow ..
Features to Aid DVFS..0.....eeececeseeceseseseseseeseceseseseeeeesessseacaeacseseseacaceceeseedgeuapieseseseseeeeeeeteees 8822
Unit ACTMONs for Multimedia Engines (NVJPG, NVENC, NVENC1}.NVDEC, NVDEC1, and
VIC) eeeeeeseseseseceesescsesesesessescecscsesessscusssseacaeacsescscusecsessacacaesessceusececsegengeag}ecseeeaeecseseeeenseeeeeeeees 8823
Unit ACTMON for BPMP/SCE/RCE/AON Cortex-R5 ProceSSot.)...)....cseseceeceseeeeeeeeeeeees 8824
Activity Aggregation
Programming Guidelines
Global R@GiSters 00.0.0... cccccccececseseeceseeseseceseeecseeeeeecasUPaghyesccceseeecseecsessesecsesesseeecseeecseeeeeesees
Central ACTMON Instance ReGisters ...........:...: Jpn ccc ceecescescseescseeseseesesecseeeeseeecseeeeeeees 8826
ACTMON ReGiStEPS.....seesessseessecstesstessecssteestecsseesledDbsstesstecsuecsuessnecsutesatesseessuessueesueesetesseesseenatecsseeses 8828
Hardware Synchronization Primitives (HSP) Soc.scssccssssscsssescsssecssseessssecssseecssnscssseecssseccsseeessnecesss 8871
OVELVICW....esseecseeesstesseessteestecsscesatesseesstessecsedheafheagestesatecstessueesuecsseesntesseesueeauecseesutesnessutesniessesseeesneeseeets
Rationale... cececeesescecececeseseseesesessDiaghtececeseseseseeeeeseseseaeseeseseseseaeseeeeeeacaeaeeeeeeseseaeeeeeeetees
USC CASS... eeeceecessceeseceseeescscepeDuadessscsessceecsceecsesacsesacsesacacscacsesessesaceesacsesaceesaceeeeesaeeteaes
Shared Mailboxes .0.......eceecesestheeseseesesesesescscececesescseeeeeeeeensesceeseseeeescaceeeeeeceeaeeceeeeeeeeseeeeeeees
Shared Semaphores ..
Arbitrated Semaphore ya o....ecccceccscescssesesseseeseseeceseeseseeseseeecuecseseeseseeseeseseeeeseeseeeseeeseeeaeees 8872
Doorbell s 00.0... eceeeeeyeceeatececeseseseseseeseseseseseecececscseseseeescseseaeecceseseseaeeeeseeeacaeaeaeeeeseseaeeeeeeetees 8872
FUNCtIONAl DESCTIPTION oes eesseeeseeestesntecseessseesnecsutesetesseesnesstecsueesueesseesutesatesaeessueesueesetesateeaeesnee 8872
Sub-Unit De@SCPIPTIONS 00... ee cee ccc cetcesesceseeeeseseeseeseseesesesecuecseseesesesseeeeseeecsesseeecseeeseeeaeees 8875
Multiple Processors Access to Shared R@SOUICES...........ccccecessseeseseeseeeeseseeseseeseeeeseeeeseeaes 8880
Using Doorbells for Handshake During Boot Sequence. ...........cececeseeseseseeseteeeeeeseeeeseeees 8881
Shared\interrupts Configuration ............cccccccecsceseseeseseeseseeceeceseeeeseseeseeseseeeeseeecseeseeeeeeeeeaeees 8881
Programming Model ............cccccceccesssseseseescseeeeseeceseesesecsesesseseeseecseecsesaesessesecseeecaeeecseeeeeeeees 8882
Programming GUICElINES ....... ees eessecseesstecseesseeeseecsuteseeessecsseestecsecsueesseesutesntecseesseessneestesateeaeeenees 8882
Shared Mailboxes .0.......cscecececesesesseseseeesesescsceeeeecescsceeseseeessesceeeeeeeseseseeeeeeeseeaeaeeeeeeenseseeeeeeees
Shared Semaphores ..
Arbitrated Semaphore ..........ccccceccssescsseseceseesesecesecseseeceseeccsecseseesesecseeseseeeesesseeeeaeeeseseeaeees 8884
Doorbell S oo... ceeeeeeeseseecesesesesesestsesesesesesescesscseseeeeescseseaeneaeseseaeseeeeeacacacaeaeeeeseseaeeeereeeates 8884
HSP Re@GIStTEMS ou. eseeceesseessseesstesstessseesueesnecsutesstecssessseesuecsueesatesseesaessuecaueesuessueesiteeatessessueesueesutenateeaeenae 8885

```
</details>


<!-- Page 21 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

9.7.4.1 Common Registers .............................................................................................................8885

9.7.4.2 HSP Interrupt Registers......................................................................................................8886

9.7.4.3 Shared Semaphore Registers.............................................................................................8890

9.7.4.4 Arbitrated Semaphore Registers........................................................................................8891

9.7.4.5 Invalid Registers..................................................................................................................8896

9.8 Thermal Sensor and Thermal Throttling Controller.................................................................. 8897

9.8.1 Overview................................................................................................................................................... 8897

9.8.1.1 Thermal Sensor Cells (TSENSE_U3_A, TSENSE_BJT_U3_A) ...........................................8897

9.8.1.2 Thermal Event Detection (SOC_THERM_thermctl)...........................................................8899

9.8.1.3 Electrical Event Detection (SOC_THERM_edp) .................................................................8901

9.8.1.4 Throttling Controller (SOC_THERM_throttlectl) ................................................................8902

9.8.1.5 FSI_THERM..........................................................................................................................8903

9.8.2 Thermal Registers................................................................................................................................ 8903

9.8.2.1 Thermal Sensor Registers..................................................................................................8903

9.9 In-System Test Controller (IST) ......................................................................................................... 9022

9.9.1 Overview................................................................................................................................................... 9022

9.9.1.1 Features...............................................................................................................................9022

9.9.1.2 Impacted Domains and IPs................................................................................................9023

9.9.1.3 Platform Level View............................................................................................................9024

9.9.1.4 Software Components........................................................................................................9025

9.9.2 IST Registers .......................................................................................................................................... 9028

9.10 Design for Debugging (DFD) .............................................................................................................. 9046

9.10.1 Overview................................................................................................................................................... 9046

9.10.1.1 System Connectivity Overview...........................................................................................9047

9.10.1.2 Summary of Major Features...............................................................................................9049

9.10.2 Functional Description....................................................................................................................... 9049

9.10.2.1 CoreSight.............................................................................................................................9050

9.10.2.2 Closed Box Debug Over USB2............................................................................................9115

9.10.2.3 Miscellaneous Debug Features..........................................................................................9156

9.10.2.4 Watchdog for Debug and Recovery ...................................................................................9176

9.10.2.5 Global Freezing for WDTs...................................................................................................9178

9.10.2.6 Debugging Low Power States............................................................................................9186

9.10.3 DFD Registers........................................................................................................................................ 9188


<details>

<summary>OCR (Page 21)</summary>


```text

9.7.4.1
9.7.4.2
9.7.4.3
9.744
9.7.4.5
9.8
9.8.1
9.8.1.1
9.8.1.2
9.8.1.3
9.8.1.4
9.8.1.5
9.8.2
9.8.2.1
9.9
9.9.1
9.9.1.1
9.9.1.2
9.9.1.3
9.9.1.4
9.9.2
9.10
9.10.1
9.10.1.1
9.10.1.2
9.10.2
9.10.2.1
9.10.2.2
9.10.2.3
9.10.2.4
9.10.2.5
9.10.2.6
9.10:3
Thermal Sensor and Thermal Throttling Controller.
In-System Test Controller (IST)...
COMMON REGISTETS ..........:ceceecceceeseeseeseeseeseceececeeceeeesecsecsecseceeeeeeceeeeaecsecaeeaecaeeeeseesersereesese 8885
HSP Interrupt REGiSterS 0.2... ececeeceseesceescesceeceeecaeeseesecsecseeseeseeseeaecaecaeeaesaeeeseeterseresbaesly 8886
Shared Semaphore ReGiSters............ccccccsscssesesessesseseeeseseescceseeeseeecseeseseesesecsesecsunateapgfeeees 8890
Arbitrated Semaphore ReGiSters............cccccceesseceseesesseseeeceeeeseeeeseecseeseseesesessgfecsMocnseeeseees 8891
Invalid REGiSters........ccceccceeeseeeesseseseeeeseeseeeeseeeeeeees 8896
Overview
Thermal Sensor Cells (TSENSE_U3_A, TSENSE_BUT_U3_A) .....0) 0. cseseeeeseseseseeeeeeeeteeees 8897
Thermal Event Detection (SOC_THERM_thermctl) ............::A)eQeceecesseeeeeeseeeseeeseeeeeeees 8899
Electrical Event Detection (SOC_THERM_edp) ...........::s:sg:Deadeceseseeseeeseseseeeeececeeseseeeeneeeees 8901
Throttling Controller (SOC_THERM_throttlectl) ......... yet cceseceseeseseseseceseseeseseseseeeseenseeeseeees 8902
FSI_LTHERM. 0.00. eeescceecseescscesceesceesscessceseceecsceeseesdgueslpeessceecscsecsesecsesacsesaeseseceesseeeseeeaeeeaes
Thermal REGiSters wn. eseeseessesssessseesstesseesseeestecssecsusesseslMcrssecssecsueesueesueesatesseessueeanecsueeseteeseesseenatecsneeses
Thermal Sensor ReGiSter ............cccccccesesessep@tencael cceseseeseseecesceseceseeeeseeseseeeesesseeeseeeeseeeeaeees
Overview..
Features
Impacted Domains and IPS .........Cegpeeccesesceceseesesesseseeseseesesesecseeseseeecsecaeecseeecaeeseseeseseeeeeeatee
Platform Level View ...........:Gpeptececeseseseseececeseseseseeeeeeseseseseaeesesesesesceeeeeecaeaeaeaeeeeseseaeeeeeeeeeees
Software COMPONENTS... feecececcecesessesesceseeceseceseeseseeceseeececcseseeseseeseeseseeeeseeseeeseeeeseeeseees
IST REGISTELS oo. cs tecseesseeesnecsntesntecseesseestecsueesatesseesatessmesseesueesueesutesatessessueesueesneeeateeaennee
Design for Debugging (DED) ........scssssssssssssesstesessessescesneeesessunseseessuseessnneseeesanesessunateesesntetessneeseess
OVEPVICW..o esses tigeiteesssseeesseeesssneessneesssnecssseeessnesssetssssessneeessnesssutessseeessueessseeessetesssecessetessnecensenessneense
System Connectivity OVErViOW 0... eee ceeeeeseeeeseseeeescseeeseeseseescseeseeecseeesaeeeseeeseeeeseesatees
Summary. of Major Features....
FunctionalDescription..
CoreSight
Glosed Box Debug Over USB2.........cecccceccesesesseseseeseseesesessesceseecsesecsecsesecsesecsesecseeecseeeeseeees
Miscellaneous Debug Features..........cccecccscssesesseseeseseseesesceseeecseeecsecseseesesesseeecaeeeeseeeeseeees
Watchdog for Debug and ReCOVETY ............ecececeseseseeseeeeesesesceeseceseseseeeeeeetetataeeeeeeeeeeseseeteees 9176
Global Freezing for WDTS...........ccceccccecessescssesesseseseeseecsesecsesecseecsesecsecsesessesecseeecseeecseeesseeaes 9178
Debugging Low Power States ..........ccccccecccsesssseseseeseeecseseeseseeseecsesecsessesecsesessesecaeeecseeeeseeees 9186
DFD ReGIStEMS uo... eceesseessseeseesstesssessueesneesstesatecssessseessecsueesatesseesaesauecsueesuessueesutesatecsessueesueesueesateeaeenee 9188

```
</details>


<!-- Page 22 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

9.10.3.1 CoreSight_CFG Registers ...................................................................................................9188

9.10.3.2 Scratch Registers................................................................................................................9215

9.11 System Registers .................................................................................................................................... 9215

9.11.1 Miscellaneous Registers.................................................................................................................... 9215

9.12 Hardware Performance Monitor (HWPM)..................................................................................... 9216

9.12.1 Overview................................................................................................................................................... 9216

9.12.1.1 System Block Diagram .......................................................................................................9218

9.12.1.2 Performance Monitor Description .....................................................................................9221

9.12.1.3 Performance Event Considerations...................................................................................9222

9.12.1.4 Performance Trigger Considerations ................................................................................9224

9.12.1.5 Memory Subsystem Single Pass Profiling ........................................................................9231

9.12.1.6 Programming Path..............................................................................................................9235

9.12.1.7 Virtualization Support.........................................................................................................9236

9.12.2 Functional Description....................................................................................................................... 9238

9.12.2.1 IPs Utilizing HWPMs...........................................................................................................9238

9.12.3 Programming Guidelines................................................................................................................... 9242

9.13 Always-On Cluster (AON) and SPE................................................................................................... 9243

9.13.1 Overview................................................................................................................................................... 9243

9.13.1.1 AON Cluster Diagram..........................................................................................................9244

9.13.2 AON Cluster Functional Description ............................................................................................ 9245

9.13.2.1 Cortex-R5 Processor...........................................................................................................9245

9.13.2.2 Processor Configuration ....................................................................................................9245

9.13.2.3 Interrupt Controller..............................................................................................................9245

9.13.2.4 Processor and Interrupt Controller Documentation .........................................................9245

9.13.2.5 Timers..................................................................................................................................9246

9.13.2.6 TCM Interface .....................................................................................................................9246

9.13.2.7 ATCM Interface...................................................................................................................9247

9.13.2.8 Error Checking and Signaling.............................................................................................9248

9.13.2.9 BTCM Interface ...................................................................................................................9249

9.13.2.10 BTCM RAM Configuration ..................................................................................................9249

9.13.2.11 Error Checking and Signaling.............................................................................................9249

9.13.2.12 Interrupts .............................................................................................................................9249

9.13.2.13 AXI Block Support...............................................................................................................9260


<details>

<summary>OCR (Page 22)</summary>


```text

9.10.3.1
9.10.3.2
9.11
9.11.1
9.12
9.12.1
9.12.1.1
9.12.1.2
9.12.1.3
9.12.1.4
9.12.1.5
9.12.1.6
9.12.1.7
2.2
9.12.2.1
2.3
3.1
9.13.1.1
3.2
9.13.2.1
9.13.2.2
9.13.2.3
9.13.2.4
9.13.2.5
9.13.2.6
9.13.2.7
9.13.2.8
9.13.2.9
9.13.2.10
9.13.2.11
9.13.2.42
9.13.2.13
Hardware Performance Monitor (HWPM)
Always-On Cluster (AON) and SPE..
CoreSight_CFG ReGisters ...........cecccecseesessesessesesecseeecseseeseeceseecseecsessesecsesecseeecaeeecseeseeeagn 9188
Scratch ReGiSters..........cccccccccesessssesseseseeseseeseeecsesceseeseseeseseesesecsesecseseeseceeseeecsecseeeseeeeeeestaeells
SYSTEM REGISTELS ou... ees tecssecsneesseesseeestecsucesseesuecsseeesecsuessneesueesscesatessuessneesueesseeratessuesstesasecagensteteglesees
Miscellaneous Registers
OVErVICW....ceesceeceesteseeesteeteetees
System Block Diagram
Performance Monitor DeSCription .............ccccceeeeceseeeeseeeeseceseeeslosfeapicseeseeeseescseeeeseeeeeeees 9221
Performance Event Considerations ...........cccecescsssseseseseeeeeeathlees thee eeeseseseaeeeeeseseeeeeeeeeeees 9222
Performance Trigger Considerations .............cccceccccesescesege Maadecseescseeseseeseseeseeeeseeecseeeeseeees 9224
Memory Subsystem Single Pass Profiling ..............0.-@teqeeceseseseseseececeeeseseeeeeeeeseseeeeeeeeeteees 9231
Programming Path..........ccccccccccessesssceseseesesesscssescssedeorspesesceccsceecseeecsesaesecsesesaeeecsenecseeeeeesees 9235
Virtualization SUPPOFt oo... cece cceeccesseseceseeceseesesMesseeccseeeceecsesecsesecaeeeesecesseceeseeaeeeseeeaeees 9236
Functional D@SCriPtiOn .........cecceesecssececseeseessesseessiPecennedccesesseeeusesesaeeeuceueeaeesessueeaneeassseateanseeseateateeneenes 9238
IPs Utilizing HWPMs
Programming Guidelines
OVELVICW....essecsseesstesseessteestecsseesatesseesshefOjecssessuessueesutesatecsessuessueesseesutesseesseeaiecsueesutesneesuteeaiesaesseeesneeseeees
AON Cluster Dia Qrarn ni... i eccecccsceseecescesesecesseseseeseseescseesesecsesecsecseseeeesecaeseeseeeeseeeeaeees
AON Cluster Functional D@SCLiIPtion oo... eeeessesssessesstessseesseesstesstecstesseesuecstesetesseesnessneesseeses 9245
Cortex-R5 ProCeSSor AQ ye ec cceccecceescsesseescseeecseesesesaesessceesaceecscecseseesesaceesacaeeeceessceeeeeeeeneeaes 9245
Processor Configuration ............ccccccceccssescssesessesesecseecsesesseeeseeecsesecsecsesecsesesseeesseeecseeeeseeees 9245
Interrupt COmtrolleric....... ec eccceccccescesessesceseseseesesecseeeeseecsesaeseeseseeeesecseecseecseeeeseeeeseeeseesaees 9245
Processor and.Interrupt Controller Documentation .............cccccecesseseeseseseeseteeseeeeseeeeseeees 9245
THMELS... eos leceeceseeeescsssseseesceecsceeseescsecscseescsecacsecscseeaesaeseeecsesacsesaceeesesasaeeesaeeesaeeaseeeeseeeeeeesaeees 9246
TCM Interface .. 9246
AT CMAN terface occ eececececesesescseseeeeesescsescscececsacseseseseecavsceeseeeesescaceeseecetateceeeeeeeeeseateneees 9247
ErrorChecking and Signaling ...........cccccceccssesesseseseeseeseseseesesceseeeeseecesecsesessesecseeecseeecseeeeseeees 9248
BTCM Interface oo... eee ececeseseseseeeesesesesesescececesesesceesesscaeseseneeseseseseaceeeececacaeaeaeeeeseseaeeeereetees 9249
BTCM RAM Configuration ............cccceccssescesesesseseseeseseeseseesesceseeccsesecsecaesessesecseecaeeeeseeeeseeees 9249
Error Checking and Signaling ...........ccccccecceeessesesseseeeeseeeesesceseeecseeecsecsesessesesseeecseeecseeesseeees 9249
IMTOPFUPtS 02... eeeeeccecescesceeceeccececeeseeseeseeseceacsececcececaeesecseeaecaeceacsesasecessecaesaeeaeceeseeseesereeaeeaees 9249
AXI BIOCK SUPPOFt ......eeeceececceseseeseeeseseesescesesecsesceseaesesecsesececcseseeaesecseesesececsesaeeeseeeseeeaeees 9260

```
</details>


<!-- Page 23 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

9.13.2.14 Interrupts .............................................................................................................................9261

9.13.2.15 Cortex-R5 Activity Monitor .................................................................................................9262

9.13.2.16 Programming Model...........................................................................................................9264

9.13.3 AON Programming Guidelines ........................................................................................................ 9275

9.13.3.1 Power Management ...........................................................................................................9275

9.13.3.2 AON Cluster SC7 Entry .......................................................................................................9283

9.13.3.3 AON Cortex-R5 Activity Monitor.........................................................................................9283

9.13.3.4 Reset and Clocking .............................................................................................................9284

9.13.4 AON Registers ....................................................................................................................................... 9285

9.13.4.1 AONCLUSTER......................................................................................................................9298

9.13.4.2 DMAAPB..............................................................................................................................9301

9.13.4.3 APS_AST..............................................................................................................................9373

9.13.4.4 AO-DMA Registers ..............................................................................................................9398

10. I/O Controllers and Interfaces ..............................................................................................................9475

10.1 High-Speed I/O Cluster......................................................................................................................... 9475

10.1.1 Overview................................................................................................................................................... 9475

10.1.1.1 HSIO UPHY Group...............................................................................................................9475

10.1.1.2 NVHS UPHY Group .............................................................................................................9478

10.1.1.3 GbE UPHY Group.................................................................................................................9479

10.2 USB Complex............................................................................................................................................. 9481

10.2.1 Overview................................................................................................................................................... 9481

10.2.2 USB Functional Description ............................................................................................................. 9483

10.2.2.1 USB Controller.....................................................................................................................9483

10.2.2.2 Interface Restrictions .........................................................................................................9484

10.2.2.3 Host and Memory Access Interfaces................................................................................9485

10.2.2.4 USB 3.2 Device Controller...................................................................................................9485

10.2.2.5 xHCI Controller Programming Interface............................................................................9485

10.2.2.6 USB PADCTL .......................................................................................................................9486

10.2.2.7 USB AO ................................................................................................................................9487

10.2.3 USB Programming Guidelines......................................................................................................... 9487

10.2.3.1 Cold Boot.............................................................................................................................9487

10.2.3.2 SC7 (LP0).............................................................................................................................9494

10.2.3.3 XUSB Controller Power Gating...........................................................................................9499


<details>

<summary>OCR (Page 23)</summary>


```text

9.13.2.14 IMTOPPUPtS o.oo... cece eeceeceeceeccecceceeseeseeseeseesececesecsceececaecaecsesaesecaceeeeeeaecseeaeeaeeaeeeeseesersereeaeeagen
9.13.2.15 Cortex-R5 Activity MOMItOr o.oo. ceeeecseeeceeseeessceeseeeecsesecsesecsesacsesassesaeeesseeeesseebaeed
9.13.2.16 Programming Model ............ccccccsssessseeseseesceeecseescsecaesecsesecseseeseeecseecsessesecsesesseeecseuaatestgfreees
9.13.3 AON Programming Guidelines ...
9.13.3.1 Power Management ..
9.13.3.2 AON Cluster SC7 Entry ........eecececcecesesesesesesescecesesescsceeeeeeeeessaceeeceeeeescatetstlgeleapaceeeeeeeseseeeeeees
9.13.3.3 AON Cortex-R5 Activity MOMitOr..... eee eeeeeereeeeneeseeeeseeseseesesapsltal pessseseeeeeeseeseeseeaeees
9.13.3.4 Reset and ClOCKING .........cccceesceseseesesceseseeceseeecsceceseesesessesecsecesesesslpsfeapicecsesesseecseeecseeseeeeees
9.13.4 AON ReGISTESS ou... sesseeeseesseessseesnecsseesstessesseeestecsuecsutesseesstesatecssessseesnadl bess iMbecsssteeatecseesutssneesseeeateessesses
9.13.4.1 AONCLUSTER........eccseceseseesececeeesescececeeeeesescececececesescaceeeeeesenesDbaadiceeeseseeeeeeeeeeaseeeeeeeeneeseeteeeees
9.13.4.2 DMAAPB .... os eeecesesesesesesceeseceseseneeeseeseseacacecscecescacaesteaghiveqesesceseseseaeseaeeeacaeaeseeseseseaeeeeeeeeees
9.13.4.3 APS_AST ....eececessscscecesesesesescececececeacaeececesesescececececesescsdeceslpesescecseececeescaeeeeeeeceeaeeeeeeeeeeeseaeeeees
9.13.4.4 AO-DMA R@GISTEIS ...........eccecceceeseeseeseeseeeeeccecccccee Mfecsseeseeaececeececeeecaeeaeeaecaeseeeeeeeeeeeseeeaeeas
10. 1/0 Controllers and Interfaces .o..cccescecesesssesseessesttcvcsaplessscsssesssssesseessessessesssessessessetsatssesstsatssssensanesees
10.1 High-Speed I/O Cluster
10.1.1 Overview
10.1.1.1 HSIO UPHY Group
10.1.1.2 NVHS UPHY Group 1.0.0... ecececesesessQoeipeecescsceccecesesesceecescsesesencecseseseseeeeseaeacaeaeaceeeseseaeeeeeeeeees
10.1.1.3 GDE UPHY Group.........eeeecesee(iepleceseceseseseecsceceseseseseseseseseaeacsesescsesceeeeescaeaeaeaeeseseaeaeeeeeeeteees
10.2 USB COMplex....cececceecsessesseessesse Dagphecscesccecsseeeuccueeaeesucsuseaceeussuseaessnseusseseseeenssaseaneeassueeateanseeseaneanseeseaeeateeeees
10.2.1 OVELVICW....esseesstesstessesansalige Wesssesssessutesstecsuecsueesneesutesstessuessueesueesueesasesaeesauessecsueesutesneesuneeaiesaesseeesneeseees
10.2.2 USB Functional D@SCTIPTION oo. ee eeeeeseesseessterssecsteseeesseessessnesssessueesseesutesatecsersueesneesetennteeaeenae
10.2.2.1 USB Controller... 2.5%. ..c.ceecececeseseseeeesesesesesesceceseseseseeeeescaeaeaeacseseseseseeeeeeseacacaeaeeeeseaeaeeeeeeeeeees
10.2.2.2 Interface ReStriCtions ooo... eeeeececcsesesceseseecseseseseseeecacseseeeeeseceeseseececsesacacaeaeeeetaceeeeeeeeeeaeaeaes
10.2.2.3 Host and Memory Access Interfaces ..........ccccscssecsseseseseeeeeseseseseseeeeeeseseseaeaeeceseaeeeeeeeeeeetes 9485
10.2.2.4 USB 3.2 Device Controller
10.2.2.5 xHCLController Programming Interface ..........cccceecceceessecesceseeseseeceseeseseeseseeeceeseeeeseeeseees 9485
10.2.2.6 USB*PADCTL 2.0... eecececeseseeceseseseseseseeseseseseseecscecsacacaesesesacaeseseaeeseseseseseeeseeatacacaeaeeeeseseaeeeeeeetees 9486
10.2.2.7 USB AO ooo. eeececesesesesesesesecesesesesesesesesseseseseseesescacaesesesacaeseaeaceseseseaeaeaeeeeaeacaeaeaceaeseseaeaeeeeetees 9487
10.2.3 USB Programming Guidelines 00... eeceeseessesssecseesneesseessessuecseesueesseesstesatecstersneesneestesateeaeeenees 9487
10.2.3.1 Cold BOOt a... eeeeeececeeseseseeeesesesesesesesesesesesesescecsescacseseescaeseaeacseseseaeaceeeaeecasacaeaeeeseseaeaeeeeetees 9487
10.2.3.2 £1 07 Al (a1 0) ee ee 9494
10:2:3.3 XUSB Controller Power Gating ..........cccccccccccsesesseseseeseseeseseecesecseeeseseeseeseseeeeseeeeeeseeeeeeseeaeees 9499

```
</details>


<!-- Page 24 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

10.2.3.4 USB AO Programming ........................................................................................................9513

10.2.3.5 USB 2 Pad Tracking Programming ....................................................................................9520

10.2.3.6 Battery Charging over XUSB...............................................................................................9521

10.2.3.7 Data Contact Detection ......................................................................................................9522

10.2.3.8 Primary Charger Detection.................................................................................................9523

10.2.3.9 Secondary Charger Detection ............................................................................................9523

10.2.3.10 XUSB Programming Guidelines for Device Mode.............................................................9523

10.2.3.11 Recommended PHY Settings.............................................................................................9546

10.2.3.12 BIAS PAD Configuration .....................................................................................................9546

10.2.3.13 Boot ROM Initialization Sequence for USB Recovery .......................................................9546

10.2.3.14 Performance Settings for USB Controllers........................................................................9548

10.2.3.15 USB Controller Handling of USB Resume Sequence ........................................................9548

10.2.4 USB Registers........................................................................................................................................ 9549

10.2.4.1 USB 3.0 Device Controller Memory-Mapped I/O Registers..............................................9549

10.2.4.2 USB PADCTL and AO Registers .........................................................................................9599

10.2.4.3 XHCI Controller Configuration Registers...........................................................................9649

10.2.4.4 XHCI Controller Memory-Mapped I/O Registers...............................................................9776

10.2.4.5 XUSB DEV Registers ...........................................................................................................9803

10.3 Universal Flash Storage Complex (UFS)......................................................................................... 9819

10.3.1 Overview................................................................................................................................................... 9819

10.3.1.1 Standards and Compatibility..............................................................................................9821

10.3.1.2 Relevant Chapters in the TRM............................................................................................9822

10.3.1.3 Features...............................................................................................................................9822

10.3.2 Functional Description....................................................................................................................... 9823

10.3.2.1 Interface Components........................................................................................................9823

10.3.2.2 UFS Complex Interfaces and Internal Blocks....................................................................9824

10.3.2.3 UniPro ..................................................................................................................................9826

10.3.2.4 MPHY...................................................................................................................................9830

10.3.3 Programming Guidelines................................................................................................................... 9830

10.3.3.1 Fuse Programming .............................................................................................................9830

10.3.4 UFS Registers ........................................................................................................................................ 9831

10.4 MIPI M-PHY................................................................................................................................................ 9835

10.4.1 Overview................................................................................................................................................... 9835


<details>

<summary>OCR (Page 24)</summary>


```text

10.2.3.4 USB AO Programming ...........:c::cecceecesceseesecescesceccececseeseesecseseeeeeeceeeaecaecaecaecaeeeeseeseesereesege 9513
10.2.3.5 USB 2 Pad Tracking Programming ............ccccceseccsseseesesesseseceseeseseeecsessesessesecseeecsteecseeesbansl 9520
10.2.3.6 Battery Charging over XUSB...........ccscesssssseseseseseseeesesesesesenecesesesesceeeetstacacacaeeeeseegaateatgfesees
10.2.3.7 Data Contact Detection oo... cesseeeceeeecseeecsesseeessceeseeeecsceecseeetetacsesscetsegfesedbcnseesneeees
10.2.3.8 Primary Charger Detection...
10.2.3.9 Secondary Charger Detection ...........cccesesececeseseseeeeeeseseseseececeeeeseseseetselgedeapateeeeteeseseneeeees 9523
10.2.3.10 XUSB Programming Guidelines for Device MOde..........ccccccessesesesape teat peceseeseseeseeeeseeeeseees 9523
10.2.3.11 Recommended PHY SettingS...........:cccceccssssssescsecseeeeseseeseesesssealosespicecsesecseeecseeeeseeeeseeees 9546
10.2.3.12 BIAS PAD Configuration .........c.ccceccccecssescssesesseceseeseeecseseeseeseslecstVhcsecsesecseseeseeecseeeeseeeeseeees 9546
10.2.3.13 Boot ROM Initialization Sequence for USB RECOVETY ........-S:adeeceecececeseseseceeeeeseseeeeeeeeeeeees 9546
10.2.3.14 Performance Settings for USB Controllers.............c0 Qoteqceccssescseeseseeseeeseseeseeecseeeeseeeeeeees 9548
10.2.3.15 USB Controller Handling of USB Resume Sequence’ 2)... .eececceeceeseeeeseseeseeeseeeeseeeeseeees 9548
10.2.4 USB REGISCELS oo eceeceesseessseesstesstecseesseeesneesstesatecstesssesasecss Mestssseesstesstecaueesueesueesitesatesaessuessneeseeesateeaeeenee 9549
10.2.4.1 USB 3.0 Device Controller Memory-Mappeda/O_ReGisters ............ecccecsseteeeeeeeseeeeeeeeeeees 9549
10.2.4.2 USB PADCTL and AO ReGistefPs ............:ccasMesncesessesceeeseseesesceseeccseecsecsesecsesecseeecaeeecseeeeseees
10.2.4.3 XHCI Controller Configuration Registers
10.2.4.4 XHCI Controller Memory-Mapped I/O,REGiSterS...........eeesececeseceseseeeeeeeeeeseseseeeeeeseseeeeeeees 9776
10.2.4.5 XUSB DEV ReGiStEPS ..0......ceeeeeee Capp eeceeccecceceecceceeeeeseeseeseeaececeeeseceeeaeeseeaeeaeeaeeeeseeseesereeateas
10.3 Universal Flash Storage Complex (UFS).....-sssscsssssscsssssessessnesssesssseseessnseseeesnseseessneeeesnnessessenteesseee
10.3.1 OVELVICW....esseesseeesstesseesseesnessn Dbagheseesseecstecsseesueesueesutesstecsuessueesneesueesanesseesaseeaecsueesuteaneesuieeaiecsessueesneeseees
10.3.1.1 Standards and Compatibility 00.0... cceccecesesesesesceeeeeeeseseseeeeeeeeseseseeeeeeeeeeataeeeeeeeeeeseaeeneees
10.3.1.2 Relevant Chapters inth@ TRM..........ccccccesccseessescsseseeeeseeesesceseeecseeecsessesessesecseecaeeecseeeeseeaes
10.3.1.3 Features os ON eee eee ceccecseeececesceesscsesscsacscacscacsesacsesacsesasacscsessceeseesacesassesaceessceeeeeeaeeteaes
10.3.2 FUNCtIONAl DESCHIPTION oo. ec eceessesseeesstesstesseessseesnecsutesutesseesnsesstecaueesueesseesutesatesaessueesueesitesatesaeeenee
10.3.2.1 Interface COMPONENMS.......... eee cscscesessesesceseeeseseeseeeeseecsesecseescseeesecaeseeseeesaeeeeseeseseeeeeeeates
10.3.2.2 UFS Complex Interfaces and Internal Blocks.
10.3.2.3 UMIPLO Ly... eeceeceeeeesesesesceeececesesesesesesesesesesescessacseaeseseacseseaeeesseseseacaeseeeeacaeaeaeeeseseaeaeeeereetees
10.3.2.4 MRBY 0c eeceeeeeeecesesesescececesesesesesesseseacaescseessacacaesesesacacaeaeaeeseseseaeaceeesaeacacaeaeeeseseaeaeeeeetees
10.3.3 Programming GUICelineS ...... cc esessecseeseecseesseeessecsesesetesseessesstecseessueesseesteeatesseesseeesueestenateeaeenee
10.3.3.1 FUSE Programming ..........:cecceccececeeseeseeseesececeeceeecececsecseesecsesseeeeeeecaeeeeeaecaecaecaeceeseasersereeaeeaes
10.3.4 UFS REGIStELS oe eseecseesseessseesstesstessessueesneesutesatesasessseesuecsueesatesseessesaecaueesueesueesitesatecaeessuessueesseesateeaeenae
10.4 MIPL M-PHY 0... eeeeseecesseseesesseescsuesesseescssnesneesssecsesnseassecuecasanenecussusaneneeussusasenseuseasaseusseseessseasseeatenseesetenteaseeeees
104.1 OVELVICW....esseesseesstesseessseessecsseesutesscsnesstecsuecsueesuesutesatessuessueesueesseesaneeaeesaseestecaueesunesseesuteeatecauesseeeaneesanets

```
</details>


<!-- Page 25 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

10.4.1.1 Features...............................................................................................................................9835

10.4.1.2 Retiming Interface...............................................................................................................9843

10.4.1.3 Clocks..................................................................................................................................9843

10.4.1.4 Resets..................................................................................................................................9845

10.4.2 M-PHY Registers .................................................................................................................................. 9847

10.4.2.1 Vendor .................................................................................................................................9847

10.4.2.2 Clock Control.......................................................................................................................9849

10.5 PCI Express (PCIe) Controller............................................................................................................. 9849

10.5.1 Overview................................................................................................................................................... 9849

10.5.1.1 Features...............................................................................................................................9850

10.5.1.2 External Connectivity Diagrams.........................................................................................9852

10.5.2 Interfaces ................................................................................................................................................ 9855

10.5.2.1 System Interconnect Interfaces.........................................................................................9855

10.5.2.2 External I/O Interfaces........................................................................................................9856

10.5.3 Operation Models................................................................................................................................. 9860

10.5.3.1 Normal Root Port Operation...............................................................................................9860

10.5.3.2 Normal Endpoint Operation................................................................................................9860

10.5.4 Programming Guidelines................................................................................................................... 9861

10.5.4.1 Initialization.........................................................................................................................9861

10.5.4.2 PCIe Device Discovery and Enumeration ..........................................................................9865

10.5.4.3 PCIe Controller Hot Reset...................................................................................................9867

10.5.4.4 Interrupt and Message Handling .......................................................................................9867

10.5.4.5 PCIe Hierarchy Enumeration ..............................................................................................9871

10.5.4.6 Partition Power-Gating .......................................................................................................9872

10.5.4.7 SC7.......................................................................................................................................9890

10.5.4.8 Fault Handling.....................................................................................................................9891

10.5.4.9 Shutdown and Reboot ........................................................................................................9891

10.5.5 PCIe Registers ....................................................................................................................................... 9891

10.5.5.1 PCIe iATU.............................................................................................................................9891

10.5.5.2 PCIe Root Port...................................................................................................................10010

10.5.5.3 PCIe x1/x4/x8 Root Complex...........................................................................................10075

10.5.5.4 PCIe x4/x8 Endpoint .........................................................................................................10412

10.6 1G Ethernet Controller........................................................................................................................10682


<details>

<summary>OCR (Page 25)</summary>


```text

10.4.1.1
10.4.1.2
10.4.1.3
10.4.1.4
10.4.2
10.4.2.1
10.4.2.2
10.5
10.5.1
10.5.1.1
10.5.1.2
10.5.2
10.5.2.1
10.5.2.2
10.5.3
10.5.3.1
10.5.3.2
10.5.4
10.5.4.1
10.5.4.2
10.5.4.3
10.5.4.4
10.5.4.5
10.5.4.6
10.5.4.7
10.5.4.8
10.5.4.9
10.5.5
10.5.5.1
10.5.5.2
10.5.5.3
10.5,5.4
FOAtUIS oo... eeeeccccceecesceseceseeececceeecseeaeesecsecsecsecsacsaceaeesecsecsecseceeesaseseecaecaeeaecaeseeeeeseesereeaeesesn 9835
Retiming Interface... cc ccecccccessessseesesesseseeeeseeecsecsesecsesesseseeseecseeecsesaesecsesesaseecseeecseessbacsl 9843
Clocks
Resets
M-PHY Registers .
CIOCK CONON eee eeeeeeceeeseseseseseeeesesesesesescscecseecaeseeescaeaeaeeeseseseseacupelual paseeeeeeeseseeeeeeeeteees
PCI Express (PCle) Controller .......cccssscssssscssssscsssecssssecsssesssssscssseessssecssseslyslbesiitecssecesneecssecesnecesseseese 9849
OVELVICW....essecsseesstesseesseeestecsseesutesseesstenstecssecssessueesstesatessessnessneesseesanesadl lecetbesseesutesseesteentecsesseeesneesseees 9849
FOAtUIeS ooo. eee ecceeeesceeceeesesceecsceacesacsesscsassceecsceecsesacevaceeneeDMnadesseeeceesaceesseeeseeeesseeeeeeeaeereaes 9850
External Connectivity Diagrams .............cecececeeceseesesespiveqeeeeseseseseseeeeeeseseseaeaeeeeseseeeaeeeeeteees 9852
INCOr FACES on. eeeecssesecssseessstersnsecssnseessseessnsecssuceesuscessucensaseessneedhaseed)pecesuseessuceesnseessueeesnseeesneeesneeeseeeesneeeeseses 9855
System Interconnect Interfaces... eeeececesesesessMfecseeeeeesesceceeeeeeseseeeeeeeeeteeseeeeeeeeeseeeeeees 9855
Extermal 1/0 Interfaces ........ecececcececeeeseeeeceapetecsanl ececesesesesenceseseseseeceeeeeseaeacaeeeeeeseseeeaceeeeeeees 9856
Operation Models
Normal Root Port Operation.
Normal Endpoint Operation...........ccce Mic cecccecesesesseeeeseseeseeceseecsesecsecsesecsesecseeecaeeecseeesseeaes
Programming Guidelines... Ciiecceesseesseesseesssecseeesneessessntesstecseesueesueesteeatecstessueesneestennteeaeeenees
IMitiAI ZATION eee eee eeeeeceeececeeeG Pep beececcecececscesecesescsesceseaeaceeeeseceeacececeesecacaeaeaeseeceeaeeeeeeeeeeaeaeats
PCle Device Discovery andEnUMEration .............cecececeseteteeceseseseseececeseseseaeaeeceseseaeeeeeeeeeees 9865
PCle Controller Hot RES€ty:.......cescecesesesceceseseseseeeeseseseseseneceseseseseeeeeeeeacaeacaeeeeseaeaeeeeeeeeeees 9867
Interrupt and MessageHandling .............ccceeecececeseseeeeeseeeeesceeeeeceeeeescacseeeeeeeesceeseeeeeeeeeaeaes 9867
PCle Hierarchy Enumeration ...........ececcscececeseseseeeeeseseseseseeeeceseseseaceeeeeeeseaeacaeeeeeeaeeeaeeeeeeeees 9871
Partition POWerGating «0.0... eeeeceeceeceseeececceececceeecseeseesecsessecsaeecseesaecsecaecaecaeceeseesereereeaeeats 9872
SO7 oe eeeeegeee diag deccescceceseeesesescececseecescaeseseseesescececseecesscacseseseeeescecaeeeseesescaeeeeeeeceeaceeeeeeeeeeeseeteeeees
Fault Handling
Shutdown aNd REDO... eeeeeeececeeeeesesesescscecececescseseseeeesesceeeeeeseseseeeeeeecetaeseeeeeeeeeseeeeeeees 9891
PCIEREGISTELS o.oo. eeesseeesssetessseeessntessseeessntessseeensntecssneessasecssueessnteesseeessaeessneesssessssenesnecssnenesneessnens 9891
PCO TATU... eeeeeceeeceseseseeseceseseseseseeseseseaescecesscscaesesesscacseaeaeeeeseseaeaceesesacacaeaeaeaeseaeaceeeeeetates 9891
PCle Root Porta... cecccecseesesceeceeesenesscsecsesecscseeeesecseeavaeeeseeeaseeesseeeeseesaeeesaceeseeeeseeeeseesate 10010
PCle xX1/xX4/x8 Root COMplex........cccceccccssssseseseeseseeceseeseseeceseeseseeseseeeceeeseeecseeseeeeeeesseeates 10075
PCle X4/xX8 ENGpoint «00... eeeecccceccecesesseseseeseeccsescescsceseceeseeecseeseeeeseseeeseecseesseesseeesseeeseeeate 10412
1G Ethernet Controller... eceesecseessesseessessuesssesnsessessnesaecseesseesseestessiesseesseeseeseseesseesnenneess 10682

```
</details>


<!-- Page 26 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

10.6.1 Overview.................................................................................................................................................10682

10.6.1.1 Standards Compliance .....................................................................................................10682

10.6.1.2 Ethernet Controller Features ............................................................................................10683

10.6.1.3 Transaction Layer (MTL)..................................................................................................10685

10.6.1.4 Direct Memory Access (DMA) Block ...............................................................................10687

10.6.1.5 MACsec Media Access Control Security (MACsec) Block.............................................10688

10.6.1.6 Features Not Supported ...................................................................................................10691

10.6.2 1G Ethernet Controller Functional Description.....................................................................10691

10.6.2.1 Overview ............................................................................................................................10691

10.6.2.2 Interfaces ..........................................................................................................................10693

10.6.2.3 Features.............................................................................................................................10698

10.6.3 1G Ethernet Controller Programming Guidelines.................................................................10718

10.6.3.1 Virtualization Programming Guidelines...........................................................................10718

10.6.3.2 Guidelines to Access PTP Registers from VMs..............................................................10720

10.6.3.3 Guidelines for Handling ETHER_QOS_VM[i]_interrupt by Guest OS ..............................10720

10.6.3.4 Guidelines for Handling EQOS_common_intr .................................................................10721

10.6.3.5 Access Lock for DCRCC, RSF, and FEP in 1GMAC .........................................................10722

10.6.3.6 DMA Channel Recovery Programming Guidelines .........................................................10724

10.6.3.7 DMA/Queue Dynamic Change of Arbitration Rules........................................................10724

10.6.3.8 Golden Register Settings..................................................................................................10724

10.6.3.9 Programming Guidelines to Operate 1GMAC in Loop-back Mode................................10725

10.6.3.10 Programming Guidelines for Energy-Efficient Ethernet..................................................10725

10.6.3.11 Pad Calibration Programming Guidelines.......................................................................10727

10.6.3.12 Pad Recalibration Programming Guidelines ...................................................................10727

10.6.3.13 Other Guidelines................................................................................................................10728

10.6.3.14 Miscellaneous Programming Guidelines ........................................................................10728

10.6.4 1G Ethernet Controller Registers................................................................................................10729

10.6.4.1 1G Ethernet Controller Core Registers.............................................................................10729

10.6.4.2 1G Ethernet Controller QoS Registers .............................................................................11332

10.7 MAC Security (MACsec)......................................................................................................................11366

10.7.1 Overview.................................................................................................................................................11366

10.7.1.1 Limitations.........................................................................................................................11366

10.7.1.2 Controlled and Uncontrolled Ports ..................................................................................11367


<details>

<summary>OCR (Page 26)</summary>


```text

10.6.1
10.6.1.1
10.6.1.2
10.6.1.3
10.6.1.4
10.6.1.5
10.6.1.6
10.6.2
10.6.2.1
10.6.2.2
10.6.2.3
10.6.3
10.6.3.1
10.6.3.2
10.6.3.3
10.6.3.4
10.6.3.5
10.6.3.6
10.6.3.7
10.6.3.8
10.6.3.9
10.6.3.1
10.6.3.1
10.6.3.1
10.6.3.1
10.6.3.1
10.6.4
10.6.4.1
10.6.4.2
10.7
10.7.1
10.7.1.1
107,1.2
BF WON | O
OVE VICW....ecsccsecseessessecsscesessecsucsueesscsucsueeaceeuceueeasesnceuseaeseeuscaseaeesassueeaeeeussuseseeanseueesteaeeseseeteaneeeseteateeeeeeey
Standards Compliance ..........ccccccccccseseesesseseeseseseeseeecseecseseeseeecseeecsesaesecsesecseeesseeeeseeesstaes
Ethernet Controller Features ..........cccccsescsceseseseeseeeeseseseseseeceseseseececeeeseaeacacaeeeeeeseagaatentgheee
Transaction Layer (MTL) .......-.:ssecsecscssseseseseseseseceescecseseseeescncecacseecensesessacacatsegfesedeseteeeees
Direct Memory Access (DMA) Block.... .
MACsec Media Access Control Security (MACsec) BIOCK..........::::1Qohieeeseeeeeeeeeees 1
Features Not SUPPOrted 00... ce ceccececsesecseescseeseseeseseeeeseeecseeseseesestapeltuad Pesseeeeeeeeeeeeeeeeatee 1
1G Ethernet Controller Functional DESCriPtion uu... cesses fete iieessesseesseesesseseseeeeeseeees ]
OVELVIOW 0... eeeeceseceeesceececeseeceeeeesacseeecseeacecscsecscsessesecsteasstesceeadl lees tbcecesseteteeseteesseeteseetates 1
INCOLFACES ooo. eeeetetceeeeesesesescecseesesescaceceesceseseeceeseeaeacacaceeeegeedbuadesceesaeaeeseeeeeeeseeeeeeceeeeeeeaeats 1
FOAtUreS ooo. eee eccceecceecsceecsceeeeesecsesscseescsecscsecscseeseeseseghlleqeceesseseesseecaeeesseeesaeeaseeessaeeeseesate 1
1G Ethernet Controller Programming Guidelines...) eeeecseesseesneeseestecstesseeneeseess ]
Virtualization Programming Guidelines..............0..Meclecccccecsceseseeseseeeceecsesecsesecseeeeseeeeseeaes 1
Guidelines to Access PTP Registers from VMS..).........c:ccccccssesesesseseeseeeeeseeeeseeseeeeeseeeeee 1
Guidelines for Handling ETHER_QOS_VM[i)interrupt by Guest OS «0.0.0... 1
Guidelines for Handling EQOS_commoncintr ....
Access Lock for DCRCC, RSF, and FEP*in 1GMAC ...... cece cece cee eeesecsscesseesseesseeneeees 1
DMA Channel Recovery Programming Guidelines ..............:.cecessececeseeeteteeeeceseeeecereeeeees 1
DMA/Queue Dynamic Changevof- Arbitration RUIe@S «00.0.0... ecececeeeeseceseseeteeeeeeeeseeeeeeeeeeeees 1
Golden Register Settings 2s... ccc cccccescesseseseeseseeseseeseseeecseeseseesesesseeeeseecseeeeeesseeesseeates 1
Programming Guidelines’to Operate 1GMAC in Loop-back Modé............::cccceeeeeeeees 1
Programming Guidelines for Energy-Efficient Ethernet...............:ececceseseeeeseeeseseeeeeeeeeees 1
Pad Calibration Programming Guidelines ..............ccccccccecesseseeeeseseeseeceseeeeseeeseeeeseeeeseeaeee 1
Pad Recalibration Programming Guidelines ............c.ccccccceseeseseeeeseeeeseeeeseeeseeeeeeeeeseeaeee 1
Other Guidelines... eee eeseseeceeeseseseseseeeeseseseseseeeescseseseaencseseseaeeceesseaeacaeaeeeeseseaeeeeeeeeaas 1
Miscellaneous Programming Guidelines
1G Ethernet Controller Registers.....
1G.Ethernet Controller Core Registers..
1G Ethernet Controller QOS ReGiSters ...........ceccccesessesessecesceseeeeseseeeseecseeeeseeesseeseseeeeseeate
MAC Security (MACSEC)....csssescsssscssssscsssscssssscssnsccsssecssusccsssesssnsccssscessusecsssecssssecsssecssnsecssuecssisecesueessnseess
OVErVICW....ecseccecseessessessseesessecsucsucesscsucsueeaseeucsuecascsnceuseaseseeucsueeseesucsueeateeassusesesanseeeeateateseseeteaeesessteateeeeeess
LIMITATIONS 00sec cece cecceccecceceeceeseeseeseeseeseesececeseceaeesecsecsecsececsacaseeecaeeaesaesaeseeeeeseeseeeereeates
Controlled and Uncontrolled Ports .........c..cccccssescssesesseseseeceseeseeeeseeeeeeeeseeecseeeseeeeeeeeseeaee

```
</details>


<!-- Page 27 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

10.7.1.3 MACsec Key Agreement Protocol ...................................................................................11367

10.7.1.4 MACsec Flow ....................................................................................................................11370

10.7.1.5 Block Diagram...................................................................................................................11370

10.7.1.6 Top-Level Connectivity .....................................................................................................11370

10.7.1.7 MACsec in ETHER_QOS....................................................................................................11371

10.7.1.8 MACsec in MGBE Wrapper...............................................................................................11371

10.7.1.9 Software Access View of MACsec IP..............................................................................11372

10.7.1.10 AMAP View of MACsec IP................................................................................................11373

10.7.2 MACsec Functional Description...................................................................................................11374

10.7.2.1 MACsec Tx Details............................................................................................................11376

10.7.2.2 MACsec Rx Details............................................................................................................11389

10.7.2.3 MACsec with Frame Preemption Feature .......................................................................11398

10.7.2.4 MTU Check on Egress and Ingress Packets ...................................................................11400

10.7.2.5 Handling VLAN Packets ...................................................................................................11400

10.7.2.6 Generation of Secure Interrupt.........................................................................................11401

10.7.2.7 Byte Order Definition.........................................................................................................11402

10.7.2.8 Miscellaneous Points .......................................................................................................11402

10.7.2.9 Clocks and Resets ............................................................................................................11403

10.7.2.10 Power Management .........................................................................................................11407

10.7.3 MACsec Programming Guidelines...............................................................................................11408

10.7.3.1 Initial Configuration Guidelines........................................................................................11408

10.7.3.2 Run Time Configuration Guidelines.................................................................................11415

10.7.3.3 Configuring MACsec LUTs...............................................................................................11420

10.7.3.4 Inter-Packet Gap (IPG) Programming in MAC.................................................................11425

10.7.3.5 Programming Block Level Firewalls ................................................................................11426

10.7.3.6 Global Configuration Register Fields Description...........................................................11427

10.7.4 MACsec Registers..............................................................................................................................11430

10.8 10G Ethernet Controller.....................................................................................................................11668

10.8.1 Overview.................................................................................................................................................11668

10.8.1.1 Standards Compliance .....................................................................................................11668

10.8.1.2 High-Level Block Diagram ................................................................................................11669

10.8.2 Ethernet Controller Major Features............................................................................................11669

10.8.2.1 Features Supported in Hardware.....................................................................................11669


<details>

<summary>OCR (Page 27)</summary>


```text

10.7.1.3
10.7.1.4
10.7.1.5
10.7.1.6
10.7.1.7
10.7.1.8
10.7.1.9
10.7.1.10
10.7.2
10.7.2.1
10.7.2.2
10.7.2.3
10.7.2.4
10.7.2.5
10.7.2.6
10.7.2.7
10.7.2.8
10.7.2.9
10.7.2.10
10.7.3
10.7.3.1
10.7.3.2
10.7.3.3
10.7.3.4
10.7.3.5
10.7.3.6
10.7.4
10.8
10.8.1
10.8.1.1
10.8.1.2
10.8.2
10.8-2.1
MACsec Key Agreement Protocol .........:cceceesesssseseseseseseeceeeseseseseeceeeeeseacaeaeeeeeeseaeeeeeeeeeas
MACSEC FLOW .......eceeesescececeseseseseseseessesesesesceseseseaenesesaaeseaeaeseseseaeaceeeeestaeacacaeeeesescaeeeeteetbnes
BIOCK DiaQrarm .......c.ecceeccccesesseceseeseceseseesesecseccsesceseeseseeseseneceecseseesesesseeecseecseseseseseaaateat ghee
Top-Level Connectivity 0.0... eecceceseesseseseeeecesesesesceeeeesesesesesceeeeesesesseeeeeetstersteegfeae(iseseeeees
MACsec in ETHER_QOS....
MACsec in MGBE Wrappet............c::ccccsceeccesceceecceseeseeseeseeaeeecececcceeeeatelgelespitseeeeeeeereeates
Software Access View Of MACSEC IP..u.......eeeeeseeseeeseseseseseeceeesesesepeltuad lf eeseeeeeeeeeseeeeeeeeees
AMAP View of MACSEC IP... eeeceseseseseseececeeeseseseaceeeeeeeseatscecscseelosfeaieseeeseseaeeeneeseseseeeeees
MACsec Functional D@SCriPtion ........eeseeccecsesseecesseeseessesseesseeseeseseghlbecstibecsessesssseeesteseseseateeteeneets
MACSEC TX Details... ee eecececeeceeeceseseseseeeesesescseeeseeseseacaeapesDheadececeeeeeseaeacaeaeeeeeeseaeeceeeeees
MACS6C RX Details..........eececececeseeceseseseseececeseseseseneeeseagfiteqeeeeseseseaeeeeeeseaeacaeaeeeeseseaeeeeeeeteees
MACsec with Frame Preemption Feature 2.2.0.0... Qeyeccccccscecesceseseeseseeeeseeeceeseeeeeseeatee
MTU Check on Egress and Ingress Packets ........\¢. cl eccccccssesseseseseeseeeeseeeeseeeseeseseeeeseeaeee
Handling VLAN Packets ...........:ccccccccsscsesscsegibscsanlscceseeseseeecseeseseeseseeseeeeseeecseseseeeeeseeeseeeaeee
Generation of Secure Interrupt.............. cca hesseceseeseseeseseeceseeseseeseseeeeeecseecseeesseeseseeeeeeeatee
Byte Order Definition..
Miscellaneous Points
Clocks and Resets ........:.cccceceseseeQodipeesesescecesesescseseseeseseseseaeseeseseseacecseeseaeaeaeaeeeeseseaeeceeeeeeas
Power Managemen nt .........22:Gpigdecesceccescesececceceeccececseeseeseesecseceacecsaeaecaesaeesesaeeeeeeeseeeereeaees
MACsec Programming Guidelines oes ccssseesesssseeseessneeeesssntescssssenessssnesessnmssssnnteesssanats
Initial Configuration Guidelines... ec cceceececeeeeeceseeeeseseeseeseseeccseseecsesessesesseeeeseeeeeeeaeee
Run Time Configuration Guidelines oo... cceeccccccesseseseececeseeeeseseeeeeeeseeeaeeeseeeeeseeeeseeaeee
Configuring MACSCC LUTS .........ccccccceccesscsseseseeseseeseseeseseecseeseseeseseeeeeecsesecsesesseeeeseeeeseeatee
Inter-Packet Gap.(IPG) Programming in MAC...........cessccsssseseseseseseeeeeceeseseseeeeeeeeseeeeeetaes
Programming)Block Level Firewalls ..........:ccccecccsesesseseseeceseeseeeeseeeeseeeseeecseecseeeeseeeeeeeaeee
Global Configuration Register Fields Description.
MACsec\Registers...............
10G ‘Ethernet Controller
OVELVICW.... ce eeseecseecsstesseesseeestecsseeestecssessseesecsuccsseesusessessecsucesatesuesseessecsuessneesueesseessessuessneeaseesueenstessnesses
Standards Compliance
High-Level Block Diagram ............ccccccecsesscsseseseeceseeseseeseseeccseeseseeseseeeseecseecseseseeesseeeeeeeate
Ethernet Controller Major Features.......cccsccssecsessesssesessessesssessessesseeesessessessseesseesateanseseaseeseesees
Features Supported in Hardware ..........c.ccccccscesescssesseseseecesceseeeseseeeeeecseeecseeseeeeeeeeseeates
| Page 27

```
</details>


<!-- Page 28 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

10.8.2.2 Feature Supported in Software ........................................................................................11670

10.8.2.3 Features with Limitations.................................................................................................11670

10.8.2.4 Features Not Supported ...................................................................................................11670

10.8.2.5 Internal Features...............................................................................................................11671

10.8.2.6 Physical Coding Sublayer (PCS) Features.......................................................................11678

10.8.2.7 UPHY Features..................................................................................................................11679

10.8.3 10G Ethernet Controller Functional Description ..................................................................11680

10.8.3.1 Overview ............................................................................................................................11680

10.8.3.2 MAC Details.......................................................................................................................11681

10.8.3.3 PCS Details........................................................................................................................11684

10.8.3.4 UPHY Details .....................................................................................................................11688

10.8.3.5 Descriptors........................................................................................................................11707

10.8.3.6 Split Header Support.........................................................................................................11728

10.8.3.7 Enhanced Descriptor for Time-Based Scheduling..........................................................11731

10.8.3.8 Other Features of MGBE...................................................................................................11743

10.8.3.9 Clocks and Resets ............................................................................................................11764

10.8.3.10 Power Management .........................................................................................................11767

10.8.4 10G Ethernet Programming Guidelines....................................................................................11778

10.8.4.1 MGBE UPHY Initialization Sequence ...............................................................................11778

10.8.4.2 UPHY Power Up/Down Sequence....................................................................................11780

10.8.4.3 Tx Lane Power Up Sequence ...........................................................................................11781

10.8.4.4 Tx Lane Power Down Sequence ......................................................................................11781

10.8.4.5 Rx Lane Power Up Sequence ...........................................................................................11782

10.8.4.6 Rx Lane Power Down Sequence ......................................................................................11784

10.8.4.7 Guidelines to Change the Operating Speed Mode..........................................................11785

10.8.4.8 MGBE Initialization............................................................................................................11787

10.8.4.9 Virtualization Programming Guidelines...........................................................................11814

10.8.4.10 Guidelines to Access PTP Registers from VMs..............................................................11816

10.8.4.11 Interrupt Processing .........................................................................................................11816

10.8.4.12 VM Interrupt Handling Guidelines....................................................................................11818

10.8.4.13 mgbe_common_intr_o Handling Guidelines ...................................................................11818

10.8.4.14 Blocking Access to CRC Configuration Bits in XGMAC..................................................11819

10.8.4.15 Software Programming Guidelines..................................................................................11821


<details>

<summary>OCR (Page 28)</summary>


```text

10.8.2.2
10.8.2.3
10.8.2.4
10.8.2.5
10.8.2.6
10.8.2.7
10.8.3
10.8.3.1
10.8.3.2
10.8.3.3
10.8.3.4
10.8.3.5
10.8.3.6
10.8.3.7
10.8.3.8
10.8.3.9
10.8.3.10
10.8.4
10.8.4.1
10.8.4.2
10.8.4.3
10.8.4.4
10.8.4.5
10.8.4.6
10.8.4.7
10.8.4.8
10.8.4.9
10.8.4.10
10.8.4.11
10.8.4.12
10.8.4.13
10.8.4.14
10.8.4.15
Feature Supported in Software o....... cc ceecccecseeseseeseseeseseeceseeseseesesesseeeeseecseeeeseeeeseeeeeeeaea
Features with Limitations ......0.....ceececesesceseseseseseseeeeseseseseseececeseseacececeseaeaeaeaeeceseseaeeeeeeebnes
Features Not SUPPOrted ....... cee ecccecsesecseeceseeeeseeseseeseseeecsecseeeesesesseeecseeecseseeseeecaaateas ghee
Internal Features ........c. ce ccecesescececssesesceeseeesesesescsceesaescaeaeeeeeeseseecececeesacacateeeeeesseagfesedbvseeeneaes
Physical Coding Sublayer (PCS) Features...
UPHY Feature... ce eeeeeseeesceeeseneescsecscecseeeseescseeesseeececssseesseesateetalgefnapiseeeesseneeeesaees
10G Ethernet Controller Functional D@SCription ........c.cceceeseesecessspe tends escesseeseeeteeseeseeeeeees
OVELVIOW oo. eeeeceseceeesceecsceecscseesesacseeacseeacsecacsecscsessesecseeavaeeaceeeaseessloefghicaseevseeaseeeeseeeeseesaees
MAC Details... ececeececeseseseseseeeeeeseseseseecesesesescnceeesestacacateeeaphleestlheseseseseseeeseseseeeeeeeeeeeees
PCS Details... eececesceseseseseseeeseseseseseseceseseseaceeseescscacaeapesheadececeeseeseseacacaeeeeseseaeeceeeeeeees
UPHY Details 20... eseseseseeeeesesesesescscecesescacneseeseagftteqeceseseseaeeeeeeseaeacaeaeeeseseaeeceeeeteees
D@SCTIPTOFS 200... ee eeeeceeccecceccecceceeseeseeseeseesceeccccecceseedecsslpecseceeceeceeceeecaeeaeesesseseeseeseeseeseaeeates
Split Header SUPPOFt....... eee ecceccesseseseesesceseeeeseseesMesseeecscsecseescseecsecaesecseseceeesseeesseeeeeeeaes
Enhanced Descriptor for Time-Based Scheduling .............:cccececceeeceeseseeeeeeeeeeeseeeeeseeeeee
Other Features Of MGBE............:.ccccscssssssenasMbesscsescecesesesesesencesesesesceceeeseaeaeaeaeecesescaeececeeares
Clocks and Resets ..
Power Managemen nt ...........:cecceccessessesfenbesececcecceeceeecseesesseesecseceeesacsaeeaeeaeeaeeaesaeeeeeeeseesereeates
10G Ethernet Programming Guidelines ou... ees eccssseecsssseeesesssteessssseeesesnmissssnaiesessnuees
MGBE UPHY Initialization Sequence .........e ee ececccceseseeseseeeesceseeeseseeseeeeseeeseecseeeeseeeeseeaee
UPHY Power Up/Down Sequence. ..........ccceccescesceseeseeseeseeseeceececeeeeeeeseeaecaesaeceeeeecereereeaees
Tx Lane Power Up SCquencee ..........ccceceeeeseeseeseeseeseesecseeseesececceaccceesaeeaesaeeaeeeeeeeereeeeeeeeaes
Tx Lane Power DoWwm SEQUENCE .........ceeeceesceseeseeseeseeseeseeseescesecccceeaeeseeaeeaeeaeeeeeeeeeeserteaes
Rx Lane Power UP Se@quencee ..........ceceeceeccesceseeseeseeseeseeseesecscceeeecseeeaeeaeeaesaesaeseeeeeseeeereeaees
Rx Lane Power DOWN SeqUENCE ..........ceeceseeseeseeseeseeseeseeseeaeeeeeeceaseeeesecsessecaeseeeeeteeeereeaees
Guidelines.to_ Change the Operating Speed Mode...........cccccesesceseseeseseeeeeeeeseeseeeeeseeaees
MGBE Initialization
Virtualization Programming Guidelines.............ccccccccecsscesesceseseeseseeeceeseseesesecseeeeseeeeseeaes
Guidelines to Access PTP Registers from VMS..........:cccccscesseseseeseseeeeseeeeseeeeseeeeeeeeseeetee
Interrupt ProCeSSing ...........:ecceccescesceseeseesececcecceceececseesecsecsecseeacecaeeaeeaesaeeaecaeseeseeseeeereeates
VM Interrupt Handling Guidelines... cece cecesessesesecseeeesescesecseseeseseeeeeeseseeeeeeatees
mgbe_common_intr_o Handling Guidelines ............cccceccccsceseseeeeseeeeseeeeseeeeeeseeeeeseeaeee
Blocking Access to CRC Configuration Bits in XGMAC..........cccececeesesseseseeeeeeseteeeeeeeeee
Software Programming Guidelines.............ccccceecceseseesesceeeeeeseseeccseeseeecsesecsesecseeesseeeeseeaes

```
</details>


<!-- Page 29 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

10.8.5 10G Ethernet Registers...................................................................................................................11822

10.8.5.1 10G Ethernet Controller Wrapper Registers....................................................................11822

10.8.5.2 10G Ethernet Controller Core Registers ..........................................................................11866

10.8.5.3 10G Ethernet Controller Core Registers cont'd 1 ............................................................12026

10.8.5.4 10G Ethernet Controller Core Registers cont'd 2 ............................................................12236

10.8.5.5 10G Ethernet Controller Core Registers cont'd 3 ............................................................12476

10.8.5.6 10G Ethernet Controller Core Registers cont'd 4 ............................................................12673

10.8.5.7 10G Ethernet Controller Core Registers cont'd 5 ............................................................12771

10.8.5.8 10G Ethernet Controller Core Registers cont'd 6 ............................................................12863

10.9 Controller Area Network (CAN)........................................................................................................13013

10.9.1 Overview.................................................................................................................................................13013

10.9.1.1 Revision .............................................................................................................................13015

10.9.1.2 References ........................................................................................................................13016

10.9.1.3 Hardware Features ...........................................................................................................13016

10.9.1.4 Software Features.............................................................................................................13017

10.9.2 Functional Description.....................................................................................................................13017

10.9.2.1 CAN Clock Domains .........................................................................................................13017

10.9.2.2 CAN Resets .......................................................................................................................13019

10.9.2.3 External Time Stamp ........................................................................................................13019

10.9.2.4 CAN Message RAM ..........................................................................................................13021

10.9.2.5 Round Robin Arbiter Between APB and CAN Core .........................................................13021

10.9.2.6 Configuration and Status Registers.................................................................................13021

10.9.2.7 Time-Triggered (TT) CAN.................................................................................................13023

10.9.2.8 Bosch IP Specific Features ..............................................................................................13024

10.9.2.9 Notable Bosch IP Behavior...............................................................................................13024

10.9.2.10 System Interfaces.............................................................................................................13025

10.9.2.11 CAN SoC Interface............................................................................................................13025

10.9.3 Programming Guidelines.................................................................................................................13026

10.9.3.1 Selecting Trigger Source for SWT and EVT.....................................................................13026

10.9.3.2 Selecting Sources for Fault Detect Signal to HSM .........................................................13027

10.9.3.3 Orin Specific Controller Initialization ...............................................................................13027

10.9.3.4 Arbitration Between STD Message and EXT Message ..................................................13027

10.9.3.5 Prefetch Feature on Transmit Message Handler............................................................13027


<details>

<summary>OCR (Page 29)</summary>


```text

10.8.5 TOG Ethernet ReGiSters 0... ceeseesseesesecsecsseesseesseesatecsessesseesseesstesssessneeseesasesntesnesseeeneeseeeey
10.8.5.1 10G Ethernet Controller Wrapper ReGiSters ...........cccccccecessesseeeseeeeseeseseeeeseeeeseeeeseeeesesbens
10.8.5.2 10G Ethernet Controller Core Registers ...........ccccccccecssesesceseeseseeeeseeeeseeeeseecsseseaaateas ghee
10.8.5.3 10G Ethernet Controller Core Registers Cont'd 1 ........cceccseeseeeseseeseseeeeseesegfesedierseeesees
10.8.5.4 10G Ethernet Controller Core Registers cont'd 2..
10.8.5.5 10G Ethernet Controller Core Registers Cont'd 3... ccccccseeseseeeseesestpefeopieeseseseeeeseeeeee
10.8.5.6 10G Ethernet Controller Core Registers Cont'd 4.........cccccseesessssepeted becseeeeseeseseeeeeeeaeee
10.8.5.7 10G Ethernet Controller Core Registers Cont'd 5.0... ccccccsceeeLadecdeseeeeseeeeseeseseeseseeaeee
10.8.5.8 10G Ethernet Controller Core Registers Cont'd 6 .........cccc Abe tecceseseeeeseeeeeeeseteeseeeeeeee
10.9 Controller Area Network (CAN).....ccecssesssessesssssessesssessssessssssesssnse Dhadlessesstesussesatssessessenssssesensaeaes
10.9.1 OVELVICW....essecssecsstessessueestecssessatecssessseestecsucesneesssesssesatecsucesnnesafllbeng eecsuessneesueesueeestessuessneeaeesueenseessnesaes
10.9.1.1 REVISION oe. eee ecceeeceessceeccesceeeeeeesecetsecsetscsecscecacseesssdgneslpaceeceeseeeesseecaeeesseeetaeeaseeeseeeeseetates
10.9.1.2 ReFEFENCES one. eeeeeeeceseseececececeseseseeeceseseseacececseseaesesMfesseacacaesceceseseaceeseeseaeacacaeseeseseaeeceeeetaas
10.9.1.3 Hardware Features ..........ccecesscescsceceseseseeceeeape¥ecsanl ceceeseseseaesceseseseeeeceeeseaeaeaeaeeceseseaeeceeeeeees
10.9.1.4 Software Features
10.9.2 Functional Description..
10.9.2.1 CAN Clock Domains
10.9.2.2 CAN ReS6tS 0000. eeeecceececeeeeeeeesehoipecsecscsecscsecscsecseescseeavseeeceeesceeesssesaeeesaeetaeaseeeeseeeeseetates
10.9.2.3 External Tire Stamp oo... tecccceccccsccseeceseeceseeseseeseseeecseeseseeeesesseeecseecseseeeeeeseeeeseeates
10.9.2.4 CAN Message RAM ..0........2hgteeceesceseeseeseesceccececcececsecsecsecsecseceacseseeeaeeaecaesaesaeeeeseeteesereeates
10.9.2.5 Round Robin Arbiter BetWeen APB and CAN Cote .........c.secesesesseseceseseseeeeeeeeseseeeeceteeeees 13021
10.9.2.6 Configuration and StatuS REGiSters..........cccceccccesseseseeceseeseeeeseeeseeeeseeeeseseseeseseeeeseeatee 13021
10.9.2.7 Time-Triggered (FR)-CAN ..0....eseecesecscsesesesesesseeceescecseseseeseseneecaeaeccencesesneneacatsceeseeneneeeeeeees 13023
10.9.2.8 Bosch IP Specific Features ......... ec ceccccsccsceceseeceseeseseeseseeecseeseeeesesesseeecseecseeeeseeesseeeseeeates 13024
10.9.2.9 Notable Bosch IP Behavior...........cececsscsesseseseseseseeeeseseseseseseeeeseseaceceeeseaeacaeaeeeeeeseaeeceeeeeaeas 13024
10.9.2.10 System Interfaces... 13025
10.9.2.11 CANSOC Interface 0... eeeeeseseeseseseseseseceseseseseseseeseseseaeaeseseseaeaceceeseaeacaeaeeeeseseaeeceeeeeaes 13025
10.9.3 PROGFAMMING GUICE]INES ... eee eecseeseesseesseesseeesseesseeestecsuecsneesecsseesatesssessneeseesueenntesnesseeentecseeets 13026
10.9.3.1 Selecting Trigger Source for SWT and EVT.......ccceeccccecccecescesesseseseeeceecseseesesecseeeeseeeeseees 13026
10.9.3.2 Selecting Sources for Fault Detect Signal to HSM ..........ccceccccesessesceeeseseeseecseeeeseeeeseeees 13027
10.9.3.3 Orin Specific Controller InitialiZation 0.0.0... ce ccececseseseecesceseeeeseeeeeeeeseeeeseeesseeeeeeeeseeaees 13027
10.9.3.4 Arbitration Between STD Message and EXT M@SSa@ .........:.ceccsseseeseseeseseseeeeseseeeesees 13027
10.9,3.5 Prefetch Feature on Transmit Message Handlet..............cccccececssseseeseseeeeseeeeeeeseeeeeseeeeee 13027

```
</details>


<!-- Page 30 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

10.9.4 CAN Registers......................................................................................................................................13028

10.9.4.1 CAN Core Registers ..........................................................................................................13033

10.10 SDMMC Controller................................................................................................................................13071

10.10.1 Overview.................................................................................................................................................13071

10.10.2 SDMMC Controller Functional Description .............................................................................13073

10.10.2.1 Supported Features ..........................................................................................................13073

10.10.2.2 Supported Specifications and Standards........................................................................13074

10.10.2.3 Hardware/Software Partitioning......................................................................................13076

10.10.2.4 SDMMC Clocking ..............................................................................................................13079

10.10.2.5 Interface to Memory Controller........................................................................................13080

10.10.2.6 Address Width...................................................................................................................13080

10.10.2.7 SMMU Translation ............................................................................................................13081

10.10.2.8 ADMA2 64 Bit....................................................................................................................13081

10.10.2.9 Descriptors for 64-bit Addressing....................................................................................13082

10.10.2.10 ADMA3...............................................................................................................................13083

10.10.2.11 Register Access ................................................................................................................13084

10.10.2.12 Non-DMA Mode of Transfer (PIO mode).........................................................................13084

10.10.2.13 Standard Driver Support ...................................................................................................13084

10.10.3 SDMMC Programming Guidelines...............................................................................................13085

10.10.3.1 Clocks and Reset ..............................................................................................................13085

10.10.3.2 Initialization.......................................................................................................................13086

10.10.3.3 SDMMC1 Initialization Sequence.....................................................................................13086

10.10.3.4 SDMMC4 Initialization Sequence.....................................................................................13092

10.10.3.5 General Guidelines............................................................................................................13097

10.10.3.6 ADMA2...............................................................................................................................13098

10.10.3.7 ADMA3...............................................................................................................................13098

10.10.3.8 Programming Guidelines for eMMC HS400 Mode .........................................................13100

10.10.3.9 Clock Trimmer Settings....................................................................................................13105

10.10.3.10 SDR50/SDR104/HS200 Tuning Procedure .....................................................................13106

10.10.3.11 Boot ROM Support ............................................................................................................13108

10.10.3.12 SD3.0 Signal Voltage Switching.......................................................................................13109

10.10.4 SDMMC Registers..............................................................................................................................13109

10.10.4.1 SDMMCAB Registers........................................................................................................13187


<details>

<summary>OCR (Page 30)</summary>


```text

10.9.4 CAN ReGIStEMS...0...eeceeesseesstecsseesstesseesseesecsuccsseesssesssesseecsuessatesueesseesaecsuecsneesueesueesatessuessneeaseesueenaeessneseey 13028
10.9.4.1 CAN Core ReGiStePs .........:..:cecceccessesseseeseesceeseeccceeeeeseesecsecsesseeeeesaceeeaeeaesaeesesaeeeeseesererestnes 13033
10.10 SDMMC Controller n....ceeseeceecsessesssessessesceesseesnssaeeaeesussuesaceenseuseseeanesussasesseeassuseaneeaseatsateanssaseaneanegaarectagfees 13071
10.10.1 Overview
10.10.2 SDMMC Controller Functional Description...
10.10.2.1 Supported Features
10.10.2.2 Supported Specifications and Standards............ccccceccscessseeseseesesepeal pesesesecseeeeseeeeeeeees
10.10.2.3 Hardware/Software Partitioning .............c:ccceccsceseseesesseseseeceseeseseeslpeespieseeecseeeceeeseseeeeeeatee
10.10.2.4 SDMMC CLOCKING ...........cececeseseseceeeeeeeeecescececececesesceceeeseststsceepllpeen@hesseeeeeseetseeeeeteeseseeeeeees
10.10.2.5 Interface to Memory Controller... ceeceesseseceseeeeeeceeeseegeedbaadesceceecaeeeeeeeeseeceeeeeceeneeeeaeees
10.10.2.6 Address Width ..........ccceccecececesesescecesesesesescecscecesesescaeeeegfileqaceeeceeseseseeeeeteeseecaeeceeeeeeeeeeeeeeees
10.10.2.7 = SMMU Translation ........eeeeeeesceseeecesesescececesecesesecdecselpeseaceceeseeseseaeeseeeeestaeaeeeeeeeeseseaeeeeees
10.10.2.8 = ADMA2 64 Bit... eeececececesesesceeeeeeesesescecscececeassMfessesevacaceeeeseeseseaeeeeeeeeseaeaeeeeeneeseseaeeeeees
10.10.2.9 Descriptors for 64-bit AddreSSing..............aetenaeleceeeecesesesesceceseseseseseeeeseeeseaeaeeeeeseseseaeeees
10.10.2.10 = ADMA3 Luo. eeeeeceseeesesesesccecececeseacsesesesevesana lbpresesescseeeeecseaeaceceeseeseseaeeeeeeeeetaeaceeeenenseseaeeeeees
10.10.2.11
10.10.2.12 | Non-DMA Mode of Transfer (PIO MOde).........eeeeececeseseseseeceeeseseseseseeeeeeseeeaeaeeteeseseaeaeeees
10.10.2.13 Standard Driver SUPPort «0.0.0.2... Cage eececeececececeseseeeeeeesesesesceceeeseseaeseeeeenseseaeaeeeeeseseaeeeeees
10.10.3 SDMMC Programming Guidelines... cesessecsecsessseessesseecsessneesseesseesatessesseteaeesseenstecsnesses
10.10.3.1 Clocks and Reset ..........1:Dagteseeeesesesesesesesceseseseseseseeseseaeseaeseeseseaeacaceeseaeacacaeeeeseseaeeceeeeeaas
10.10.3.2 DMitiAI ZATION eee eee Dp eeeceeececeecececeeesesesescseseesescaeaceeeseseseececeeeacacaeeeeeeeesceeaeeeeeneeeeaeats
10.10.3.3 SDMMC17 InitializatioM Sequence ...........cccceeecsceseeseseeeeseeeseescseecseaesecsesecseseeseeeeseeeeaeeaes
10.10.3.4 SDMMC4 InitialiZation SEQUENCE. .......... ec eceeeeeseseeseseeeescsecseesesecesesaesecsesecseseeseeeeseeeeseeas
10.10.3.5 General Guideline ..0......eeeececeeeeeeceseseseseeeeseseseseseseseseseaeaeseseseacaceeeeeseaeaeaeaeeceeeseaeeceeeeeaas
10.10.3.6
10.10.3.7
10.10.3.8 Programming Guidelines for EMMC HS400 Mode ...........cccceeesceseseeseseeeeseeeeeeeseeeeeseeeeee 13100
10.10.3.9 GlOCK Trimmer SettingS ............ccccecccceccsesecseeeeseeceseeseseeseseeecseeseseesesesseeeeseeecseeeeeesseeeeeeeate 13105
10.10.3.10 SDR50/SDR104/HS200 Tuning Procedure .......... cc ececeeeseseeseceseseseseeeeeeseseseaeeeeeseseeeeeeees 13106
10.10.3.11 Boot ROM Support ...........eceecesesessesesesesesesescesesesescseseesestacaeaesceseseaeaceeeeeseaeacaeaeeeeseseaeaceeeeeaas 13108
10.10.3.12 SD3.0 Signal Voltage SWitChing..........cccccceceeesessesceseseeseseeesseeseseeeesesaesecsesecseseeseeeeseeeeseeees 13109
10.10,4 SDMMC ReGIStEPS.......essesseessstesstesseeestecsseesneesseessesseecsucssanesssesseesaecsucesatesueesseesatessuessneesueesscenaeessnesses 13109
10A0.4.1 SDMMCAB ReGiISteEPS ............cecececceceseseseseseeesceeeesesceceeeeseaesesceeeecescaeeeeeeeestecaeeeeeeseeeseaeeeeees 13187

```
</details>


<!-- Page 31 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

10.10.4.2 SDMMCA Registers ..........................................................................................................13292

10.11 I2C Controller (I2C) ...............................................................................................................................13372

10.11.1 Overview.................................................................................................................................................13372

10.11.1.1 Features.............................................................................................................................13372

10.11.1.2 Clocking.............................................................................................................................13373

10.11.2 Functional Description.....................................................................................................................13374

10.11.2.1 Second Level Clock Gating (SLCG)..................................................................................13374

10.11.2.2 Bus Clear Master Operation .............................................................................................13375

10.11.2.3 Multi-Master Operation.....................................................................................................13377

10.11.3 I2C Programming Guidelines.........................................................................................................13385

10.11.3.1 I2C Frequency Divisor Register........................................................................................13385

10.11.3.2 Programming Guidelines for Master in Normal Mode ...................................................13394

10.11.3.3 Programming Guidelines for Packet-Based Interface....................................................13396

10.11.3.4 Master in Packet Mode Programming Guidelines..........................................................13402

10.11.3.5 Programming Guidelines for Slave in Byte Mode ...........................................................13415

10.11.4 I2C Registers........................................................................................................................................13430

10.12 Universal Asynchronous Receiver/Transmitter (UART)..........................................................13466

10.12.1 Overview.................................................................................................................................................13466

10.12.1.1 Features.............................................................................................................................13467

10.12.1.2 Security Features ..............................................................................................................13467

10.12.1.3 Hardware Signaling...........................................................................................................13467

10.12.1.4 Clocking.............................................................................................................................13468

10.12.1.5 Use Cases..........................................................................................................................13470

10.12.1.6 Error Handling ...................................................................................................................13471

10.12.2 Programming Guidelines.................................................................................................................13471

10.12.2.1 UART Register Access......................................................................................................13471

10.12.2.2 16450 Mode Programming ..............................................................................................13472

10.12.2.3 16550 Mode Programming ..............................................................................................13472

10.12.2.4 Transmitter and Receiver Holding Registers ..................................................................13473

10.12.2.5 FIFO Interrupt Mode Operation ........................................................................................13474

10.12.2.6 FIFO Polled Mode Operation ............................................................................................13474

10.12.2.7 Programmable Baud Rate Generator ..............................................................................13475

10.12.2.8 Enable Register .................................................................................................................13475


<details>

<summary>OCR (Page 31)</summary>


```text

10.10.4.2
10.11
10.11.1
10.11.1.1
10.11.1.2
10.11.2
10.11.2.1
10.11.2.2
10.11.2.3
10.11.3
10.11.3.1
10.11.3.2
10.11.3.3
10.11.3.4
10.11.3.5
10.11.4
10.12
10.12.
10.12.1.1
10.12.1.2
10.12.1.3
10.12.1.4
10.12.1
10.12.1
10.12.2
10.12.2.1
10.12.2.2
10.12.2.3
10.12.2.4
10.12.2.5
10.12.2.6
10.12.2;7
10A)2.2.8
SDMMCA R@GISTETS 1.00... ..:ceccecceseesceseeseeseeeeeceeeeeeaeesecseesecseceaceacaccecsecseesesaeseeeseereeeseaeeaas
12C Controller (LOC) o..ceccecesescscssesssssscssesssessesscsssssstssessessssssessussasssessessanssessessatsamsssssatsatssesstsanssssessaelines
Overview
Features
Clocking
Functional Description..
Second Level Clock Gating (SLCG)...
Bus Clea
Multi-Ma
I2C Programming Guideline ou... eeeeecseessessseeseesseecsessnaselbnaglestecsesseeseeseesntesnesneeneeseeess
I2C Frequency Divisor ReGiSter 0.0... eeeeeeeeeeeeeseeg lege eeceececeecsesaeeesseeesseaeseeeesseeeseetaees
Program
Program
r Master Operation ......... ec eeceeeecceceeseeceececeeseeseeseeeceececehpeleapreeeeeeceeeeseeeeeeeeaees
SEP OPC ration... ee eeeceecesceseeeceeccesceeceeeeeseesteseceaghleestlheseeseeseeseeeeeeeeeeeeeeeeeats
ming Guidelines for Master in Normal Mod@),............ccccecceceeeeseeeeseeeeeeeeeseeeeee 13394
ming Guidelines for Packet-Based Interface ............cccececeesceseseeeeseeeeeeeeeeeeeee 13396
Master in Packet Mode Programming GuidelineS................ccccccceseseeseseeeeseeeeeeeseeeeeeeesee 13402
Program
12C Registers
Universal Asynchronous Receiver/Transmitter (UART)
Overview
Features
Security
Hardware Signaling... ye .cccccccccecsscsseseseeseeceseecesceseseescseeecseeseseesesesseeecseeecseeeeeeseneeseeates
Clocking
USe CaSOS 20.0... ON eee ccceececeeceesecsesseseeecsecscsecscseeseeecseeavseeceeescseeeseeeaeeesaeeevaeeaseeeeseeeeseesaees
Error Handling-cv2.....ecesceceseceseseseeeesesesesesesceceseseseseeeseeseaeseaeecseseaeeeeceeeseaeacaeaeeceseseaeeceeeeeetas
Programming Guidelines
UART Register Access...
16450.Mode Programming ...........ccccccccsesscsseseseeceseeseseeseseeccseeseseeseseeseeecseeecseeseeseeeeeseeate
16550 Mode Programming ...........ccccccccsesscsseseseeceseeseseeseseeecseeseseecesesseeeeseeeeseseseeeeseeeeseeate
Transmitter and Receiver Holding Registers ............ccccecccsesessesesseeceeeseseeseseceeeeseeeeseeees
FIFO Interrupt Mode Operation ...........ccccccceesseceseeseseeseseeeeceseseeseseeseeecseeecseeceeeeeseeeeeeeate
FIFO Pol
Program
Enable ReGister ..........ccccceccssesescescsseseseeseseeseseesesceseeseseeeseeecseeseseesesesseeecseesseeeseeesseeeeeeeate
ming Guidelines for Slave in Byte Mode
FOAtUreS oo... cece Dk gteeceeceeceeeseesccecceeceecececsecsecaecaesseceaceeeeeeaesaeeaesaeeaeeeeseeseeeeeeeaees
led Mode Operation .........cccccceccccescssescsseseseeseseeseseeseescseeecseeecsessesesseseseeeesseeeeseeates
Mable Baud Rate Generator 0... cceceececcecescesesesseseeseseeecseeecsecsesecsesecseeeeseeeeseeaees

```
</details>


<!-- Page 32 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

10.12.2.9 Interrupt Identification Register .......................................................................................13475

10.12.2.10 FIFO Control Register........................................................................................................13476

10.12.2.11 Line Control Register ........................................................................................................13477

10.12.2.12 Modem Control Register ..................................................................................................13477

10.12.2.13 Line Status Register..........................................................................................................13477

10.12.2.14 Modem Status Register....................................................................................................13477

10.12.2.15 Scratchpad Register .........................................................................................................13478

10.12.2.16 Auto-Baud Sense Register................................................................................................13478

10.12.2.17 Baud Rate Generator.........................................................................................................13479

10.12.2.18 SIR Pulse Encoder/Decoder .............................................................................................13479

10.12.2.19 UART Interrupts and Interrupt Service Routine...............................................................13480

10.12.2.20 FIFO Flushing Guidelines..................................................................................................13483

10.12.2.21 UART Boot.........................................................................................................................13484

10.12.2.22 IRDA_CSR Register (UART_IRDA_CSR_0)........................................................................13485

10.12.2.23 Pad and Pinmux Information ...........................................................................................13486

10.12.3 UART Registers ...................................................................................................................................13489

10.13 Server Base System Architecture (SBSA) UART.......................................................................13500

10.13.1 Overview.................................................................................................................................................13500

10.13.1.1 SBSA ..................................................................................................................................13500

10.13.1.2 UART..................................................................................................................................13500

10.13.1.3 Feature List........................................................................................................................13501

10.13.1.4 Interrupt and Status Generation.......................................................................................13503

10.13.1.5 UART DMA Interface.........................................................................................................13504

10.13.1.6 Error Handling ...................................................................................................................13505

10.13.1.7 Clock and Reset ................................................................................................................13506

10.13.2 Programming Guidelines.................................................................................................................13508

10.13.2.1 Initial Sequence (Clock, Reset, and Pinmux Programming)...........................................13508

10.13.2.2 Basic Guideline for Tx.......................................................................................................13508

10.13.2.3 Basic Guidelines for Rx.....................................................................................................13508

10.13.2.4 Tx: Non-FIFO Mode Programming...................................................................................13509

10.13.2.5 Tx: FIFO Mode Programming (Non-DMA) .......................................................................13510

10.13.2.6 Tx: FIFO Mode Programming (DMA Mode).....................................................................13511

10.13.2.7 Rx: Non-FIFO Mode Programming...................................................................................13512


<details>

<summary>OCR (Page 32)</summary>


```text

10.12.2.21
10.12.2.22
10.12.2.23
10.12.3
10.13
10.13.
10.13.1.1
10.13.1.2
10.13.1.3
10.13.1.4
10.13.1
10.13.1
10.13.1
10.13.2
10.13.2.1
10.13.2.2
10.13.2.3
10.13.2.4
10.13.2.5
10.13.2:6
10A)3.2.7
Interrupt Identification REGiSter ...........cccceceececsseseeeeseeeeseeeseeseseeceseesesecsesessesesseeeeseeeseeeaeag 13475
FIFO Control RegisSter...........cccccccccesscssesesseseeseseeceseeseseeseseeeceecseseeseseesseecseeesseseeeeeesseeeeeehaes 13476
Line Control REQister 0.0... cccececccecsessesesseseeceseeceseeseseceeseeeceeeseseesesesseeecseesseeeseeeeaaateatgfeee 13477
Modem Conttrol Register ............cccccccsccsescesseccseeceseeseseeseseeeeeeseeesesesseeecsesecsesseafesedivrseeeates 13477
Line Status Register...
Modem Status ReGister ............ccccccccccscesesccseeseseeseseeseseeseseeecseeseeeesssessssesaigefespiseeeseeeeeeeeates 13477
Scratchpad ReGister ..........cccecccccsesseseseesesceseesescseescecseecsesecseescsesecsagateal fescseeeeseeeeseeeeseeees 13478
Auto-Baud Sense ReGiSter............cccceccscecescessesesessesceseseeecscsecseescsesles)eahiteseecseeeseeeeseeeeseeees 13478
Baud Rate Generator... eecececeecececesesesetceceseseseeesccestsescacateceaphleestlheceseseseseneeeeseseeeeeeeeeteees 13479
SIR Pulse Encoder/De@COoder uu... .eeeeeseeecececeseseseceeeeeeeseneeDbaadeceseseeeeeeeeseeeseaeeeeeeseeeeeeeeees 13479
UART Interrupts and Interrupt Service ROUTING 2.00... ere cccececceeeeeeeeseeeeseeeeeeeeseeeeseenees 13480
FIFO Flushing Guidelines .............cccccecccesceseeseseeceseedeeespececesceseececeseeseeecseeecseeeeeeeeeseeeeseeates 13483
UART BOOt .......ccecececesesesceceseseseseseeeesesesesesceceecseseaesesMfesseacacaesceseseaeaceeeeeseaeacacaeseesescaeaceeeeteres 13484
IRDA_CSR Register (UART_IRDA_CSR_O)....,ercecas)ecesesessseceseseseeeeececeesescaeseseseeeeneseeeeeeeetaes 13485
Pad and Pinmux Information ..
UART Registers
Server Base System Architecture (SBSA) UART.
OVErVICW...ececceeseessessessscesecsecesccucescsneeedEbeacsuessessceuseaesaeseucsueeseeeussueeaeeeussueeaesaseueeateaessseeteaeseseeteateeeeeass
Interrupt and Status. Gerieration...........cccccccccecseseseeseeeeseseeseeseseeccseeecsecsesecsesecseeeeseeesseeaeee
UART
Error Handling-cv2.....ecesceceseceseseeeeesesesesesesceseseseseseeeseeseacaeaeecsescsesceceeeseaeacaeaeeeeseseaeeceeeeeatas
Clock
Progra
Initial
Basic
Basic
Tx: Non-FIFO Mode Programming ..........ccccccecesssseseeseseeseseeecseeseseeecsesaesecsesecsesecseeeeseeeeseeaes
Tx: FIFO Mode Programming (NOM-DMA) ..........::scssssseceseseseseeeseseeececesescacaeseseseenseeeeeeeees
Tx: FIFO Mode Programming (DMA Mode)...........:::::sscsssssseceseeseseeeeeceseescacaeseseseeeeeeeeeeeees
Rx: Non-FIFO Mode Programming ..........:ccceccscesessesesseseseeceseeseeeseeeeeeeeseeesseeesseeeeseeeeseeaee
DMA Interface... cececcecescesesseceseesceeeseseesesecseeeesesecseeseseeseseeeesecseecseessecseeeeaeseeaeees
and.Reset
mming Guidelines
Sequence (Clock, Reset, and Pinmux Programming)
Guideline fOr TX... eeeecececeseseseseececesesesesesceceeeseseacaeeceseseaeaceceeeseacaeaeaceeceeseaeaceceeeates
Guidelines FOr RX... eecceccecesesseceseeseseeseseesesceseeceseseeseeseseeseseeeseceseecseecseeseseeeeseeaeees

```
</details>


<!-- Page 33 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

10.13.2.8 Rx: FIFO Mode Programming (Non-DMA).......................................................................13513

10.13.2.9 Rx: FIFO Mode Programming (DMA Mode).....................................................................13514

10.13.2.10 BREAK Programming (Non-FIFO Mode) in Tx.................................................................13515

10.13.2.11 BREAK Programming by Not Flushing FIFO Data (FIFO mode) in Tx............................13516

10.13.2.12 BREAK Programming Flushing FIFO Data (FIFO mode) in Tx........................................13516

10.13.2.13 Loopback...........................................................................................................................13517

10.13.3 SBSA UART Registers.......................................................................................................................13517

10.14 Serial Peripheral Interface (SPI).......................................................................................................13529

10.14.1 Overview.................................................................................................................................................13529

10.14.1.1 Standard and Compatibility..............................................................................................13530

10.14.1.2 Glossary.............................................................................................................................13530

10.14.1.3 Features.............................................................................................................................13531

10.14.2 Functional Description.....................................................................................................................13531

10.14.2.1 Transmission Format .......................................................................................................13533

10.14.2.2 Modes of Operation..........................................................................................................13535

10.14.2.3 Error Conditions ................................................................................................................13544

10.14.2.4 Programming Guidelines..................................................................................................13546

10.14.3 SPI Registers........................................................................................................................................13551

10.15 Quad Serial Peripheral Interface (QSPI).......................................................................................13567

10.15.1 Overview.................................................................................................................................................13567

10.15.1.1 Standard and Compatibility..............................................................................................13567

10.15.1.2 Glossary.............................................................................................................................13568

10.15.1.3 Relevant Chapters in the TRM..........................................................................................13568

10.15.1.4 Features.............................................................................................................................13568

10.15.2 Functional Description.....................................................................................................................13569

10.15.2.1 Flash Devices Configurations ..........................................................................................13569

10.15.2.2 Dual QSPI Bus Configuration ...........................................................................................13571

10.15.2.3 System Configuration.......................................................................................................13571

10.15.2.4 Drive Strength Programming............................................................................................13572

10.15.2.5 Safety Mechanisms ..........................................................................................................13573

10.15.3 Programming Guidelines.................................................................................................................13574

10.15.3.1 Clock Initialization and Control ........................................................................................13574

10.15.3.2 Clock Programming for Various QSPI Modes.................................................................13574


<details>

<summary>OCR (Page 33)</summary>


```text

10.13.2.8 Rx: FIFO Mode Programming (NOn-DMA) ..........:::ecesscsssesesesesesececseseacseseseseencececseeeeeeeeeeeas 13513
10.13.2.9 Rx: FIFO Mode Programming (DMA Mode)............::ccscsscecesesesecesseseecsesesesesseaceceeseetenetians 13514
10.13.2.10 BREAK Programming (Non-FIFO Mode) in TX..........:cccccssecesesesecesseseecsesesesescacecsegenteatgfees 13515
10.13.2.11 BREAK Programming by Not Flushing FIFO Data (FIFO mode) in TX...........4:sfoceee 13516
10.13.2.12 BREAK Programming Flushing FIFO Data (FIFO mode) in Tx
10.13.2.13 LOOPDACK 2.0... eee eccceccceccsseseseecesecsesessesecsesecsesecsescesecsesecscseeeceecseseesseesatsessigefespiseeeseeeeeeseestes
10.13.3 SBSA UART ReGIStePS ......seesssssssessseesstesseesseesseesstesstecsucssstessesseesstecsucsseteaueegpettadeljecssnteaseesseenseessnesses
10.14 Serial Peripheral Interface (SPI) ......ccssssscssssessssecssssessssecsssessssecssssessssessaljelbsstcsssesesneccsseccsneessssessene
10.14.1 OVELVICW....eeseecseesstesstessseestecsseeentecssesssessecsscesneesssessesstecsucesatessesseessecadl laeesMlcsseesatessessnteseesseenatesseessee
10.14.1.1 Standard and Compatibility... eeececeseseseeeeeeeeeeseneeDbaadeceseseeeeeeeeseeeaeeeeeeeeeeeeeeeeeees
10.14.1.2 GIOSSALY oo... eeeecececesesesescecececeseseseseeeseseseaescsesesenenesseseaghileqeecseseseaeeeeeeseaeacaeaeeeeseseaeeceeeeeaas
10.14.1.3 FOAtUreS ooo. eee eeceeecceececeeeeceecsceaceesscseescsecscecscsessssdgneslpaceeceecseeeesssesaeeesaeeetaeeaseeeeseeeseesates
10.14.2 Functional D@SCriIPtiON ........cceccesseessessecseessessesssssesseesasen Mgsenecueeseesessussueeaeseussueeatesussueeaneaseneeateeseeneees
10.14.2.1 TransSMiSSiONn FOAL... eee eeseesesceeeeeapOPencael cceecsceessceeceeeecseeecsesaeesaceseeeeseceeeeeeeeeeeaes
10.14.2.2 Modes Of Operation .........ccceececeessesesessesenns Mbesuseceseeceseeeeseeecsecseseesesesseeecseeesseeeseeeseeeeeseeates
10.14.2.3 Error Conditions
10.14.2.4 Programming Guidelines... Mescccceceseeccseeseseeseseecesceseseeseseeseeeeseeeseseeseeesseeeeseeatee
10.14.3 SPI REGiIStELS oo. eceeeceeessesstecsseesstecstesshe pecsscssneesnessesseecsucesatessesseessecsuessntesuesseeesatessuessneeaseesueenatesssesaee
10.15 Quad Serial Peripheral Interface (QSPI) .....sescsssssssssecssssescssecssssescssecssssesssnecssssesssnecesssesssneessssecesse
10.15.1 OVELVICW.....esseecsecsstecstesseeesnecsetDbagscsscssseestecsueesneesssessessecsucesatesnsesseessecsuessneesueesseesstessuessneeaueesseenatessnesaes
10.15.1.1 Standard and Compatibility... ccc eeeceseseseseeeeeeseeesesesceeeeeseseseeeeeeeeeteeaeaeeeeeeseseeeeeeees
10.15.1.2 GOSSALY oes eeeeeeees ed aDeccescececeseseseseeesesesesesessseseacsesesseacseaeaeseeseseaescaceeeeaeacaeaeeeeseseaeeeeceeeatas
10.15.1.3 Relevant Chapters: the TRM..........ccccccccccsscesseseseeseseeseseeseseeseseeseseeeseeeseecseseseeeesseeeeeeeatee
10.15.1.4 FOAtUre 00... pele eeceecceeescescsceecscccseeseseescsecscsecscseeseeacseeavaceceeeseaeeasaeeaeeesseeesaeeeseeeseeeeseesates
10.15.2 Functional.Description
10.15.2.1 Flash Devices Configurations .
10.15.2.2 Dual_QSPI Bus Configuration ..........cccccccccceseseeseseeseseeseseeeeeeseseeseseeeseecseecseeseeeeeeeeseeate
10.15.2.3 System Configuration 0... eececeecesececeseseseecesesesesesceeeeeecsesesceeeeeseseseeeeeeeeseeeaeaeeeeeeseseeeeeeees
10.15.2.4 Drive Strength Programming. ..........ccccccccssssesesseceseeseseeseseeseseeseeeseseeseeeeseeecseeeseeeeseeeeseeaee
10.15.2.5 Safety Mechanisms ............cecececeseesessseseseseseeceeesesesescseseeecsesesceeseeseseaeeeeeeeeseecaeaeeeeeeeeeeeeeeeees
10.15,3 Programming GUICeliINeS ...... ee eessecseeseecsecseessseesseesatecsesseteseesseesatesssesseeseesseeeatessesneeneesneess
10.15.31 Clock Initialization ANd COMtrOl .........eeeeceseseseseeeeeeeseseseseseeeeceseseececeeeseaeacaeaeeeeseseaeeeeeeetaees
1045.3.2 Clock Programming for VarioUs QSPI] MOde@S...........cccceceseeseeseseeeeeeeeseeeeseeeeseeeeseeeeseeetee

```
</details>


<!-- Page 34 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

10.15.3.3 PLL Clocking Policy ..........................................................................................................13575

10.15.3.4 QSPI Controller Configuration..........................................................................................13575

10.15.3.5 PIO Data Transfer Using CPU...........................................................................................13576

10.15.3.6 DMA Data Transfer ...........................................................................................................13576

10.15.3.7 Programming Trimmers...................................................................................................13577

10.15.3.8 Auto-Drive Strength Calibration Sequence......................................................................13578

10.15.4 QSPI Registers.....................................................................................................................................13578

10.16 Pulse Width Modulator (PWM)........................................................................................................13596

10.16.1 Overview.................................................................................................................................................13596

10.16.1.1 PWM Diagrams .................................................................................................................13596

10.16.1.2 Use Cases..........................................................................................................................13598

10.16.2 Programming Guidelines.................................................................................................................13598

10.16.3 PWM Registers ...................................................................................................................................13599

10.17 Fan Tachometer .....................................................................................................................................13600

10.17.1 Overview.................................................................................................................................................13600

10.17.2 Functional Description.....................................................................................................................13602

10.17.2.1 Fan Tachometer Clocks ...................................................................................................13602

10.17.3 Programming Guidelines.................................................................................................................13606

10.17.3.1 Interrupt Handling.............................................................................................................13607

10.17.4 Fan Tachometer Registers .............................................................................................................13607

11. Safety........................................................................................................................................................... 13612

11.1 Functional Safety ..................................................................................................................................13612

11.1.1 Error Reporting....................................................................................................................................13612

11.1.1.1 Error Reporting Architecture ............................................................................................13613

11.1.1.2 IP Error Reporting Mechanisms.......................................................................................13615

11.1.1.3 Error Flow ..........................................................................................................................13617

11.1.1.4 Error Handling ...................................................................................................................13618

11.1.1.5 Error Output Pin.................................................................................................................13618

11.1.1.6 Heartbeat Over SPI ...........................................................................................................13619

11.1.2 Functional Safety Island..................................................................................................................13619

11.1.2.1 Overview ............................................................................................................................13619

11.1.3 Hardware Safety Manager (HSM)................................................................................................13625

11.1.3.1 Overview ............................................................................................................................13625


<details>

<summary>OCR (Page 34)</summary>


```text

10.15.3.3 PLL Clocking Policy 0.0... cece cece ceseeeeeeeeeeteneseaeaseneseseneneseseesaessensnesesseeseeeeseneeenenas 13575
10.15.3.4 QSPI Controller Configuration ..........ccccceeccccecseeceseeseseeseseeeeeeeseseeseseeseeecseeecseeeseeesseeeeseshaes 13575
10.15.3.5 PIO Data Transfer USING CPU... ceeccceeccseseseeseseeseseeseseeeeeeseseesesesseeecseeecseseeseeeeaaatean ghee 13576
10.15.3.6 DMA Datta Transfer ooo... eecececeeeeseceseseseseeceseseseseseeeeseseacaeaeseesesescecececeseatacacaeecegfesndocuseeteees 13576
10.15.3.7 Programming TriMMMe’ ........... ce cceccescescesececceececeececseeseesecsecsecsececeeeaeeaeeseesngbebagheseeeeeeeaees 13577
10.15.3.8 Auto-Drive Strength Calibration Sequence ...........cccccecccceessesesseeeeeseeeedgsecpicesseeeseeeeseeaes 13578
10.15.4 QSPI] REGISTErS 0... ees eeecsseeessseeesseesssnessseeesssneessnsessseeessnsessseeessnsessseeessneessseesanbad) ecessnesssneessseeeseeees 13578
10.16 Pulse Width Modulator (PWM) .u..c.cccscsssesscsssssessessessstssessesstssesssssnssesssalelbedGssssstestsstsenssessetsanssese 13596
10.16.1 OVELVICW....eeseecseesstesstessseestecsseeentecssesssessecsscesneesssessesstecsucesatessesseessecadl laeesMlcsseesatessessnteseesseenatesseessee 13596
10.16.1.1 PWM Diagram «0.0... cccceceseseseseseeeesesesesescececeseseacsescesescacaeapesDheadecececeeeseaeacaeaeeeeeeseaeaceeeeeaes 13596
10.16.1.2 USC CASS... eecececcceecseeecscesesesscseeseseescaecscecsceeseescsegilleqecseeseseesseecaeeesaeeesaeeaseeesaeeeseesases 13598
10.16.2 Programming GUICeliNeS ...... ee eceeseeseseecsesseeesseesedhaseelesseeseesseesstessesseeseesseesatesnessteeneeseeess 13598
10.16.3 PWM ReOGIStETS o...eeseesssessseesseesstecssecsetesseesseesatecssecsseesseess Meaesssessneesecsueesatesssessneeaecsuceeateaneesseesneeseeeen 13599
10.17 Fan TaChome ter on. seseecseesseesssecseecsstesseessteestecseeseessagi¥orsenglcssesseesueesseesaeesseesneeesmesseesenesneesseeanessnessneeanees 13600
10.17.1 OVELVICW.....esseeeseesstesstessseestecsseeeatecssessseesecsucesidange leesssecsucesatesnsesseesaecsuessneeaueesseesatessuessneeaecsueenatessnesaes 13600
10.17.2 Functional D@SCriPtion uu... ceccecseesessessssuy Magheccessessuesseesesseseuceseeseseucsueeaessussueeatesesseseateanseaseeeeeteeneees 13602
10.17.2.1 Fan Tachometer ClOCKS .0......:.ccscesesssueiecceseseseseseeceseseseseseneeseseseseeceeeseaeacaeaeeeeeeseaeeceeeeeaas 13602
10.17.3 Programming Guidelines... lic seeseecseessessneesseeestecseesseesecseesatessesseeseesueesatesneesseeeaecseeess 13606
10.17.3.1 Interrupt Handling... pi teeccececcecesceceseeccseeecsecsesecsesecseecsesecsesaesessesesseseeseeesseeesseeate 13607
10.17.4 Fan Tachometer ReGiSters .y..eecsessessesecsesseessseeseesasecsesseesseeseesntessessneeseeseeeatesneesseeaeeseeess 13607
11. Satety .occeececcsescsscccseessescseecsetessapipisssssesssccsnecsnessuesesseesseesuecsnsesnecesseesessucssuecsuecsueesnsesseeseeesueesueesneeseeeeseeesees 13612
11.1 FUNCtioNaAl Safety ......C vc eccseccssesssessseesseecssscssecsnecssesessecsssssessuessusesnessessaseesecsusesneessessueeeseesseesseeeseees 13612
11.1.1 Error REPOrting... 2c eesceessesstecsesssesssessseesseecssesseessessueesatecsessneeseesseesatessesaeeateesuceeatesneeseeeaecseeesn 13612
11.1.1.1 Error Reporting Architecture ...........ccecccccccsescsseceseeseseeseseeeeseeseseeseseeeseeeseeecseeseeeeseeeseeeate 13613
11.1.1.2 IP Error Reporting Mechanisms ............:cccccccsescssssesseseeeeseeeseescseeceseeecsecsesesseseeeeesseeeseeeatee 13615
11.1.1.3 Error FIOW ea... ccecececesesececeseseseseseseeseseseseaescssesescseneseacscaeaeaeseeseseacaceeeeeseaeacaeaeeceeeseaeaeeeeeeaas 13617
11.1.1.4 Error Handling .........ccceecccecsseseseescsceseseesesecsesccseeceseeseseceeseeceeeseseesesesaeeecaeecseeeeessseeeeseeates 13618
11.1.1.5 ErroOrOutput PIN... cee ceeceeeccenceseeseeseesceeeceececeeeeseesecsecsecececeesaeeaeeaeeaeeaesaeeeeseeseeeereeates 13618
11.1.1.6 Heartbeat Over SPI oo... eecesesesesseseseseseseeceseseseseseeeseseseseaeneseseseececeeeseaeacaeaeeeeseseaeeeeeeeeaes 13619
11.1.2 Functional Safety ISA .......cececcssesssesssssssescsssssessnecsueceseecsuscsseesuessuseeseessnsesneesessuceeseesseeeseeeseeesneees 13619
11.1.2.1 Overview
11.1.3 Hardware Safety Manager (HSM).
WAY3.1 Overview

```
</details>


<!-- Page 35 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

11.1.3.2 HSM Registers ..................................................................................................................13627

11.1.4 Safety Cluster Engine (SCE)...........................................................................................................13645

11.1.4.1 Overview ............................................................................................................................13645


<details>

<summary>OCR (Page 35)</summary>


```text

11.1.3.2 HSM ReGjSteP ..........ccccceccesceseeseeseeseeseeseescesececeececeesecsecsecseceeceececeecaesaesaeeseseeeeeseeseesereeaeas 13627
11.1.4 Safety Cluster Engine (SCE).......scsssscsssssesssssssssssssseseessnseseessnseseessneeseesesseseessnsesesennstsessentesessenetees 13645
11.1.4.1 OVEIVIOW 2... eeeeccecceseescesececeeseescscecseesecsecseeseesecsecsaceaecsesaesaecaecececeaceecaeeaeeaeeaeseeseeeegaadeaegfees 13645

```
</details>


<!-- Page 36 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27


<details>

<summary>OCR (Page 36)</summary>


```text

System-on-Chip
IVIDIA CONFIDENTIAL
IVIDIA Orin Series

```
</details>


<!-- Page 37 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Revision History

## 1. Revision History

Document ID: DP-10508-001

Version Date Description of Change

1.0 Nov 10, 2021 Initial release

1.1 Jan 31, 2023 See "About this Release" and "Change Log" for details about changes and updates.

1.2 Sep 29 , 2023 See "About this Release" and "Change Log" for details about changes and updates.

### 1.1 About this Release

1. Introduction

Getting Started About this Release

2. Memory Architecture and Memory Mapped I/O

Memory Subsystem (MSS) Address Map Address Space Translation (AST) Control Plane UPDATED General Purpose Direct Memory Access (DMA) Engines System Memory Management Unit (SMMU)

3. Boot and Power Management

Boot Process Power Management Controller (PMC) Boot and Power Management Processor (BPMP)

4. CPU Complex

5. GPU

6. Multimedia Complex

Host Controller


<details>

<summary>OCR (Page 37)</summary>


```text

Revision History
1. Revision History
Document ID: DP-10508-001
Version Date
1.0 Nov 10, 2021
1.1 Jan 31, 2023
1.2 Sep 29, 2023
1.1 About this Release
1. Introduction
* Getting Started
= About this Release
2. Memory Architecture and Memory Mapped I/O
= Memory Subsystem (MSS)
= Address Map
* Address Space Translation (AST)
= Control Plane UPDATED
Description of Change
Initial release
See "About this Release” and "Change Log" for details
about changes and updates.
See "About this.Release” and "Change Log" for details
about changes and updates.
* General Purpose Direct.Memory Access (DMA) Engines
= System Memory Management Unit (SMMU)
3. Boot and Power Management
= Boot Process
* Power Management Controller (PMC)
= Boot and. Power Management Processor (BPMP)
4. CPU Complex
5. GPU
6. Multimedia Complex
* Host Controller

```
</details>


<!-- Page 38 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

About this Release

MIPI Camera Serial Interface (CSI) UPDATED Video Input (VI) Real-Time Camera Engine (RCE) Display Control Engine (DCE) Image Signal Processor (ISP) Video Image Compositor (VIC) High Definition Audio (HDA) Display Controller Consumer Electronics Control (CEC) Audio Processing Engine (APE) UPDATED Always On Digital Microphone (AODMIC) Pixel Memory Formats

7. Computer Vision Acceleration

Deep Learning Accelerator (DLA) Programmable Computer-Vision Accelerator (PVA)

8. System Components

Always-On Cluster (AON) and SPE Clock and Reset Controller (CAR) Interrupt Controllers Timers Multi-Purpose I/O Pins and Pin Multiplexing (PinMux) UPDATED GPIO Controllers Activity Monitor (ACTMON) Hardware Synchronization Primitives (HSP) Thermal Sensor and Thermal Throttling Controller In-System Test Controller (IST) Design for Debugging (DFD) UPDATED System Registers Hardware Performance Monitor (HWPM)

9. I/O Controllers and Interfaces

High-Speed I/O Cluster USB Complex UPDATED Universal Flash Storage Complex (UFS) MIPI M-PHY PCI Express (PCIe) Controller UPDATED 1G Ethernet Controller (RGMII)


<details>

<summary>OCR (Page 38)</summary>


```text

About this Release
MIPI Camera Serial Interface (CSI) UPDATED
Video Input (VI)
Real-Time Camera Engine (RCE)
Display Control Engine (DCE)
Image Signal Processor (ISP)
Video Image Compositor (VIC)
High Definition Audio (HDA)
Display Controller
Consumer Electronics Control (CEC)
Audio Processing Engine (APE) UPDATED
Always On Digital Microphone (AODMIC)
Pixel Memory Formats
7. Computer Vision Acceleration
* Deep Learning Accelerator (DLA)
* Programmable Computer-Vision Accelerator (PVA)
8. System Components
Always-On Cluster (AON) and SPE
Clock and Reset Controller (CAR)
Interrupt Controllers
Timers
Multi-Purpose I/O Pins and Pin Multiplexing (PinMux) UPDATED
GPIO Controllers
Activity Monitor (ACTMON)
Hardware SynchronizatiomPrimitives (HSP)
Thermal Sensor and Thermal Throttling Controller
In-System Test Controller (IST)
Design for Debugging (DFD) UPDATED
System Registers
Hardware Performance Monitor (HWPM)
9. I/O Controllers and Interfaces
High-Speed I/O Cluster
USB Complex UPDATED
Universal Flash Storage Complex (UFS)
MIPI M-PHY
PCI Express (PCle) Controller UPDATED
1G Ethernet Controller (RGMI!I)

```
</details>


<!-- Page 39 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Change Log

MAC Security (MACsec) 10G Ethernet Controller (XFI) UPDATED Controller Area Network (CAN) SDMMC Controller UPDATED I2C Controller (I2C) Universal Asynchronous Receiver/Transmitter (UART) Server Based System Architecture (SBSA) UART Serial Peripheral Interface (SPI) Quad Serial Peripheral Interface (QSPI) Pulse Width Modulator (PWM) UPDATED Fan Tachometer

10. Functional Safety

Error Reporting Hardware Safety Manager (HSM) Functional Safety Island (FSI) Safety Cluster Engine (SCE)

### 1.2 Change Log

This change log identifies technical changes and/or significant modification to already released materials, it does not include editorial changes made for readability.

All Sections - Ongoing

Correcting KB notation where appropriate; updating to KiB. This follows the IEEE and NIST convention using an 'i' to indicate the binary convention, and its absence to indicate decimal: i.e., 1 KiB is 210 or 1,024 bytes, and 1 KB is 103 or 1,000 bytes.

##### 1.2.1 202309 29 (Version 1.2)

Memory Architecture and Memory Mapped I/O

Control Backbone (CBB) Error Monitor; Removed/updated error monitor and error notifier information throughout; other minor updates

Multimedia Complex

MIPI Camera Serial Interface (CSI); Changed VI 5.0 and ISP 5.0 both to 6.0 APE Registers; updates to the following register files:

Audio Crossbar (AXBAR) Registers


<details>

<summary>OCR (Page 39)</summary>


```text

Change Log
MAC Security (MACsec)
10G Ethernet Controller (XFIl) UPDATED
Controller Area Network (CAN)
SDMMC Controller UPDATED
12C Controller (l2C)
Universal Asynchronous Receiver/Transmitter (UART)
Server Based System Architecture (SBSA) UART
Serial Peripheral Interface (SPI)
Quad Serial Peripheral Interface (QSPI)
Pulse Width Modulator (PWM) UPDATED
Fan Tachometer
10. Functional Safety
* Error Reporting
* Hardware Safety Manager (HSM)
* Functional Safety Island (FSI)
* Safety Cluster Engine (SCE)
1.2 Change Log
This change log identifies technical changes’and/or significant modification to already released
materials, it does not include editorial changes made for readability.
All Sections - Ongoing
Correcting KB notation where appropriate; updating to KiB. This follows the IEEE and NIST
convention using an ‘i’ to indicate the binary convention, and its absence to indicate decimal: i.e., 1
KiB is 210 or 1,024 bytes, andM KB is 103 or 1,000 bytes.
1.2.1 20230929 (Version 1.2)
Memory Architecture and Memory Mapped I/O
* ControlBackbone (CBB) Error Monitor; Removed/updated error monitor and error notifier
information throughout; other minor updates
Multimedia’Complex
* MIPI Camera Serial Interface (CSI); Changed VI 5.0 and ISP 5.0 both to 6.0
» APE Registers; updates to the following register files:
° Audio Crossbar (AXBAR) Registers

```
</details>


<!-- Page 40 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Change Log

Digital Microphone Control (DMIC) Registers Audio De-Multiplexer (ADX) Control Registers Audio Miscellaneous (AMISC Control Registers Audio Generic Interrupt Control (AGIC) Registers

System Components

Multi-Purpose I/O Pins and Pin Multiplexing (PinMux) Registers

G3 PAD Control Registers; Updated note to use Block Name (PADCTL_A0) to find the Base Address of these registers in the System Address Map UFS PAD Control Registers; Updated note to use Block Name (PADCTL_A17) to find the Base Address of these registers in the System Address Map

Design for Debugging (DFD); Updates to FSI TSC section: added FSI_CSITE_TSINTP Render Configuration, Connectivity, Calculating Time-Interval Using Timestamps subsections

I/O Controllers and Interfaces

USB Complex; Changed PADCTRL_G2_CTL_ to PADCTRL_EDP_ PCIe Registers (PCIe Root Port); Updated PCIE_RP_APPL_DEBUG_0: added encoding definition to SMLH_LTSSM_STATE 10G Ethernet Controller (XFI)

10G Ethernet Registers; Added notes regarding base addresses and reset/prod hex value 10G Ethernet Controller Wrapper Registers; Added: PCS_WRAP_UPHY_HW_INIT_CONTROL_0_0; PCS_WRAP_UPHY_STATUS_0_0; PCS_WRAP_INTERRUPT_STATUS_0

SDMMC Controller; Removed Boot ROM support Pulse Width Modulator (PWM); PinMux naming changed to soc_gpio37 for PWM8 interface in Table 1.1


<details>

<summary>OCR (Page 40)</summary>


```text

Change Log
° Digital Microphone Control (DMIC) Registers
° Audio De-Multiplexer (ADX) Control Registers
° Audio Miscellaneous (AMISC Control Registers
° Audio Generic Interrupt Control (AGIC) Registers
System Components
* Multi-Purpose I/O Pins and Pin Multiplexing (PinMux) Registers
° G3 PAD Control Registers; Updated note to use Block Name (PADCTL_AO) to find the Base
Address of these registers in the System Address Map
° UFS PAD Control Registers; Updated note to use Block Name(RADCTL_A17) to find the
Base Address of these registers in the System Address Map
= Design for Debugging (DFD); Updates to FSI TSC section: added FSI_CSITE_TSINTP Render
Configuration, Connectivity, Calculating Time-Interval Using Timestamps subsections
1/O Controllers and Interfaces
USB Complex; Changed PADCTRL_G2_CTL_ to PADGFRL_EDP_
PCle Registers (PCle Root Port); Updated PCIE-RR_APPL_DEBUG_O: added encoding
definition to SMLH_LTSSM_STATE
10G Ethernet Controller (XFl)
° 10G Ethernet Registers; Added notes regarding base addresses and reset/prod hex value
° 10G Ethernet Controller Wrapper Registers; Added:
PCS_WRAP_UPHY_HW_INIT_CONTROL_O_O; PCS_WRAP_UPHY_STATUS_0_O;
PCS_WRAP_INTERRUPT_STATUS_0
SDMMC Controller; Removed Boot ROM support
Pulse Width Modulator (PWM);PinMux naming changed to soc_gpio37 for PWM8B interface
in Table 1.1

```
</details>


<!-- Page 41 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Getting Started

## 2. Getting Started

### 2.1 Overview

This Technical Reference Manual (TRM) describes how the NVIDIA ® Orin™ series system-on-chip (SoC) functions; and is a guide for writing, understanding, and modifying code that controls those functions. It contains functional descriptions of how the Orin hardware works, and also describes the registers and related programming interfaces.

Not all the units in Orin are described in detail here; as some, like the GPU, are only intended to be used with NVIDIA supplied drivers. This document is intended to provide deep technical detail where appropriate, users should first refer to the datasheets and other published information for an overview of Orin.

Refer to the datasheet for supported features and speeds. This document may describe hardware features and functionality not currently supported on specific Orin product SKUs, and may describe clock speeds or data rates that cannot be achieved on all SKUs. Refer to the appropriate Orin product data sheet as this is the primary authority for supported features, functionality, and operating speeds of a particular product SKU.

Refer to software documentation for supported features. This document may describe hardware features not supported by NVIDIA software. Description of a hardware capability in this document does not imply software support for that function. Refer to the appropriate BSP or software release notes for detailed information about currently supported software functionality.


<details>

<summary>OCR (Page 41)</summary>


```text

Getting Started
2. Getting Started
2.1 Overview
This Technical Reference Manual (TRM) describes how the NVIDIA® Orin™ series system-on-chip
(SoC) functions; and is a guide for writing, understanding, and modifying code that controls those
functions. It contains functional descriptions of how the Orin‘hardware works, and also describes
the registers and related programming interfaces.
Not all the units in Orin are described in detail here; as some, like the GPU, are only intended to be
used with NVIDIA supplied drivers. This document is intended to provide deep technical detail
where appropriate, users should first refer to the datasheets and other published information for
an overview of Orin.
Refer to the datasheet for supported f res and speeds. This document may describe
hardware features and functionality n rrently supported on specific Orin product SKUs,
and may describe clock speeds or data, ates that cannot be achieved on all SKUs. Refer to
the appropriate Orin product dat et as this is the primary authority for supported
features, functionality, and operating speeds of a particular product SKU.
Refer to software docurdiatin for supported features. This document may describe
hardware features not'su| orted by NVIDIA software. Description of a hardware capability
in this document does hot imply software support for that function. Refer to the
appropriate BSP ware release notes for detailed information about currently
supported softw. unctionality.

```
</details>


<!-- Page 42 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Getting Started

Figure 2.1 Orin Series SoC Block Diagram

##### 2.1.1 Reading Register Tables

Every register table has an address line followed by a table containing the bit descriptions for that register. The address line contains:

Offset: the address of the register within the specific module. Refer to the system memory map for the start address of the module; apply the offset at the top of the table to get the register address. Read/Write: the register access type. If a register table contains the R/W column, individual bits within the register will have different R/W properties. If there is no R/W column, all bits in that register have the same R/W property. Values are RO (read only), R/W (read/write), WO (write only, and RWC (read/write to clear). Parity Protection: per register parity diagnostic in hardware implemented by safety critical IPs. The parity diagnostic detects random faults in the register fields. ‘Y’ indicates that the field is continuously checked by the parity diagnostic of the register. Single bit flips in the register, if not intended, are reported as a fault. ‘N’ indicates that the field is not checked by the parity diagnostic of the register. If all fields of the register have Parity Protection column as 'N',  the register does not implement any hardware based parity diagnostic.


<details>

<summary>OCR (Page 42)</summary>


```text

Getting Started
Figure 2.1 Orin Series SoC Block Diagram
CPU Power Rail | Clock & Reset
Sensor Processing
[ [ ARM Cortex-A78AE CPU Complex | Timers MCU (RS)
i Mailboxes,
Semaphore.
a eashiscs3STEE MM ervey teenposeedta bee Config Reg,
CPU switch fabric (Coherent) Sys Config UART, I2C.
GPIO QSPI, SPI,
Fuses,
System Dab 9 ry Controller PWFM
SysRAM cache ee al
TZRAM
iRAM Boot, USB,
Power Management System Control Fabric UFS,
MCU (R5 SD/MMC
1 Gb Enet
ek Audig.Processor | { General
GPU Power Rail Safely Realtime | | Platform |] PCIE purpose
Lock-Step Dispiey, «| |) Seeaully (Audis 10} (__DMA
oS MCU (RS)| | Controller
Sotety
Velend Host: Commanchbuffer and Synchronization
Powart Rail
Video
Decode |] Encode
System MMU & Arbitration
Memory Controller
LPDDR
auge4 Aoweyy
2.1.1 Reading RegisterTables
Every register table has an address line followed by a table containing the bit descriptions for that
register. The address line contains:
* Offset: the address ofthe register within the specific module. Refer to the system memory
map for the startvaddress of the module; apply the offset at the top of the table to get the
register address.
Read/Write: the register access type. If a register table contains the R/W column, individual
bits withinthe register will have different R/W properties. If there is no R/W column, all bits in
that register have the same R/W property. Values are RO (read only), R/W (read/write), WO
(write onlysand RWC (read/write to clear).
Parity Protection: per register parity diagnostic in hardware implemented by safety critical
IPs. The parity diagnostic detects random faults in the register fields.
‘Y‘indicates that the field is continuously checked by the parity diagnostic of the register.
Single bit flips in the register, if not intended, are reported as a fault.
‘N’ indicates that the field is not checked by the parity diagnostic of the register.
If all fields of the register have Parity Protection column as 'N', the register does not
implement any hardware based parity diagnostic.

```
</details>


<!-- Page 43 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Getting Started

Reset: gives the power-on reset value in 32-bit binary. A value of x implies that the register bit has an undefined value at reset. A hexadecimal value is listed for convenience, where appropriate. Default: only displayed when the default setting is different from the Reset value.

Unspecified bits may not appear in tables (see example below). Unspecified bits should be written with their Reset values, while reads return an unknown value.


<details>

<summary>OCR (Page 43)</summary>


```text

Getting Started
* Reset: gives the power-on reset value in 32-bit binary. A value of x implies that the register
bit has an undefined value at reset. A hexadecimal value is listed for convenience,-where
appropriate.
* Default: only displayed when the default setting is different from the Reset value.
Unspecified bits may not appear in tables (see example below). Unspecified bits Should be written
with their Reset values, while reads return an unknown value.
Address within the module (Base address given in the Address Map chapter)
Offset: 0x0
ReadWrite: RW
Parity Protection: N
Register access type
Parity protection of the bits
32-bit power-on reset value in hex (binar¥)
Reset: 0x4050001f (0D0100,00xx,x101,0000,0xx0,0x00,0x01, 1111)
Bit
Reset
Ox0
Oxt
0x0
Description
PIO
Programmable 10
Program this bit to 1, after all the other bits in the. QSPf Command Register and QSP! Command Register 2 are
programmed to start the transfer. Hardware cleagé this bit automatically after the transfer is done. Clearing of this bit by
Software will stop the shifter and latch the-partfal Gata into the buffer (in Receive Mode).
M_S
0 = Reserved
1 = Master Mode (internal cide) (gétauit)
Mode:
The QSPI controller nged’be programmed according to the device It is communicating with, Only Master Mode 0 is
supported
0 = Mode 0 (for SOfegnd DDR)

```
</details>


<!-- Page 44 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Getting Started


<details>

<summary>OCR (Page 44)</summary>


```text

Unspecified bits
(31:30, 13:0 as in
this example)
are treated as “0”
in the hex and “x”
in the binary
representation of
the Reset value.
= STSC Bit Select, STSC[1+MBS] edge used as reference when not free running.
&& 0 Oxt FR:
Getting ode
Access type different among fields; VY
btieee od a separate R/W column in the table specifies the fields’ access types.
Read/Mrite: See table below. <5
Parity Protection: N
Reset: 0x00400005 (Obxx00,' ,0100,0000, 00xx,xxx0,0000,0101) Sy
Bit RW Reset Description
29:23 RO Oxo RX_FIFO_FULL_COUNT:
Indicates the number of slots in the receive FIFO i799 before the FIFO is empty.
This field is used by Software for debugging Sy,
22:16 RO 0x40 TX_FIFO_EMPTY_COUNT: Yy
Indicates the number of slots in the transrfiit KIFO remaining before the FIFO is full.
This field is used by Software for ¥
15 RW 0x0 RX_FIFO_FLUSH: N
‘Software writes a 1 to this bit the Rx FIFO. This bit reads as 1 when the flush
operation is in progress and 1S Ib O when it is finished.
0=NOP
1=FLUSH
14 RW 0x0 TX_FIFO_FLUSH: X
‘Software writes a is bit to flush the Tx FIFO. This bit reads as 1 when the flush
operation is in ‘and returns to 0 when it is finished.
0=NOP
Parity Protection different a1 fields;
Offset 0x2030 a separate Parity Protection column in the table specifies the fields’ parity protection.
Read/Write: See table below.
Parity Protection: See table below.
Bit RW __ Parity Protection 2 ESeer
1916 RW THOST_MLOCK_VM
72 RW Y x» THOST_MLOCK_CH
1 RO N & 0x0 THOST_MLOCK_TZLOCKED
0 RO n we 0x0 THOST_MLOCK_LOCKED
1 (ODXXXX,XXXX,XXXX, XXXX, XXXXXXXX,XXOO, XXX 1)
Description
Free Running , controls the microsecond counter TSC lock behavior
0 = the microsecond locks the usec reference pulse to a selected bit of STSC[4:1] using the adjust signal (recommended mode).
1 = Usec Counter counts on each edge of OSC in free running fashion (legacy mode).
gy NVIDIA CONFIDENTIAL

```
</details>


<!-- Page 45 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Getting Started

##### 2.1.2 Units

This TRM follows the IEEE and NIST conventions for multiplying prefixes.

Among other things, this convention uses an 'i' to indicate the binary convention, and its absence to indicate decimal. So, 1 KiB is 2 10 or 1,024 bytes, and 1 KB is 10 3 or 1,000 bytes. Similarly it uses:

Mi for 2 20 and M for 10 6

Gi for 2 30 and G for 10 9

Ti for 2 40 and T for 10 12

##### 2.1.3 Glossary

This glossary is intended to cover the acronyms used in this document; along with some others related to the Arm SoC world. Many other acronyms in this document are in broad engineering use and are not documented here.

Term Definition

32K or 32k 32,768 Hz oscillator clock. Any references to 32k, 32 kHz, 32 KHz, or 32K in the context of this clock should always be interpreted as referring to a frequency of 32,768 Hz.

444/422/420 Pixel storage formats. 444 refers to formats where there are equal amounts of information for all three elements, 422 and 420 refer to formats where the color difference information is stored at half-resolution in either one direction or both.

ADAS Advanced Driving Assistance System.

ADSP Audio DSP. Refers to the Cortex-A9 processor in the APE.

ADX Audio Demultiplexer. Part of the Audio Hub used to demultiplex multiple audio streams.

AMBA Advanced Microcontroller Bus Architecture. A set of standard buses defined by ARM.

AMX Audio Multiplexer. Part of the Audio Hub used to multiplex multiple audio streams together.

AO or AON Always-On power domain. This part of the chip is always powered on, even in the deepest sleep state, except complete processor shutdown. See also SPE.

AON I/O rails Inputs/Outputs in VDDIO_SYS, VDDIO_AO, and VDDIO_AO_HV serving the AON cluster logic

AONPG Always-On Non-Power Gated. Used to indicate when an AO partition has no power gating implemented.

AOPG Always-On Power Gated. Used to indicate whether an AO partition has power gating implemented.

AOPM Always-On Cluster Power Management Module. Power management module implements/manages the Cortex-R5 power state transitions. AOPM manages power state transitions for the SPE Cortex- R5 and its subsystem.

AOTAG Always-On Thermal Alarm Generator.


<details>

<summary>OCR (Page 45)</summary>


```text

Getting Started
2.1.2 Units
This TRM follows the IEEE and NIST conventions for multiplying prefixes.
Among other things, this convention uses an ‘i’ to indicate the binary convention) and its absence
to indicate decimal. So, 1 KiB is 210 or 1,024 bytes, and 1 KBis 103 or 1,000 bytes. Similarly it uses:
* Mi for 22° and M for 10°
* Gi for 23° and G for 109
* Ti for 24° and T for 1012
2.1.3 Glossary
This glossary is intended to cover the acronyms used in this;document; along with some others
related to the Arm SoC world. Many other acronyms in this.document are in broad engineering use
and are not documented here.
Term Definition
32K or 32k 32,768 Hz oscillator clock. Any references‘to 32k, 32 kHz, 32 KHz, or 32K in the context of this clock
should always be interpreted as referring to a frequency of 32,768 Hz.
444/422/420 Pixel storage formats. 444 refers.to.formats where there are equal amounts of information for all
three elements, 422 and 420 refer‘to formats where the color difference information is stored at
half-resolution in either one direction or both.
ADAS Advanced Driving Assistance System.
ADSP Audio DSP. Refers to the’Cortex-AQ processor in the APE.
ADX Audio Demultiplexer?Part of the Audio Hub used to demultiplex multiple audio streams.
AMBA Advanced Micfocontroller Bus Architecture. A set of standard buses defined by ARM.
AMX Audio Multiplexer. Part of the Audio Hub used to multiplex multiple audio streams together.
AO or AON Always-Qn_.power domain. This part of the chip is always powered on, even in the deepest sleep
state,.except complete processor shutdown. See also SPE.
AON 1/0 rails Inputs/Outputs in VDDIO_SYS, VDDIO_AO, and VDDIO_AO_HV serving the AON cluster logic
AONPG Always-On Non-Power Gated. Used to indicate when an AO partition has no power gating
implemented.
AOPG Always-On Power Gated. Used to indicate whether an AO partition has power gating implemented.
AOPM Always-On Cluster Power Management Module. Power management module implements/manages
the Cortex-R5 power state transitions. AOPM manages power state transitions for the SPE Cortex-
R5 and its subsystem.
AOTAG Always-On Thermal Alarm Generator.

```
</details>


<!-- Page 46 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Getting Started

Term Definition

AOVC Always-On Voltage Controller.

AP Applications Processor. Refers to the Orin device, means the same as SoC.

APB AMBA Peripheral Bus. Arm defined simple 32-bit single master bus for peripheral devices.

APE Audio Processing Engine.

Aperture A named region of address space.

APS Auxiliary processor subsystem. Refers to an implementation boundary that is shared across Cortex- R5 clusters on the chip.

ARM Arm is a company provides the CPU architectural specification for Orin. Arm is also Architecture Reference Manual, as in (the second Arm of) ARM ARM, which defines the CPU architecture.

AST Address Space Translator. A subunit associated with some of the embedded Arm cores that does address translation from local addresses to system addresses along with appending some AXI attributes.

AUTOSAR Automotive Open System Architecture (an OS used in automotives)

AXI AMBA Advanced eXtensible Interface. A more advanced bus than AHB defined as part of AMBA 3 by ARM.

AVIC Arm PL192 Vectored Interrupt Controller. Used as the Cortex-R5 interrupt controller for all the Cortex-R5 processors (SPE, SCE, and BPMP).

Bayer A type of image sampling pattern invented by Dr. Bryce E. Bayer of Eastman Kodak. The pattern consists of quads of pixels with two green samples, one red sample, and one blue sample.

BCT Boot Configuration Table. Stored on external boot device, contains config parameters for boot decisions.

BIT Boot Information Table. Maintained internally by Boot ROM in RAM for boot path/error tracking and logging.

BKV Best Known Value. Configurations determined by system characterization.

BOM Bottom of Memory. Refers to the lowest address in an address map.

BPMP Boot and Power Management Processor.

BPMP-FW BPMP Firmware. This refers to the power management firmware that would be executed on BPMP (post-boot). This is also stored in external boot media.

BR Boot ROM. Power-on start boot code. Stored/burnt in chip IROM, executes from BPMP.

Brick Input/output interface block with analog and other special functions.

CAR Clock and Reset module. Controls clocks and resets to the various parts of Orin.

CBB Control Backbone.

CCPLEX CPU complex (i.e., CPU subsystem).

CDE Color Decompression Engine.


<details>

<summary>OCR (Page 46)</summary>


```text

Term
AOVC
APB
APE
Aperture
APS
ARM
AST
AUTOSAR
AXl
AVIC
Bayer
BCT
BIT
BKV
BOM
BPMP
BPMP-FW
Brick
CAR
CBB
CCPLEX
CBE
Getting Started
Definition
Always-On Voltage Controller.
Applications Processor. Refers to the Orin device, means the same as SoC.
AMBA Peripheral Bus. Arm defined simple 32-bit single master bus for peripheral.devices.
Audio Processing Engine.
A named region of address space.
Auxiliary processor subsystem. Refers to an implementation boundary/that is shared across Cortex-
R5 clusters on the chip.
Arm is a company provides the CPU architectural specification for Orin.
Arm is also Architecture Reference Manual, as in (the second Arm of) ARM ARM, which defines the
CPU architecture.
Address Space Translator. A subunit associated with some/of the embedded Arm cores that does
address translation from local addresses to system addresses along with appending some AXI
attributes.
Automotive Open System Architecture
(an OS used in automotives)
AMBA Advanced extensible Interface. A moreyadvanced bus than AHB defined as part of AMBA 3 by
ARM.
Arm PL192 Vectored Interrupt Controller. Used as the Cortex-R5 interrupt controller for all the
Cortex-R5 processors (SPE, SCE, and.BPMP).
A type of image sampling pattern invented by Dr. Bryce E. Bayer of Eastman Kodak. The pattern
consists of quads of pixels with*two green samples, one red sample, and one blue sample.
Boot Configuration Table. Stored on external boot device, contains config parameters for boot
decisions.
Boot Information TableésMaintained internally by Boot ROM in RAM for boot path/error tracking and
logging.
Best Known Value»Configurations determined by system characterization.
Bottom of Memory. Refers to the lowest address in an address map.
Boot and Power Management Processor.
BPMP Firmware. This refers to the power management firmware that would be executed on BPMP.
(post-boot). This is also stored in external boot media.
Boot ROM. Power-on start boot code. Stored/burnt in chip IROM, executes from BPMP.
Input/output interface block with analog and other special functions.
Clock and Reset module. Controls clocks and resets to the various parts of Orin.
Control Backbone.
CPU complex (i.e., CPU subsystem).
Color Decompression Engine.

```
</details>


<!-- Page 47 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Getting Started

Term Definition

CEC Consumer Electronics Control. A part of the HDMI interface specification used for sending device control commands, often from a remote control.

CID Client ID.

CIL Control and Interface Logic.

Cold boot The SoC partition power transitions from OFF to ON with no previous state available. Software must construct all states from scratch. Boot ROM is executed. DRAM is brought on-line.

CoT Chain of trust. A security term used to denote any code that is trusted because it is loaded securely from the root of trust (Boot ROM).

CP Color Parser.

C-PHY A MIPI standard physical layer that can carry CSI data. Clocks are transmitted along with data; data lanes are three wires.

CPU CPU generally refers to the main CPUs unless specified otherwise.

CRC Cyclic Redundancy Check.

CSI MIPI Camera Serial Interface. A standard high-speed serial interface for connecting cameras to Orin.

CUDA Compute Unified Device Architecture.

CVC Central Voltage Controller.

CV Cluster Computer Vision Cluster. A partition in Orin that includes NVDLA, PVA, and CVNAS.

CVNAS Computer Vision NoC and SRAM.

CVNOC A subblock within CVNAS–the NoC portion of CVNAS.

CVSRAM A subblock within CVNAS–the memory storage portion of CVNAS.

CZ Controlled-output impedance MPIO pads.

DBC Dead Battery Charging.

DBP Dead Battery Provisions.

DBB Data Back-Bone.

DCLS Dual Core Lock Step, a technique used for functional safety where two processing cores receive the same inputs, and the outputs are compared to detect errors. Usually one of the cores is delayed with respect to the other.

DDA Digital Differential Analyzer. A technique commonly used in graphics for interpolation of variables over an interval between start and end point, and also applied to other problems.

DDIC Display Driver Integrated Circuit

Deep Sleep See SC7.

DFD Design for Debug

DFS Dynamic Frequency Scaling


<details>

<summary>OCR (Page 47)</summary>


```text

Term
CEC
cID
CIL
Cold boot
CoT
C-PHY
CPU
CRC
csl
CUDA
cvc
CV Cluster
CVNAS
CVNOC
CVSRAM
DBC
DBP
DBB
DCLS
DDA
DDIC
Deep Sleep
DFD.
DFS
Getting Started
Definition
Consumer Electronics Control. A part of the HDMI interface specification used for sending device
control commands, often from a remote control.
Client ID.
Control and Interface Logic.
The SoC partition power transitions from OFF to ON with no previous state available. Software must
construct all states from scratch. Boot ROM is executed. DRAM is broughton-line.
Chain of trust. A security term used to denote any code that is trusted/because it is loaded securely
from the root of trust (Boot ROM).
Color Parser.
A MIPI standard physical layer that can carry CSI data. Clocksjare transmitted along with data; data
lanes are three wires.
CPU generally refers to the main CPUs unless specified otherwise.
Cyclic Redundancy Check.
MIPI Camera Serial Interface. A standard high-speed serial interface for connecting cameras to Orin.
Compute Unified Device Architecture.
Central Voltage Controller.
Computer Vision Cluster. A partitioniA Orin that includes NVDLA, PVA, and CVNAS.
Computer Vision NoC and SRAM:
A subblock within CVNAS=the'NoC portion of CVNAS.
A subblock within CVNAS-the memory storage portion of CVNAS.
Controlled-output impedance MPIO pads.
Dead Battery Charging.
Dead BatteryProvisions.
Data Back-Bone.
Dual Core Lock Step, a technique used for functional safety where two processing cores receive the
same inputs, and the outputs are compared to detect errors. Usually one of the cores is delayed
withrespect to the other.
Digital Differential Analyzer. A technique commonly used in graphics for interpolation of variables
over an interval between start and end point, and also applied to other problems.
Display Driver Integrated Circuit
See SC7.
Design for Debug
Dynamic Frequency Scaling

```
</details>


<!-- Page 48 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Getting Started

Term Definition

DFT Design for Test

dGPU or DGPU Discrete GPU. Refers to an attached GPU that is external to the Orin SoC, as opposed to the internal GPU.

DLA Deep Learning Accelerator

DLS Delayed Lock-Step

DMIC Digital microphone interface. Supports direct attach of PDM microphones.

DPD Deep Power Down. A mode in which the pad can tolerate VDD_CORE being turned off.

D-PHY A MIPI standard physical layer that can carry CSI data. Clocks are transmitted separately from data; data lanes are two wires and clock lanes are two wires.

DRCM Debug Recovery Mode (also known as RCM-exit-to-JTAG).

DSI MIPI Display Serial Interface. A standard high-speed serial interface for connecting displays to Orin.

DVC Dynamic Voltage Controller block.

DVFS Dynamic Voltage and Frequency Scaling.

EAVB Ethernet Audio Video Bridging. Includes extension of the Ethernet standard supporting real-time streaming; more recently referred to as Time-Sensitive Networking.

EC Error Collator

ECC Error Correction Code.

eDP Embedded DisplayPort™.

EMC External Memory Controller. A block that interfaces with external DDR/LPDDR devices.

EOF End of Frame. Refers to the last non-cropped long packet in a frame, or to an ISP EOF packet.

EVP Exception Vector Pointer.

FA Failure Analysis.

FCM Full Custom Macro.

FE Frame End. Refers to the NVCSI short packet.

FIQ Fast Interrupt Request.

FMEA Failure Mode and Effects Analysis.

FMON Frequency Monitoring logic.

FS Frame Start. Refers to the NVCSI short packet.

FSI Functional Safety Island

FSM Finite State Machine. This is a hardware engineering phrase used to describe a hardware block that controls the operation of some logic function.


<details>

<summary>OCR (Page 48)</summary>


```text

dGPU or DGPU
DLA
DLS
DMIC
D-PHY
DRCM
DSI
DVC
DVFS
EAVB
ECC
eDP
EMC
EOF
EVP
FIQ
FMEA
FMON
FSI
FSM
Getting Started
Definition
Design for Test
Discrete GPU. Refers to an attached GPU that is external to the Orin SoC, as opposed-to the internal
GPU.
Deep Learning Accelerator
Delayed Lock-Step
Digital microphone interface. Supports direct attach of PDM microphones.
Deep Power Down. A mode in which the pad can tolerate VDD_CORE being turned off.
A MIPI standard physical layer that can carry CSI data. Clocks are transmitted separately from data;
data lanes are two wires and clock lanes are two wires.
Debug Recovery Mode (also known as RCM-exit-to-JTAG).
MIPI Display Serial Interface. A standard high-speed serial interface for connecting displays to Orin.
Dynamic Voltage Controller block.
Dynamic Voltage and Frequency Scaling.
Ethernet Audio Video Bridging. Includesextension of the Ethernet standard supporting real-time
streaming; more recently referred to as Time-Sensitive Networking.
Error Collator
Error Correction Code.
Embedded DisplayPort™.
External Memory ControllersA block that interfaces with external DDR/LPDDR devices.
End of Frame. Refers;to.the last non-cropped long packet in a frame, or to an ISP EOF packet.
Exception Vector Pointer.
Failure Analysis:
Full Custom. Macro.
Frame End. Refers to the NVCSI short packet.
East interrupt Request.
Failure Mode and Effects Analysis.
Frequency Monitoring logic.
Frame Start. Refers to the NVCSI short packet.
Functional Safety Island
Finite State Machine. This is a hardware engineering phrase used to describe a hardware block that
controls the operation of some logic function.

```
</details>


<!-- Page 49 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Getting Started

Term Definition

GIC Generic Interrupt Controller. Normally used to describe an Arm supplied interrupt controller used for a specific set of processors.

GPIO General Purpose Input/Output. An I/O signal uncommitted to a specific role and controlled by software.

GTE Generic Timestamping Engine

HDMI High-Definition Multimedia Interface. A digital connection carrying video and audio at high speed over a single connector.

HDR High Dynamic Range. Usually a reference to cameras or displays using a higher dynamic range for pixel values.

HSIO High-Speed I/O Interfaces. See the corresponding chapter of this TRM for more details.

HSM Hardware Safety Manager.

HV Hypervisor

HVC Hardware Vmin Control. The hardware initiated flow to enter/exit the Vmin state on VDD_CPU. Now referred to as CC3.

ICG Internal Clock Gate

iGPU or IGPU Internal GPU. Refers to the GPU within the Orin SoC.

IRAM Internal RAM used by the boot process until DRAM is configured; now deprecated, and replaced by TCMs and SysRAM.

IROM Internal chip ROM which contains the Boot ROM code and data.

IPI Inter-Processor Interrupt.

IPT Inverse Perspective Transform.

IRQ Interrupt Request.

ISP Image Signal Processor. A hardware engine that is part of the camera processing pipeline.

ISR Interrupt Service Routine

JTAG Joint Test Action Group Standard for Test Access Port and Boundary Scan Architecture. A serial bus used to external devices used for debug and testing.

KMD Kernel mode driver.

LDC Lens Distortion Correction

LIC "Legacy" interrupt controller, a central interrupt controller in Orin.

LP1 Low Power 1 state. Devices are power-gated, SoC clock domains are set to the minimum frequency (12 MHz and 38.4 MHz), the flow controller is configured to monitor "LP1 exit wake events," DRAM is put in self-refresh, and the VDD_CPU rail is powered off. Also known as the Suspend state.

LSIO Low-Speed I/O

LV Low-voltage MPIO pads.


<details>

<summary>OCR (Page 49)</summary>


```text

Term
GIC
GPIO
GTE
HDMI
HDR
HSIO
HSM
HVC
iGPU or IGPU
RAM
ROM
ISR
JTAG
KMD
LDC
LIC
LP1
LSIO.
Getting Started
Definition
Generic Interrupt Controller. Normally used to describe an Arm supplied interrupt controller used for
a specific set of processors.
General Purpose Input/Output. An I/O signal uncommitted to a specific role and-controlled by
software.
Generic Timestamping Engine
igh-Definition Multimedia Interface. A digital connection carrying video and audio at high speed
ver a single connector.
igh Dynamic Range. Usually a reference to cameras or displays Using a higher dynamic range for
ixel values.
nolea my
igh-Speed I/O Interfaces. See the corresponding chapter of this TRM for more details.
Hardware Safety Manager.
Hypervisor
Hardware Vmin Control. The hardware initiated flow to enter/exit the Vmin state on VDD_CPU. Now
referred to as CC3.
Internal Clock Gate
Internal GPU. Refers to the GPU within the Orin SoC.
Internal RAM used by the boot process until DRAM is configured; now deprecated, and replaced by
TCMs and SysRAM.
Internal chip ROM which contains ;the Boot ROM code and data.
Inter-Processor Interrupt.
Inverse Perspective Transform.
Interrupt Request.
Image Signal Processor. A hardware engine that is part of the camera processing pipeline.
Interrupt Service Routine
Joint Test Action Group Standard for Test Access Port and Boundary Scan Architecture. A serial bus
used to external devices used for debug and testing.
Kernelmode driver.
bens Distortion Correction
“Legacy” interrupt controller, a central interrupt controller in Orin.
Low Power 1 state. Devices are power-gated, SoC clock domains are set to the minimum frequency
(12 MHz and 38.4 MHz), the flow controller is configured to monitor "LP1 exit wake events," DRAM is
put in self-refresh, and the VDD_CPU rail is powered off. Also known as the Suspend state.
Low-Speed |/O
Low-voltage MPIO pads.

```
</details>


<!-- Page 50 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Getting Started

Term Definition

MB1 and MB2 Microboot stages 1 and 2, stored on external boot media. Refer to the Boot chapter for more details.

MC Memory Controller. Handles requests from internal clients and arbitrates among them to allocate memory bandwidth. Also referred to as MSS.

MCA Machine Check Architecture

MCCIF or MC- CIF

Memory Controller Client Interface. The standard interface block between the memory controller subsystem fabric and the client device. Note that some modules may have multiple client interfaces.

MDMM Multi-drop multi-merge.

MIPI The Mobile Industry Processor Interface. An industry alliance promoting a number of standard interfaces for mobile devices.

MMIO Memory-Mapped I/O (transactions).

MODS Modular Diagnostic Software. It is a powerful software program that allows users to test the NVIDIA hardware. MODS is used for three primary purposes–chip and board functional validation, chip and board failure analysis and debug, and architectural verification.

MPCORE Multiprocessor CPU core. A generic term for a CPU capable of operating as part of an SMP group.

M-PHY or MPHY MIPI M-PHY. An embedded-clock serial-interface technology with high bandwidth capabilities.

MPIO Multi-purpose Input/Output.

MSI Message Signaled Interrupt.

MSS Memory Subsystem. Refer to the corresponding chapter.

MTS An alternate name for the Carmel CPU Microcode generated by Dynamic Code Optimization.

NOC Network On Chip (referring to the backbone architecture of the SoC)

NVDEC NVIDIA Video Decoder engine.

NVENC NVIDIA Video Encoder engine.

NVJPG NVIDIA JPEG engine.

NVM Non-Volatile memory. Data retained even after power is turned off. All boot media have non-volatile memory storage.

OD Open Drain MPIO pads.

OGL Open Graphics Library (also known as OpenGL). An API supported on Orin and accelerated in hardware by dedicated 3D and 2D engines.

PA Physical Address.

Partition A physical sub-region of the Orin device. Power gating is usually applied at the partition level.

PCIe Peripheral Component Interconnect Express. A high-speed interface for connecting to external devices.

PG Power Gating; Power Gate-able


<details>

<summary>OCR (Page 50)</summary>


```text

Term
MB] and MB2
MCA
MCCIF or MC-
CIF
MDMM
MIPI
MMIO
MODS
MPCORE
M-PHY or MPHY
MPIO
MSI
MSS
MTS
NOC
NVDEC
NVENC
NVJPG
NVM
OGL
Partition
PCle
Getting Started
Definition
Microboot stages 1 and 2, stored on external boot media. Refer to the Boot chapter for.more
details.
Memory Controller. Handles requests from internal clients and arbitrates among.them to allocate
memory bandwidth. Also referred to as MSS.
Machine Check Architecture
Memory Controller Client Interface. The standard interface block between._the memory controller
subsystem fabric and the client device. Note that some modules may, have multiple client interfaces.
Multi-drop multi-merge.
The Mobile Industry Processor Interface. An industry alliance promoting a number of standard
interfaces for mobile devices.
Memory-Mapped |/O (transactions).
Modular Diagnostic Software. It is a powerful software,program that allows users to test the NVIDIA
hardware. MODS is used for three primary purposes-chip and board functional validation, chip and
board failure analysis and debug, and architectural Verification.
Multiprocessor CPU core. A generic term for a‘CPU capable of operating as part of an SMP group.
MIPI M-PHY. An embedded-clock serial-interface technology with high bandwidth capabilities.
Multi-purpose Input/Output.
Message Signaled Interrupt.
Memory Subsystem. Refer to the’corresponding chapter.
An alternate name for the Carmel CPU Microcode generated by Dynamic Code Optimization.
Network On Chip (referring’to the backbone architecture of the SoC)
Non-Volatile memory. Data retained even after power is turned off. All boot media have non-volatile
memory'storage.
Open Drain MPIO pads.
Qpen Graphics Library (also known as OpenGL). An API supported on Orin and accelerated in
hardware by dedicated 3D and 2D engines.
Physical Address.
A physical sub-region of the Orin device. Power gating is usually applied at the partition level.
Peripheral Component Interconnect Express. A high-speed interface for connecting to external
devices.
Power Gating; Power Gate-able

```
</details>


<!-- Page 51 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Getting Started

Term Definition

PMIC Power Management Integrated Control (synonymous with PMU).

PMC Power Management Controller. Controls the various power management features in the system.

PMIC Power management IC. Off-die module that controls various voltage regulators, provides the 32 kHz (32.768 kHz) clock source and provides the main system reset to the SoC.

POR Power On Reset.

PPC Pixels Per Clock.

PPI Private Peripheral Interrupt within an Arm processor core.

PWFM Pulse Width Frequency Modulation. Generates programmed pulse widths typically used to control backlight in display panels.

PVA Programmable Vision Accelerator. Custom computer vision DSP, Orin has two of them.

PVT Process, Voltage, and Temperature.

R5 Cortex-R5 is a mid-range ARMv7 CPU cluster used for multiple engines in the SoC.

RAZ Read As Zero.

RCE Real-time Camera-control Engine. See the corresponding chapter.

RCM Recovery Mode. Used for re-flashing the external boot device image.

RGB Name given to pixels with red, green, and blue color components. This is the pixel format typically found in most display technologies because each color component corresponds to the colors of the filters or phosphors used in the display device.

RISC Reduced Instruction Set Computer. The CPU architecture used by Arm CPUs.

RMMI Reference M-PHY Module Interface.

R/O Read only.

RTC Real Time Clock (as in VDD_RTC)

R/W Read write.

SATA Serial Advanced Technology Attachment (ATA).

SC7 Low power 0 state in which DRAM is put in self-refresh. The system state is saved in the PMC and in DRAM. VDD_CORE and VDD_CPU rails are powered off, and PMC is configured to monitor "LP0 wake events" that trigger LP0 exit. Also known as Deep-Sleep state.

SCE Safety Cluster Engine. See the corresponding chapter.

SCF System Coherency Fabric.

SCR Security Control Register.

SE Security Engine. Used for hardware acceleration of authentication and decryption steps.

SGI Software Generated Interrupt.


<details>

<summary>OCR (Page 51)</summary>


```text

Term
PMIC
PMC
PMIC
POR
PPC
PPI
PWFM
PVA
PVT
RAZ
RCE
RCM
RGB
RISC
RMMI
R/O
RTC
R/W
SATA
SC7
SCE
SCF
SCR
SGI
Getting Started
Definition
Power Management Integrated Control (synonymous with PMU).
Power Management Controller. Controls the various power management features‘in the system.
Power management IC. Off-die module that controls various voltage regulators»provides the 32 kHz
(32.768 kHz) clock source and provides the main system reset to the SoC.
Power On Reset.
Pixels Per Clock.
Private Peripheral Interrupt within an Arm processor core.
Pulse Width Frequency Modulation. Generates programmed pulse widths typically used to control
backlight in display panels.
Programmable Vision Accelerator. Custom computer vision, DSP, Orin has two of them.
Process, Voltage, and Temperature.
Cortex-R5 is a mid-range ARMv7 CPU cluster used for multiple engines in the SoC.
Read As Zero.
Real-time Camera-control Engine. See the corresponding chapter.
Recovery Mode. Used for re-flashing the external boot device image.
Name given to pixels with red, green;.and blue color components. This is the pixel format typically
found in most display technologi@s because each color component corresponds to the colors of the
filters or phosphors used in the display device.
Reduced Instruction Set Computer. The CPU architecture used by Arm CPUs.
Reference M-PHY Module‘Interface.
Read only.
Real Time Clock.(as in VDD_RTC)
Read write.
Serial Advanced Technology Attachment (ATA).
Low poWer O state in which DRAM is put in self-refresh. The system state is saved in the PMC and in
DRAM? VDD_CORE and VDD_CPU rails are powered off, and PMC is configured to monitor "LPO wake
events’ that trigger LPO exit. Also known as Deep-Sleep state.
Safety Cluster Engine. See the corresponding chapter.
System Coherency Fabric.
Security Control Register.
Security Engine. Used for hardware acceleration of authentication and decryption steps.
Software Generated Interrupt.

```
</details>


<!-- Page 52 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Getting Started

Term Definition

SDMMC SD and MMC Controller. An I/O controller supporting both the SD/SDIO interface standards and the eMMC standard.

SFIO Special Function Input/Output

SLCG Second Level Clock Gating. A hardware technique to reduce power.

SLINK Serial Link. A legacy and now obsolete name for the SPI controller.

SM Security Master

SMMU System Memory Management Unit. Block within the memory controller used to map from a virtual address space to physical addresses for device DMA.

SMP Symmetric Multi-Processing.

SNIC System Network InterConnect. Used to refer to the control fabric in SoC.

SoC System on a Chip. An integrated circuit containing a CPU, memory controller and the peripheral devices needed for a computing system.

SOF Start of Frame. Used to refer to the first non-cropped long packet in a frame, or to an ISP SOF packet.

SOR Serial Output Resource. SOR is GPU IP for driving HDMI/DP/LVDS. It converts the output of the display to a more modern high-speed serial protocol. DSI is not included since it's not GPU IP based.

S/PDIF Sony/Philips Digital Interconnect Format.

SPE Sensor Processing Engine. See the Always-On Cluster chapter.

SPI (a) Serial Peripheral Interface Bus. A synchronous serial data link, that operates in full-duplex mode.

(b) A Shared Peripheral Interrupt within an Arm core.

ST Standard MPIO pads.

Sub-aperture An aperture whose address space is a subset of another aperture and whose accessibility is also a subset of another aperture.

SysRAM Name for the shared on-chip memory.

TBSA Trusted Base System Architecture (an Arm specification).

TCM Tightly Coupled Memory. This refers to internal local RAM that is associated with some of the Arm CPU Cores. These are used as local, low-latency scratch pad memory.

Tegra The name formerly used to describe the NVIDIA family of SoCs, and now used only in certain applications. References to Tegra that still exist in this TRM, such as Tegra Host or Tegra pixel formats, may be considered to apply to all the NVIDIA family of SoCs, up to and including Orin.

THI Host Interface.

TNR Temporal Noise Reduction.

TOM Top of Memory. Refers to the highest address in an address map.

TOS Trusted OS.


<details>

<summary>OCR (Page 52)</summary>


```text

Term
SDMMC
SFIO
SLCG
SLINK
SMMU
SMP
SNIC
SoC
SOF
SOR
S/PDIF
SPE
SPI
Sub-aperture
SysRAM
TBSA
TCM
Tegra
THI
TNR
TOM
TOS
Getting Started
Definition
SD and MMC Controller. An I/O controller supporting both the SD/SDIO interface standards and the
eMMC standard.
Special Function Input/Output
Second Level Clock Gating. A hardware technique to reduce power.
Serial Link. A legacy and now obsolete name for the SPI controller.
Security Master
System Memory Management Unit. Block within the memory controller used to map from a virtual
address space to physical addresses for device DMA.
Symmetric Multi-Processing.
System Network InterConnect. Used to refer to the control fabric in SoC.
System ona Chip. An integrated circuit containing a CRU, memory controller and the peripheral
devices needed for a computing system.
Start of Frame. Used to refer to the first non-cropped long packet in a frame, or to an ISP SOF
packet.
Serial Output Resource. SOR is GPU IP for. driving HDMI/DP/LVDS. It converts the output of the
display to a more modern high-speed sérial)protocol. DSI is not included since it's not GPU IP based.
Sony/Philips Digital Interconnect Format.
Sensor Processing Engine. See the Always-On Cluster chapter.
(a) Serial Peripheral Interface Bus. A synchronous serial data link, that operates in full-duplex mode.
(b) A Shared Peripheral Interrupt within an Arm core.
Standard MPIO pads.
An aperture whose address space is a subset of another aperture and whose accessibility is also a
subset of another aperture.
Name for the shared on-chip memory.
Trusted/Base System Architecture (an Arm specification).
TightlyGoupled Memory. This refers to internal local RAM that is associated with some of the Arm
CPU.Cores. These are used as local, low-latency scratch pad memory.
The name formerly used to describe the NVIDIA family of SoCs, and now used only in certain
applications. References to Tegra that still exist in this TRM, such as Tegra Host or Tegra pixel
formats, may be considered to apply to all the NVIDIA family of SoCs, up to and including Orin.
Host Interface.
Temporal Noise Reduction.
Top of Memory. Refers to the highest address in an address map.
Trusted OS.

```
</details>


<!-- Page 53 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Getting Started

Term Definition

TS TimeStamp

TSC Timestamp System Counter.

TSEC Security co-processor. An embedded security processor used mainly to manage the HDCP encryption and keys on the HDMI link.

TSOSC Ring oscillator based thermal sensors.

TZ TrustZone ® is a secure operating environment of the Arm CPU architecture and the related secure parts of the SoC backbone and devices.

TZRAM TrustZone secured RAM on the SoC.

UFS Universal Flash Storage.

UFSHC UFS Host Controller.

Uncore The CPU related logic outside of the CPU processing core itself.

UniPro MIPI Unified Protocol, a link layer communication protocol.

U-PHY or UPHY Universal PHY, and NVIDIA reference to a multi-mode Serializer-Deserializer (SerDes) with analog pads for high-speed signaling to support various protocols.

VA Virtual address.

VDD_CORE SoC power rail.

VDD_CPU CPU power rail.

VDD_RTC Always-On power rail.

vGPIO Virtual General-Purpose Input/Output.

vGIC Virtualization capable Generic Interrupt Controller

VI Video Input. The acronym used to describe the Orin block used for camera and related pixel input functions.

VIC (a) Video Image Compositor. A SoC block that implements video post-processing functions needed by a video playback application to produce the final image for the player window.

(b) The Arm name for the PL192 Vectored Interrupt Controller; used alongside the Cortex-R5 cores. Also referred to here as AVIC to avoid a name-space conflict with the previous entry.

VM Virtual Machine

VPR Video Protect Region.

Warm boot Exit from SC7 state.

WDT Watchdog Timer. These timers can generate interrupts or resets to attempt to break the AP out of undesirable states.

WFE Wait For Event (an Arm instruction).

WFI Wait For Interrupt (an Arm instruction).


<details>

<summary>OCR (Page 53)</summary>


```text

Term
TSC
TSEC
TSOSC
TZRAM
UFS
UFSHC
Uncore
UniPro
U-PHY or UPHY
VDD_CORE
VDD_CPU
VDD_RTC
vGPIO
vGIC
VIC
VPR
Warm boot
WDT
WEE
WEI
Getting Started
Definition
TimeStamp
Timestamp System Counter.
Security co-processor. An embedded security processor used mainly to managethe HDCP
encryption and keys on the HDMI link.
Ring oscillator based thermal sensors.
TrustZone’ is a secure operating environment of the Arm CPU archit@cture and the related secure
parts of the SoC backbone and devices.
TrustZone secured RAM on the SoC.
Universal Flash Storage.
UFS Host Controller.
The CPU related logic outside of the CPU processing core itself.
MIPI Unified Protocol, a link layer communication,protocol.
Universal PHY, and NVIDIA reference to a multi=mode Serializer-Deserializer (SerDes) with analog
pads for high-speed signaling to support various protocols.
Virtual address.
SoC power rail.
CPU power rail.
Always-On power rail.
Virtual General-Purpose Input/Output.
Virtualization capable Generic Interrupt Controller
Video Input. The acronym used to describe the Orin block used for camera and related pixel input
functions.
(a) Video Image Compositor. A SoC block that implements video post-processing functions needed
by a video playback application to produce the final image for the player window.
(b) The Arm name for the PL192 Vectored Interrupt Controller; used alongside the Cortex-R5 cores.
Also referred to here as AVIC to avoid a name-space conflict with the previous entry.
Virtual Machine
Video Protect Region.
Exit from SC7 state.
Watchdog Timer. These timers can generate interrupts or resets to attempt to break the AP out of
undesirable states.
Wait For Event (an Arm instruction).
Wait For Interrupt (an Arm instruction).

```
</details>


<!-- Page 54 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Getting Started

Term Definition

WID Write ID (from the AXI specification).

W1C Write as 1 to Clear.

xHCI eXtensible Host Controller Interface for USB.

XIP eXecute In Place. Debug-only scheme where the primary IROM code is bypassed, and external code is fetched instead at reset, to test out Boot ROM code. This code is executed in-place from the external device, i.e., executed per instruction without fetching the entire code chunk.

YCbCr An alternative pixel representation that can take advantage of the properties of the human psycho- perceptual vision system and store the color difference information with lower spatial resolution. It consists of a luminance channel Y and two color difference signals Cb and Cr. See the definition of 444/422/420.

YUV See YCbCr. U and V are equivalent to Cb and Cr, respectively.

ZSL Zero Shutter Lag.


<details>

<summary>OCR (Page 54)</summary>


```text

Term
WID
WIC
xHCl
XIP
YCbCr
YUV
ZSL
Getting Started
Definition
Write ID (from the AXI specification).
Write as 1 to Clear.
eXtensible Host Controller Interface for USB.
eXecute In Place. Debug-only scheme where the primary IROM code is bypassed, and external code
is fetched instead at reset, to test out Boot ROM code. This code is executéd in-place from the
external device, i.e., executed per instruction without fetching the entire’code chunk.
An alternative pixel representation that can take advantage of thesproperties of the human psycho-
perceptual vision system and store the color difference information,with lower spatial resolution. It
consists of a luminance channel Y and two color difference signals\Cb and Cr. See the definition of
444/422/420.
See YCbCr. U and V are equivalent to Cb and Cr, respectively.
Zero Shutter Lag.

```
</details>


<!-- Page 55 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Architecture and Memory Mapped I/O

## 3. Memory Architecture and Memory Mapped I/O

### 3.1 Memory Subsystem (MSS)

##### 3.1.1 Overview

The Memory Subsystem (MSS) provides support for:

Access to LPDDR5 DRAM attached to the SoC Access to on-chip SysRAM A SyncPoint interface for inter-processor signaling Full-speed I/O coherence by routing requests through a scalable coherence fabric A comprehensive set of safety and security mechanisms.

Structurally, the MSS consists of six major components:

MSS Data Backbone - routes requests from clients to the MSS Hub and responses from MSS Hub to the clients. MSS Hub - receives and arbitrates among client requests, performs System Memory Management Unit (SMMU) translation, and sends requests to the Memory Controller Fabric (MCF). NVLink Hub - provides the connection to the iGPU. MCF - performs security checks, feeds I/O coherent requests to the Scalable Coherence Fabric (SCF), and directs requests to the multiple memory channels. Memory Controller (MC) Channels - contain the row sorter/arbiter and DRAM controllers. DRAM I/O - contains the channel-to-pad fabric, DRAM I/O pads, and PLLs.

3. 4.

5. 6.

The NVIDIA ® Orin™ MSS is designed to support LPDDR5 DRAM memory with up to a 256-bit bus width. It handles requests from a wide variety of clients, supporting their bandwidth, latency, quality-of-service needs, and special ordering requirements. MSS supports address translation for clients that use virtual addresses.


<details>

<summary>OCR (Page 55)</summary>


```text

Memory Architecture and Memory Mapped I/O
3. Memory Architecture and Memory Mapped
1/0
3.1 Memory Subsystem (MSS)
3.1.1 Overview
The Memory Subsystem (MSS) provides support for:
* Access to LPDDR5 DRAM attached to the SoG
= Access to on-chip SysRAM
* A SyncPoint interface for inter-processor signaling
* Full-speed I/O coherence by routing requests through a scalable coherence fabric
= Acomprehensive set of safety and security mechanisms.
Structurally, the MSS consists of six major components:
1. MSS Data Backbone - routes requests from clients to the MSS Hub and responses from MSS
Hub to the clients.
2. MSS Hub - receives and arbitrates among client requests, performs System Memory
Management Unit (SMMU)translation, and sends requests to the Memory Controller Fabric
(MCF).
3. NVLink Hub - providés the connection to the iGPU.
4. MCF - performs security checks, feeds I/O coherent requests to the Scalable Coherence
Fabric (SCF), and.directs requests to the multiple memory channels.
5. Memory Controller (MC) Channels - contain the row sorter/arbiter and DRAM controllers.
6. DRAM |/O.>contains the channel-to-pad fabric, DRAM I/O pads, and PLLs.
The NVIDIA“Orin™ MSS is designed to support LPDDR5 DRAM memory with up to a 256-bit bus
width. It handles requests from a wide variety of clients, supporting their bandwidth, latency,
quality-of+service needs, and special ordering requirements. MSS supports address translation for
clientsthat use virtual addresses.

```
</details>


<!-- Page 56 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

###### 3.1.1.1 Features

Key features include:

Up to 256-bit wide memory interface supporting LPDDR5 DRAM with sixteen x16 DRAM channels High-bandwidth interface to the integrated NVIDIA Ampere Architecture GPU (NVLink3 NCISOC interface) Full-speed I/O coherence with bypass for Isochronous (ISO) traffic Can be configured as 128-bit (east/west or south); or 256-bit (full configuration) 40 (39) bit virtual address Up to 128GB external DRAM On-chip static RAM, referred to as SysRAM (512 KiB) AON TZ-SRAM System Memory Management Unit (SMMU) for address translation based on the Arm SMMU-500 Independent SMMU for ISO clients Phase-aware DRAM timers Memory protection table for iGPU and NVLInk interfaces High-bandwidth PCIe ordered writes DRAM encryption DRAM ECC (stored in memory in-line with data) PCIe MSI support Functional Safety Island 42 generalized security carveouts

The block diagram in the Introduction chapter shows where the MSS fits in the overall SoC architecture.


<details>

<summary>OCR (Page 56)</summary>


```text

Memory Subsystem (MSS)
3.1.1.1 Features
Key features include:
Up to 256-bit wide memory interface supporting LPDDR5 DRAM with sixteen.x16 DRAM
channels
High-bandwidth interface to the integrated NVIDIA Ampere Architectur@GPU (NVLink3
NCISOC interface)
Full-speed I/O coherence with bypass for Isochronous (ISO) traffic
Can be configured as 128-bit (east/west or south); or 256-bit (full\configuration)
AO (39) bit virtual address
Up to 128GB external DRAM
On-chip static RAM, referred to as SysRAM (512 KiB)
AON TZ-SRAM
System Memory Management Unit (SMMU) for address translation based on the Arm
SMMU-500
Independent SMMU for ISO clients
Phase-aware DRAM timers
Memory protection table for iGPU and NVLInk interfaces
High-bandwidth PCle ordered writes
DRAM encryption
DRAM ECC (stored in memory in-lingé with data)
PCle MSI support
Functional Safety Island
A2 generalized security carveouts
The block diagram in the Introduction chapter shows where the MSS fits in the overall SoC
architecture.

```
</details>


<!-- Page 57 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

###### 3.1.1.2 Block Diagram

Figure 3.1 MSS Block Diagram


<details>

<summary>OCR (Page 57)</summary>


```text

Technical Reference Mi
.1.1.2 Block Diagram
Figure 3.1 MSS Block Diagram
Clie connections.
oss
¥SL
ata Backbone (D88)
1 auyBU3FeND
mace
aloo
McH
apaua|
McH
1c 4
Common] [(Ordered)
faean
Tawatunr
DRAMC
g PUUELD SSW
Tavatunr
jowsuwn
7 on
‘CPU Clusters,
ARM
cpu
“ARM
cpu
‘ARM
cPU
cluster] [cluster |clust
sats
ma28
war
tes
DRAMC
EMC Pad Macro
wreaiene
weveonrmmn
aiocetaces 3206
sciokexcentasnotes
DRAM
EMC Pad Macro
| Page 57

```
</details>


<!-- Page 58 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

###### 3.1.1.3 Speeds and Feeds

There are complex bandwidth requirements with requests from:

SoC clients iGPU

and memory destinations:

DRAM SCF Cache SysRAM AON TZ-SRAM

Local DRAM bandwidth (up to 256 bits of LPDDR5 @ 6.4Gbps) gives a peak DRAM bandwidth of up to 205 GB/sec. The SCF cache has additional bandwidth that can be used by GPU when SCF allocation is enabled. The main datapaths through MCF and SCF support up to 8*32B*scfclk = 273 GB/sec in both read and write directions.

##### 3.1.2 Functional Description

###### 3.1.2.1 MSS Data Backbone

Clients connect using an AMBA AXI bus Socket interface to an AXI Client Interface (AXICIF) in the client partition. One or more AXICIFs connect to a Partition Client (PC) Interface, which connects the clients to a Tier Snap Arbiter (TSA) network, which provides a shared wiring path to the client hubs. Clients may directly connect to a client hub as well.

The Data Backbone supports requests from 32B to 256B in size.

###### 3.1.2.2 Client Hubs

There are eight client hub instances:

Four unordered hubs (Hub0/Hub1 and Hub2/Hub3) that get transactions from clients that require no request ordering. One ordered hub (Hub4) that gets transactions from clients that require WAW request ordering. Three Qual Engine (see Memory Qualification Engine below) hubs (Hub5-7) with a single Qual Engine as client and no TBUs, which allow the Qual Engines in aggregate, to saturate DRAM.


<details>

<summary>OCR (Page 58)</summary>


```text

Memory Subsystem (MSS)
3.1.1.3 Speeds and Feeds
There are complex bandwidth requirements with requests from:
* SoC clients
* iGPU
and memory destinations:
= DRAM
= SCF Cache
= SysRAM
= AON TZ-SRAM
Local DRAM bandwidth (up to 256 bits of LPDDR5 @ 6.4Gbps) gives a peak DRAM bandwidth of up
to 205 GB/sec. The SCF cache has additional bandwidth that-can be used by GPU when SCF
allocation is enabled. The main datapaths through MCF and.SCF support up to 8*32B*scfclk = 273
GB/sec in both read and write directions.
3.1.2 Functional Description
3.1.2.1 MSS Data Backbone
Clients connect using an AMBA AXI bus‘Sacket interface to an AXI Client Interface (AXICIF) in the
client partition. One or more AXICIFs connect to a Partition Client (PC) Interface, which connects
the clients to a Tier Snap Arbiter (TSA))network, which provides a shared wiring path to the client
hubs. Clients may directly connect.tora client hub as well.
The Data Backbone supports requests from 32B to 256B in size.
3.1.2.2 Client Hubs
There are eight client-hub instances:
1. Four unordéréd hubs (HubO/Hub1 and Hub2/Hub3) that get transactions from clients that
require no request ordering.
2. One ordered hub (Hub4) that gets transactions from clients that require WAW request
ordering.
3. Three-Qual Engine (see Memory Qualification Engine below) hubs (Hub5-7) with a
single Qual Engine as client and no TBUs, which allow the Qual Engines in aggregate, to
saturate DRAM.

```
</details>


<!-- Page 59 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

Figure 3.2 Client Hub Block Diagram

Unordered requests arriving on the TSA chain are connected to either the Hub0/1 pair or the Hub2/3 pair. They are steered to the even or odd hub in the pair using an address-hash- based steering function. The nominal interleave between hubs is 1 KiB. Ordered requests are steered to Hub4 (to the ordered hub).

The figure below shows the overall hub topology


<details>

<summary>OCR (Page 59)</summary>


```text

Figure 3.2 Client Hub Block Diagram
kot dee
Unordered requests arriving on the Tacha
pair or the Hub2/3 pair. They are stee
based steering function. The nominalst
steered to Hub4 (to the ordered h
The figure below shows the ov hub topology
Technical Reference Mai
Memory Subsystem (MS:
are connected to either the HubO/1
the even or odd hub in the pair using an address-hash-
erleave between hubs is 1 KiB. Ordered requests are

```
</details>


<!-- Page 60 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

Figure 3.3 MSS Hub Topology

Each client hub contains the following significant modules:

PCFIFO interlock for each client interface Bandwidth throttle DDA Mem Qual engine TBUs with wrapper logic (for SMMU translation–not present in the Qual Engine hubs) Hierarchical ring arbiter Hub throttling logic

3.1.2.2.1 PCFIFO Interlock

The PCFIFO interlock associated with each client interface provides ordering for low bandwidth ordered clients. When the interlock for a client is enabled, the interlock logic stores the upper address bits down to the channel interleave (which is either 512B or 1KB) and other attributes such as StreamID. When a new client request strides outside a 512B or 1KB (configurable) region or has differences in another tracked attribute the new request is stalled until all outstanding write requests have completed. Since the memory system provides ordering for requests from a client to a 512B or 1KB region, this ensures the clients’ writes are committed in order. For more details and caveats see the section on Transaction Ordering below.

3.1.2.2.2 Bandwidth Throttle DDA

Each client interface is equipped with a DDA that can cap the bandwidth requested by a client. This may be used to prevent certain oversubscription problems.


<details>

<summary>OCR (Page 60)</summary>


```text

Memory Subsystem (MSS)
Figure 3.3 MSS Hub Topology
Each client hub contains the following significant modules:
= PCFIFO interlock for each client interface
Bandwidth throttle DDA
Mem Qual engine
TBUs with wrapper logic (for SMMU translation-not present in the Qual Engine hubs)
Hierarchical ring arbiter
Hub throttling logic
3.1.2.2.1 PCFIFO Interlock
The PCFIFO interlock associated'with each client interface provides ordering for low bandwidth
ordered clients. When the interlock for a client is enabled, the interlock logic stores the upper
address bits down to the channel interleave (which is either 512B or 1KB) and other attributes such
as StreamlD. When a newselient request strides outside a 512B or 1KB (configurable) region or has
differences in another tracked attribute the new request is stalled until all outstanding write
requests have completed: Since the memory system provides ordering for requests from a client to
a512B or 1KB regionythis ensures the clients’ writes are committed in order. For more details and
caveats see the section on Transaction Ordering below.
3.1.2.2.2 Bandwidth Throttle DDA
Each client‘interface is equipped with a DDA that can cap the bandwidth requested by a client. This
may be.used to prevent certain oversubscription problems.

```
</details>


<!-- Page 61 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

3.1.2.2.3 Memory Qualification Engine

The Memory Qualification Engine (Qual Engine, MemQual or MIU) is a distributed synthetic load generator. It supports full DRAM bandwidth (256B per dbbclk) for either reads or writes. Its main purposes are to:

Provide a unit that can generate memory qualification request streams at full bandwidth that is easy to set up and use Debug memory stability issues Initialize ECC regions Perform silicon measurement and memory performance testing Validate SysRAM performance Safety testing (only performed by MIUs with an SMMU)

2. 3. 4. 5. 6.

The Qual Engine contains pattern generators for addresses, data, byte enables; and configuration registers to specify stride, accesses per activate, request rate, read-write burst length, etc. It integrity-checks returning read data and reports when errors are detected. It has an address-as- data mode, which can be used for address aliasing checks.

The Qual Engine has eight interfaces, each providing:

Read interface (one read per dbbclk) Write data interface (32B per dbbclk) Read response interface (64B per dbbclk) Write ack response interface (one write ack per dbbclk)

The request interfaces connect to Ring 2 of each of the eight client hubs. Three of the hubs have Qual Engine as their only client. Qual Engines on these hubs have no access to SMMU translation. Each response interface connects to one response chain.

3.1.2.2.4 TBUs with Wrapper Logic

Translation Buffer Units (TBUs) are the Translation Lookaside Buffers of the Arm SMMU-500 (described below). They cache full translations and perform virtual to physical translation on incoming requests. Wrapper logic converts MSS control flags into ACE-Lite controls supported by Arm and implements overrides for many parameters. A bypass path around the TBUs is provided for clients that use physical addressing.

Multiple TBU instances are used in each MCHub to support the necessary bandwidth. The non- ordered hubs have four non-ISO TBUs and some have two ISO TBUs. Requests from a given client are distributed over the appropriate set of TBUs using an address-hash-based steering function. The ordered hub has four TBUs of smaller size.

Translation requests that miss at a TBU are sent to its attached TCU in the common hub. TLB invalidations are forwarded to the TBUs from the TCUs.


<details>

<summary>OCR (Page 61)</summary>


```text

Memory Subsystem (MSS)
3.1.2.2.3 Memory Qualification Engine
The Memory Qualification Engine (Qual Engine, MemQual or MIU) is a distributed synthetic load
generator. It supports full DRAM bandwidth (256B per dbbclk) for either reads or writes. Its main
purposes are to:
1. Provide a unit that can generate memory qualification request streams,at full bandwidth that
is easy to set up and use
. Debug memory stability issues
. Initialize ECC regions
. Perform silicon measurement and memory performance testing
. Validate SysRAM performance
. Safety testing (only performed by MIUs with an SMMU)
ow KR WY
The Qual Engine contains pattern generators for addresses, data, byte enables; and configuration
registers to specify stride, accesses per activate, requestrate, read-write burst length, etc. It
integrity-checks returning read data and reports when €rrors are detected. It has an address-as-
data mode, which can be used for address aliasing checks.
The Qual Engine has eight interfaces, each providing:
* Read interface (one read per dbbclk)
* Write data interface (32B per dbbclk)
= Read response interface (64B per dbbcik)
* Write ack response interface (one write ack per dbbclk)
The request interfaces connect to Ringye of each of the eight client hubs. Three of the hubs have
Qual Engine as their only client. Qual.Engines on these hubs have no access to SMMU
translation. Each response interface connects to one response chain.
3.1.2.2.4 TBUs with Wrapper Logic
Translation Buffer Units (JBUs) are the Translation Lookaside Buffers of the Arm SMMU-500
(described below). They cache full translations and perform virtual to physical translation on
incoming requestssWrapper logic converts MSS control flags into ACE-Lite controls supported by
Arm and implements overrides for many parameters. A bypass path around the TBUs is provided
for clients that ‘use physical addressing.
Multiple TBUsinstances are used in each MCHub to support the necessary bandwidth. The non-
ordered hubs have four non-ISO TBUs and some have two ISO TBUs. Requests from a given client
are distributed over the appropriate set of TBUs using an address-hash-based steering function.
The ordered hub has four TBUs of smaller size.
Translation requests that miss at a TBU are sent to its attached TCU in the common hub. TLB
invalidations are forwarded to the TBUs from the TCUs.

```
</details>


<!-- Page 62 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

3.1.2.2.5 Hierarchical Ring Arbiter

In each client hub, arbitration of requests is done in several “rings.” The outermost ring (Ring 2) arbitrates between NISO and Soft ISO traffic/clients. Ring 1 arbitrates between ISO and real-time clients (together with the Ring 2 output). The Ring 1 output is sent to the TBUs. SMMU outputs (including the bypass path) are arbitrated in Ring 0.5. Outputs of the Ring 0.5 are sent to MCF.

Ring 2 and Ring 1 are priority tier snap arbiters that provide bandwidth-guarantees using a Digital Differential Analyzer (DDA) mechanism. They also support dynamic masking of arbiter inputs based on the number of outstanding transactions below.

3.1.2.2.6 Hub Throttling Logic

To prevent hubs from issuing requests that exceed response bandwidth, each client hub has a configurable DDA at its output that can throttle the bandwidth of read requests.

3.1.2.2.7 Common Hub

The Common Hub contains hub logic for which there is only one copy. It contains the following major blocks:

1. 2.

TCUs and NVCaches ECC Scrubber

In addition, it contains common logic, including the timestamp counter, used to generate deadlines for client requests, and the aggregator for SMMU/hub interrupts.

3.1.2.2.8 TCU

Each TCU is backed by an instance of NVCache (or NV$), whose purpose is to reduce page-walking traffic to DRAM. A TCU contains:

MacroTLB - which is a large backup TLB that backs up the smaller TLBs in the TBU units. The MacroTLB is configured to the maximum possible size (4096 entries, each storing one PTE). Page Table Walk Cache - which caches partial table walks. Page Walk logic - which walks the stage 1- and stage 2-page table structures as needed.

Each TCU has input buffering to absorb the maximum of 16 requests outstanding from each TBU connected, stores them internally, and then does the required walks for the requests after arbitration. Each TCU can have up to 32 requests outstanding to NV$/DRAM. The peak rate for TCU hits is one per four clocks and the peak rate for TCU misses is one per five clocks (assuming a simple last-level PTE miss--if complex page walks are required, the rate can be much lower).


<details>

<summary>OCR (Page 62)</summary>


```text

Memory Subsystem (MSS)
3.1.2.2.5 Hierarchical Ring Arbiter
In each client hub, arbitration of requests is done in several “rings.” The outermost ring.(Ring 2)
arbitrates between NISO and Soft ISO traffic/clients. Ring 1 arbitrates between ISO and real-time
clients (together with the Ring 2 output). The Ring 1 output is sent to the TBUs, SMMU outputs
(including the bypass path) are arbitrated in Ring 0.5. Outputs of the Ring 0.5 are. sent to MCF.
Ring 2 and Ring 1 are priority tier snap arbiters that provide bandwidth-guarantees using a Digital
Differential Analyzer (DDA) mechanism. They also support dynamic maskingyof arbiter inputs based
on the number of outstanding transactions below.
3.1.2.2.6 Hub Throttling Logic
To prevent hubs from issuing requests that exceed response bandwidth, each client hub has a
configurable DDA at its output that can throttle the bandwidth-of read requests.
3.1.2.2.7 Common Hub
The Common Hub contains hub logic for which thefe‘is only one copy. It contains the following
major blocks:
1. TCUs and NVCaches
2. ECC Scrubber
In addition, it contains common logic, including the timestamp counter, used to generate deadlines
for client requests, and the aggregator for SMMU/hub interrupts.
3.1.2.2.8 TCU
Each TCU is backed by an instance of NVCache (or NV$), whose purpose is to reduce page-walking
traffic to DRAM. A TCU contains:
* MacroTLB - which-is.a)large backup TLB that backs up the smaller TLBs in the TBU units. The
MacroTLB is configured to the maximum possible size (4096 entries, each storing one PTE).
* Page Table Walk’Cache - which caches partial table walks.
* Page Walk logic - which walks the stage 1- and stage 2-page table structures as needed.
Each TCU has.input buffering to absorb the maximum of 16 requests outstanding from each
TBU connected, stores them internally, and then does the required walks for the requests after
arbitrationjEach TCU can have up to 32 requests outstanding to NV$/DRAM. The peak rate for TCU
hits is one.per four clocks and the peak rate for TCU misses is one per five clocks (assuming a
simplevast-level PTE miss--if complex page walks are required, the rate can be much lower).

```
</details>


<!-- Page 63 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

3.1.2.2.9 NVCache

NVCache (or NV$) is an auxiliary cache that stores arrays of PTEs or PDEs that are fetched to satisfy TCU miss requests. NV$ lines are 64B, which store eight PTEs or PDEs and provides a form of prefetch, unlike TBU and TCU, which cache and request individual PTEs. NV$ is an out of order cache; it can return hits immediately while prior misses are still outstanding. Misses to DRAM are returned in order to TCU.

3.1.2.2.10 ECC Scrubber

ECC protection requires a way of fixing single-bit errors that can accumulate over time before any of them become unrecoverable multi-bit errors. Errors can occur in any portion of memory, which might otherwise be subject to security restrictions. There is a hardware-scrubber unit to meet these needs.

Under software control, the scrubber inserts a write request with byte enables off to a designated address into the pipe. RMW logic in the Memory Controller Channel does a read, which corrects the data, followed by a write of the corrected data plus newly computed ECC bits. Scrubber requests use the direct path to the channels, and not the IO-coherent path through SCF.

###### 3.1.2.3 Arm SMMU-500

The SoC uses Arm SMMU-500 IP blocks (TBU and TCU) encapsulated in NVIDIA-designed wrappers. Refer to the System Memory Management Unit chapter of this document for more details.

Five Translation Cache Units (TCUs) are located in the Common Hub. They handle translation requests input from the Translation Buffer Units (TBUs) in the client hubs (the Qual Engine hubs do not support SMMU translation). To improve performance, an additional NVIDIA-designed NVCache (NV$), associated with each TCU, caches the eight PTEs (64B) returned from memory each time a TCU miss goes out to memory.

Two TCUs, with associated TBUs and NVCaches, form a logical SMMU, serving non-ISO clients on each of the two unordered hub pairs. A dedicated fifth TCU, with associated TBUs and NVCache, serves ISO clients. It is anticipated that both non-ISO TCUs serving a single hub pair have the context registers programmed identically, but TCUs on different hub pairs and the ISO TCU could support disjoint contexts.

Invalidations of TLB and cache entries at TCU, TBU, and NVCache are performed by software using register writes to the respective TCU(s). TCUs in turn send invalidation messages to their attached TBUs and they also send bulk invalidation requests to their respective NVCaches (the entire NV$ is invalidated at any TCU invalidation).

Invalidations for non-ISO contexts must only be sent to the non-ISO TCUs. This is to prevent non- ISO invalidations from affecting ISO performance. Hardware DVM-based invalidations are not supported to the SMMU, although DVM is used for inter-CPU-cluster page-table invalidations.


<details>

<summary>OCR (Page 63)</summary>


```text

Memory Subsystem (MSS)
3.1.2.2.9 NVCache
NVCache (or NV$) is an auxiliary cache that stores arrays of PTEs or PDEs that are fetched to
satisfy TCU miss requests. NV$ lines are 64B, which store eight PTEs or PDEs and provides a form
of prefetch, unlike TBU and TCU, which cache and request individual PTEs. NV$ isan out of order
cache; it can return hits immediately while prior misses are still outstanding. Misses to DRAM are
returned in order to TCU.
3.1.2.2.10 ECC Scrubber
ECC protection requires a way of fixing single-bit errors that can accumulate over time before any
of them become unrecoverable multi-bit errors. Errors can occur_in any portion of memory, which
might otherwise be subject to security restrictions. There is a hardware-scrubber unit to meet
these needs.
Under software control, the scrubber inserts a write request with byte enables off to a designated
address into the pipe. RMW logic in the Memory Controller-Channel does a read, which corrects the
data, followed by a write of the corrected data plus newlycomputed ECC bits. Scrubber requests
use the direct path to the channels, and not the |O-coherent path through SCF.
3.1.2.3. Arm SMMU-500
The SoC uses Arm SMMU-500 IP blocks (TBU.and TCU) encapsulated in NVIDIA-designed wrappers.
Refer to the System Memory Management-Unit chapter of this document for more details.
Five Translation Cache Units (TCUs) aretocated in the Common Hub. They handle translation
requests input from the Translation. Buffer Units (TBUs) in the client hubs (the Qual Engine hubs do
not support SMMU translation). Toimprove performance, an additional NVIDIA-designed NVCache
(NV$), associated with each TCU¥eaches the eight PTEs (64B) returned from memory each time a
TCU miss goes out to memory:
Two TCUs, with associated TBUs and NVCaches, form a logical SMMU, serving non-ISO clients on
each of the two unordered hub pairs. A dedicated fifth TCU, with associated TBUs and NVCache,
serves ISO clients. Itts.anticipated that both non-ISO TCUs serving a single hub pair have the
context registers programmed identically, but TCUs on different hub pairs and the ISO TCU could
support disjoint.contexts.
Invalidations of TLB and cache entries at TCU, TBU, and NVCache are performed by software using
register writes to the respective TCU(s). TCUs in turn send invalidation messages to their attached
TBUs and they also send bulk invalidation requests to their respective NVCaches (the entire NV$ is
invalidated at any TCU invalidation).
Invalidations for non-ISO contexts must only be sent to the non-ISO TCUs. This is to prevent non-
ISQvinvalidations from affecting ISO performance. Hardware DVM-based invalidations are not
supported to the SMMU, although DVM is used for inter-CPU-cluster page-table invalidations.

```
</details>


<!-- Page 64 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

The TCU configuration is 128 contexts for all TCUs (NISO and ISO). This is the largest SMMU-500 configuration supported. Each of the two pairs of NISO TCUs can be independently programmed.

Note that NISO TCUs 0 and 1 must be programmed identically and NISO TCUs 2 and 3 must be programmed identically. NISO TCUs 0, 1 may be programmed differently from NISO TCUs 2, 3, as long as each pair of TCUs serves a disjoint set of clients.

###### 3.1.2.4 NVLink Hub (Connection to the iGPU)

The Ampere iGPU connects to the memory subsystem using eight NCISOC ports. NCISOC is the on-chip version of the NVLink protocol used to connect GPUs. Each link provides approximately 35 GB/s of raw bandwidth in each direction and approximately 25 GB/sec achievable bandwidth in each direction. GPU requests may be IO coherent. Requests can be 32B, 64B, 96B, 128B, or 256B. If 256B, there can be no byte enables.

Each NCISOC port connects to the memory subsystem through one of eight NVLink Hubs. NVLink Hub contains logic to do the following:

Convert from NCISOC protocol to the ACE-Lite format used within the memory subsystem. Provide response buffering for GPU responses. Implement barriers to allow hazard-free updates of the protection table.

3.1.2.4.1 Read-Modify-Write (RMW) Transactions

NCISOC supports a RMW command that may be used to implement coherent platform atomics. The read transaction is initiated by the GPU and is conveyed on the NCISOC request interface (REQ virtual channel, RMW command). The response goes back to the imitating unit (GPU L2), which performs the operation, then issues a TRANS_DONE command that conveys the write data to memory. SCF implements the RMW protocol, which requires locking a cache line until TRANS_DONE is received.

###### 3.1.2.5 MSS Clients

The following clients have memory interface(s) in the SoC and connect to the HUBs (excludes dGPU/iGPU/QualEngine).

AON-DMA AON-R5 APE-DSP APE-DMA AXIAP (DFD) AZA-HDA BPMP-DMA


<details>

<summary>OCR (Page 64)</summary>


```text

Memory Subsystem (MSS)
The TCU configuration is 128 contexts for all TCUs (NISO and ISO). This is the largest SMMU-500
configuration supported. Each of the two pairs of NISO TCUs can be independently programmed.
Note that NISO TCUs O and 1 must be programmed identically and NISO TCUs 2 and'3 must be
programmed identically. NISO TCUs 0, 1 may be programmed differently from NISO T@Us 2, 3, as
long as each pair of TCUs serves a disjoint set of clients.
3.1.2.4 NVLink Hub (Connection to the iGPU)
The Ampere iGPU connects to the memory subsystem using eight NCISOC ports. NCISOC is the
on-chip version of the NVLink protocol used to connect GPUs. Each link provides approximately 35
GB/s of raw bandwidth in each direction and approximately 25 GB/see achievable bandwidth in
each direction. GPU requests may be IO coherent. Requests can(be)32B, 64B, 96B, 128B, or 256B. If
256B, there can be no byte enables.
Each NCISOC port connects to the memory subsystem through one of eight NVLink Hubs. NVLink
Hub contains logic to do the following:
= Convert from NCISOC protocol to the ACE-Lite format used within the memory subsystem.
= Provide response buffering for GPU responses:
* Implement barriers to allow hazard-free updates of the protection table.
3.1.2.4.1 Read-Modify-Write (RMW) Transactions
NCISOC supports a RMW command that may be used to implement coherent platform atomics.
The read transaction is initiated by the.GPU and is conveyed on the NCISOC request interface (REQ
virtual channel, RMW command). The response goes back to the imitating unit (GPU L2), which
performs the operation, then issues’‘a TRANS_DONE command that conveys the write data to
memory. SCF implements the RMW protocol, which requires locking a cache line until
TRANS_DONE is received.
3.1.2.5 MSS Clients
The following clients\have memory interface(s) in the SoC and connect to the HUBs (excludes
dGPU/iGPU/QualEngine).
= AON-DMA
* AON-RS
= APE-DSP
APE-DMA
AXIAP (DFD)
AZA-HDA
BPMP-DMA

```
</details>


<!-- Page 65 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

BPMP-R5 DCE-DMA/DCE-R5 Engine with minimal bandwidth requirements that is configured as SISO.

DLA DLA-Falcon EQOS ETR (DFD) Functional Safety Island (FSI)

An independent, redundant set of processors with onboard memory that is used as a monitoring and safety processor working beside other SoC engines without requiring an external functional safety processor. It has its own power rail and clocks to be maximally independent of other SoC components.

This safety processor must meet strict safety requirements, which requires high fault coverage internally and, also on the external memory interface. The memory subsystem does not meet these metrics. FSI can therefore operate in two modes:

Safety mode . This is done when accessing the FSI ASIL-D carveout. Both FSI0 and FSI1 ports are used and CRC values are read/written in addition to data. SMMU is bypassed (using StreamID 0x7f). Normal mode . This is done when accessing outside the FSI ASIL-D carveout. Only the FSI0 ports are used. CRC values are not used. SMMU is enabled.

The FSI ports are normal, low-bandwidth non-ISO clients with no special QoS requirements. They connect to Ring 2, which allows them to be configured as NISO or SISO.

GPCDMA HOST1X HWPM_PMA HWPM_PMA is the write client for the HWPM (hardware performance monitor) unit. ISP ISP-Falcon MGBE MGBE are multi-gigabit ethernet clients that are configured as SISO. NVDISPLAY The GPU NVDisplay 4.0 client is used, which makes 128B requests in batches of two. In block linear mode, it uses XBAR_RAW. To avoid changes in MSS Hub logic, a disp2dbb shim splits 128B display requests into a pair of 64B requests with AXI_aruser_user_size == 128B, matching the AXI socket protocol used by other clients. This shim then connects to AXICIF, like other MSS clients.


<details>

<summary>OCR (Page 65)</summary>


```text

Memory Subsystem (MSS)
BPMP-R5
DCE-DMA/DCE-R5
Engine with minimal bandwidth requirements that is configured as SISO.
* DLA
DLA-Falcon
*" EQOS
ETR (DFD)
Functional Safety Island (FSI)
An independent, redundant set of processors with onboard memory that is used as a
monitoring and safety processor working beside other SoCengines without requiring an
external functional safety processor. It has its own power rail and clocks to be maximally
independent of other SoC components.
This safety processor must meet strict safety requirements, which requires high fault
coverage internally and, also on the external memory interface. The memory subsystem
does not meet these metrics.
FSI can therefore operate in two modes:
° Safety mode. This is done when accessingsthe FSI ASIL-D carveout. Both FSIO and FSI1
ports are used and CRC values are read/written in addition to data. SMMU is bypassed
(using StreamID Ox7f).
° Normal mode. This is done when acceSsing outside the FSI ASIL-D carveout. Only the FSIO
ports are used. CRC values are notrused. SMMU is enabled.
The FSI ports are normal, low-bandwidth non-ISO clients with no special QoS
requirements. They connect‘to Ring 2, which allows them to be configured as NISO or
SISO.
GPCDMA
HOST1X
HWPM_PMA
HWPM_PMA is the write client for the HWPM (hardware performance monitor) unit.
= ISP
ISP-Falcon
= MGBE
MGBE are\multi-gigabit ethernet clients that are configured as SISO.
NVDISPLAY
The GPU NVDisplay 4.0 client is used, which makes 128B requests in batches of two. In block
linear-mode, it uses XBAR_RAW. To avoid changes in MSS Hub logic, a disp2dbb shim splits
128B display requests into a pair of 64B requests with AXl_aruser_user_size == 128B,
Matching the AXI socket protocol used by other clients. This shim then connects to AXICIF,
like other MSS clients.

```
</details>


<!-- Page 66 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

NVDISPLAY-NISO NVDisplay 4.0 contains an NVDISPLAY-NISO client, which is used for configuring display header frames. NVDISPLAY-NISO issues reads and writes to the memory system for semaphores, notifiers, and push-buffers. NVDISPLAY-NISO has minimal bandwidth requirements.

NVDEC NVENC NVJPG OFA-DMA Optical Flow Accelerator (OFA) is a client that is configured as SISO and used independently of NVENC. PCIe PSC PVA PVA-Falcon QSPI QSPI has minimal bandwidth requirements and is configured as SISO.

RCE-DMA RCE-R5 SCE-DMA SCE-R5 SDMMC SE TSEC UFSC VI-Falcon VI VIC XUSB-DMA XUSB-HOST

###### 3.1.2.6 MCF

MCF is the internal Memory Controller Fabric. MCF contains four MCF slices plus the crossbars that route requests between client hubs and NVLinkHub to the MCF/SCF slices, and to the channels and other memory destinations (SysRAM and Syncpoint registers).


<details>

<summary>OCR (Page 66)</summary>


```text

Memory Subsystem (MSS)
NVDISPLAY-NISO
NVDisplay 4.0 contains an NVDISPLAY-NISO client, which is used for configuring display
header frames. NVDISPLAY-NISO issues reads and writes to the memory system for
semaphores, notifiers, and push-buffers. NVDISPLAY-NISO has minimal bandwidth
requirements.
NVDEC
NVENC
NVJPG
OFA-DMA
Optical Flow Accelerator (OFA) is a client that is configured as SISQ and used independently
of NVENC.
= PCle
= PSC
* PVA
PVA-Falcon
* QSPI
QSPI has minimal bandwidth requirements andis\configured as SISO.
RCE-DMA
RCE-R5
SCE-DMA
SCE-R5
SDMMC
" SE
* TSEC
* UFSC
* VI-Falcon
» Vi
= VIC
XUSB-DMA
XUSB-HOST
3.1.2.6 MCF
MCF is the internal Memory Controller Fabric. MCF contains four MCF slices plus the crossbars
that route’requests between client hubs and NVLinkHub to the MCF/SCF slices, and to the
channels.and other memory destinations (SysRAM and Syncpoint registers).

```
</details>


<!-- Page 67 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

###### 3.1.2.7 SCF

The Scalable Coherence Fabric (SCF) contains coherence logic and the SCF cache, as well as the interface to CCPLEX. SCF is part of the CCPLEX cluster and is coupled with MCF and conveys MSS traffic.

###### 3.1.2.8 SysRAM

SysRAM is an on-chip RAM managed by software, intended to provide memory for boot, power management, TrustZone (TZ), and interprocessor communication (IPC). SysRAM is potentially usable by other applications as a fast, low-latency, low-power alternative to DRAM.

Boot requires an internal RAM to store data used to initialize the chip before DRAM is available. This RAM needs to be directly accessible by the boot processor (the BPMP) and all boot I/O storage devices (for example, Flash controller or USB controller). The boot I/O device transfers encrypted boot data directly to the internal RAM as one of the first steps during boot. The SysRAM characteristics are:

A size of 512 KiB. A low access latency for boot speed. Direct access from the I/O clients to SysRAM.

During the initial portion of boot, CCPLEX power management needs a protected region in SysRAM. This area can be freed before the completion of boot. To set up this "pre-boot" aperture, the BPMP initializes one of the GSCs to set up an aperture that allows read/write access to only CCPLEX power management.

The SoC has many CPU cores and auxiliary processors, which have pair-wise communication requirements. All IPC communication buffers are in DRAM. Post-boot, SysRAM is exclusively used for the MCE GSC (MCE private code and workspace).

SysRAM has its own aperture in physical address space, distinct from the DRAM aperture, and is available to all DRAM memory clients. Initialization is done by a dedicated state machine, which is started by writing to a trigger register. Any accesses that occur before initialization is complete are back-pressured (no SysRAM requests are dropped). Software is responsible for allocating SysRAM for each use case.

3.1.2.8.1 Bandwidth

The maximum SysRAM bandwidth is 32B per SCF clock for each of the two instances, or up to 64.2 GB/s aggregate (SCF clock = EMC clock with a max of 1066 MHz). Most SysRAM clients use a small fraction of the maximum bandwidth so their requirements are easily met. The most important aspect of bandwidth is the interaction of SysRAM and DRAM accesses and the effects on DRAM bandwidth and ISO N% values. If SysRAM is oversubscribed, HOL blocking can occur, limiting DRAM


<details>

<summary>OCR (Page 67)</summary>


```text

Memory Subsystem (MSS)
3.1.2.7 SCF
The Scalable Coherence Fabric (SCF) contains coherence logic and the SCF cache, aswell as the
interface to CCPLEX. SCF is part of the CCPLEX cluster and is coupled with MCF and conveys MSS
traffic.
3.1.2.8 SysRAM
SysRAM is an on-chip RAM managed by software, intended to provideymemory for boot, power
management, TrustZone (TZ), and interprocessor communication (IPC)\SysRAM is potentially
usable by other applications as a fast, low-latency, low-power alternative to DRAM.
Boot requires an internal RAM to store data used to initialize the chip before DRAM is available. This
RAM needs to be directly accessible by the boot processor (thesBPMP) and all boot I/O storage
devices (for example, Flash controller or USB controller). The, boot I/O device transfers encrypted
boot data directly to the internal RAM as one of the first'steps during boot. The SysRAM
characteristics are:
* Asize of 512 KiB.
= A low access latency for boot speed.
" Direct access from the I/O clients to SysRAM.
During the initial portion of boot, CCPLEX powér management needs a protected region in SysRAM.
This area can be freed before the completion of boot. To set up this "pre-boot" aperture, the BPMP
initializes one of the GSCs to set up an aperture that allows read/write access to only CCPLEX
power management.
The SoC has many CPU cores andauxiliary processors, which have pair-wise communication
requirements. All IPC communication buffers are in DRAM. Post-boot, SysRAM is exclusively used
for the MCE GSC (MCE private(code and workspace).
SysRAM has its own aperture in physical address space, distinct from the DRAM aperture, and is
available to all DRAM mémory clients. Initialization is done by a dedicated state machine, which is
started by writing toa trigger register. Any accesses that occur before initialization is complete are
back-pressured (no SySRAM requests are dropped). Software is responsible for allocating SysRAM
for each use case.
3.1.2.8.1 Bandwidth
The maximum SysRAM bandwidth is 32B per SCF clock for each of the two instances, or up to 64.2
GB/s aggregate (SCF clock = EMC clock with a max of 1066 MHz). Most SysRAM clients use a small
fractionof the maximum bandwidth so their requirements are easily met. The most important
aspect of bandwidth is the interaction of SysRAM and DRAM accesses and the effects on DRAM
bafhdwidth and ISO N% values. If SysRAM is oversubscribed, HOL blocking can occur, limiting DRAM

```
</details>


<!-- Page 68 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

bandwidth. SysRAM bandwidth must be limited to 13 GB/sec or about 10% of DRAM bandwidth to prevent HOL blocking DRAM.

###### 3.1.2.9 SyncPoint Interface

The SyncPoint Interface or Side Band Shim (SBS) presents a memory-mapped aperture to MSS clients, converting reads and writes to this aperture to syncpoint operations at Host1x. The SyncPoint interface converts read requests to SyncPoint reads and write requests to SyncPoint INCR operations at Host1x.

For SyncPoint reads of any size, Host1x returns a 32b read response of SyncPoint value. MSS replicates these 32b to the width of the read response and returns the replicated value back to the client.

For writes to the SyncPoint aperture, the data payload of the request does not matter, and is not passed from MSS logic to Host1x. There are no restrictions on the size of reads or write requests. Any sized read or write request to the aperture results in a request to Host1x. SyncPoint writes with zero byte enables are ignored.

Each of the 1K SyncPoints has a 64 KiB address range assigned to it in the SyncPoint aperture, so that each may be controlled by a 64 KiB hypervisor page-table entry. The SyncPoint aperture is 64MB long and starts at a 64MB aligned base address. In other words, PA[25:16] of the address is used as the SyncPoint index.

The SyncPoint interface does not have any additional security mechanisms other than normal page-table protections provided by the SMMU or/and GMMU. SyncPoint requests are expected to be MMU-translated in the same manner as other requests to MSS.

###### 3.1.2.10 Memory Controller (DRAM) Channels

The SoC has 16 Memory Controller channels, each controlling a x16 LPDDR5 channel, together implementing a 256-bit DRAM I/O interface. The channel logic is divided into four sections. CIFLL, WCAM, and Row Sorter represent the “MC” portion, while the final section is EMC and contains DRAM control, ECC, and Encryption logic.

3.1.2.10.1 CIFLL

CIFLL is the interface unit between MCF and the row sorter. It includes input FIFOs, async crossings, DRBC conversion, encryption key ID lookup, stat range comparison, and Ring 0x/Ring 0, which implement the final ring arbitration.


<details>

<summary>OCR (Page 68)</summary>


```text

Memory Subsystem (MSS)
bandwidth. SysRAM bandwidth must be limited to 13 GB/sec or about 10% of DRAM bandwidth to
prevent HOL blocking DRAM.
3.1.2.9 SyncPoint Interface
The SyncPoint Interface or Side Band Shim (SBS) presents a memory-mapped.aperture to MSS
clients, converting reads and writes to this aperture to syncpoint operations at-Host 1x. The
SyncPoint interface converts read requests to SyncPoint reads and write requests to SyncPoint
INCR operations at Host 1x.
For SyncPoint reads of any size, Host 1x returns a 32b read response of\SyncPoint value. MSS
replicates these 32b to the width of the read response and returns the replicated value back to the
client.
For writes to the SyncPoint aperture, the data payload of the-request does not matter, and is not
passed from MSS logic to Host 1x. There are no restrictions on the size of reads or write requests.
Any sized read or write request to the aperture results in a.request to Host1x. SyncPoint writes
with zero byte enables are ignored.
Each of the 1K SyncPoints has a 64 KiB address range’assigned to it in the SyncPoint aperture, so
that each may be controlled by a 64 KiB hypervisor page-table entry. The SyncPoint aperture is
64MB long and starts at a 64MB aligned base address. In other words, PA[25:16] of the address is
used as the SyncPoint index.
The SyncPoint interface does not have anyadditional security mechanisms other than normal
page-table protections provided by the SMMU or/and GMMU. SyncPoint requests are expected to
be MMU-translated in the same manner. as other requests to MSS.
3.1.2.10 Memory Controller (DRAM) Channels
The SoC has 16 Memory Controller channels, each controlling a x16 LPDDR5 channel, together
implementing a 256-bit DRAM I/O interface. The channel logic is divided into four sections. CIFLL,
WCAM, and Row Sorter represent the “MC” portion, while the final section is EMC and contains
DRAM control, ECC, and Encryption logic.
3.1.2.10.1 CIFCL
CIFLL is thesinterface unit between MCF and the row sorter. It includes input FIFOs, async
crossings, DRBC conversion, encryption key ID lookup, stat range comparison, and Ring Ox/Ring 0,
which implement the final ring arbitration.

```
</details>


<!-- Page 69 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

3.1.2.10.2 WCAM

WCAM is the point of global visibility for the memory subsystem. Write requests are acknowledged at WCAM, even though the writes may not be committed to DRAM until later. WCAM tracks pending writes so it can apply them to subsequent reads to the same address. WCAM stores the write data for writes that are being arbitrated. It has associative lookup logic to locate in-flight write data associated with any read that is scheduled. WCAM also implements the read-modify- write required for ECC and Encryption.

3.1.2.10.3 Row Sorter/Arbiter

The row sorter/arbiter takes a stream of requests from WCAM in bank queues and produces a DRAM-efficient and latency-sensitive stream of activate, read, write, and out of order per-bank refresh commands. The MC row sorter also handles All-Bank-Refresh, Refresh Management for Row Hammer (RFM) and power-down-modes (ACPD and DSR). Periodic calibrations are also now in the mcclk domain with an ownership arbiter that decides between periodic calibration commands and normal row sorter arbitration.

3.1.2.10.4 EMC

EMC maps the stream of activate, read, write, and refresh commands from the Row Sorter into actual DRAM commands. In addition, it handles maintenance operations such as power-down and periodic training. It also contains the decryption and ECC blocks for response data.

###### 3.1.2.11 Addressing

3.1.2.11.1 40 (39)-bit Virtual Addressing

SoC clients provide 40 bits of address at the AXI interface. Bit 39 is used to indicate conversion between TEGRA_RAW and XBAR_RAW block linear sector ordering. Therefore, a 39-bit virtual address space is supported.

The Arm SMMU supports a 49-bit input virtual address. The top 10 SMMU virtual address input bits are driven to zero in the SMMU wrapper.

If all 39 virtual address bits are used, the page table can be three levels deep, making worst-case TLB misses expensive (and bad for ISO). To reduce the overhead of page table walks, software only instantiates the number of levels needed for the maximum VA allocation for the context. In many cases, this should be under 1 GB (30 bits), which requires only a two-level table.

1 level 2 MB (2 ^ (12 + 9)) 21 bits

2 level 1 GB (2 ^ (12 + 2 * 9)) 30 bits

3 level 512 GB (2 ^ (12 + 3 * 9)) 39 bits


<details>

<summary>OCR (Page 69)</summary>


```text

Memory Subsystem (MSS)
3.1.2.10.2 WCAM
WCAM is the point of global visibility for the memory subsystem. Write requests aref~acknowledged
at WCAM, even though the writes may not be committed to DRAM until later. WCAM tracks
pending writes so it can apply them to subsequent reads to the same address. WCAM stores the
write data for writes that are being arbitrated. It has associative lookup logic to locate in-flight
write data associated with any read that is scheduled. WCAM also implements’the read-modify-
write required for ECC and Encryption.
3.1.2.10.3 Row Sorter/Arbiter
The row sorter/arbiter takes a stream of requests from WCAM in_bank queues and produces a
DRAN-efficient and latency-sensitive stream of activate, read, write, and out of order per-bank
refresh commands. The MC row sorter also handles All-Bank-Refresh, Refresh Management for
Row Hammer (RFM) and power-down-modes (ACPD and DSR)rPeriodic calibrations are also now in
the mcclk domain with an ownership arbiter that decides-between periodic calibration commands
and normal row sorter arbitration.
3.1.2.10.4 EMC
EMC maps the stream of activate, read, write, and refresh commands from the Row Sorter into
actual DRAM commands. In addition, it handles:maintenance operations such as power-down and
periodic training. It also contains the decryption and ECC blocks for response data.
3.1.2.11 Addressing
3.1.2.11.1 40 (39)-bit VirtualAddressing
SoC clients provide 40 bits ofaddress at the AXI interface. Bit 39 is used to indicate conversion
between TEGRA_RAW and XBAR_RAW block linear sector ordering. Therefore, a 39-bit virtual
address space is supported:
The Arm SMMU supforts a 49-bit input virtual address. The top 10 SMMU virtual address input
bits are driven to zero’in the SMMU wrapper.
If all 39 virtuaLaddress bits are used, the page table can be three levels deep, making worst-case
TLB misses.expensive (and bad for ISO). To reduce the overhead of page table walks, software only
instantiates the number of levels needed for the maximum VA allocation for the context. In many
cases, this should be under 1 GB (30 bits), which requires only a two-level table.
1 level 2MB (2% (12 + 9)) 21 bits
2-level 1 GB (2% (12+ 2*9)) 30 bits
3 level 512 GB (2% (12+3*9)) 39 bits

```
</details>


<!-- Page 70 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

3.1.2.11.2 128GB Maximum DRAM Size

A maximum attached DRAM size of 128GB is supported. Since the 0-2GB physical address range is dedicated to MMIO, DRAM starts at 2GB, so the physical address range for DRAM is from 2GB to 130GB. Additional details:

Because the GPU has only 37 physical address bits available (0-128GB range), GPU can only access 126GB of DRAM. In 128GB DRAM configs, it is recommended that software place carveouts and service buffers that do not need access by GPU in the 128-130GB physical address range. When ECC is enabled, the maximum addressable DRAM size is 112GB, since 1/8 of memory is dedicated to ECC storage. In this configuration, GPU can access all available DRAM. 128-bit DRAM configurations are limited to 64GB (56GB when ECC is enabled).

3.1.2.11.3 StreamID Specification of Context and Virtual Machine ID

The Arm SMMU uses a StreamID field, associated with each request, to specify which Address Space ID (ASID) and associated context, and which Virtual Machine ID (VMID) to use.

The StreamID field at the client interface is 8-bits wide. Only 128 StreamIDs are supported, so StreamID[7] is ignored.

StreamID is programmed into client registers by the hypervisor (or by boot code in non-hypervisor systems) and conveyed to MSS over the client’s AXI interface. MSS additionally provides a per- client pair of registers that can be programmed to override the client-provided StreamID value with a value from the registers. The main intention for these registers is to provide StreamID values for clients with no internal support for StreamID.

The OVERRIDE_ADD mode enables the display client to output a window ID field on the StreamID interface and have that added to the base StreamID value in the StreamID override register, so that each display window is effectively a separate virtual client.

###### 3.1.2.12 Address-based Steering

3.1.2.12.1 DRAM Channel Steering

Steering of requests to logical DRAM channels is determined by the MC_EMEM_ADR_CFG_CHANNEL_MASK_* registers. The following equation determines the logical channel:

logical_chan[3:0] = chan[3:0] & (num_channels-1), where

chan[0] = ^(EMEM_ADR_CFG_CHANNEL_MASK_0_EMEM_CHANNEL_MASK[31:9]&addr[31:9])

chan[1] = ^(EMEM_ADR_CFG_CHANNEL_MASK_1_EMEM_CHANNEL_MASK[31:9]&addr[31:9])

chan[2] = ^(EMEM_ADR_CFG_CHANNEL_MASK_2_EMEM_CHANNEL_MASK[31:9]&addr[31:9])


<details>

<summary>OCR (Page 70)</summary>


```text

Memory Subsystem (MSS)
3.1.2.11.2 128GB Maximum DRAM Size
A maximum attached DRAM size of 128GB is supported. Since the O-2GB physical address range is
dedicated to MMIO, DRAM starts at 2GB, so the physical address range for DRAM is)from 2GB to
130GB. Additional details:
* Because the GPU has only 37 physical address bits available (O-128GB range), GPU can only
access 126GB of DRAM. In 128GB DRAM configs, it is recommended that software place
carveouts and service buffers that do not need access by GPU in thé) 28-130GB physical
address range.
= When ECC is enabled, the maximum addressable DRAM size is 11 2GB, since 1/8 of memory is
dedicated to ECC storage. In this configuration, GPU can accessvall available DRAM.
= 128-bit DRAM configurations are limited to 64GB (56GB when ECC is enabled).
3.1.2.11.3 StreamlD Specification of Context and Virtual Machine ID
The Arm SMMU uses a StreamID field, associated with each request, to specify which Address
Space ID (ASID) and associated context, and which Virtual Machine ID (VMID) to use.
The StreamID field at the client interface is 8-bits-wide. Only 128 StreamIDs are supported, so
StreamID[7] is ignored.
StreamIlD is programmed into client registers‘by the hypervisor (or by boot code in non-hypervisor
systems) and conveyed to MSS over the client’s AXI interface. MSS additionally provides a per-
client pair of registers that can be programmed to override the client-provided StreamID value with
a value from the registers. The main intention for these registers is to provide StreamID values for
clients with no internal support for StréamID.
The OVERRIDE_ADD mode enables the display client to output a window ID field on the StreamID
interface and have that addedto‘the base StreamID value in the StreamID override register, so that
each display window is effectively a separate virtual client.
3.1.2.12 Address-based Steering
3.1.2.12.1 DRAM*Channel Steering
Steering of requests to logical DRAM channels is determined by the
MC_EMEMADR_CFG_CHANNEL_MASK_* registers. The following equation determines the logical
channel:
logical_chan[3:0] = chan[3:0] & (num_channels-1), where
chan[0] = “(EMEM_ADR_CFG_CHANNEL_MASK_0_EMEM_CHANNEL_MASK[31:9]&addr[31:9])
chan[1] = “(EMEM_ADR_CFG_CHANNEL_MASK_1_EMEM_CHANNEL_MASK[31:9]&addr[31:9])
chan[2] = “(EMEM_ADR_CFG_CHANNEL_MASK_2_EMEM_CHANNEL_MASK[31:9]&addr[31:9])

```
</details>


<!-- Page 71 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

chan[3] = ^(EMEM_ADR_CFG_CHANNEL_MASK_3_EMEM_CHANNEL_MASK[31:9]&addr[31:9])

512B versus 1 KiB interleave is determined as follows:

interleave_512B = EMEM_ADR_CFG_CHANNEL_MASK_0_EMEM_CHANNEL_MASK[9] | EMEM_ADR_CFG_CHANNEL_MASK_1_EMEM_CHANNEL_MASK[9] |

EMEM_ADR_CFG_CHANNEL_MASK_2_EMEM_CHANNEL_MASK[9] |

EMEM_ADR_CFG_CHANNEL_MASK_3_EMEM_CHANNEL_MASK[9];

The recommended settings of the registers are the following:

Channels Interleave EMEM_ADR_CFG_CHANNEL_MASK_* registers

16 512B MASK_0:  32’b 0010 0111 1010 1111 0101 001x xxxx xxxx MASK_1:  32’b 0101 0110 0011 1100 1010 010x xxxx xxxx MASK_2:  32’b 0011 1111 0010 0110 0100 100x xxxx xxxx MASK_3:  32’b 1110 0010 0100 0100 0011 000x xxxx xxxx

16 1 KiB MASK_0:  32’b 0010 0111 1010 1111 0100 010x xxxx xxxx MASK_1:  32’b 0101 0110 0011 1100 1010 100x xxxx xxxx MASK_2:  32’b 0011 1111 0010 0110 0101 000x xxxx xxxx MASK_3:  32’b 1110 0010 0100 0100 0010 000x xxxx xxxx

8,4 512B MASK_0:  32’b 1011 1001 0100 1111 0101 001x xxxx xxxx MASK_1:  32’b 1100 1010 1110 0100 1010 010x xxxx xxxx MASK_2:  32’b 0010 1110 0111 0110 0100 100x xxxx xxxx

8,4 1 KiB MASK_0:  32’b 1011 1001 0100 1111 0100 010x xxxx xxxx MASK_1:  32’b 1100 1010 1110 0100 1010 100x xxxx xxxx MASK_2:  32’b 0010 1110 0111 0110 0101 000x xxxx xxxx

For there to be no aliasing of memory addresses (that is, two physical addresses mapping to the same DRAM location), the mask bits that correspond to the channel bits in the physical address must allow all channels to be selected. Normally this is done by having a unique chan_base bit set in each mask register. For simplicity in the reverse mapping, we require this for legal settings of the mask registers. For best performance, the channel mask registers should be programmed with optimized settings given above.


<details>

<summary>OCR (Page 71)</summary>


```text

Memory Subsystem (MSS)
chan[3] = *(EMEM_ADR_CFG_CHANNEL_MASK_3_EMEM_CHANNEL_MASK[31:9]&addr[31:9])
512B versus 1 KiB interleave is determined as follows:
interleave_512B = EMEM_ADR_CFG_CHANNEL_MASK_0_EMEM_CHANNEL_MASK[9] |
EMEM_ADR_CFG_CHANNEL_MASK_1_EMEM_CHANNEL_MASK[9] |
EMEM_ADR_CFG_CHANNEL_MASK_2_EMEM_CHANNEL_MASK[9J. |
EMEM_ADR_CFG_CHANNEL_MASK_3_EMEM_CHANNEL_MASK(9)3
The recommended settings of the registers are the following:
Channels Interleave
16 512B
16 1 KiB
8,4 512B
8,4 1 KiB
EMEM_ADR_CFG_CHANNEL_MASK_* registers
MASK_O: 32’b-0010 0
XXXX
MASK_1: 82’b 01010
XXXX
MASK_2:y32’b 0011 1
XXXX,
MASK_3: 32’b 1110 00
XXXX
MASK_O: 32’b 00100
XXKXX
MASK_1: 32’b 01010
XXXX
MASK_2: 32’b 0011
XXXX
MASK_3: 32’b 000
XXXX
MASK_O: 32’b 1011 100
XXXX
MASK_1: 32’b 1100 10
XXXX
MASK_2: 32’b 0010 11
XXXX
MASK_O: 32’b 1011 100
XXXX
MASK_1: 32’b 1100 10
XXXX
MASK_2: 32’b 0010 11
XXXX
001000
10101 001x xxxx
00 1010 010x xxxx
00100 100x xxxx
00 0011 O0Ox xxxx
1 0100 010x xxxx
00 1010 100x xxxx
00101 OOOx xxxx
00 0010 O00x xxxx
10101 001x xxxx
00 1010 010x xxxx
00100 100x xxxx
1 0100 010x xxxx
00 1010 100x xxxx
00101 OOOx xxxx
For there to be no.aliasing of memory addresses (that is, two physical addresses mapping to the
same DRAM location), the mask bits that correspond to the channel bits in the physical address
must allow allchannels to be selected. Normally this is done by having a unique chan_base bit set
in each mask*egister. For simplicity in the reverse mapping, we require this for legal settings of the
mask registers. For best performance, the channel mask registers should be programmed with
optimized-settings given above.

```
</details>


<!-- Page 72 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

3.1.2.12.2 DRAM Bank Steering

Steering of requests to DRAM banks (within a device within a channel) is determined by the MC_EMEM_ADR_CFG_BANK_MASK_{0,1,2,3} registers. The following equation determines the bank:

bank[0] =    ^(EMEM_ADR_CFG_BANK_MASK_0_EMEM_BANK_MASK[31:10] & xaddr[31:10]) bank[1] =    ^(EMEM_ADR_CFG_BANK_MASK_1_EMEM_BANK_MASK[31:10] & xaddr[31:10]) bank[2] =    ^(EMEM_ADR_CFG_BANK_MASK_2_EMEM_BANK_MASK[31:10] & xaddr[31:10]) bank[3] = ^(EMEM_ADR_CFG_BANK_MASK_3_EMEM_BANK_MASK[31:10] & xaddr[31:10])

The variable xaddr is the physical address with the channel bits right-shifted out as follows:

4-channel mode: xaddr[31:10] = (addr[33:12] >> 2) 8-channel mode: xaddr[31:10] = (addr[34:13] >> 3) 16-channel mode: xaddr[31:10] = (addr[35:14] >> 4)

Note that in a 16-bank LPDDR5 systems with four bank groups, bank[3:2] select the bank group and bank[1:0] select the bank within bank group.

The recommended settings of the registers are the following:

8 banks

Channels Interleave EMEM_ADR_CFG_BANK_MASK_* registers

4, 8, 16 512B, 1 KiB MASK_0:  32’b 0101 1100 1010 0111 1000 01xx xxxx xxxx MASK_1:  32’b 1110 0101 0111 0010 0100 10xx xxxx xxxx MASK_2:  32’b 1001 0111 0011 1011 1011 00xx xxxx xxxx

MC_EMEM_ADR_CFG_BANK_MASK_0=0x5CA78400 MC_EMEM_ADR_CFG_BANK_MASK_1=0xE5724800 MC_EMEM_ADR_CFG_BANK_MASK_2=0x973BB000

16 banks

Channels Interleave EMEM_ADR_CFG_BANK_MASK_* registers

4, 8, 16 512B, 1 KiB MASK_0:  32’b 1011 0101 0111 1010 1111 10xx xxxx xxxx MASK_1:  32’b 0101 1111 1010 1101 1010 01xx xxxx xxxx MASK_2:  32’b 1101 0001 1001 1110 0110 00xx xxxx xxxx MASK_3:  32’b 1111 0010 0110 1011 0001 00xx xxxx xxxx


<details>

<summary>OCR (Page 72)</summary>


```text

Memory Subsystem (MSS)
3.1.2.12.2 DRAM Bank Steering
Steering of requests to DRAM banks (within a device within a channel) is determined by the
MC_EMEM_ADR_CFG_BANK_MASK_{0, 1,2,3} registers. The following equation determines the
bank:
* bank[O] = “(EMEM_ADR_CFG_BANK_MASK_O_EMEM_BANK_MASK[34;10] & xaddr[3 1:10])
* bank[1] = 4(EMEM_ADR_CFG_BANK_MASK_1_EMEM_BANK_MASK{(34:10] & xaddr[3 1:10])
* bank[2] = (EMEM_ADR_CFG_BANK_MASK_2_EMEM_BANK_MASK[31:10] & xaddr[3 1:10])
* bank[3] = 4(EMEM_ADR_CFG_BANK_MASK_3_EMEM_BANK_MASK{8 1:10] & xaddr[31:10])
The variable xaddr is the physical address with the channel bits right-shifted out as follows:
= 4-channel mode: xaddr[31:10] = (addr[33:12] >> 2)
= 8-channel mode: xaddr[31:10] = (addr[34:13] >> 3)
= 16-channel mode: xaddr[31:10] = (addr[35:14] >> 4)
Note that in a 16-bank LPDDR5 systems with four bank.-groups, bank[3:2] select the bank group
and bank[1:0] select the bank within bank group.
The recommended settings of the registers are thefollowing:
8 banks
Channels Interleave EMEM_ADR_CFG_BANK_MASK_* registers
4,8, 16 512B, 1 KiB MASK_O: 32’b 0101 1100 1010 0111 1000 O1xx xxxx
XXXX
MASK_1: 32’b 11100101 0111 0010 0100 10xx xxxx
XXXX
MASK_2: 32’b 1001 0111 0011 1011 1011 OOxx xxxx
XXXX
MC_EMEM_ADR_CFG_BANKSMASK_0=0x5CA78400
MC_EMEM_ADR_CFG_BANK, MASK_1=0xE5724800
MC_EMEM_ADR_CFG_BANK_MASK_2=0x973BBO00
16 banks
Channels Interleave EMEM_ADR_CFG_BANK_MASK_* registers
4,8, 16 512B, 1 KiB MASK_O: 32’b 1011 0101 0111 1010 1111 10xx xxxx
XXXX
MASK_1: 32’b 0101 1111 1010 1101 1010 O1xx xxxx
XXXX
MASK_2: 32’b 1101 0001 1001 11100110 OOxx xxxx
XXXX
MASK_3: 32’b 111100100110 1011 0001 OOxx xxxx
XXXX

```
</details>


<!-- Page 73 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

MC_EMEM_ADR_CFG_BANK_MASK_0=0xB57AF800 MC_EMEM_ADR_CFG_BANK_MASK_1=0x5FADA400 MC_EMEM_ADR_CFG_BANK_MASK_2=0xD19E3000 MC_EMEM_ADR_CFG_BANK_MASK_3=0xF26B1000

For there to be no aliasing of memory addresses (that is, two physical addresses mapping to the same DRAM location), the mask bits that correspond to the bank bits in the physical address must allow all banks to be selected. Normally this is done by having a unique bank bit set in each mask register. For simplicity in the reverse mapping, we require this for legal settings of the mask registers. For best performance, program the channel mask registers with the optimized settings given above.

3.1.2.12.3 iGPU NVLink Steering

Incoming iGPU requests are steered to one of the iGPU NVLink interfaces based upon an address hash determined by the GPU. The nominal interleave is 256B. Responses are routed to the NVLink interface that originated the request.

###### 3.1.2.13 Virtual Channels

Virtual channels allow independence and differentiated quality of service (QoS) for multiple logical streams that share a common physical channel.

3.1.2.13.1 Virtual Channels for Quality of Service

The SoC has a robust mechanism to provide QoS to the different traffic classes. The major traffic classes are described below:

Isochronous (ISO). Clients have fixed latency requirements and specified bandwidth that is provided within a time horizon of hundreds of nsec (display and camera). Bandwidth disruptions for system events like DVFS and system training are provisioned for with appropriate buffering. Data is needed in the required time or pixels are dropped. Soft ISO (SISO). Clients have fixed bandwidth requirements within a time horizon of milliseconds. Stalls are allowed within this time period so long as the specified bandwidth is provided for a specified minimum fraction of each period (for example, NVDEC, NVENC, and PVA). Processing for a frame must be completed within the frame time or frame is dropped. Non-ISO (NISO). Best-effort service. Faster is better, but there is no hard deadline and no guarantees. Low-latency (LL). Client performance depends on lowest possible latency (for example,CPU reads). Low-latency SISO (SISO_LL). This is used for NISO page-table misses and Cortex-A9 CPU reads. The requests are SISO, but latency is critical to meet the clients’ performance


<details>

<summary>OCR (Page 73)</summary>


```text

Memory Subsystem (MSS)
MC_EMEM_ADR_CFG_BANK_MASK_0=0xB57AF800
MC_EMEM_ADR_CFG_BANK_MASK_1=0x5FADA400
MC_EMEM_ADR_CFG_BANK_MASK_2=0xD19E3000
MC_EMEM_ADR_CFG_BANK_MASK_3=O0xF26B 1000
For there to be no aliasing of memory addresses (that is, two physical addresses mapping to the
same DRAM location), the mask bits that correspond to the bank bits in the physical address must
allow all banks to be selected. Normally this is done by having a unique bank bit set in each mask
register. For simplicity in the reverse mapping, we require this for legal settings of the mask
registers. For best performance, program the channel mask registers with the optimized settings
given above.
3.1.2.12.3 iGPU NVLink Steering
Incoming iGPU requests are steered to one of the iGPU NVLink interfaces based upon an address
hash determined by the GPU. The nominal interleave is 256B. Responses are routed to the NVLink
interface that originated the request.
3.1.2.13 Virtual Channels
Virtual channels allow independence and differentiated quality of service (QoS) for multiple logical
streams that share a common physical channel.
3.1.2.13.1 Virtual Channels for Quality of Service
The SoC has a robust mechanism to-provide QoS to the different traffic classes. The major traffic
classes are described below:
Isochronous (ISO). Clients)have fixed latency requirements and specified bandwidth that is
provided within a time-horizon of hundreds of nsec (display and camera). Bandwidth
disruptions for system.events like DVFS and system training are provisioned for with
appropriate buffering. Data is needed in the required time or pixels are dropped.
Soft ISO (SISO). Clients have fixed bandwidth requirements within a time horizon of
milliseconds.‘Stalls are allowed within this time period so long as the specified bandwidth is
provided for a)specified minimum fraction of each period (for example, NVDEC, NVENC, and
PVA). Processing for a frame must be completed within the frame time or frame is dropped.
Non-ISO(NISO). Best-effort service. Faster is better, but there is no hard deadline and no
guarantees.
Low-latency (LL). Client performance depends on lowest possible latency (for example,CPU
reads).
Low-latency SISO (SISO_LL). This is used for NISO page-table misses and Cortex-A9 CPU
reads. The requests are SISO, but latency is critical to meet the clients’ performance

```
</details>


<!-- Page 74 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

requirements. SISO_LL is a hybrid: SISO_LL requests travel on the ISO VC from hubs through MCF but split into their own VC in the channel.

The ISO and SISO virtual channels are “provisioned,” meaning that under normal conditions requests launched into the virtual channel proceed to the memory channel (or final destination) without backpressure, thus should traverse the MSS pipeline with relatively low latency. The NISO virtual channel is “unprovisioned” meaning that when DRAM (or final destination) is oversubscribed, requests can back up and fill the virtual channel. The latency under these conditions can be high— it is a function of the load issued by all the clients. Thus, in a case in which clients may saturate DRAM, the NISO virtual channel is only suited to “best effort” service. The ISO virtual channel is special in that all interactions with the other virtual channels and other uncontrolled sources of stalls are avoided so that latency is predictable.

Ring 1 and Ring 2 DDA settings are used to prioritize ISO over other VCs and SISO over NISO above the TBUs. There are dedicated ISO SMMU TBUs to prevent SMMU slowdowns from other VCs from affecting ISO.

VCs are provided from clients, through hubs, MCF, and SCF to Ring 0 at each Memory Controller Channel. The Ring 0 arbiter arbitrates between the head of each VC as it selects requests for the row sorter. At that point, row sorter priorities and deadlines determine which order requests are satisfied.

3.1.2.13.2 Virtual Channels to Prevent Deadlock

Two additional virtual channels are needed to remove dependencies between streams of requests that can cause deadlock:

TRANS_DONE to convey the RMW completion signal from GPU L2 to SCF. Without this additional virtual channel, the TRANS_DONE command could be blocked behind a request waiting for the RMW to complete, causing deadlock.

The four main virtual channels (NISO, SISO, ISO, CPU_LL), are conveyed to the DRAM channels, where they get resolved. This is done in a dual-level ring structure: Ring 0x followed by Ring 0.

###### 3.1.2.14 Arbitration, Throttling, and Deadlines

Arbitration, throttling, and deadlines are used to improve QoS for clients. The goals are to:

Provide clients with required bandwidth Improve utilization by preventing congestion Reduce client latency and limit latency outliers


<details>

<summary>OCR (Page 74)</summary>


```text

Memory Subsystem (MSS)
requirements. SISO_LL is a hybrid: SISO_LL requests travel on the ISO VC from hubs.through
MCF but split into their own VC in the channel.
The ISO and SISO virtual channels are “provisioned,” meaning that under normal conditions
requests launched into the virtual channel proceed to the memory channel (or final destination)
without backpressure, thus should traverse the MSS pipeline with relatively lowdatency. The NISO
virtual channel is “unprovisioned” meaning that when DRAM (or final destination)\is oversubscribed,
requests can back up and fill the virtual channel. The latency under these conditions can be high—
it is a function of the load issued by all the clients. Thus, in a case in whichrclients may saturate
DRAM, the NISO virtual channel is only suited to “best effort” service. The ISO virtual channel is
special in that all interactions with the other virtual channels and other uncontrolled sources of
stalls are avoided so that latency is predictable.
Ring 1 and Ring 2 DDA settings are used to prioritize ISO over other VCs and SISO over NISO above
the TBUs. There are dedicated ISO SMMU TBUs to prevent SMMU slowdowns from other VCs from
affecting ISO.
VCs are provided from clients, through hubs, MCF, and SCF_to Ring O at each Memory Controller
Channel. The Ring O arbiter arbitrates between the head.of each VC as it selects requests for the
row sorter. At that point, row sorter priorities and deadlines determine which order requests are
satisfied.
3.1.2.13.2 Virtual Channels to Prevent Deadlock
Two additional virtual channels are neededto remove dependencies between streams of requests
that can cause deadlock:
= TRANS_DONE to convey the RMW- completion signal from GPU L2 to SCF. Without this
additional virtual channel, the FRANS_DONE command could be blocked behind a request
waiting for the RMW to complete, causing deadlock.
The four main virtual channels(NISO, SISO, ISO, CPU_LL), are conveyed to the DRAM channels,
where they get resolved. Thisis done in a dual-level ring structure: Ring Ox followed by Ring O.
3.1.2.14 Arbitration, Throttling, and Deadlines
Arbitration, throttling, and deadlines are used to improve QoS for clients. The goals are to:
* Provide-celients with required bandwidth
* Improve utilization by preventing congestion
= Reduce client latency and limit latency outliers

```
</details>


<!-- Page 75 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

3.1.2.14.1 Priority Tier Snap Arbiter (PTSA/DDAs)

DRAM utilization can vary depending on the characteristics of the request stream and can pause for periodic training, refresh, etc. Certain clients and traffic streams have bandwidth requirements that the system must satisfy despite the variable DRAM utilization. Bandwidth guarantee logic at the snap arbiter inputs is included.

The bandwidth guarantee logic uses a DDA mechanism along with dynamic masking of the inputs to the snap arbiter. For each input at any snap arbiter ring, provide the following control, state, and I/O. Note that signed (two's complement) fixed-point arithmetic is used for the bandwidth calculations, using N integer bits (including sign) and F fraction bits. For this SoC, the values are N=11 and F=12.

Name Control, state, I/O Fixed pt format (#int bits. #frac bits)

Description

request input - Request is present at the arbiter input

grant input - Request was granted last cycle

high_priority output - Request grants are behind the guaranteed rate

rate control 0.F Amount to increment accum every clock.

accum state N.F Accumulates number of grants “owed” to this arbiter input; a negative value indicates that the input has had more grants than its guarantee

max control N.0 Maximum value of accum allowed

min control N.0 Minimum value of accum allowed (normally negative)

grant_decrement global control 1.F Amount to subtract from accum every clock that a grant occurs. This is a global config value that is used for all DDAs.

Each clock cycle, the following computation is done for each snap arbiter input:

high_priority = (accum >= 0.0); accum = accum + rate;

if (grant) accum = accum – grant_decrement;

if (accum > max) accum = max;

if (accum < min) accum = min;

If any snap arbiter input has a non-zero value for (high_priority and request), that is if high priority and at least one of its slots has a valid request, then we AND the snap arbiter request inputs with a mask where the mask value is the input’s high_priority signal (the input’s high_priority is used as a mask for all the input’s requests). If no input has a non-zero value for (high_priority and request),


<details>

<summary>OCR (Page 75)</summary>


```text

Memory Subsystem (MSS)
3.1.2.14.1 Priority Tier Snap Arbiter (PTSA/DDAs)
DRAM utilization can vary depending on the characteristics of the request stream and-can pause
for periodic training, refresh, etc. Certain clients and traffic streams have bandwidth requirements
that the system must satisfy despite the variable DRAM utilization. Bandwidth guarantee logic at
the snap arbiter inputs is included.
The bandwidth guarantee logic uses a DDA mechanism along with dynamic\masking of the inputs
to the snap arbiter. For each input at any snap arbiter ring, provide the following control, state, and
1/0. Note that signed (two's complement) fixed-point arithmetic is used for the bandwidth
calculations, using N integer bits (including sign) and F fraction bits. For this SoC, the values are
N=11 and F=12.
Name Control, state, I/O Fixed pt format Description
(#int bits. #frac bits)
request input - Request is present at the arbiter input
grant input - Request was granted last cycle
high_priority output - Request grants are behind the
guaranteed rate
rate control O.F Amount to increment accum every
clock.
accum state N.E. Accumulates number of grants “owed” to
this arbiter input; a negative value
indicates that the input has had more
grants than its guarantee
max control N.O Maximum value of accum allowed
min control N.O Minimum value of accum allowed
(normally negative)
grant_decrement global control 1.F Amount to subtract from accum every
clock that a grant occurs. This is a global
config value that is used for all DDAs.
Each clock cycle, the following computation is done for each snap arbiter input:
high_priority = (actum >= 0.0);
accum = accumy+ rate;
if (grant) aceum = accum - grant_decrement;
if (accum > max) accum = max;
if (accum * min) accum = min;
If any.snap arbiter input has a non-zero value for (high_priority and request), that is if high priority
and atNeast one of its slots has a valid request, then we AND the snap arbiter request inputs with a
maskywhere the mask value is the input’s high_priority signal (the input’s high_priority is used as a
mask for all the input’s requests). If no input has a non-zero value for (high_priority and request),

```
</details>


<!-- Page 76 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

then there is no masking of the snap arbiter inputs. Thus, any inputs that are “behind” are handled in the next snap arbiter round while inputs that are not behind are excluded.

DDAs are provided on the Ring 2 and Ring 1 snap arbiter rings in the client hubs, within SCF at merge points between CPU and DMA traffic, and Ring 0 and Ring 0x in the Memory Controller Channels.

Frequency versus Use-case Programming of Registers

Software usually requires that a given register must be owned by a single driver. The clocks driver is responsible for registers that depend on frequency and the client/ISO manager drivers are responsible for registers that depend on use case. Therefore, display and other ISO clients whose bandwidth demands are constant regardless of clock frequency, rate, minimum, and maximum, are programmed by the display driver.

Display and other ISO client DDA rates are typically programmed to provide the appropriate bandwidth for a given use case at maximum mcclk/emcclk/scfclk with grant_decrement = 1 at this maximum frequency. At lower clock frequencies, rather than increasing each input’s rate parameter (which would require control of the rate registers by multiple drivers), the clocks driver changes the global grant_decrement value instead. Clients whose bandwidth should scale down at lower clock frequencies (such as CPU) have their rate programmed by the clocks driver as well, so it scales down with frequency. In general, a given client is categorized either as a use-case- dependent client or a frequency-dependent client, which dictates whether the client driver or clocks driver owns the client’s DDA register.

The grant_decrement register is shadowed so it can be automatically updated when a frequency change occurs. For example, the CPU’s rate needs to scale down with EMCCLK so it does not overwhelm the available bandwidth.

3.1.2.14.2 Request Throttling

Throttling of requests is an important way to prevent congestion and saturation by low priority requests. For regions of the design in which there are no VCs (for example the output Ring 1), local throttling is used to prevent low priority VCs from head-of-line blocking high-priority VCs.

Hub Partition Client Bandwidth Throttling

This limits the bandwidth consumed by a single partition client. A bandwidth throttle is provided at each partition client, which operates similarly to the DDAs at the ring arbiters that guarantee bandwidth, only these throttles cap bandwidth. Each clock cycle, an accumulator is incremented by a client-specific rate increment that corresponds to a 64 byte transfer. Simultaneously, if the partition client receives a grant from the ring arbiter, the accumulator is decremented by a globally configured grant decrement value. Requests from a partition client to the arbiter are masked if the accumulator value is negative.


<details>

<summary>OCR (Page 76)</summary>


```text

Memory Subsystem (MSS)
then there is no masking of the snap arbiter inputs. Thus, any inputs that are “behind” are. handled
in the next snap arbiter round while inputs that are not behind are excluded.
DDAs are provided on the Ring 2 and Ring 1 snap arbiter rings in the client hubs, within SCF at
merge points between CPU and DMA traffic, and Ring O and Ring Ox in the Memory Controller
Channels.
Frequency versus Use-case Programming of Registers
Software usually requires that a given register must be owned by a single/driver. The clocks driver is
responsible for registers that depend on frequency and the client/ISO manager drivers are
responsible for registers that depend on use case. Therefore, display‘and other ISO clients whose
bandwidth demands are constant regardless of clock frequency, rate, minimum, and maximum, are
programmed by the display driver.
Display and other ISO client DDA rates are typically programmed to provide the appropriate
bandwidth for a given use case at maximum mcclk/emcclk/scfclk with grant_decrement = 1 at
this maximum frequency. At lower clock frequencies, rather'than increasing each input’s rate
parameter (which would require control of the rate registers by multiple drivers), the clocks driver
changes the global grant_decrement value instead/Clients whose bandwidth should scale down at
lower clock frequencies (such as CPU) have their rateyprogrammed by the clocks driver as well, so it
scales down with frequency. In general, a given client is categorized either as a use-case-
dependent client or a frequency-dependent client, which dictates whether the client driver or
clocks driver owns the client’s DDA register.
The grant_decrement register is shadowéd’so it can be automatically updated when a frequency
change occurs. For example, the CPU’s rate needs to scale down with EMCCLK so it does not
overwhelm the available bandwidth,
3.1.2.14.2 Request Throttling
Throttling of requests is an,important way to prevent congestion and saturation by low priority
requests. For regions of the design in which there are no VCs (for example the output Ring 1), local
throttling is used to prévent low priority VCs from head-of-line blocking high-priority VCs.
Hub Partition Client. Bandwidth Throttling
This limits the bandwidth consumed by a single partition client. A bandwidth throttle is provided at
each partitionsclient, which operates similarly to the DDAs at the ring arbiters that guarantee
bandwidth, only these throttles cap bandwidth. Each clock cycle, an accumulator is incremented by
a client-specific rate increment that corresponds to a 64 byte transfer. Simultaneously, if the
partitiomclient receives a grant from the ring arbiter, the accumulator is decremented by a globally
configured grant decrement value. Requests from a partition client to the arbiter are masked if the
accumulator value is negative.

```
</details>


<!-- Page 77 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

Since a client will not receive any further grants once its request is masked, the lowest possible value for the accumulator is the grant decrement value.

Hub Output Throttling to Prevent Response Path Backpressure

The response paths from MCF to the client hubs have limited bandwidth – less than full DRAM bandwidth. Arbitration inefficiencies at the MCF output response crossbar can further reduce bandwidth on each of these paths to about 90% of the theoretical response bandwidth. If 1) clients make large requests or, 2) if the input request crossbar selects requests from a hub that exceed the response bandwidth to that hub, persistent backups can occur at the output response crossbar through the MCF/SCF response pipeline, all the way back to the channels. Since the response paths have no virtual channels, priority responses (e.g., ISO SMMU page-table-misses) can be trapped and delayed. Also, if the input request crossbar chooses requests from a hub at a higher rate than the responses can be delivered, the backpressure reduces the rate the row sorters can schedule requests, reducing DRAM bandwidth.

Ring 0/Ring 0x Throttling

Ring 0 and Ring 0x have DDAs at each input, which provides bandwidth control under most circumstances. The input request stream at Ring 0 additionally needs throttling to prevent the row sorter from filling with low priority requests (which could head-of-line block high-priority ISO requests) and to prevent CPU requests, which normally get high priority, from starving SISO and NISO.

3.1.2.14.3 Latency Allowance and Deadlines

The Memory Subsystem supports clients with different latency requirements. The architecture achieves this by calculating a deadline for each request as it enters the memory subsystem and then prioritizing requests that reach their deadline and have not been serviced.

When all requests are within their deadline, the arbiter grants requests to maximize efficiency (Efficiency Arbitration Mode). If any request(s) have reached their deadline, the arbiter operates in Latency Arbitration Mode, giving high priority to the expired request(s). For a variety of reasons, an expired request may not be able to be granted immediately.

Here are several definitions that are useful in the explanations:

Expiration Time. The time between a request reaching its deadline and the time it is granted by the arbiter. Latency Tolerance. The latency a client can tolerate while running at its design bandwidth. This may be governed by a) the size of internal latency buffers within the client or b) the size of the client’s MCCIF response buffer (which needs to be large enough to store all the client’s requests outstanding in the memory controller). The latency allowance should be less than the Latency Tolerance, minus the expected Expiration Time and minus pipeline latencies not accounted for in the latency allowance, to avoid stalling the client.


<details>

<summary>OCR (Page 77)</summary>


```text

Memory Subsystem (MSS)
Since a client will not receive any further grants once its request is masked, the lowest possible
value for the accumulator is the grant decrement value.
Hub Output Throttling to Prevent Response Path Backpressure
The response paths from MCF to the client hubs have limited bandwidth - less than full DRAM
bandwidth. Arbitration inefficiencies at the MCF output response crossbar can further reduce
bandwidth on each of these paths to about 90% of the theoretical responsé,-bandwidth. If 1) clients
make large requests or, 2) if the input request crossbar selects requests from a hub that exceed
the response bandwidth to that hub, persistent backups can occur at the output response
crossbar through the MCF/SCF response pipeline, all the way back to-the channels. Since the
response paths have no virtual channels, priority responses (e.g., ISO SMMU page-table-misses)
can be trapped and delayed. Also, if the input request crossbar chooses requests from a hub at a
higher rate than the responses can be delivered, the backpressure reduces the rate the row sorters
can schedule requests, reducing DRAM bandwidth.
Ring O/Ring Ox Throttling
Ring O and Ring Ox have DDAs at each input, which provides bandwidth control under most
circumstances. The input request stream at Ring O‘additionally needs throttling to prevent the row
sorter from filling with low priority requests (which’could head-of-line block high-priority ISO
requests) and to prevent CPU requests, which normally get high priority, from starving SISO and
NISO.
3.1.2.14.3 Latency Allowance andDeadlines
The Memory Subsystem supports cliénts with different latency requirements. The architecture
achieves this by calculating a deadline for each request as it enters the memory subsystem and
then prioritizing requests that reach their deadline and have not been serviced.
When all requests are within,their deadline, the arbiter grants requests to maximize efficiency
(Efficiency Arbitration Modé)If any request(s) have reached their deadline, the arbiter operates in
Latency Arbitration Mode, giving high priority to the expired request(s). For a variety of reasons, an
expired request may not be able to be granted immediately.
Here are several definitions that are useful in the explanations:
* Expiration Mime. The time between a request reaching its deadline and the time it is granted
by the arbiter.
Latency Tolerance. The latency a client can tolerate while running at its design bandwidth.
This(may be governed by a) the size of internal latency buffers within the client or b) the size
ofthe client’s MCCIF response buffer (which needs to be large enough to store all the client’s
requests outstanding in the memory controller). The latency allowance should be less than
the Latency Tolerance, minus the expected Expiration Time and minus pipeline latencies not
accounted for in the latency allowance, to avoid stalling the client.

```
</details>


<!-- Page 78 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

Bandwidth-disruption time. The time service at a channel may be disrupted for infrequent events, such as frequency changes, periodic training, ZQ Calibration, and so forth.

Deadline Computation

When a request is stored in the partition client (PC) FIFO, a deadline is computed for it. The deadline is computed by adding the latency allowance (LA) of the issuing client to the current timestamp. The LA is programmable on a per-client basis. Slack is defined as:

Slack = Deadline – Timestamp

Negative slack means the request has been pending in the Row Sorter for longer than its latency allowance and should receive latency-mode arbitration. Modular arithmetic is used to handle timestamp wraparound.

To decouple the concept of time in the Row Sorter from the clock period of the MCCLK, the units of deadlines, LAs, timestamps, and slack are all stored in units of ticks. A tick is the wall-clock granularity; nominally 30ns. There are configuration variables to tell the TIMER unit how to translate MCCLK cycles into the appropriate timestamp increments for the current clock- frequency.

Determining the Latency Allowance

When latency allowance is exceeded, the request expires. Requests are expected to be granted within the expiration time. Thus, the latency expected a given request to achieve is given by:

target_latency = latency_allowance

+ expiration_time

+ static_latency_minus_snap_arb_to_row_sorter

This target_latency should match expected_latency in the following Little’s Law equation:

latency_buffer_size = design_bandwidth * expected_latency

Combining the equations, setting expected_latency = target_latency and latency_buffer_size = mccif_size, design_bandwidth = client_bandwidth, and solving for latency_allowance, results in the following:

latency_allowance = mccif_size / client_bandwidth

- static_latency_minus_snap_arb_to_row_sorter

- expiration_time

The following table shows the terms in static_latency_minus_snap_arb_to_row_sorter.


<details>

<summary>OCR (Page 78)</summary>


```text

Memory Subsystem (MSS)
* Bandwidth-disruption time. The time service at a channel may be disrupted for infrequent
events, such as frequency changes, periodic training, ZQ Calibration, and so forthe
Deadline Computation
When a request is stored in the partition client (PC) FIFO, a deadline is computed)for it. The
deadline is computed by adding the latency allowance (LA) of the issuing client.to the current
timestamp. The LA is programmable on a per-client basis. Slack is defined as:
Slack = Deadline - Timestamp
Negative slack means the request has been pending in the Row Sorter_for longer than its latency
allowance and should receive latency-mode arbitration. Modular arithmetic is used to handle
timestamp wraparound.
To decouple the concept of time in the Row Sorter from the‘clock period of the MCCLK, the units
of deadlines, LAs, timestamps, and slack are all stored in units of ticks. A tick is the wall-clock
granularity; nominally 3Ons. There are configuration variables to tell the TIMER unit how to
translate MCCLK cycles into the appropriate timestamp increments for the current clock-
frequency.
Determining the Latency Allowance
registers that determine the deadline for client requests. In many cases, the latency allowance is
statically programmed. In some cases, it Must be dynamically programmed based on client
bandwidth and/or memory clock frequencies.
When latency allowance is exceeded,.the request expires. Requests are expected to be granted
within the expiration time. Thus,the latency expected a given request to achieve is given by:
target_latency = latency_allowance
+ expirationstime
+ statics Latency_minus_snap_arb_to_row_sorter
This target_latency should match expected_latency in the following Little’s Law equation:
latency_buffer_size = design_bandwidth * expected_latency
Combining the-equations, setting expected_latency = target_latency and latency_buffer_size =
mccif_size, design_bandwidth = client_bandwidth, and solving for latency_allowance, results in the
following:
Llatency_-ablowance = mccif_size / client_bandwidth
- static_latency_minus_snap_arb_to_row_sorter
- expiration_time
The following table shows the terms in static_latency_minus_snap_arb_to_row_sorter.

```
</details>


<!-- Page 79 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

Table 3.1 Terms in static_latency_from_snap_arbiter_to_row_sorter

Static latency AXI to TBU input 149 scfclk

Static latency from WCAM to RespXbar 11 mcclk

Static Latency from RespXbar to client 197.2 scfclk

Expiration time is the time between a request expiring and being serviced under normal conditions while the DRAMs are active. This includes the tick granularity, time to finish processing another active list, time to switch from a different direction or rank, precharge, and activate time, and so on. There is also additional time to service one other request that may have expired at the same time (more than this is relegated to bandwidth disruption time).

The following table provides the expiration time calculation for LPDDR5.

Table 3.2 Expiration Time Calculation

Parameter LPDDR5

ns dramclks

RCD 18 0

7 txns 0 112

W2P 36 40

turn Penalty (hidden behind w2p)

RCD 18 0

TA catchup 0 208

RAS 60 0

Total 132 360

Different latency allowance rubrics are used for:

1. 2. 3. 4.

bandwidth-soak read clients low-latency CPU read clients ISO read clients (i.e., display) write clients

The rules are programmed by the NVIDIA driver based in information provided from an API.

Latency Allowance for Bandwidth-Soak Read Clients


<details>

<summary>OCR (Page 79)</summary>


```text

Memory Subsystem (MSS)
Table 3.1 Terms in static_latency_from_snap_arbiter_to_row_sorter
Static latency AXI to TBU input 149 scfclk
Static latency from WCAM to RespXbar 11 meclk
Static Latency from RespXbar to client 197.2 scfclk
Expiration time is the time between a request expiring and being serviced under normal conditions
while the DRAMs are active. This includes the tick granularity, time to_finish processing another
active list, time to switch from a different direction or rank, precharge, and activate time, and so on.
There is also additional time to service one other request that may have expired at the same time
(more than this is relegated to bandwidth disruption time).
The following table provides the expiration time calculation for“PDDRS.
Table 3.2 Expiration Time Calculation
Parameter LPDDR5
ns dramclks
RCD 18 0
7 txns ie} 112
We2P 36 40
turn Penalty (hidden behind w2p)
RCD 18 0
TA catchup ie} 208
RAS 60 0
Total 132 360
Different latency allowance rubrics are used for:
1. bandwidth-soak read clients
2. low-latency.@PU read clients
3. ISO read’clients (i.e., display)
4. write clients
The rules.are programmed by the NVIDIA driver based in information provided from an API.
Latency.Allowance for Bandwidth-Soak Read Clients

```
</details>


<!-- Page 80 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

Bandwidth soak clients use the above equation and assume that client_bandwidth is 85% of the peak_dram_bw. The LA for NISO read clients at peak dramclk frequency is 41 tickets; for SISO clients it is 37 tickets.

Note that client_bandwidth, unloaded_latency_minus_snap_arb_to_row_sorter, and expiration_time are all functions of clock frequency. For highest accuracy, perform this calculation for each set of operating frequencies. However, since the frequency-dependent terms are roughly inversely proportional to dramcclk frequency and, assuming the various clock frequencies in the MSS pipeline roughly scale with each other, the latency allowance is estimated at a given frequency by:

latency_allowance = target_latency_allowance (at base_freq)

* (base_freq / emcclk_freq)

At low frequencies, the latency allowance can be larger than the maximum value allowed by the register field and so capped at this maximum value (255 ticks, where a tick is 30 nsec). Since latency_allowance for bandwidth soak clients depends on frequency, the values must be updated when a frequency change occurs. The proper values are programmed by emc_reg_calc.h.

Note that this equation does not take into account large latency disruptions caused by infrequent events (also called bandwidth disruption events).

Latency Allowance for CPU Read Clients

Because CPU reads are latency-critical, the latency allowance needs to be short. The default is 4 ticks (120 ns), but the high-priority CPU request feature can drop it to 0 ticks for designated requests.

Latency Allowance for ISO Read (i.e., display) Clients

Display clients differ in several significant ways from the non-ISO clients:

Non-ISO clients can tolerate occasional bandwidth disruptions or excess-latency events; average throughput is what matters. Display clients can tolerate occasional bandwidth disruptions as long as there is enough data prefetched and buffered in the mempool to tolerate the bandwidth disruption; display clients must not underflow. Display’s internal latency tolerance is limited only by the number of queued up read responses in its internal mempool buffer. The memfetch unit and display itself independently track progress through the frame. Memfetch greedily requests all the pixels required for a frame, subject only to back-pressure from MSS and isohub clock. The datapath portion of display reads pixels from the response buffer in raster order at the required rate. There is no internal buffer connecting memfetch and display proper that limits display’s latency tolerance.

Display’s internal mempool is used to tolerate:

Total latency, which includes display internal latency, MSS static latencies + drain time of a saturated row sorter Bandwidth disruption events


<details>

<summary>OCR (Page 80)</summary>


```text

Memory Subsystem (MSS)
Bandwidth soak clients use the above equation and assume that client_bandwidth is 85%.of the
peak_dram_bw. The LA for NISO read clients at peak dramclk frequency is 41 tickets; for.SISO
clients it is 37 tickets.
Note that client_bandwidth, unloaded_latency_minus_snap_arb_to_row_sorter, and
expiration_time are all functions of clock frequency. For highest accuracy, perform-this calculation
for each set of operating frequencies. However, since the frequency-dependent terms are roughly
inversely proportional to dramcclk frequency and, assuming the various cloek-frequencies in the
MSS pipeline roughly scale with each other, the latency allowance is estimated at a given frequency
by:
latency_allowance = target_latency_allowance (at base_freq)
* (base_freq / emcclk_freq)
At low frequencies, the latency allowance can be larger than the:maximum value allowed by the
register field and so capped at this maximum value (255 ticks, where a tick is 30 nsec). Since
latency_allowance for bandwidth soak clients depends on frequency, the values must be updated
when a frequency change occurs. The proper values are programmed by emc_reg_calc.h.
Note that this equation does not take into account large latency disruptions caused by infrequent
events (also called bandwidth disruption events).
Latency Allowance for CPU Read Clients
Because CPU reads are latency-critical, the laténcy allowance needs to be short. The default is 4
ticks (120 ns), but the high-priority CPU request feature can drop it to O ticks for designated
requests.
Latency Allowance for ISO Read (i.e., display) Clients
Display clients differ in several significant ways from the non-ISO clients:
1. Non-ISO clients can tolerate occasional bandwidth disruptions or excess-latency events;
average throughput is what matters. Display clients can tolerate occasional bandwidth
disruptions as long as.there is enough data prefetched and buffered in the mempool to
tolerate the bandwidth disruption; display clients must not underflow.
2. Display’s internal latency tolerance is limited only by the number of queued up read
responses inits’internal mempool buffer. The memfetch unit and display itself independently
track progréss through the frame. Memfetch greedily requests all the pixels required for a
frame, subject only to back-pressure from MSS and isohub clock. The datapath portion of
display-reads pixels from the response buffer in raster order at the required rate. There is no
internal buffer connecting memfetch and display proper that limits display’s latency
tolerance.
Display:s-internal mempool is used to tolerate:
*Total latency, which includes display internal latency, MSS static latencies + drain time of a
saturated row sorter
= Bandwidth disruption events

```
</details>


<!-- Page 81 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

DVFS events Blocklinear SMMU miss period buffering Fetch amortized buffering

Display’s MCCIF buffer is used to tolerate static latencies and all the usual dynamic latencies incurred during steady state operation of the memory subsystem (notably not bandwidth disruption or DVFS events).

The considerations for determine display latency allowance are complex and are encapsulated in NVIDIA software.

Latency Allowance for Write Clients

Because of the WCAM, the latency allowance for write clients is greatly simplified which required quick scheduling of writes so that write acknowledges could be returned. Once a request has passed the WCAM, even for a low-latency client like CPU, the contents of the write are globally visible. The scheduling of the write can be done to facilitate DRAM efficiency without direct impact on the client. It is desirable to have a high latency allowance for writes, so the row sorter has flexibility in when to schedule writes and there is time for multiple write requests to the same page to arrive and be processed together. The disadvantage to a long latency allowance for writes is that a large fraction of the row sorter may be tied up with writes and unavailable for buffering reads so that reads can be done efficiently. The latency allowance equation for writes is:

latency allowance (emcclk) = min(255, 128*(1066 MHz/emcclk))

The deadline determined at the hub is ignored and all write requests are re-deadlined with LA MC_LATENCY_ALLOWANCE_CIFLL_WR_0 (0x3ff) at the channel. Direct turn arbitration generally determines when writes are scheduled. Write scheduling is determined by direction turn arbitration, not deadline expiration. The large LA of 1023 ticks ensures that writes do not remain in the row sorter for an excessive time.

###### 3.1.2.15 Logical Transaction Pipeline

Requests enter and pass through the memory system in a logical pipeline and are distributed over memory-system components. These requests can spend differing amounts of time, may be steered to different paths, and potentially may be reordered. Client attributes may be modified at certain stages.

The following table lists the stages in the logical pipeline for SoC clients. NVLink requests merge into the pipeline at the input request XBar in MCF and share the remainder of this pipeline.  Two paths to DRAM memory are available: the non-coherent path, and the path through SCF which supports I/O coherence. Requests to SCF may (or may not) snoop the CPU caches

Table 3.3 Logical Transaction Pipeline

Location Operation Controlling Register(s) Effect


<details>

<summary>OCR (Page 81)</summary>


```text

Memory Subsystem (MSS)
" DVFS events
* Blocklinear SMMU miss period buffering
* Fetch amortized buffering
Display’s MCCIF buffer is used to tolerate static latencies and all the usual dynamicatencies
incurred during steady state operation of the memory subsystem (notably not bandwidth
disruption or DVFS events).
The considerations for determine display latency allowance are complex andare encapsulated in
Latency Allowance for Write Clients
Because of the WCAM, the latency allowance for write clients is(greatly simplified which required
quick scheduling of writes so that write acknowledges could be returned. Once a request has
passed the WCAM, even for a low-latency client like CPU, the-eontents of the write are globally
visible. The scheduling of the write can be done to facilitateDRAM efficiency without direct impact
on the client. It is desirable to have a high latency allowance for writes, so the row sorter has
flexibility in when to schedule writes and there is time\for/multiple write requests to the same page
to arrive and be processed together. The disadvantage to a long latency allowance for writes is that
a large fraction of the row sorter may be tied up withwrites and unavailable for buffering reads so
that reads can be done efficiently. The latency allowance equation for writes is:
latency allowance (emcclk) = min(255, 128*(1066 MHz/emcclk) )
The deadline determined at the hub is ignored and all write requests are re-deadlined with LA
MC_LATENCY_ALLOWANCE_CIFLL_WR<O (Ox3ff) at the channel. Direct turn arbitration generally
determines when writes are scheduled, Write scheduling is determined by direction turn
arbitration, not deadline expiration» The large LA of 1023 ticks ensures that writes do not remain in
the row sorter for an excessive time:
3.1.2.15 Logical Transaction Pipeline
Requests enter and pass through the memory system in a logical pipeline and are distributed over
memory-system components. These requests can spend differing amounts of time, may be
steered to different paths, and potentially may be reordered. Client attributes may be modified at
certain stages.
The following-table lists the stages in the logical pipeline for SoC clients. NVLink requests merge
into the pipeline at the input request XBar in MCF and share the remainder of this pipeline. Two
paths to DRAM memory are available: the non-coherent path, and the path through SCF which
supports'l/O coherence. Requests to SCF may (or may not) snoop the CPU caches
Table 3.3 Logical Transaction Pipeline
Location Operation Controlling Register(s) Effect

```
</details>


<!-- Page 82 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

Client Interface

Receive transaction

AXICIF MemType override

<C>_MEMTYPE_OVERRIDE SO_DEV=(AxCache==0bxx0x), may be overridden based on register setting.

AXICIF HubID determination

<MC>_HUB_MASK <C>_NORMAL_HUBID_OVERR IDE <C>_NORMAL_HUBID <C>_SODEV_HUBID

Determine HubID using address-based hash or override value.

PCFIFO PCFIFO interlock

PCFIFO_<C>_ORDERED_CLIE NT

Conditionally stalls transactions until conflicting prior transactions have completed.

PCFIFO Large read request coalescing

MC_COALESCE_CTRL_0 MC_CLIENT_COALESCE_CON FIG_* <C>_COALESCER_ENABLED

Whether to coalesce identified sequences of 64B read requests into large read requests.

Ring 1/Ring 2

Virtual channel determination

<C>_TRAFFIC_TYPE_CONFIG Identify client as ISO, SISO, NISO

TBU Wrapper

AXI ID override <C>_AXI_ID_OVERRIDE Conditionally overrides AXI ID

TBU Wrapper

NS, STREAMID override

<C>_NS_OVERRIDE <C>_STREAMID_OVEERIDE

Conditionally overrides NS flag and Stream ID

TBU Wrapper

TBU steering control

SMMU_BYPASS_CTRL <C>_TBU_MASK <C>_NORMAL_TBUID _OVERRIDE <C>_NORMAL_TBUID <C>_SO_DEV_TBUID

Determine TBU ID (or TBU bypass)

TBU Wrapper

SMMU steering control

SMMU_CLIENT_STEERING_CT RL <C>_SMMU_STEERING_CTRL

Select between ISO and NISO SMMU

TBU Wrapper

Translation to ACE-Lite

AXI fields and per-translation flags mapped to ACE- Lite fields (AxCACHE, AxDOMAIN). AxDOMAIN forced to System Shareable (0b11) for SO_DEV requests per AMBA specification.

TBU Wrapper

Preserve SO_DEV through SMMU

MC_TBU_TRANSACTION_ATT R_CTRL TBU_SO_DEV_ATTR_PRESERV E

Whether to preserve upstream SO_DEV attribute through SMMU (default) or reset it based on AxDomain in PTE.

TBU Translation TBU page table entries and/or internal registers

Addresses transformed from virtual to physical. PTE values determine or modify various transaction attributes.

Request Coloring Block (RCB)

Barrier processing

Consumes barrier request from TBU, sets CNTR_ID attribute, tracks transactions by color, provides barrier response to TBU.

Client Hub AXI to MCF command mapping

Map AXI to MCF commands.


<details>

<summary>OCR (Page 82)</summary>


```text

Client
Interface
CIF
CIF
FIFO
FIFO
Ring 1/Ring
TBU
Wrapper
TBU
Wrapper
TBU
Wrapper
TBU
Wrapper
TBU
Wrapper
TBU
Wrapper
TBU
Request
Coloring
Block (RCB)
Client Hub
Receive
transaction
MemType
override
HubID
determination
PCFIFO
interlock
Large read
request
coalescing
Virtual channel
determination
AXI ID override
NS, STREAMID
override
TBU steering
control
SMMU steering
control
Translation to
ACE-Lite
Preserve
SO_DEV
through SMMU
Translation
Barrier
processing
AXI to MCF
command
mapping
<C>_MEMTYPE_OVERRIDE
<MC>_HUB_MASK
<C>_NORMAL_HUBID_OVERR
IDE
<C>_NORMAL_HUBID
<C>_SODEV_HUBID
PCFIFO_<C>_ORDERED_CLIE
MC_COALESCE_CTRL_O
MC_CLIENT_COALESCE_CON
FIG_*
<C>_COALESCER_ENABLED
<C>_TRAFFIC_TYPE_CONFIG
<C>_AXI_ID_OVERRIDE
<C>_NS_OVERRIDE
<C>_STREAMID_OVEERIDE
SMMU_BYPASS_CTRL
<C>_TBU_MASK
<C>_NORMAL_TBUID
_OVERRIDE
<C>_NORMAL_ABUID
<C>_SO_DEV_TBUID
SMMU_CLIENF_STEERING_CT
<C>_SMMU: STEERING_CTRL
MC_TBU_TRANSACTION_ATT
R_CTRL
TBU_SO_DEV_ATTR_PRESERV
TBU page table entries and/or
internal registers
Memory Subsystem (MSS)
SO_DEV=(AxCache==ObxxOx), may be’overridden
based on register setting.
Determine HubID using address-based hash or
override value.
Conditionally stalls transactions until conflicting prior
transactions have completed.
Whether to coalesce-identified sequences of 64B read
requests into largéread requests.
Identify Client as ISO, SISO, NISO
Conditionally overrides AXI ID
Conditionally overrides NS flag and Stream ID
Determine TBU ID (or TBU bypass)
Select between ISO and NISO SMMU.
AXI fields and per-translation flags mapped to ACE-
Lite fields (AxCACHE, AxDOMAIN).
AxDOMAIN forced to System Shareable (Ob11) for
SO_DEV requests per AMBA specification.
Whether to preserve upstream SO_DEV attribute
through SMMU (default) or reset it based on
AxDomain in PTE.
Addresses transformed from virtual to physical. PTE
values determine or modify various transaction
attributes.
Consumes barrier request from TBU, sets CNTR_ID
attribute, tracks transactions by color, provides barrier
response to TBU.
Map AXI to MCF commands.

```
</details>


<!-- Page 83 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

Client Hub Coherent steering and snoop control

<C>_COH_PATH_OVERRIDE_ NORMAL <C>_COH_PATH_OVERRIDE_S O_DEV order_id

SCF routing decision and conditional override of snoop bit.

Client Hub Order ID and sequence_num generation

MC_CLIENT_ORDER_ID <C>_ORDER_ID

Select order_id for ordered write clients and attach sequence_num for ordered streams

MCF Slice determination

CHANNEL_MASK_* Map transaction to one of four MCF/SCF slices.

SecChk Error checks E.g.,  EMEM_BOM, EMEM_SIZE, SYSRAM_BOM, SYSRAM_TOM, GSC and VPR checks, etc.

Various error checks NISO_REMOTE requests that DECERR map to NISO VC.

Coherent path

SCF SNOC / URT interlock

Various Enforces ordering for ordered threads and same- address ordering.

SCF Coherence fabric

Various Requests with dependencies (on snoops or pending transactions) may be stalled. Transactions may be merged or satisfied by SCF cache according to transaction rules.

SCF Channel determination

SCF version of CHANNEL_ENABLE, CHANNEL_MASK_*

SCF has its own copy of these registers for requests originated from CCPLEX.

Memory Destination (DRAM, SysRAM, SyncPoint)

Completion Various Transactions are completed according to Memory Destination ordering rules. ECC and/or encryption may be applied.

SCF Read response reordering

Various Responses to different addresses may be reordered by the coherence fabric.

SCF WrAck reordering

ORDER_ID_* WrAcks for ordered clients are processed in full or partial order at URT. WrAcks may be reordered after URT.

MCCIF Response reordering

Responses are returned to SoC clients in order.

Noncoher ent (direct) path

MCF Channel determination

CHANNEL_ENABLE, CHANNEL_MASK_*

Determine channel

Memory Destination (SCF cache, DRAM, SysRAM, +SyncPoint)

Completion Various Transactions are completed according to Memory Destination ordering rules. ECC and/or encryption may be applied.


<details>

<summary>OCR (Page 83)</summary>


```text

Ss’
Technical Reference Mai ax
Memory Subsystem (MS:
Client Hub Coherent <C>_COH_PATH_OVERRIDE___ SCF routing decision and conditional override Of snoop
steering NORMAL bit.
and snoop <C>_COH_PATH_OVERRIDE_S 1%)
control O_DEV ¢
order_id ‘a
Client Hub =Order ID and MC_CLIENT_ORDER_ID Select order_id for ordered writ Vv and attach
sequence_num <C>_ORDER_ID sequence_num for ordered str
generation 9)
MCF Slice CHANNEL_MASK_* Map transaction to one o r MCF/SCF slices.
determination (V;
SecChk Error checks E.g., EMEM_BOM, Various error eneckg NG REMOTE requests that
EMEML_SIZE, SYSRAM_BOM, C.
SYSRAM_TOM, GSC and VPR
checks, etc.
DECERR map to NES
SNOC / URT Various rdering for ordered threads and same-
interlock ordering.
SCF Coherence Various CXts with dependencies (on snoops or pending
fabric nsactions) may be stalled. Transactions may be
rged or satisfied by SCF cache according to
ransaction rules.
SCF Channel SCF version of 4 SCF has its own copy of these registers for requests
determination CHANNEL_ENABLE, (@) originated from CCPLEX.
CHANNEL_MASK_* C5
Memory Completion Various oe Transactions are completed according to Memory
Destination Destination ordering rules. ECC and/or encryption may
(DRAM, be applied.
SysRAM, N
SyncPoint) WO
SCF Read response Various Responses to different addresses may be reordered by
reordering @ the coherence fabric.
SCF WrAck oRdeiL0- WrAcks for ordered clients are processed in full or
reordering partial order at URT. WrAcks may be reordered after
Ss URT.
MCCIF Response ( ) Responses are returned to SoC clients in order.
reorderin
MCF annel Determine channel
etermination
CHANNEL_ENABLE,
CHANNEL_MASK_*
Memory. Completion Various Transactions are completed according to Memory
Destination Destination ordering rules. ECC and/or encryption may
(SC Cache, be applied.
AM,
» +SyncPoint)
gy NVIDIA CONFIDENTIAL

```
</details>


<!-- Page 84 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

MCCIF Response reordering

Responses are returned to SoC clients in order.

###### 3.1.2.16 Transaction Ordering

Clients differ in their ordering and bandwidth requirements. The AXI interface provided at the client/MC boundary provides a general framework for expressing ordering. Some clients are not equipped to express their ordering requirements using AXI, so configuration registers are provided to specify ordering behavior for these clients.

3.1.2.16.1 Normal MSS Clients

The DMA fabric treats all clients except NVLink and PCI ordered clients as normal clients. Normal MSS clients use the AXI ordering model for Normal memory by default. MSS provides the following ordering guarantees to each normal MSS client.

Read responses are returned in the same order that requests were received at the input to the DMA fabric regardless of the AXIID, even though AXI only requires this for requests using the same AXIID.

Reads can get data from younger writes since AXI places no ordering dependencies between reads and writes.

Write acknowledges are returned in the same order that the writes were received at the input to the DMA fabric regardless of the AXIID.

Writes can be completed in any order by the DMA fabric, but the write acknowledges always return in order even though AXI only requires this for requests using the same AXIID. WrAck guarantees that all previous writes are globally visible.

3.1.2.16.2 PCI Ordered Clients

For PCI-ordered clients such as PCIe, XUSB, and AZA_HDA, each IP is responsible for all PCI ordering requirements except for write after write (WAW) ordering. WAW ordering for these clients is the responsibility of both the client and the DMA fabric.

MSS clients are not allowed to send a mixture of SO/DEV requests and Normal requests. The DMA fabric does not provide read after read ordering for any clients. SO/DEV reads requests are treated as Normal non-cacheable reads.

3.1.2.16.3 High Bandwidth PCI Ordered Clients

High-bandwidth PCI-ordered writes use the SCF-interlock. The ordering interlock is implemented in SCF’s SNOC – a point where latencies are shortest since all interlock latencies are within one module. It directs full ordered bandwidth to one slice at a time. Each slice is provided with elasticity above and below the interlock to provide smooth bandwidth above and below the interlock.


<details>

<summary>OCR (Page 84)</summary>


```text

Memory Subsystem (MSS)
MCCIF Response Responses are returned to SoC clients in order.
reordering
3.1.2.16 Transaction Ordering
Clients differ in their ordering and bandwidth requirements. The AXI interfaceyprovided at the
client/MC boundary provides a general framework for expressing ordering. Some clients are not
equipped to express their ordering requirements using AXI, so configuration registers are provided
to specify ordering behavior for these clients.
3.1.2.16.1 Normal MSS Clients
The DMA fabric treats all clients except NVLink and PCI orderedsclients as normal clients. Normal
MSS clients use the AXI ordering model for Normal memory:by*default. MSS provides the following
ordering guarantees to each normal MSS client.
1. Read responses are returned in the same order that.requests were received at the input to
the DMA fabric regardless of the AXIID, even though AXI only requires this for requests using
the same AXIID.
a. Reads can get data from younger writes Since AXI places no ordering dependencies
between reads and writes.
2. Write acknowledges are returned in thesSame order that the writes were received at the input
to the DMA fabric regardless of the AXIID.
a. Writes can be completed in anyorder by the DMA fabric, but the write acknowledges
always return in order even though AXI only requires this for requests using the same
AXIID. WrAck guarantees thateall previous writes are globally visible.
3.1.2.16.2 PCI Ordered Clients
For PCl-ordered clients such’as PCle, XUSB, and AZA_HDA, each IP is responsible for all PCI
ordering requirements except for write after write (WAW) ordering. WAW ordering for these clients
is the responsibility of both’the client and the DMA fabric.
MSS clients are not allowed to send a mixture of SO/DEV requests and Normal requests. The DMA
fabric does not provide read after read ordering for any clients. SO/DEV reads requests are treated
as Normal non-cacheable reads.
3.1.2.16.3 High Bandwidth PCI Ordered Clients
High-bandwidth PCl-ordered writes use the SCF-interlock. The ordering interlock is implemented in
SCF’s*SNOC - a point where latencies are shortest since all interlock latencies are within one
module It directs full ordered bandwidth to one slice at a time. Each slice is provided with elasticity
above and below the interlock to provide smooth bandwidth above and below the interlock.

```
</details>


<!-- Page 85 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

To use the high-bandwidth ordered architecture, client and software configuration must do the following:

Client must connect to the ordered hub.

If native AXI client:

Client uses Device memory type. Client sets AXI ID to a constant value (e.g., 0).

If legacy MCCIF client:

Set AXI_ID_OVERRIDE to CGID_ZERO.

All clients:

Use MEMTYPE_OVERRIDE to force the MemType to Device. Set SO_DEV_HUBID to the appropriate value for the client. Set SO_DEV_TBUID to the appropriate value for the client. Disable the PCFIFO interlock for the client by programming the client-specific field in the MC_PCFIFO_CLIENT_CONFIG* register to UNORDERED. Set TRAFFIC_TYPE_CONFIG to NISO. Set ORDER_ID to one of ORD_1, ORD_2, or ORD_3. MSS hub configuration should steer requests to SCF. Requests are directed to an MCF slice using an address-based hash.

3.1.2.16.4 Low Bandwidth PCI Ordered Clients

Low-bandwidth PCI ordered clients can use any client hub. They use the PCFIFO interlock during boot and use the high-bandwidth interlock afterwards.

Client and software configurations must do the following:

Client normally connects to the ordered hub but may connect to an unordered hub (for example, if client requires ordering during boot but not during normal operation)

If native AXI client:

Client uses Device memory type. Client sets set AXI ID to a constant value (e.g., 0).

If legacy MCCIF client:

Set AXI_ID_OVERRIDE to CGID_ZERO.

All clients:

Use MEMTYPE_OVERRIDE to force the MemType to Device. Set SO_DEV_HUBID to the appropriate value for the client.


<details>

<summary>OCR (Page 85)</summary>


```text

Memory Subsystem (MSS)
To use the high-bandwidth ordered architecture, client and software configuration must do/the
following:
* Client must connect to the ordered hub.
If native AXI client:
= Client uses Device memory type.
* Client sets AXI ID to a constant value (e.g., 0).
If legacy MCCIF client:
= Set AXI_ID_OVERRIDE to CGID_ZERO.
All clients:
Use MEMTYPE_OVERRIDE to force the MemType to Device,
Set SO_DEV_HUBID to the appropriate value for the client.
Set SO_DEV_TBUID to the appropriate value for the client.
Disable the PCFIFO interlock for the client by programming the client-specific field in the
MC_PCFIFO_CLIENT_CONFIG* register to UNORDERED.
Set TRAFFIC_TYPE_CONFIG to NISO.
Set ORDER_ID to one of ORD_1, ORD_2, or ORD_3.
MSS hub configuration should steer requests to SCF.
Requests are directed to an MCF slice(Using an address-based hash.
3.1.2.16.4 Low Bandwidth PCI Ordered Clients
Low-bandwidth PCI ordered clients‘can use any client hub. They use the PCFIFO interlock during
boot and use the high-bandwidth interlock afterwards.
Client and software configurations must do the following:
* Client normally connects to the ordered hub but may connect to an unordered hub (for
example, if client’equires ordering during boot but not during normal operation)
If native AXI client:
* Client usesDevice memory type.
* Client sets.set AXI ID to a constant value (e.g., 0).
If legacy MCCIF client:
= SetAXI_ID_OVERRIDE to CGID_ZERO.
All clients:
» Use MEMTYPE_OVERRIDE to force the MemType to Device.
= Set SO_DEV_HUBID to the appropriate value for the client.

```
</details>


<!-- Page 86 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

Set SO_DEV_TBUID to the appropriate value for the client. Enable the PCFIFO interlock for the client by programming the client-specific field in the MC_PCFIFO_CLIENT_CONFIG* register to ORDERED. TRAFFIC_TYPE_CONFIG may be programmed to NISO Set ORDER_ID to ORD_0 in the MC_CLIENT_ORDER_ID* register Requests are directed to an MCF slice using an address-based hash. Requests can be routed through either the SCF or the MCF bypass path, using one of the methods of specifying snooping/coherent routing.

Ordered clients that need fast ordered writes must use the SCF path. Any client that consumes a buffer generated by an ordered client that wrote through SCF and depends on the ordering behavior must also use the SCF path.

###### 3.1.2.17 Error Checking and Reporting

There are multiple classes of errors that are detected by the system, as shown below. Containable means unrelated parts of the system may continue running while the affected client or subsystem is reset. The remaining columns describe what is done to the offending transaction, how the error is reported to the system, and how it is reported to the client.

Table 3.4 Error Types and Responses

Error type Where detected? Containa ble

Effect on transaction

Report to system Report to client

Security check failure

Security check blocks in MCF and SCF

No DECERR bit set in request.

MCF: Log and optional interrupt. SCF: Optional log and interrupt (prefetcher can fetch out of range) Note : requests arriving with DECERR from SMMU are not reported as failures at MCF.

DECERR is reported to client hub or NVLinkHub, but hubs do not return DECERR to client. DECERR of PTC request causes SMMU fault for requests that hit on TLB entry.

DRAM ECC single-bit read error

EMC Yes Correct data value Log and optional interrupt

None

Pipeline ECC single-bit error

Point data is used Yes Correct data value Log and optional interrupt

None

DRAM ECC dual-bit read error

EMC Yes None Log and optional interrupt

SLVERR bit set in data packet

Pipeline ECC dual-bit error

Point data is used Yes None Log and optional interrupt

SLVERR bit set in data packet


<details>

<summary>OCR (Page 86)</summary>


```text

* Set SO_DEV_TBUID to the appropriate value for the client.
* Enable the PCFIFO interlock for the client by programming the client-specific fieldinthe
MC_PCFIFO_CLIENT_CONFIG* register to ORDERED.
* TRAFFIC_TYPE_CONFIG may be programmed to NISO
* Set ORDER_ID to ORD_O in the MC_CLIENT_ORDER_ID* register
= Requests are directed to an MCF slice using an address-based hash.
= Requests can be routed through either the SCF or the MCF bypass path,-using one of the
methods of specifying snooping/coherent routing.
Memory Subsystem (MSS)
Ordered clients that need fast ordered writes must use the SCF path.Any client that consumes a
buffer generated by an ordered client that wrote through SCF and depends on the ordering
behavior must also use the SCF path.
3.1.2.17 Error Checking and Reporting
There are multiple classes of errors that are detected bythe system, as shown below. Containable
means unrelated parts of the system may continue running while the affected client or subsystem
is reset. The remaining columns describe what is done to the offending transaction, how the error
is reported to the system, and how it is reported tothe client.
Table 3.4 Error Types and Responses
Error type
Security check
failure
DRAM ECC
single-bit read
error
Pipeline ECC
single-bit error.
DRAM ECC
dual-bit read
error
Pipeline@ECC
dual-bitverror
Where detected? Containa
Security check
blocks in MCF and
SCF
EMC
Point data is used
EMC
Point data is used
ble
Yes
Yes
Yes
Yes
Effect on
transaction
DECERR bit set in
request.
Correct data value
Correct data value
None
None
Report to system
MCF: Log and
optional interrupt.
SCF: Optional log and
interrupt (prefetcher
can fetch out of
range)
Note: requests
arriving with DECERR
from SMMU are not
reported as failures
at MCF.
Log and optional
interrupt
Log and optional
interrupt
Log and optional
interrupt
Log and optional
interrupt
Report to client
DECERR is reported
to client hub or
NVLinkHub, but hubs
do not return DECERR
to client.
DECERR of PTC
request causes
SMMU fault for
requests that hit on
TLB entry.
None
None
SLVERR bit set in data
packet
SLVERR bit set in data
packet

```
</details>


<!-- Page 87 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

Error type Where detected? Containa ble Effect on transaction Report to system Report to client

Parity Any unit that acts on the item other than forwarding

No Forward or suppress, whichever is most natural

Log and optional interrupt

None

Timeout MSS implements no timeouts

N/A N/A N/A N/A

DECERRs are detected in the SMMU and in the security check blocks in SCF and MCF. A DECERR indicates the request itself is bad, irrespective of the data. Since DECERRs must generate a response, they must be passed through the pipeline. The DECERR bit is set in the request, so the request is effectively a NOP as it passes through the pipe. DECERRs are routed through SCF, or the bypass path based on the normal parameters of the request. Since a DECERR may have an illegal address, and handling illegal requests is a burden we do not want every memory resource to deal with, all DECERR requests are directed to DRAM; to the DRAM channel indicated by the channel mask decode, ignoring all BOM and TOM registers. Writes with DECERRs are suppressed and reads with DECERRs return all 1's.

In general, the unit that detects a DECERR, generates an interrupt for it (under configuration register control).

DRAM ECC errors are detected in EMC. EMC corrects single-bit errors and optionally logs them (frequent single-bit errors may indicate an imminent hardware failure). Uncorrectable double-bit errors set the slave error (SLVERR) flag in the data packet, are logged, and optionally generate an interrupt. The SLVERR bit is propagated up to the client.

Pipeline ECC errors are detected in the unit that receives the data (whether MSS or a requesting unit). Single-bit errors are corrected and may optionally be logged. Uncorrectable double-bit errors set the SLVERR flag in the data packet, are logged, and optionally generate an interrupt. The SLVERR bit is propagated up to the client.

NVLink protocol errors are detected by NVLink logic based on detectable corruption of a request. The error is logged and an interrupt optionally generated. The logic detecting the error may kill the request or forward it on, whichever is most convenient, since there's no obvious way to fix it and a hang is likely to result in any case.

Parity errors indicate corruption of the command or address. The error is logged and an interrupt optionally generated. The logic detecting the parity error may kill the request or forward it on, whichever is most convenient, since there is no obvious way to fix it and a hang is likely to result in any case.

The client AXI interface returns both the DECERR and SLVERR bits. Typically, at most one is set, but if both are set, DECERR prevails. Clients may or may not observe, or act on error responses.


<details>

<summary>OCR (Page 87)</summary>


```text

Memory Subsystem (MSS)
Error type Where detected? Containa Effect on Report tosystem Report tovclient
ble transaction
Parity Any unit that acts No Forward or Log and optional None
on the item other suppress, interrupt
than forwarding whichever is most
natural
Timeout MSS implements N/A N/A N/A N/A
no timeouts
DECERRs are detected in the SMMU and in the security check blocks in\SCF and MCF. A DECERR
indicates the request itself is bad, irrespective of the data. Since DECERRs must generate a
response, they must be passed through the pipeline. The DECERR bit\is set in the request, so the
request is effectively a NOP as it passes through the pipe. DECERRs are routed through SCF, or the
bypass path based on the normal parameters of the request. Since a DECERR may have an illegal
address, and handling illegal requests is a burden we do not Want every memory resource to deal
with, all DECERR requests are directed to DRAM; to the DRAM channel indicated by the channel
mask decode, ignoring all BOM and TOM registers. Writes. with DECERRs are suppressed and reads
with DECERRs return all 1's.
In general, the unit that detects a DECERR, generates/an interrupt for it (under configuration
register control).
DRAM ECC errors are detected in EMC. EMC corrects single-bit errors and optionally logs them
(frequent single-bit errors may indicate an.inaminent hardware failure). Uncorrectable double-bit
errors set the slave error (SLVERR) flag ithe data packet, are logged, and optionally generate an
interrupt. The SLVERR bit is propagated up to the client.
Pipeline ECC errors are detected imthe unit that receives the data (whether MSS or a requesting
unit). Single-bit errors are corrected’and may optionally be logged. Uncorrectable double-bit errors
set the SLVERR flag in the data.packet, are logged, and optionally generate an interrupt.
The SLVERR bit is propagated:up to the client.
NVLink protocol errors aré detected by NVLink logic based on detectable corruption of a request.
The error is logged and.anjinterrupt optionally generated. The logic detecting the error may kill the
request or forward it-on, whichever is most convenient, since there's no obvious way to fix it anda
hang is likely to resultin any case.
Parity errors indicate corruption of the command or address. The error is logged and an interrupt
optionally generated. The logic detecting the parity error may kill the request or forward it on,
whichever is most convenient, since there is no obvious way to fix it and a hang is likely to result in
any case.
The client AXI interface returns both the DECERR and SLVERR bits. Typically, at most one is set, but
if both-are set, DECERR prevails. Clients may or may not observe, or act on error responses.

```
</details>


<!-- Page 88 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

###### 3.1.2.18 Access Checks (DECERRs)

SMMU performs access checks based on page-table access restrictions. Requests that fail are marked as DECERRs.

The NVLink protection table performs address-based access checks for iGPU and NVLink Master requests.

In addition, there are several categories of access checks, which ensure requests are legal and that they follow the access rules for apertures:

Address Range Checks VPR Checks GSC Checks AON TZ-SRAM Checks TZ-DRAM Checks SMMU Translation Checks iGPU Carveout Checks

3.1.2.18.1 Location of Access Checks

These additional security and range access checks are performed in the security check blocks in one of two locations:

SoC client requests at the input of MCFSlice . Previously, SoC client checks were done within the two client hubs. Now there are four or more client hubs, plus GPU requests come in separately from the hubs. The location minimizes the number of instances of the security check logic, while protecting all SoC client inputs, whether coherent or not. If a request fails a security check, it causes a DECERR. Details of the violating request (address, client ID, failure ID) are logged in the MC_ERR_* registers. DECERR write requests are suppressed by clearing byte enables. DECERR read requests return all 1's, thus preventing dissemination of secure data. If interrupts are enabled, MC throws an interrupt. CCPLEX requests at the ingress to SCF . CPU cluster requests are checked the ingress of SCF for the same reason as above—to distinguish CCPLEX requests from SoC client requests in systems that can forward and merge requests. Since no lookup is needed for these tests, the latency can be folded into an existing pipeline stage. If a request fails a security check it is DECERRed. If the request came from a CPU client, an MCA event is generated with a code indicating the type of event (it is not necessarily an error). If the request came from a non- CPU client, no error logging is done. DECERR write requests are suppressed by clearing byte enables. DECERR read requests return all 1's, thus preventing dissemination of secure data.

Note that SoC client requests that enter SCF are guaranteed to have been fully checked for DECERRs. They do not need to be further checked for DECERRs, although a given request may have its DECERR bit set based on a prior check.


<details>

<summary>OCR (Page 88)</summary>


```text

Memory Subsystem (MSS)
3.1.2.18 Access Checks (DECERRs)
SMMU performs access checks based on page-table access restrictions. Requests that fail are
marked as DECERRs.
The NVLink protection table performs address-based access checks for iGPU and/NVLink Master
requests.
In addition, there are several categories of access checks, which ensure requests are legal and that
they follow the access rules for apertures:
Address Range Checks
VPR Checks
GSC Checks
AON TZ-SRAM Checks
TZ-DRAM Checks
SMMU Translation Checks
iGPU Carveout Checks
3.1.2.18.1 Location of Access Checks
These additional security and range access checks are performed in the security check blocks in
one of two locations:
1. SoC client requests at the input of MCFSlice. Previously, SoC client checks were done within
the two client hubs. Now there are four or more client hubs, plus GPU requests come in
separately from the hubs. TheJacation minimizes the number of instances of the security
check logic, while protecting-all SoC client inputs, whether coherent or not. If a request fails a
security check, it causes.a(DECERR. Details of the violating request (address, client ID, failure
ID) are logged in the MCCERR_* registers. DECERR write requests are suppressed by clearing
byte enables. DECERR-read requests return all 1's, thus preventing dissemination of secure
data. If interrupts are.enabled, MC throws an interrupt.
2. CCPLEX requests at the ingress to SCF. CPU cluster requests are checked the ingress of
SCF for the same reason as above—to distinguish CCPLEX requests from SoC client requests
in systems that\can forward and merge requests. Since no lookup is needed for these tests,
the latency.can be folded into an existing pipeline stage. If a request fails a security check it
is DECERRed. If the request came from a CPU client, an MCA event is generated with a code
indicating the type of event (it is not necessarily an error). If the request came from a non-
CPU client, no error logging is done. DECERR write requests are suppressed by clearing byte
enables. DECERR read requests return all 1's, thus preventing dissemination of secure data.
Note that SoC client requests that enter SCF are guaranteed to have been fully checked for
DECERRs. They do not need to be further checked for DECERRs, although a given request may have
its(DECERR bit set based on a prior check.

```
</details>


<!-- Page 89 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

3.1.2.18.2 Routing and Memory Destination Errors

Requests are routed to the various memory destinations (DRAM, SysRAM, etc.) over multiple paths (IO coherent path and non-coherent path). Not all combinations are supported.

The following combinations are illegal and result in DECERRs and interrupts:

DECERR_COH_ISO – ISO requests on the coherent path

This error can be suppressed using the programmable register MC_MCF_SCF_CFG_0.ALLOW_ISO_REQ_ON_COHERENT_PATH  (default is to DECERR).

DECERR_IGPU_RESTRICTED_ACCESS – iGPU is only allowed to access specific regions of memory as defined by IGPU_ACCESSIBLE_CARVEOUT(1|2)_(BOM|SIZE)

The status register MC_ERR_ROUTE_SANITY_STATUS_0 contains the encoding ERR_ROUTE_SANITY_ERR_TYPE which describes the kind of error.  MC_ERR_ROUTE_SANITY_ADR_0 contains the address of the violating transaction. A new bit, DECERR_ROUTE_SANITY_INT, in the MC_INTSTATUS indicates routing related programming errors.

###### 3.1.2.19 Reporting of Functional Errors

Each of the following MSS subunits can generate interrupts to inform software of completed events or error conditions encountered by the hardware. The table below gives the subunit and the subunit's primary interrupt status register.

Table 3.5 Subunit and Primary Interrupt Status Register

Module Interrupt Status Register

MCF MC_INTSTATUS_0*

HUB MC_HUB_INSTATUS_0

HUB_COMMON MC_HUBC_INTSTATUS_0

SyncPoint MC_MSS_SBS_INTSTATUS_0

MC Channel MC_CH_INTSTATUS_0

EMC EMC_INTSTATUS

Note : MC_INSTATUS_0 is the legacy interrupt status register.

Each of the subunits ideally contains the three interrupt registers below, but in some cases only contains the first two:

INTSTATUS. Contains the interrupt vector. A bit in this register is set when the hardware detects the specific condition that triggers the interrupt. Writing a 1 to the interrupt vector bit clears the associated interrupt.


<details>

<summary>OCR (Page 89)</summary>


```text

Memory Subsystem (MSS)
3.1.2.18.2 Routing and Memory Destination Errors
Requests are routed to the various memory destinations (DRAM, SysRAM, etc.) over multiple paths
(lO coherent path and non-coherent path). Not all combinations are supported.
The following combinations are illegal and result in DECERRs and interrupts:
= DECERR_COH_ISO - ISO requests on the coherent path
° This error can be suppressed using the programmable register
MC_MCF_SCF_CFG_0.ALLOW_ISO_REQ_ON_COHERENT_PATH (default is to DECERR).
= DECERR_IGPU_RESTRICTED_ACCESS - iGPU is only allowed to access specific regions of
memory as defined by IGPU_ACCESSIBLE_CARVEOUT(1|2)_(BOM{SIZE)
The status register MC_ERR_LROUTE_SANITY_STATUS_O contains.the encoding
ERR_ROUTE_SANITY_ERR_TYPE which describes the kind of error. MC_ERR_ROUTE_SANITY_ADR_O
contains the address of the violating transaction. A new bit, DBECERR_ROUTE_SANITY_INT, in the
MC_INTSTATUS indicates routing related programming erfors.
3.1.2.19 Reporting of Functional Errors
Each of the following MSS subunits can generatevinterrupts to inform software of completed
events or error conditions encountered by the-hardware. The table below gives the subunit and the
subunit's primary interrupt status register.
Table 3.5 Subunit and Primary Interrupt Status Register
Module Interrupt Status Register
MCF MC_INTSTATUS_0O*
HUB MC_HUB_INSTATUS_O.
HUB_COMMON MC_HUBC_INTSTATUS_O
SyncPoint MC_MSS_SBS_INTSTATUS_O
MC Channel MC_CH_INTSTATUS_O
EMC EMC_INTSTATUS
Note: MC_INSTATUS_O is the legacy interrupt status register.
Each of the.subunits ideally contains the three interrupt registers below, but in some cases only
contains:the first two:
1. ANTSTATUS. Contains the interrupt vector. A bit in this register is set when the hardware
detects the specific condition that triggers the interrupt. Writing a 1 to the interrupt vector
bit clears the associated interrupt.

```
</details>


<!-- Page 90 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

INTMASK. Contains mask vector for the interrupt vector. Each bit in this register corresponds to a bit in INTSTATUS. If the MASK bit for an interrupt is set (UNMASKED), the corresponding interrupt is forwarded to the global interrupt logic on the non-critical wire. INTPRIORITY. (Not implemented in all units) Contains priority mask vector for the interrupt vector. Each bit in this register corresponds to a bit in INTSTATUS. If the MASK bit for an interrupt is set (UNMASKED), the corresponding interrupt is forwarded to the global interrupt logic on the critical wire.

Some subunits have two wires to the global interrupt status logic in HUB-common, and others have only the non-critical wire:

intr – interrupt signal to global interrupt logic in HUB-common critical_intr – critical interrupt signal to global interrupt logic in HUB-common

For error conditions, ERR_*STATUS registers are provided to log information on the cause of the error (generally the address of the offending transaction, which could be virtual or physical), and other information relevant to the error.

3.1.2.19.1 Global Interrupt Interface

Global interrupt logic in HUB-common aggregates the incoming signals from the subunits and exports the following signals to the interrupt processing logic in LIC:

mss2lic_mc_critical_intr – OR of incoming critical_intr signals, indicating critical interrupt is active mss2lic_mc_intr – OR of incoming intr signals, indicating non-critical interrupt is active.

Each TCU generates secure and non-secure interrupts, and they are routed directly to LIC:

mss2lic_smmu_comb_nonsecure_intr – non-secure interrupt from TCU0 mss2lic_smmu_comb_secure_intr – secure interrupt from TCU0 mss2lic_smmu1_comb_nonsecure_intr – non-secure interrupt from TCU1 mss2lic_smmu1_secure_intr – secure interrupt from TCU1 mss2lic_smmu2_comb_nonsecure_intr – non-secure interrupt from TCU2 (ISO SMMU) mss2lic_smmu2_secure_intr – secure interrupt from TCU2 (ISO SMMU) mss2lic_smmu3_comb_nonsecure_intr – non-secure interrupt from TCU3 mss2lic_smmu3_comb_secure_intr – secure interrupt from TCU3 mss2lic_smmu4_comb_nonsecure_intr – non-secure interrupt from TCU4 mss2lic_smmu4_secure_intr – secure interrupt from TCU 4

The following registers within HUB-common show the status of the non-critical and critical input wires from each of the subunits:

MC_GLOBAL_INTSTATUS_0 MC_GLOBAL_INTSTATUS_1_0


<details>

<summary>OCR (Page 90)</summary>


```text

Memory Subsystem (MSS)
2. INTMASK. Contains mask vector for the interrupt vector. Each bit in this register corresponds
to a bit in INTSTATUS. If the MASK bit for an interrupt is set (UNMASKED), the corresponding
interrupt is forwarded to the global interrupt logic on the non-critical wire.
3. INTPRIORITY. (Not implemented in all units) Contains priority mask vector forthe interrupt
vector. Each bit in this register corresponds to a bit in INTSTATUS. If the MASKbit for an
interrupt is set (UNMASKED), the corresponding interrupt is forwarded to. the global interrupt
logic on the critical wire.
Some subunits have two wires to the global interrupt status logic in HUB~common, and others have
only the non-critical wire:
* intr - interrupt signal to global interrupt logic in HUB-common
* critical_intr - critical interrupt signal to global interrupt logic in HUB-common
For error conditions, ERR_*STATUS registers are provided to loginformation on the cause of the
error (generally the address of the offending transaction, whichcould be virtual or physical), and
other information relevant to the error.
3.1.2.19.1 Global Interrupt Interface
Global interrupt logic in HUB-common aggregates the incoming signals from the subunits and
exports the following signals to the interrupt processing logic in LIC:
= mss2lic_mc_critical_intr - OR of incoming critical_intr signals, indicating critical interrupt is
active
mss2lic_mc_intr - OR of incoming/intr’signals, indicating non-critical interrupt is active.
Each TCU generates secure and non-secure interrupts, and they are routed directly to LIC:
= mss2lic_smmu_comb_nonseecure_intr - non-secure interrupt from TCUO
* mss2lic_smmu_comb_secure_intr - secure interrupt from TCUO
* mss2lic_smmu1_comb.snonsecure_intr - non-secure interrupt from TCU1
mss2lic_smmu1_secure_intr - secure interrupt from TCU1
mss2lic_smmu2_comb_nonsecure_intr - non-secure interrupt from TCU2 (ISO SMMU)
mss2lic_smmu2_sé€cure_intr - secure interrupt from TCU2 (ISO SMMU)
mss2lic_smmu3,comb_nonsecure_intr - non-secure interrupt from TCU3
mss2lic_smamu3_comb_secure_intr - secure interrupt from TCU3
mss2licssnamu4_comb_nonsecure_intr - non-secure interrupt from TCU4
mss2lic_smmu4_secure_intr - secure interrupt from TCU 4
The following registers within HUB-common show the status of the non-critical and critical input
wires from each of the subunits:
*SMC_GLOBAL_INTSTATUS_O
*" MC_GLOBAL_INTSTATUS_1_0

```
</details>


<!-- Page 91 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

MC_GLOBAL_CRITICAL_INTSTATUS_0 MC_GLOBAL_CRITICAL_INTSTATUS_1_0

3.1.2.19.2 MCF Interrupts (including interrupts from the SecChk block)

The SecChk security block in MCF implements numerous security checks. When an address decode error occurs, the offending address is captured in the MC_ERR_ADDR register and information about the error is captured in one or more MC_ERR_*STATUS registers. The captured information is intended to assist developers in debugging the error.

A single request can trigger multiple errors. There are multiple error status registers (MC_ERR_*STATUS) which capture the status of different types of errors, as listed below:

MC_ERR_STATUS – Multiple violations. When more than one of the following violations occurs, the highest-priority violation is reported (listed below in descending priority order):

ERR_TYPE = DECERR_EMEM – DRAM minimum/maximum allowed memory addresses ERR_TYPE = SECURITY_TRUSTZONE – TrustZone carveout violations

MC_ERR_GENERALIZED_CARVEOUT_STATUS – GSC carveout violations MC_ERR_SEC_STATUS – SEC carveout violations MC_ERR_VPR_STATUS – VPR carveout violations MC_ERR_ROUTE_SANITY_STATUS – Routing incompatibility errors (including NVLink access violations)

The capture registers record the following information about the error:

the physical address of the error (since security check is post SMMU) which type of fault the captured error corresponds to a read/write indicator the requestor Client ID the swap bit sent by the client

Subsequent errors (of any type) do not change the status and address registers until the corresponding interrupt is cleared.

To prevent requests with address decode errors from modifying memory or accessing memory they do not have permission to, the MC "squashes" the requests. A write request that is "squashed" has its byte-enables forced to all zeros; this prevents the write data from being applied to DRAM. A read request that is "squashed" has its read-return data forced to all-ones; this protects the data in DRAM from being read by nonsecure sources.

3.1.2.19.3 NVLink Interrupts

NVLink generates interrupts for malformed NVLink packets, unexpected responses, and NVLink protection table violations, etc.


<details>

<summary>OCR (Page 91)</summary>


```text

Memory Subsystem (MSS)
= MC_GLOBAL_CRITICAL_INTSTATUS_O
* MC_GLOBAL_CRITICAL_INTSTATUS_1_0
3.1.2.19.2 MCF Interrupts (including interrupts from the SecChk block)
The SecChk security block in MCF implements numerous security checks. When an address decode
error occurs, the offending address is captured in the MC_ERR_ADDR registerand information
about the error is captured in one or more MC_ERR_*STATUS registers. The ¢aptured information is
intended to assist developers in debugging the error.
A single request can trigger multiple errors. There are multiple error status registers
(MC_ERR_*STATUS) which capture the status of different types of errors, as listed below:
= MC_ERR_STATUS - Multiple violations. When more than one of the following violations
occurs, the highest-priority violation is reported (listed below in descending priority order):
° ERR_TYPE = DECERR_EMEM - DRAM minimum/maximum allowed memory addresses
e ERR_TYPE = SECURITY_TRUSTZONE - TrustZone_carveout violations
MC_ERR_GENERALIZED_CARVEOUT_STATUS - GSC.carveout violations
MC_ERR_SEC_STATUS - SEC carveout violations
MC_ERR_VPR_STATUS - VPR carveout violations
MC_ERR_ROUTE_SANITY_STATUS - Routing’ incompatibility errors (including NVLink access
violations)
The capture registers record the followinginformation about the error:
* the physical address of the error (Since security check is post SMMU)
* which type of fault the captured’error corresponds to
" a read/write indicator
= the requestor Client ID
= the swap bit sent by the client
Subsequent errors (of any type) do not change the status and address registers until the
corresponding interrupt is cleared.
To prevent requests.with address decode errors from modifying memory or accessing memory
they do not have‘permission to, the MC "squashes" the requests. A write request that is "squashed"
has its byte-enables forced to all zeros; this prevents the write data from being applied to DRAM. A
read request that is "squashed" has its read-return data forced to all-ones; this protects the data in
DRAM from being read by nonsecure sources.
3.1.2:1913 NVLink Interrupts
NVbink generates interrupts for malformed NVLink packets, unexpected responses, and NVLink
protection table violations, etc.

```
</details>


<!-- Page 92 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Memory Subsystem (MSS)

3.1.2.19.4 Memory Controller Channel Interrupts

There is currently only one performance warning type interrupt: ARBITRATION_EMEM. It fires when the MC detects that a request has been pending in the Row Sorter long enough to hit the DEADLOCK_PREVENTION_SLACK_THRESHOLD. In addition to true performance problems, this interrupt may fire in situations like clock frequency changes, when the EMC backpressures pending traffic for long periods of time. This interrupt is intended to help developers identify and debug performance and configuration issues.

3.1.2.19.5 EMC Interrupts

EMC generates interrupts on the following conditions:

ECC error buffer overflow ECC correctable error ECC uncorrectable error Clock change FIFO overflow DLL lock timeout DLL alarm: From the EMC Digital DLL when the output delay code reaches the maximum value. Attempt to issue command to device which is in self-refresh. Read data from MRR is available (to prevent software from polling for data) DRAM clock change sequence complete Refresh overflow

3.1.2.19.6 PCIe MSI

Message Signaled Interrupts (MSIs) are interrupts conveyed from an endpoint device to the interrupt controller by memory transactions, rather than dedicated wires.

PCIe MSIs are 32-bit ordered writes received by the PCIe root port (an MSS client) with system physical addresses that fall within the 64MB MSI address region specified by msi_base (iob_msi_base_match/iob_msi_base_mask) where address bits 25-16 are greater than 31, address bits 25-16 are less than 992, and address bits 15-0 are 0x0000.

The MSS Hub routes PCIE MSIs through the SMMU to ensure that devices can only trigger interrupts assigned to the device.  MSS Hub routes MSIs to SCF regardless of other considerations. SCF decodes the MSI address range and forwards MSIs to the IOBridge/GIC.

MSIs are required to push all previous writes to visibility before the MSI is sent to the interrupt controller. Because GIC is a separate destination in SCF, the standard ordered write implementation for PCIe writes to memory do not provide the required ordering guarantees for MSI messages. MSI ordering is provided by an interlock in the PCIe controller that waits for WriteAcks of all previously issued writes before forwarding an MSI. Because ordering is handled externally and not by the


<details>

<summary>OCR (Page 92)</summary>


```text

Memory Subsystem (MSS)
3.1.2.19.4 Memory Controller Channel Interrupts
There is currently only one performance warning type interrupt: ARBITRATION_EMEMelt fires when
the MC detects that a request has been pending in the Row Sorter long enough tothit’the
DEADLOCK_PREVENTION_SLACK_THRESHOLD. In addition to true performance_problems, this
interrupt may fire in situations like clock frequency changes, when the EMC backpressures pending
traffic for long periods of time. This interrupt is intended to help developers identify and debug
performance and configuration issues.
3.1.2.19.5 EMC Interrupts
EMC generates interrupts on the following conditions:
ECC error buffer overflow
ECC correctable error
ECC uncorrectable error
Clock change FIFO overflow
DLL lock timeout
DLL alarm: From the EMC Digital DLL when the output delay code reaches the maximum
value.
Attempt to issue command to device which is in self-refresh.
Read data from MRR is available (to prevent software from polling for data)
DRAM clock change sequence complete
Refresh overflow
3.1.2.19.6 PCle MSI
Message Signaled Interrupts (MSIS) are interrupts conveyed from an endpoint device to the
interrupt controller by memory-transactions, rather than dedicated wires.
PCle MSls are 32-bit ordered writes received by the PCle root port (an MSS client) with system
physical addresses thatfall within the 64MB MSI address region specified by msi_base
(iob_msi_base_match/iob_msi_base_mask) where address bits 25-16 are greater than 31, address
bits 25-16 are less-than 992, and address bits 15-0 are OxOOOO.
The MSS Hub-routes PCIE MSIs through the SMMU to ensure that devices can only trigger
interrupts assigned to the device. MSS Hub routes MSls to SCF regardless of other considerations.
SCF decodes the MSI address range and forwards MSls to the IOBridge/GIC.
MSls are ‘required to push all previous writes to visibility before the MSI is sent to the interrupt
controller. Because GIC is a separate destination in SCF, the standard ordered write implementation
for PGle writes to memory do not provide the required ordering guarantees for MSI messages. MSI
ordering is provided by an interlock in the PCle controller that waits for WriteAcks of all previously
issued writes before forwarding an MSI. Because ordering is handled externally and not by the

```
</details>


<!-- Page 93 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

MSS Registers

ordered write mechanism in SCF, MSS Hub converts MSIs to non-ordered writes before sending to MCF.

###### 3.1.2.20 Clocking

There are separate PLLs for each set of 64 DRAM I/O pads. These four PLLs drive a clocking structure with locally synchronous clocks for the following clock domains:

Each set of 64 DRAM I/O pads and associated four EMC and four Memory Controller Channels The hub units: MCF, SCF, Client Hubs, and MSS HubCommon Data Backbone (DBB)

###### 3.1.2.21 Software Interfaces

The primary software interface for configuration is via the APB bus registers.

Initial configuration Power management Device/Rank management SMMU translation management Surface allocation Statistics and debugging

##### 3.1.3 MSS Registers

The Memory Subsystem (MSS) is controlled by NVIDIA provided software, and so is not documented in detail here. However, some registers are exposed to support customers, and these are listed below.

MC_EMEM_ADR_CFG_CHANNEL_ENABLE_0

External memory address configuration channel select mask configures the routing of requests between the two memory channels. The channel select mask is ANDed with the address of a transaction. The resulting value is XORd to a single bit, which is used to select the channel for the transaction Boot requirements:

coldboot - This register should be parameterized in the BCT and written by the BootROM during coldboot. warmboot - This register should be saved in the scratch registers and restored by the BootROM during warmboot.

Mask bits [10:9] select single channel vs. dual-channel modes and 512B vs. 1KB interleave as follows, each with its own physical address to <channel, device,="" row,="" bank,="" column=""> mapping.


<details>

<summary>OCR (Page 93)</summary>


```text

MSS Registers
ordered write mechanism in SCF, MSS Hub converts MSls to non-ordered writes before sending to
MCF.
3.1.2.20 Clocking
There are separate PLLs for each set of 64 DRAM I/O pads. These four PLLs drive a clocking
structure with locally synchronous clocks for the following clock domains:
" Each set of 64 DRAM I/O pads and associated four EMC and four Memory Controller
Channels
= The hub units: MCF, SCF, Client Hubs, and MSS HubCommon
= Data Backbone (DBB)
3.1.2.21 Software Interfaces
The primary software interface for configuration is via the APB bus registers.
* Initial configuration
= Power management
= Device/Rank management
= SMMU translation management
* Surface allocation
= Statistics and debugging
3.1.3 MSS Registers
The Memory Subsystem (MSS) is controlled by NVIDIA provided software, and so is not
documented in detail here. However, some registers are exposed to support customers, and these
are listed below.
MC_EMEM_ADR_CFG_CHANNEL_ENABLE_O
External memory address configuration channel select mask configures the routing of requests
between the two memory channels. The channel select mask is ANDed with the address of a
transaction. The resulting value is XORd to a single bit, which is used to select the channel for the
transaction Bootequirements:
* coldboot: This register should be parameterized in the BCT and written by the BootROM
during Coldboot.
* warmboot - This register should be saved in the scratch registers and restored by the
BootROM during warmboot.
Maskjbits [10:9] select single channel vs. dual-channel modes and 512B vs. 1KB interleave as
follows, each with its own physical address to <channel, device,="" row,="" bank,="" column="">
mapping.

```
</details>


<!-- Page 94 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

MSS Registers

Interleave MASK[10:9] Remarks Single channel 2'b00 512B 2'bx1 Channels alternate on (most) 512B boundaries 1KB 2'b10 Channels alternate on (most) 1KB boundaries

While decoding the DRBC data from the address: if mask bit 9 is set then the 9th bit of address is dropped for DRBC decoding; and else if mask bit 10 is set then the 10th bit address is dropped for address decoding.

Write access to this register is controlled by the EMEM_CFG_ACCESS_CTRL_0 register </channel,>.

Offset: 0xdf8 Read/Write: R/W Parity Protection: Y Shadow: N SCR Protection: 0 Reset: 0x0000000f (0bxxxx,xxxx,xxxx,xxxx,0000,0000,0000,1111)

Bit Reset Description

15:0 0xf EMEM_CHANNEL_ENABLE : [PMC_SECURE] Selects which MC channels are enabled for normal read/writes

MC_EMEM_ADR_CFG_CHANNEL_MASK_0

Write access to this register is controlled by the EMEM_CFG_ACCESS_CTRL register

Offset: 0x60 Read/Write: R/W Parity Protection: Y Shadow: N SCR Protection: 0 Reset: 0x6db66200 (0b0110,1101,1011,0110,0110,001x,xxxx,xxxx)

Bit Reset Description

31:9 0x36db31 EMEM_CHANNEL_MASK : [PMC_SECURE] Mask is ANDed with address and the resulting value is XORd to a single bit, giving bit 0 of the channel index

MC_EMEM_ADR_CFG_CHANNEL_MASK_1_0

Write access to this register is controlled by the EMEM_CFG_ACCESS_CTRL register

Offset: 0xdfc Read/Write: R/W


<details>

<summary>OCR (Page 94)</summary>


```text

MSS Registers
Interleave MASK[10:9] Remarks
Single channel 2'boo
512B 2'bx1 Channels alternate on (most) 512B boundaries
1KB 2'b10 Channels alternate on (most) 1KB boundaries
While decoding the DRBC data from the address: if mask bit 9 is set then the 9thrbitvof address is
dropped for DRBC decoding; and else if mask bit 10 is set then the 10th bit address is dropped for
address decoding.
Write access to this register is controlled by the EMEM_CFG_ACCESS_CTRL_0 register </channel,>.
Offset: Oxdf8
Read/Write: R/W
Parity Protection: Y
Shadow: N
SCR Protection: O
Reset: OxOOOOOOOF (Obxxxx,xxxx,XXXX,XXXX,0000,0000,0000, Th1)
Bit Reset Description
15:0 Oxf EMEM_CHANNEL-ENABLE:
[PMC_SECURE] Selects which MC channels are enabled for normal
read/writes
MC_EMEM_ADR_CFG_CHANNEL_MASK_O
Write access to this register is controlled.by the EMEM_CFG_ACCESS_CTRL register
Offset: Ox60
Read/Write: R/W
Parity Protection: Y
Shadow: N
SCR Protection: O
Reset: Ox6db66200 (Ob0 /10;1 101,1011,0110,01 10,00 1x,xxxx,xxxx)
Bit Reset Description
31:9 Ox36db31 EMEM_CHANNEL_MASK:
[PMC_SECURE] Mask is ANDed with address and the resulting value
is XORd to a single bit, giving bit O of the channel index
MC_EMEMxADR_CFG_CHANNEL_MASK_1_0
Write aceess to this register is controlled by the EMEM_CFG_ACCESS_CTRL register
Offset: Oxdfc
Read/Write: R/W

```
</details>


<!-- Page 95 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

MSS Registers

Parity Protection: Y Shadow: N SCR Protection: 0 Reset: 0x6db66400 (0b0110,1101,1011,0110,0110,010x,xxxx,xxxx)

Bit Reset Description

31:9 0x36db32 EMEM_CHANNEL_MASK_1 : [PMC_SECURE] Mask is ANDed with address and the resulting value is XORd to a single bit, giving bit 1 of the channel index

MC_EMEM_ADR_CFG_CHANNEL_MASK_2_0

Write access to this register is controlled by the EMEM_CFG_ACCESS_CTRL register

Offset: 0xdf4 Read/Write: R/W Parity Protection: Y Shadow: N SCR Protection: 0 Reset: 0x6db66800 (0b0110,1101,1011,0110,0110,100x,xxxx,xxxx)

Bit Reset Description

31:9 0x36db34 EMEM_CHANNEL_MASK_2 : [PMC_SECURE] Mask is ANDed with address and the resulting value is XORd to a single bit, giving bit 2 of the channel index

MC_EMEM_ADR_CFG_CHANNEL_MASK_3_0

Write access to this register is controlled by the EMEM_CFG_ACCESS_CTRL register

Offset: 0xdf0 Read/Write: R/W Parity Protection: Y Shadow: N SCR Protection: 0 Reset: 0x6db67000 (0b0110,1101,1011,0110,0111,000x,xxxx,xxxx)

Bit Reset Description

31:9 0x36db38 EMEM_CHANNEL_MASK_3 : [PMC_SECURE] Mask is ANDed with address and the resulting value is XORd to a single bit, giving bit 2 of the channel i ndex


<details>

<summary>OCR (Page 95)</summary>


```text

MSS Registers
Parity Protection: Y
Shadow: N
SCR Protection: O
Reset: Ox6db66400 (0b0110,1101,1011,01 10,01 10,010x,xxxx,xxxx)
Bit Reset Description
31:9 Ox36db32 EMEM_CHANNEL_MASK_1:
[PMC_SECURE] Mask is ANDed with address and the resulting value
is XORd to a single bit, giving bit 1 of the channel index
MC_EMEM_ADR_CFG_CHANNEL_MASK_2_0
Write access to this register is controlled by the EMEM_CFG_ACCESS_CTRL register
Offset: Oxdf4
Read/Write: R/W
Parity Protection: Y
Shadow: N
SCR Protection: O
Reset: Ox6db66800 (0b0110,1101,1011,0110,01 10/00x,xxxx,xxxx)
Bit Reset Description
31:9 0x36db34 EMEM_CHANNEL_MASK_2:
[PMC_SECURE] Mask is ANDed with address and the resulting value
is,XORd to a single bit, giving bit 2 of the channel index
MC_EMEM_ADR_CFG_CHANNEL_MASK_3_0
Write access to this register is controlled by the EMEM_CFG_ACCESS_CTRL register
Offset: OxdfO
Read/Write: R/W
Parity Protection: Y
Shadow: N
SCR Protection: O
Reset: Ox6db67000\(0b0110,1101,1011,01 10,01 1 1,000x,xxxx,xxxx)
Bit Reset Description
31:9 0x36db38 EMEM_CHANNEL_MASK_3:
[PMC_SECURE] Mask is ANDed with address and the resulting value
is XORd to a single bit, giving bit 2 of the channel i ndex

```
</details>


<!-- Page 96 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Address Map

### 3.2 Address Map

##### 3.2.1 Overview

This chapter defines the system Address Map (AMAP).

The term “Address” reflects the Physical Address as seen by the main CPU complex, unless specified otherwise. The SoC has several subsystems such as the BPMP, SPE, Audio, etc. The processors in these subsystems may have a different view of the System AMAP. The AMAP specifications for these subsystems are explained in more detail in the corresponding subsystem section of this document.

The term AMAP implies System Address Map or Global Address Map (with the terms System Address Map and Global Address Map being used interchangeably), unless otherwise specified.

###### 3.2.1.1 Features

64 KiB Alignment

Arm Architecture recommends aligning all peripheral address ranges along the MMU page sizes. This enables each device to occupy a single entry in the Page Table and makes it possible to uniquely identify and describe device access attributes. The page can be uniquely classified under a non-normal memory type such as nGnRnE (for SO) or nGnRE (for DEV). Refer to the ARMv8 Architecture Reference Manuals for more information. Page-alignment of peripherals also improves security across virtualized guest Operating Systems. Armv8 supports three types of page sizes in its MMU: 4 KiB, 16 KiB, and 64 KiB. By aligning with 64 KiB, all three implementations are supported and sufficient MMIO for each device is allocated.

40-bit Address Map

The SoC supports a one Terabyte AMAP (1 TiB or 40 bits of addressing).

PCIe Aperture

The SoC offers two apertures for PCIe: one for a 32-bit address OS and the other for a greater-than 32-bit address OS. Each PCIe controller is provided with a 32 MiB aperture. The PCIe aperture for greater-than 32-bit address OS handles situations with large AMAP requirements, which cannot be addressed by drivers running on a 32-bit address OS.


<details>

<summary>OCR (Page 96)</summary>


```text

Address Map
3.2 Address Map
3.2.1 Overview
This chapter defines the system Address Map (AMAP).
The term “Address” reflects the Physical Address as seen by theymain CPU complex, unless
specified otherwise. The SoC has several subsystems such as the-BPMP, SPE, Audio, etc. The
processors in these subsystems may have a different view of the System AMAP. The AMAP
specifications for these subsystems are explained in more detail in the corresponding subsystem
section of this document.
The term AMAP implies System Address Map or Global\Address Map (with the terms System
Address Map and Global Address Map being used interchangeably), unless otherwise specified.
3.2.1.1 Features
* 64 KiB Alignment
Arm Architecture recommends aligning all peripheral address ranges along the MMU page
sizes. This enables each devicesto occupy a single entry in the Page Table and makes it
possible to uniquely identifyand describe device access attributes. The page can be
uniquely classified under‘a non-normal memory type such as nGnRnE (for SO) or nGnRE
(for DEV). Refer to the ARMv8 Architecture Reference Manuals for more information.
Page-alignment of peripherals also improves security across virtualized guest Operating
Systems. Armv8 supports three types of page sizes in its MMU: 4 KiB, 16 KiB, and 64 KiB.
By aligning with 64 KiB, all three implementations are supported and sufficient MMIO for
each device is allocated.
* 40-bit Address,Map
The SoG.supports a one Terabyte AMAP (1 TiB or 40 bits of addressing).
= PCle Aperture
The-SoC offers two apertures for PCle: one for a 32-bit address OS and the other for a
greater-than 32-bit address OS. Each PCle controller is provided with a 32 MiB
aperture. The PCle aperture for greater-than 32-bit address OS handles situations with
large AMAP requirements, which cannot be addressed by drivers running on a 32-bit
address OS.

```
</details>


<!-- Page 97 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Address Map

###### 3.2.1.2 AMAP and Aperture

The SoC supports a 1-Terabyte AMAP (40 bits). See below for a high-level overview of the AMAP.

Table 3.6 AMAP Overview

Name Address Range

Reserved (1023 GiB - 1024 GiB) 0xFF_C000_0000 - 0xFF_FFFF_FFFF

Off-Chip Aperture (256 GiB - 1023 GiB) 0x40_0000_0000 - 0xFF_BFFF_FFFF

PCIe Reconfigurable Aperture for > 32-bit OS (130 GiB - 256 GiB) (1)

0x20_8000_0000 - 0x3F_FFFF_FFFF

DRAM Aperture (2 GiB - 130 GiB) 0x00_8000_0000 - 0x20_7FFF_FFFF

On-Chip Data/Sync Plane (1 GiB - 2 GiB) 0x00_4000_0000 - 0x00_7FFF_FFFF

PCIe Reconfigurable Aperture for 32-bit OS (640 MB - 1 GiB) 0x00_3000_0000 - 0x00_3FFF_FFFF

MMIO Aperture (0 GiB - 640 MB) 0x00_0000_0000 - 0x00_3FFF_FFFF

The control plane extends beyond 4 GiB for PCIe controllers controlled by > 32-bit OS.


<details>

<summary>OCR (Page 97)</summary>


```text

Address Map
3.2.1.2 AMAP and Aperture
The SoC supports a 1-Terabyte AMAP (40 bits). See below for a high-level overview ofthe AMAP.
Table 3.6 AMAP Overview
Name Address Range
Reserved (1023 GiB - 1024 GiB) OxFF_COO0_0000 - OxFF3FRFF_FFFF
Off-Chip Aperture (256 GiB - 1023 GiB) 0x40_0000_0000 -,OxFF¢BFFF_FFFF
PCle Reconfigurable Aperture for > 32-bit OS (130 GiB - 256 Ox20_8000_0000\- 0x3F_FFFF_FFFF
Gi)"
DRAM Aperture (2 GiB - 130 GiB) 0x00_800030000 - 0x20_7FFF_FFFF
On-Chip Data/Sync Plane (1 GiB - 2 GiB) Ox00_4000_0000 - OxO0_7FFF_FFFF
PCle Reconfigurable Aperture for 32-bit OS (640 MB - 1 GiB) Ox0033000_0000 - OxO0_3FFF_FFFF
MMIO Aperture (0 GiB - 640 MB) Ox@0_0000_0000 - 0x00_3FFF_FFFF
1. The control plane extends beyond 4 GiB for PCle controllers controlled by > 32-bit OS.

```
</details>


<!-- Page 98 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Address Map

Figure 3.4 AMAP Diagram

###### 3.2.1.3 MMIO Aperture

The MMIO aperture begins at the bottom of memory (0x0) and extends to 1 GiB.


<details>

<summary>OCR (Page 98)</summary>


```text

adr tly
Figure 3.4 AMAP Diagram Y
_ TOM=
OxFF_FFFF_FFFF
~OxFF_C000_0000 aA GB-
3.2.1.3 MMIO Aperture)
The MMIO aperture begins at the bottom of memory (0x0) and extends to 1 GiB.
gy NVIDIA CONFIDENTIAL
re) NVIDIA Orin Series System-on-Chip DP-10508-001_v1.2 | Page 98

```
</details>


<!-- Page 99 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Address Map

Figure 3.5 MMIO Aperture

This region houses the following apertures:

Configuration register apertures of all IPs of the SoC 144 MiB iGPU aperture PCIe aperture for 32-bit OS in its top 384 MiB. This is used for configuration, MMIO, IOIO space and is accessible by 32-bit OS. (Note: the APE only decodes apertures below 0.75 GiB to the control backbone, so it cannot access PCIe. Since the High Definition Audio (HDA) controller sits under the 0.75 GiB range, there is no need for APE to ever access any PCIe controller.)

Each PCIe controller is provided with a 32 MiB aperture. PCIe APB configuration space is disjointed from this space and can live anywhere outside this range.

###### 3.2.1.4 On-Chip Data/Sync Plane Aperture

The following figure shows the On-Chip Data/Sync Plane aperture.


<details>

<summary>OCR (Page 99)</summary>


```text

Address Map
Figure 3.5 MMIO Aperture
1 GiB—
640 MiB—
512 MiB—
368 MiB—
MiB—
This region houses the following apertures:
* Configuration register apertures of all IPs of the-SoC
* 144 MiB iGPU aperture
* PCle aperture for 32-bit OS in its top 384 MiB. This is used for configuration, MMIO, lOIO
space and is accessible by 32-bit OS.
(Note: the APE only decodes apertures-below 0.75 GiB to the control backbone, so it cannot
access PCle. Since the High Definition Audio (HDA) controller sits under the 0.75 GiB range,
there is no need for APE to ever access any PCle controller.)
° Each PCle controller is providedwith a 32 MiB aperture.
° PCle APB configuration space. is disjointed from this space and can live anywhere outside
this range.
3.2.1.4 On-Chip Data/Sync Plane Aperture
The following figure shows the On-Chip Data/Sync Plane aperture.

```
</details>


<!-- Page 100 -->

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

Address Map

Figure 3.6 On-Chip Data/Sync Plane Aperture

This region houses the following:

The SysRAM region starting at 1 GiB. A 256 MiB region is reserved, although physical SysRAM Size is 512 KiB. 256 MiB allows for a higher steering granularity at the System Coherency Fabric (SCF) in the CCPLEX. All CPUs should access SysRAM at this physical location, without the need of any address translation. The 4 MiB Compute Vision SRAM (CV-SRAM), used by Programmable Vision Accelerators (PVAs) and Deep Learning Accelerators. A 256 MiB region is reserved for this similarly to SysRAM. The dGPU Host Controller Sync Point aperture. This is a 64 MiB Sync Point Region that is used to convert the dGPU's semaphores into Host Controller sync points. Note that this region can also be used by any non Host Controller clients. This region shadows the Sync Point RAM in Host Controller using a sideband interface between Host Controller and Memory. Previously, the GPU needed a sideband interface into the Host Controller Sync Point to talk to any other Host Controller client. With this Sync Point region, the sideband with Host Controller is removed from the GPU. Reserved region beyond the dGPU Sync Point aperture.

###### 3.2.1.5 DRAM Aperture

The DRAM aperture is used for the Physical Address of the off-chip local DRAM. The AMAP supports up to 128 GiB of DRAM. A 32-bit OS can access the lower 2 GiB Physical DRAM location (AMAP region from 2 GiB to 4 GiB). In order to access DRAM above 4 GiB in the AMAP, a 32-bit OS must use an additional address translation capability like AST or the SMMU.


<details>

<summary>OCR (Page 100)</summary>


```text

ra\ .
Address
Figure 3.6 On-Chip Data/Sync Plane Aperture
GiB+320 MiB—
4 GiB+256 MiB—
1 GiB—
This region houses the following: op
* The SysRAM region starting at 1 GiB. A 256 iBYegion is reserved, although physical SysRAM
Size is 512 KiB. 256 MiB allows for a ihe tering granularity at the System Coherency
Fabric (SCF) in the CCPLEX. All CPUs shoul cess SysRAM at this physical location, without
the need of any address translation. 7
The 4 MiB Compute Vision SRAM meses used by Programmable Vision Accelerators
(PVAs) and Deep Learning Accelerators» A 256 MiB region is reserved for this similarly to
SysRAM.
* The dGPU Host Controller Sync Roint aperture. This is a 64 MiB Sync Point Region that is
used to convert the dGPU's s hores into Host Controller sync points. Note that this
region can also be used by on Host Controller clients. This region shadows the Sync
Point RAM in Host Contro! sing a sideband interface between Host Controller and
Memory. Previously, the needed a sideband interface into the Host Controller Sync
Point to talk to any ot Host Controller client. With this Sync Point region, the sideband
with Host Controlle emoved from the GPU.
* Reserved region beyond the dGPU Sync Point aperture.
Ver
3.2.1.5 DRA erture
Nae
The DRAM a avre is used for the Physical Address of the off-chip local DRAM. The AMAP
supports up 28 GiB of DRAM. A 32-bit OS can access the lower 2 GiB Physical DRAM location
(AMAP. rear from 2 GiB to 4 GiB). In order to access DRAM above 4 GiB in the AMAP, a 32-bit OS
must use-an additional address translation capability like AST or the SMMU.
gy NVIDIA CONFIDENTIAL
e) NVIDIA Orin Series System-on-Chip DP-10508-001_v1.2 | Page 100

```
</details>
