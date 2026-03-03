Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

###### Image Signal Processor (ISP)

## 7.2.4 Image Signal Processor (ISP)

### 7.2.4.1 Overview

##### The Image Signal Processor (ISP) processes camera sensor data to produce high-quality images for the rest of the system. It is intended to support a broad range of applications including automotive applications and video for conferencing and analytics.

##### The ISP consists of the following processing units:

##### Frontend (FE) Pixel Reconstruction Unit (PRU) Affine Transform (AT) Lens Shader (LS) Area Processor (AP) Down scaler (DS) Transfer Function (TF) Local Average and Clip (LAC) Histogram (H) Flicker Band (FB) Sharpening (SHARP) DMX

##### The following block diagram shows the internal architecture of the ISP. A pixel cross-bar allows pixel data to flow between the various processing units, while various memory interfaces slow data to be transferred between the ISP and DRAM. The color coding shows at a high level where functional safety features are supported.


<details>

<summary>OCR (Page 1)</summary>


```text

Image Signal Processor (ISR)
7.2.4 Image Signal Processor (ISP)
7.2.4.1 Overview
The Image Signal Processor (ISP) processes camera sensor data to produce high-quality images for
the rest of the system. It is intended to support a broad range of applications including automotive
applications and video for conferencing and analytics.
The ISP consists of the following processing units:
= Frontend (FE)
Pixel Reconstruction Unit (PRU)
Affine Transform (AT)
Lens Shader (LS)
Area Processor (AP)
Down scaler (DS)
Transfer Function (TF)
Local Average and Clip (LAC)
Histogram (H)
Flicker Band (FB)
Sharpening (SHARP)
= DMX
The following block diagram shows the,internal architecture of the ISP. A pixel cross-bar allows
pixel data to flow between the various processing units, while various memory interfaces slow data
to be transferred between the ISPsand DRAM. The color coding shows at a high level where
functional safety features are Supported.

```
</details>

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

###### Image Signal Processor (ISP)

##### Figure 7.25 Top-Level ISP Block Diagram

### 7.2.4.2 Frontend

##### The Front-End (FE) unit of the ISP interfaces with Host1x, includes a Falcon microcontroller, and coordinates context switching and error handling.


<details>

<summary>OCR (Page 2)</summary>


```text

Image Signal processor (OR
Figure 7.25 Top-Level ISP Block Diagram
State Memory State Restore (MSR) 5
Pixel Data Memory Read (MR)
| BAD] PRU
CRC for Periodic 155
le]
acai ie
}-t-{__ Histogram (HO - Bt
ke istogram (Hi SS <>
| ———————_
7.2.4.2 Fron
The Front-End (FE) unit of the ISP interfaces with Host1x, includes a Falcon microcontroller, and
coordinates.cantext switching and error handling.
RS)

```
</details>

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

###### Image Signal Processor (ISP)

##### Figure 7.26 Frontend Block Diagram


<details>

<summary>OCR (Page 3)</summary>


```text

Image Signal processor (2h)
Figure 7.26 Frontend Block Diagram Y
HOST1X
HWR Bus Decoder HRD
Fags OffseBE Data buffer
[___'sP Falcon axni/p” |
re.
we NVIDIA Orin Series System-on-Chip DP-10508-001_v1.2 | Page 5119

```
</details>

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

###### Image Signal Processor (ISP)

##### Figure 7.27 Falcon Safety Block Diagram

### 7.2.4.3 Pixel Reconstruction Unit

##### The Pixel Reconstruction Unit (PRU) can support fusing the output of multiexposure HDR sensors into a single image. The PRU has the following operations:

##### Optical black level correction of multiple Bayer domain exposures White balance correction across multiple Bayer domain exposures Fusion of multiple Bayer domain exposures to a single HDR (HDR) Bayer image Correction of defective pixels and outliers

##### The data flow diagram of HDR fusion in the PRU is shown below.


<details>

<summary>OCR (Page 4)</summary>


```text

Image Signal Processor (ISI
Technical Reference vega
Figure 7.27 Falcon Safety Block Diagram
FALCON
Elements NA for Safety Falcons.in Xavier SoC
Normal elements H ve)
Elements NA for Salety Falcons in Xavier SoC except NVLINK.
7.2.4.3 Pixel Reconstruction, Unit
The Pixel Reconstruction Unit (P can support fusing the output of multiexposure HDR sensors
into a single image. The PRU h e following operations:
* Optical black level cor, ction of multiple Bayer domain exposures
* White balance correct n across multiple Bayer domain exposures
* Fusion of multiplé Bayer domain exposures to a single HDR (HDR) Bayer image
* Correction of defective ixels and outliers
N P
The data now aan of HDR fusion in the PRU is shown below.
@ NVIDIA CONFIDENTIAL
e) NVIDIA Orin Series System-on-Chip DP-10508-001_v1.2 | Page 5120

```
</details>

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

###### Image Signal Processor (ISP)

##### Figure 7.28 Pixel Reconstruction Unit Data Flow Diagram

##### The HDR fusion is done on a per-pixel basis across multiple (up to three) exposures and produces a single HDR image. Note that the overall ISP throughput is independent of the number of input exposures. The PRU processing is performed at the beginning of the ISP pipeline immediately following memory read. An arbitrary 2x2 color filter array (CFA) pattern is supported.

##### Figure 7.29 PRU and ISP Pipeline

##### The PRU is designed to provide the HDR fusion and defective pixel correction functionality for all anticipated use cases targeted by the ISP. The use cases include:

##### Automotive HDR image and video capture using HDR sensors Mobile and embedded image and video capture using non-HDR sensors Machine-vision processing pipelines Human-visual processing pipelines

### 7.2.4.4 Affine Transform

##### There are three Affine Transform (AT) units and each can perform a set of linear operations on pixels. See also the Transfer Function (TF) unit, which performs a set of nonlinear operations in a similar manner.

##### Typical AT operations:

##### Black level adjustment White balance Color space conversion (CSC) Color correction matrix


<details>

<summary>OCR (Page 5)</summary>


```text

Image Signal Processor (ISR)
Figure 7.28 Pixel Reconstruction Unit Data Flow Diagram
Saturation
Metric
Up to three pees tok fs te Eaposure WOR
Balance = Scaling = Fusion
Up to 14 bits =a
ae y
per exposure
The HDR fusion is done on a per-pixel basis across multiple (up to three) exposures and produces a
single HDR image. Note that the overall ISP throughput is independent of the number of input
exposures. The PRU processing is performed at the beginning ofthe ISP pipeline immediately
following memory read. An arbitrary 2x2 color filter array (CFA)pattern is supported.
Figure 7.29 PRU and ISP Pipeline
Rest of
Memary Up to three eau HDR gps Ch Memary
Read Exposures image bigutina Write
The PRU is designed to provide the HDR fusion and defective pixel correction functionality for all
anticipated use cases targeted by the ISP\The use cases include:
= Automotive HDR image and video.capture using HDR sensors
* Mobile and embedded image,and video capture using non-HDR sensors
* Machine-vision processing_pipelines
= Human-visual processing pipelines
7.2.4.4 Affine Transform
There are three Affin@Transform (AT) units and each can perform a set of linear operations on
pixels. See also thesTransfer Function (TF) unit, which performs a set of nonlinear operations in a
similar manner.
Typical AT operations:
* Blacklevel adjustment
« White balance
= (Golor space conversion (CSC)
~ Color correction matrix

```
</details>

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

###### Image Signal Processor (ISP)

##### The AT unit can operate on Bayer data, or RGB or YUV data. The AT unit also supports an optional fourth component called Auxiliary or Alpha. This is true on both input and output. When Auxiliary data are present on the RGB/YUV datapath, the pixel bus is referred to as RGBA or YUVA. The Auxiliary component can also be used with Bayer data, in which it is separated into four different subtypes of Auxiliary components based on the Bayer phase.

##### The Auxiliary component of the TL pixels is referred to as ATL. Similarly, that of the TR pixels are ATR, that of the BL pixels are ABL, and that of the BR pixels are ABR. Note that AT is one of the few units that can generate an Auxiliary component on the output when none is present on the input because all the components can influence each other.

##### As shown in the following top-level block diagram, the AT unit can be placed anywhere in the crossbar. It operates on Bayer or RGB/YUV data. If the input data is Bayer, its output data is always Bayer. If the input data is RGB/YUV, its output data is also RGB/YUV. For RGB/YUV operations, the output type is the same as the input type, because AT can perform CSC between RGB and YUV. One of the common uses of AT is to convert RGB data to YUV data.

##### Figure 7.30 Affine Transform Top-Level Block Diagram

### 7.2.4.5 Lens Shader

##### The Lens Shader (LS) unit is intended to compensate for vignetting, which is a reduction of image brightness at the periphery compared to the image center. There are many types of vignetting: natural vignetting, optical vignetting, pixel/sensor/mechanical vignetting, and so on. While some of these affect light with different wavelengths with similar magnitude and phase, most do not. Consequently, the vignetting or lens shading effect is sometimes different for different color pixels. For example, the lens-shading surface for Red (Red pixels in Bayer data, or Red channel in RGB data) is different from that of Green and Blue.

##### Luminance Shading is lens shading that is the same for all color pixels. To correct the Luminance Shading, only one lens-shading correction surface is needed for all four Bayer pixels of Bayer data, one surface for all three channels of RGB data, and one surface that applies to Y of YUV data.

##### Color/Chroma Shading is lens shading that is different for different colors. To compensate for Color/Chroma Shading, four correction surfaces for Bayer data are needed, three surfaces for RGB data, and two surfaces that apply to U and V of YUV data.

##### The LS unit consists of two different LS subunits. The first one is a rectangular grid-based method that uses Bezier patches to model the lens-shading surfaces using the Cartesian coordinate system, while the second subunit is a radial-based method that models the surfaces using the polar coordinate system. Both Bezier LS and Radial LS have the storage for four LS surfaces, and therefore can correct both Color/Chroma Shading and Luminance Shading. While the Bezier LS can


<details>

<summary>OCR (Page 6)</summary>


```text

Image Signal Processor (ISR)
The AT unit can operate on Bayer data, or RGB or YUV data. The AT unit also supports an optional
fourth component called Auxiliary or Alpha. This is true on both input and output. When-Auxiliary
data are present on the RGB/YUV datapath, the pixel bus is referred to as RGBA or YUVA=The
Auxiliary component can also be used with Bayer data, in which it is separated into four different
subtypes of Auxiliary components based on the Bayer phase.
The Auxiliary component of the TL pixels is referred to as ATL. Similarly, that of the TR pixels are
ATR, that of the BL pixels are ABL, and that of the BR pixels are ABR. Note that.AT is one of the few
units that can generate an Auxiliary component on the output when none‘s present on the input
because all the components can influence each other.
As shown in the following top-level block diagram, the AT unit can be,placed anywhere in the
crossbar. It operates on Bayer or RGB/YUV data. If the input data is Bayer, its output data is always
Bayer. If the input data is RGB/YUV, its output data is also RGB/YUV, For RGB/YUV operations, the
output type is the same as the input type, because AT can perform CSC between RGB and YUV.
One of the common uses of AT is to convert RGB data to YUV-data.
Figure 7.30 Affine Transform Top-Level Block Diagram
Bayer Affine Bayer
—— |]
RGB/YUV Transform RGB/YUY.
7.2.4.5 Lens Shader
The Lens Shader (LS) unit is intended*to compensate for vignetting, which is a reduction of image
brightness at the periphery compared'to the image center. There are many types of vignetting:
natural vignetting, optical vignetting,-pixel/sensor/mechanical vignetting, and so on. While some of
these affect light with different wavelengths with similar magnitude and phase, most do not.
Consequently, the vignetting orléns shading effect is sometimes different for different color
pixels. For example, the lens-shading surface for Red (Red pixels in Bayer data, or Red channel in
RGB data) is different from that of Green and Blue.
Luminance Shading is lens shading that is the same for all color pixels. To correct the Luminance
Shading, only one lens=shading correction surface is needed for all four Bayer pixels of Bayer data,
one surface for alhthree channels of RGB data, and one surface that applies to Y of YUV data.
Color/Chroma-Shading is lens shading that is different for different colors. To compensate for
Color/Chroma-Shading, four correction surfaces for Bayer data are needed, three surfaces for RGB
data, and two'surfaces that apply to U and V of YUV data.
The LS.unit consists of two different LS subunits. The first one is a rectangular grid-based method
that uses Bezier patches to model the lens-shading surfaces using the Cartesian coordinate
system, while the second subunit is a radial-based method that models the surfaces using the
polar coordinate system. Both Bezier LS and Radial LS have the storage for four LS surfaces, and
therefore can correct both Color/Chroma Shading and Luminance Shading. While the Bezier LS can

```
</details>

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

###### Image Signal Processor (ISP)

##### theoretically correct all LS effects without the Radial LS, the Radial LS might perform the full LS correction poorly by itself on certain sensors. sSome of the LS effects such as those caused by the sensor micro-lenses and the pixel/sensor/mechanical designs might not be radial. It is recommended that the Radial LS be used to correct the Luminance Shading or the cosine fourth falloff, and the Bezier LS be used to correct the residues.

##### As shown in the following top-level block diagram, the LS unit can be placed anywhere in the crossbar. It operates on Bayer or RGB/YUV data and outputs the data in the same type as the input.

##### Figure 7.31 Lens Shading Top-Level Block Diagram

### 7.2.4.6 Area Processor

##### The Area Processor (AP) subunit of the ISP handles three key functions: Demosaic, Noise Reduction, and Local Tone Mapping.

##### The AP supports the following key features:

##### Simultaneous CV + HV output Four independent 9x9 demosaic kernels Demosaic Bypass Chroma Artifact Removal Chroma Desaturation Noise Reduction (NRNLM) Local Tone Mapping (LTM) Detail Enhancement Output 4x4 Matrix

##### Figure 7.32 Area Processor Subsystem


<details>

<summary>OCR (Page 7)</summary>


```text

Image Signal Processor (ISR)
theoretically correct all LS effects without the Radial LS, the Radial LS might perform the-fullLS
correction poorly by itself on certain sensors. sSome of the LS effects such as those caused by the
sensor micro-lenses and the pixel/sensor/mechanical designs might not be radial. It is
recommended that the Radial LS be used to correct the Luminance Shading or the cosine fourth
falloff, and the Bezier LS be used to correct the residues.
As shown in the following top-level block diagram, the LS unit can be placed anywhere in the
crossbar. It operates on Bayer or RGB/YUV data and outputs the data in theysame type as the
input.
Figure 7.31 Lens Shading Top-Level Block Diagram
Bayer
RGB/YUV
Lens Bayer
Shading RGB/YUV
7.2.4.6 Area Processor
The Area Processor (AP) subunit of the ISP handles‘three key functions: Demosaic, Noise
Reduction, and Local Tone Mapping.
The AP supports the following key features:
Simultaneous CV + HV output
Four independent 9x9 demosaic kernels
Demosaic Bypass
Chroma Artifact Removal
Chroma Desaturation
Noise Reduction (NRNLM)
Local Tone Mapping (LEM)
Detail Enhancement
Output 4x4 Matrix
Figure 7.32 Area Processor Subsystem
Yadhance
DM [_» NRNLM LT™M
, csc socom
YW Vyopsce

```
</details>

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

###### Image Signal Processor (ISP)

#### 7.2.4.6.1 Demosaic

##### The AP unit exists at the heart of the ISP and is responsible for providing the conversion of the Bayer Mosaic of pixels to YUV or RGB pixels. The demosaic process results in each photo site having synthesized data representing the missing channels seen in the RAW Bayer image.

#### 7.2.4.6.2 Noise Reduction, Non-Local Means

##### The Noise Reduction Non-Local Means (NRNLM) unit is designed to provide noise-reduction capabilities for the ISP.

##### The NRNLM unit provides for noise reduction in still and video-image capture models through the application of a block matching algorithm applied in the spatial domain. The filter provides for noise reduction by identifying pixels in a fixed window surrounding the generation point, which display similarity to the pixel being filtered. The signal to noise improvement through pixel averaging is the fundamental principle being exploited through the application of the algorithm.

##### The NRNLM block is a subunit within the AP unit that receives pixels as input, filters them, and then provides the processed pixels to the Local Tone Mapping (LTM) block for additional processing. Following the LTM, the image data is available to additional resources to enhance, format, and deliver the image data to system memory.

##### The NRNLM unit provides the primary noise reduction capability for all use cases targeted by the ISP. These use cases include:

##### Automotive HDR image and video capture using split pixel HDR sensors Mobile and handheld image and video capture using non-HDR sensors Machine-vision processing pipelines Human-visual processing pipelines

#### 7.2.4.6.3 Local Tone-Mapping

##### The Local Tone-Mapping (LTM) unit can reduce the dynamic range of HDR images in a manner that preserves local contrast.

##### Background

##### The human visual system is complex and has evolved to cope with extreme lighting conditions such as those found on a sunny day. Under such conditions, there may be a very large variation in illumination from areas in direct illumination, to areas that are in deep shadow. Yet the human visual system can cope with these conditions and allows us to see details in both bright areas and dark areas at the same time. Contrast this with a typical camera sensor and visual display. These devices usually have a very limited ability to express brightness levels. This presents a challenge to capture and display scenes that have the kinds of extreme lighting described above. Recent advances have


<details>

<summary>OCR (Page 8)</summary>


```text

Image Signal Processor (ISR)
7.2.4.6.1 Demosaic
The AP unit exists at the heart of the ISP and is responsible for providing the conversion of the
Bayer Mosaic of pixels to YUV or RGB pixels. The demosaic process results in each photo site
having synthesized data representing the missing channels seen in the RAW Bayer image.
7.2.4.6.2 Noise Reduction, Non-Local Means
The Noise Reduction Non-Local Means (NRNLM) unit is designed to provide’noise-reduction
capabilities for the ISP.
The NRNLM unit provides for noise reduction in still and video-image’capture models through the
application of a block matching algorithm applied in the spatial domain. The filter provides for
noise reduction by identifying pixels in a fixed window surrounding the generation point, which
display similarity to the pixel being filtered. The signal to noiseimprovement through pixel
averaging is the fundamental principle being exploited through the application of the algorithm.
The NRNLM block is a subunit within the AP unit that receives pixels as input, filters them, and
then provides the processed pixels to the Local Tone Mapping (LTM) block for additional
processing. Following the LTM, the image data is available to additional resources to enhance,
format, and deliver the image data to system memory.
The NRNLM unit provides the primary noise réduction capability for all use cases targeted by the
ISP. These use cases include:
= Automotive HDR image and videocapture using split pixel HDR sensors
* Mobile and handheld image and.video capture using non-HDR sensors
* Machine-vision processing pipelines
* Human-visual processing pipelines
7.2.4.6.3 Local Tone-Mapping
The Local Tone-Mapping (LTM) unit can reduce the dynamic range of HDR images in a manner that
preserves local contrast:
Background
The human visual system is complex and has evolved to cope with extreme lighting conditions such
as those foufd’on a sunny day. Under such conditions, there may be a very large variation in
illuminationfrom areas in direct illumination, to areas that are in deep shadow. Yet the human visual
system can cope with these conditions and allows us to see details in both bright areas and dark
areas atthe same time. Contrast this with a typical camera sensor and visual display. These devices
usually have a very limited ability to express brightness levels. This presents a challenge to capture
and-display scenes that have the kinds of extreme lighting described above. Recent advances have

```
</details>

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

###### Image Signal Processor (ISP)

##### been made to allow camera sensors to capture data with a HDR. However, there remains a challenge to store and display such HDR content.

##### Chief among these challenges is the ability to maintain local relative contrast in the displayed image. A naïve approach to displaying the HDR content would be to map the linear input data from the camera sensor to display pixel levels in such a way that attaches equal importance to every brightness level. After all, the human visual system exhibits a roughly logarithmic sensitivity to light levels. However, such an approach would render the scene as visually “flat,” completely lacking the local contrast that is so desirable. Such mappings are termed Global Tone Mapping .

##### A better approach is to map regions of similar tone together, preserving their relative tonal contrast relationships. In other words, light and dark areas within a generally well-lit region would preserve their property of being light and dark. Similar contrast relationships in dark shadow areas would also be preserved. Moreover, it is possible that dark areas in brightly lit parts of the scene may end up being darker than bright areas in shadow regions in the final output image. Even though the former may have had a sensor that output value orders of magnitude brighter than the latter. This kind of local contrast-preserving tone mapping is termed Local Tone Mapping . This is the task for which this unit is designed.

##### Figure 7.33 Context Block Diagram Showing Connections to Other Units Within the ISP


<details>

<summary>OCR (Page 9)</summary>


```text

Image Signal Processor (ISR)
been made to allow camera sensors to capture data with a HDR. However, there remains a
challenge to store and display such HDR content.
Chief among these challenges is the ability to maintain local relative contrast in the. displayed
image. A naive approach to displaying the HDR content would be to map the linear.input data from
the camera sensor to display pixel levels in such a way that attaches equal importance to every
brightness level. After all, the human visual system exhibits a roughly logarithmicsensitivity to light
levels. However, such an approach would render the scene as visually “flat,” completely lacking the
local contrast that is so desirable. Such mappings are termed Global Tone Mapping.
A better approach is to map regions of similar tone together, preserving their relative tonal
contrast relationships. In other words, light and dark areas within a generally well-lit region would
preserve their property of being light and dark. Similar contrast relationships in dark shadow areas
would also be preserved. Moreover, it is possible that dark areas(in brightly lit parts of the scene
may end up being darker than bright areas in shadow regionsdnthe final output image. Even
though the former may have had a sensor that output valuetorders of magnitude brighter than the
latter. This kind of local contrast-preserving tone mapping. is termed Local Tone Mapping. This is
the task for which this unit is designed.
Figure 7.33 Context Block Diagram Showing Connections to Other Units Within the ISP
Sub-units in the
AP-NR partition
Sub-units in the
Local Tone Mapping AP-LTM partition
PartA
Formatter
Local Tone
Mapping Part B
5S SS SS Pixel
t Value Detail
Enhancement
L Mod.
TSS eee eee f ! Register
RGB 1 Decode
PrinfaryOutput (YUV) csc/CCM 1

```
</details>

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

###### Image Signal Processor (ISP)

##### The shaded blocks show the extent of the LTM unit, which is split into Part A and Part B. Part A is physically located in the NR partition of the Areal Processor, and Part B is located in the LTM partition.

##### Pixel data will enter on the left from the NLM Noise Reduction block and from the CSC/CCM block. The LTM uses the line delay elements in the NRNLM unit to allow it to process image areas. Within the LTM there are three main functional blocks: tone key generator, global tone statistics generator, and pixel value modification block. The modified pixel values exit the right side, along with statistics about the image tone.

##### The LTM is designed to enable software to control the mapping of input image tonal values to output tonal values, while simultaneously maintaining local contrast and color saturation. This is achieved by programming the hardware registers that control the LTM. In order to aid the programming software in the task of assigning values to these registers, statistics about the tonal content of the image is provided by the LTM hardware. This statistical information can be analyzed to provide information such as black points, white points, and general tonal distribution. This may influence the programming of the various transfer functions, which ultimately control the output image tone, contrast, and color saturation.

##### It should be noted that since the statistics information may require an entire frame time to accumulate, there may be a one-frame latency between the arrival of a frame and the correct application of the programmed values to the following frame of data. Care should be taken that this does not result in significant visual artifacts when the tonal content is rapidly changing. For example, it is suggested that the significance of the soft tone key is reduced when it is detected that the scene-tonal content is rapidly changing. This may reduce local contrast, but it is more desirable than the large swings in the perceived tone. This can result from the one-frame delay in application of the average tone information in the form of the soft tone key.

### 7.2.4.7 Down scaler

##### There are three Down Scaler (DS) units, which filter and resample in order to produce a smaller version of the input image. Two DS units are intended to generate primary output images, and the third is intended to produce thumbnail images. DS uses an Infinite Impulse Response (IIR) filter instead of the more typical FIR filter employed in scalers. A second-order Butterworth IIR filter with only two delay elements can achieve similar performance to a FIR filter with tens of delay elements.


<details>

<summary>OCR (Page 10)</summary>


```text

Image Signal Processor (ISR)
The shaded blocks show the extent of the LTM unit, which is split into Part A and Part B. Part’A is
physically located in the NR partition of the Areal Processor, and Part B is located in the-LTM
partition.
Pixel data will enter on the left from the NLM Noise Reduction block and from the.CSC/CCM block.
The LTM uses the line delay elements in the NRNLM unit to allow it to process image areas. Within
the LTM there are three main functional blocks: tone key generator, global tone statistics
generator, and pixel value modification block. The modified pixel values exit the-right side, along
with statistics about the image tone.
The LTM is designed to enable software to control the mapping of input image tonal values to
output tonal values, while simultaneously maintaining local contrast and color saturation. This is
achieved by programming the hardware registers that control the LTM. In order to aid the
programming software in the task of assigning values to these registers, statistics about the tonal
content of the image is provided by the LTM hardware. This statistical information can be analyzed
to provide information such as black points, white points, andsgéneral tonal distribution. This may
influence the programming of the various transfer functions, which ultimately control the output
image tone, contrast, and color saturation.
It should be noted that since the statistics informatidn-may require an entire frame time to
accumulate, there may be a one-frame latency between the arrival of a frame and the correct
application of the programmed values to the following frame of data. Care should be taken that
this does not result in significant visual artifactswhen the tonal content is rapidly changing. For
example, it is suggested that the significanceof the soft tone key is reduced when it is detected
that the scene-tonal content is rapidly changing. This may reduce local contrast, but it is more
desirable than the large swings in the perceived tone. This can result from the one-frame delay in
application of the average tone information in the form of the soft tone key.
7.2.4.7 Down scaler
There are three Down Scaler(DS) units, which filter and resample in order to produce a smaller
version of the input image..Two DS units are intended to generate primary output images, and the
third is intended to produce thumbnail images. DS uses an Infinite Impulse Response (IIR) filter
instead of the more typical FIR filter employed in scalers. A second-order Butterworth IIR filter with
only two delay elements can achieve similar performance to a FIR filter with tens of delay
elements.

```
</details>

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

###### Image Signal Processor (ISP)

##### Figure 7.34 Scaler Top-Level Block Diagram

##### Each scaler consists of an IIR filter implementing a second-order Butterworth filter. Final output resampling for the horizontal scaler uses a linear interpolator to blend between adjacent outputs of the filter.

##### Figure 7.35 Downscaler Block Diagram

##### The block diagram above shows the two halves of the down scaler which is the Horizontal Scaler and the Vertical Scaler. It also shows how these are connected to the crossbar, and either a SHARP subunit or an Auto-Focus Metric (AFM) subunit, dependent on which down scaler is being considered. The crossbar is used to connect the down scaler to other subunits within the ISP.

##### In the ISP, there are three-horizontal/vertical scaler pairs (each pair is referred to simply as a DS), to allow the scaling of three images independently. These scalers are referred to as DS0, DS1, and DS2. DS0 and DS1 connect to one SHARP subunit each and DS2 connects to an AFM subunit. The reason for the asymmetry is that DS2 will generate a thumbnail image to be used exclusively for this purpose, in addition to providing a reduced resolution input image for the AFM. Since the AFM


<details>

<summary>OCR (Page 11)</summary>


```text

Image Signal Processor (ISR)
Figure 7.34 Scaler Top-Level Block Diagram
Line
Stores
IN Horizontal Vertical | ST
Scaler Scaler
Each scaler consists of an IIR filter implementing a second-order Butterworth filter. Final output
resampling for the horizontal scaler uses a linear interpolator to,/blend between adjacent outputs of
the filter.
Figure 7.35 Downscaler Block Diagram
Horizontal Scaler Vertical Scaler
| |
| 1 | |
| 1! |
| 1! \
| |! ° >a |
| Phase 1 / 5 5 Phase |
| Accumulator 1! % w Accumulator |
| ; | ss £ |
| 1 /
| 1 / |
DS | | | \ DS
IN i i OUT
| Horizontal t Vertical
I | Fitter ™N Filter
| Kn | \
| - | -
i tines | Linear
1 Interpojator. \ | interpolator |
SHARP
AFM
ISP signal routing Crossbar
The block diagramabove shows the two halves of the down scaler which is the Horizontal Scaler
and the Vertical‘Scaler. It also shows how these are connected to the crossbar, and either a SHARP
subunit or an-Auto-Focus Metric (AFM) subunit, dependent on which down scaler is being
considered. The crossbar is used to connect the down scaler to other subunits within the ISP.
In the-|SP;there are three-horizontal/vertical scaler pairs (each pair is referred to simply as a DS), to
allowcthe scaling of three images independently. These scalers are referred to as DSO, DS1, and
DS2. DSO and DS1 connect to one SHARP subunit each and DS2 connects to an AFM subunit. The
reason for the asymmetry is that DS2 will generate a thumbnail image to be used exclusively for
this purpose, in addition to providing a reduced resolution input image for the AFM. Since the AFM

```
</details>

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

###### Image Signal Processor (ISP)

##### cannot operate on large images and these large images are likely to be user visible (and hence may need image quality enhancement in the form of sharpening), the SHARP subunits are attached to DS0 and DS1 only.

### 7.2.4.8 Sharp

##### The SHARP functional unit is a subunit within the Image Signal Processor (ISP).

##### Following all the processing steps and scaling to the correct output resolution, it may be required to enhance the perceived visual quality of the output image by increasing contrast along object edges. This gives the impression of a sharper, and clearer image. The method used in the SHARP subunit is an Un-Sharp Mask (USM) algorithm.

##### There are two SHARP subunits. Each one is connected to the output of one of the three Down Scaler (DS) subunits. Note that one of the DS subunits does not have a SHARP subunit attached, but has the AFM subunit attached instead. These connections are fixed. The outputs of the two SHARP subunits connect to the Crossbar subunit. Since the inputs of the associated DS subunits are also connected to the Crossbar subunit, each of the two DS-SHARP pairs can be independently connected to any other subunit in the ISP that is also connected to the Crossbar.

##### Figure 7.36 Sharp Function Block Diagram

##### The diagram above shows the general layout of the SHARP subunit. Pixel data enters from the left, is first filtered vertically, to produce the low-pass filtered signal G V , then low pass filtered horizontally with the Horizontal Filter to produce the final low-pass filtered signal G. This signal, along with a delayed version of the input, L 1 , is passed to the Un-Sharp Mask (USM) block, where most of the actual sharpening operation takes place. Note that the block diagram applies to each of the three input color components. This triplication has not been shown for clarity.


<details>

<summary>OCR (Page 12)</summary>


```text

Image Signal Processor (ISR)
cannot operate on large images and these large images are likely to be user visible (and hence may
need image quality enhancement in the form of sharpening), the SHARP subunits are attached to
DSO and DS1 only.
7.2.4.8 Sharp
The SHARP functional unit is a subunit within the Image Signal Processor (ISP).
Following all the processing steps and scaling to the correct output resolution, it may be required
to enhance the perceived visual quality of the output image by increasing ‘contrast along object
edges. This gives the impression of a sharper, and clearer image. Thesmethod used in the SHARP
subunit is an Un-Sharp Mask (USM) algorithm.
There are two SHARP subunits. Each one is connected to the output of one of the three Down
Scaler (DS) subunits. Note that one of the DS subunits doestnot/have a SHARP subunit attached,
but has the AFM subunit attached instead. These connections are fixed. The outputs of the two
SHARP subunits connect to the Crossbar subunit. Since-the inputs of the associated DS subunits
are also connected to the Crossbar subunit, each of the’two DS-SHARP pairs can be independently
connected to any other subunit in the ISP that is also connected to the Crossbar.
Figure 7.36 Sharp Function Block Diagram
line store 3
line store 2
Horizontal
line store 1 Filter
Vertical Filter
line store 0
USM OUT
The diagram*above shows the general layout of the SHARP subunit. Pixel data enters from the left,
is first filtered vertically, to produce the low-pass filtered signal Gy, then low pass filtered
horizontally with the Horizontal Filter to produce the final low-pass filtered signal G. This signal,
along-with a delayed version of the input, Lj, is passed to the Un-Sharp Mask (USM) block, where
mostof the actual sharpening operation takes place. Note that the block diagram applies to each
ofthe three input color components. This triplication has not been shown for clarity.

```
</details>

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

###### Image Signal Processor (ISP)

### 7.2.4.9 Transfer Function

##### There are two Transfer Function (TF) units, which each performs a set of nonlinear operations on pixels. See also the Affine Transform (AT) unit, which performs a set of linear operations in a similar manner.  The nonlinear operation is implemented by a programmable curve per pixel channel.  Each curve is implemented as a cubic Hermite spline with 18 control points with arbitrary spacing.

##### Typical TF Non-Linear Operations:

##### Gamma correction Contrast Saturation Posterization Solarization Tone Mapping

##### The TF unit supports an optional fourth component called Auxiliary or Alpha. This is true on both input and output. When Auxiliary data are present on the RGB/YUV datapath, the pixel bus is referred to as RGBA or YUVA. The Auxiliary component can also be used with Bayer data, in which case we separate it into four different subtypes of Auxiliary component based on the Bayer phase.

##### The Auxiliary component of the TL pixels is referred to as ATL. Similarly, that of the TR pixels are ATR, that of the BL pixels are ABL, and that of the BR pixels are ABR.

##### As shown in the following top-level block diagram, the TF unit can be placed anywhere in the crossbar. It operates on Bayer or RGB/YUV data and outputs the data in the same type as the input.

##### Figure 7.37 Transfer Function Top-Level Block Diagram

### 7.2.4.10 Local Average and Clip

##### The Local Average and Clip (LAC) unit creates local averages of the pixel values within a small rectangle of the image. Many such rectangles are arranged across the image effectively giving a low-resolution version of the image to allow software algorithms to determine various parameters of the image.

##### The LAC unit has the capability to use clipping to exclude pixels that are too dark or too bright from the average by defining a range to be used for the average calculation. This allows, for


<details>

<summary>OCR (Page 13)</summary>


```text

Image Signal Processor (ISR)
7.2.4.9 Transfer Function
There are two Transfer Function (TF) units, which each performs a set of nonlinear operations on
pixels. See also the Affine Transform (AT) unit, which performs a set of linear operations in a similar
manner. The nonlinear operation is implemented by a programmable curve per pixel channel. Each
curve is implemented as a cubic Hermite spline with 18 control points with arbitrary spacing.
Typical TF Non-Linear Operations:
= Gamma correction
= Contrast
* Saturation
= Posterization
* Solarization
= Tone Mapping
The TF unit supports an optional fourth component callédAuxiliary or Alpha. This is true on both
input and output. When Auxiliary data are present on. the-RGB/YUV datapath, the pixel bus is
referred to as RGBA or YUVA. The Auxiliary component, can also be used with Bayer data, in which
case we separate it into four different subtypes of)Auxiliary component based on the Bayer phase.
The Auxiliary component of the TL pixels is referred to as ATL. Similarly, that of the TR pixels are
ATR, that of the BL pixels are ABL, and that ofthe BR pixels are ABR.
As shown in the following top-level block diagram, the TF unit can be placed anywhere in the
crossbar. It operates on Bayer or RGB/YUV data and outputs the data in the same type as the
input.
Figure 7.37 Transfer Function Top-Level Block Diagram
Bayer Transfer Bayer
—_—
RGB/YUV Fupetion RGB/YUV
7.2.4.10 LocalAverage and Clip
The Local Average and Clip (LAC) unit creates local averages of the pixel values within a small
rectangle of the image. Many such rectangles are arranged across the image effectively giving a
low-resolution version of the image to allow software algorithms to determine various parameters
of the image.
The LAG unit has the capability to use clipping to exclude pixels that are too dark or too bright
from-the average by defining a range to be used for the average calculation. This allows, for

```
</details>

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

###### Image Signal Processor (ISP)

##### example, totally saturated pixels from over-exposure to be excluded from the average. The LAC will report the number of clipped pixels.

##### The ISP supports analysis of up to four regions of interest (ROIs) in the image. Each ROI supports a maximum of 32x32 LAC windows. The size of the ROIs is programmable and they are allowed to overlap. The ISP also supports an elliptical mask to be programmed to support a fisheye lens, with programmable center position, major and minor axis, and tilt angle of the ellipse. Any pixels outside the ellipse are excluded from the analysis and their count is reported.

##### As shown in the following top-level block diagram, the LAC unit can be placed anywhere in the crossbar. It produces the LAC statistics from Bayer or RGB/YUV data, while leaving the data completely unchanged.

##### Figure 7.38 LAC Top-Level Block Diagram

### 7.2.4.11 Histogram

##### Histogram (H) is a representation of the tonal distribution in the image. It plots the number of pixels for each tonal value. Histogram provides very useful statistics that can be used in many algorithms such as Auto Exposure, Auto White Balance, and Tone Mapping.

##### The histogram output has 256 bins per histogram. The bin width and center points are flexible and can be assigned to linear or logarithmic bin sizes and widths.


<details>

<summary>OCR (Page 14)</summary>


```text

Image Signal Processor (ISR)
example, totally saturated pixels from over-exposure to be excluded from the average. The LAC will
report the number of clipped pixels.
The ISP supports analysis of up to four regions of interest (ROIs) in the image. Each. RO! supports a
maximum of 32x32 LAC windows. The size of the ROIs is programmable and they,are allowed to
overlap. The ISP also supports an elliptical mask to be programmed to support a-fisheye lens, with
programmable center position, major and minor axis, and tilt angle of the ellipse. ‘Any pixels outside
the ellipse are excluded from the analysis and their count is reported.
As shown in the following top-level block diagram, the LAC unit can be placed anywhere in the
crossbar. It produces the LAC statistics from Bayer or RGB/YUV data, while leaving the data
completely unchanged.
Figure 7.38 LAC Top-Level Block Diagram
Bayer Bayer
y' LAC y'
RGB/YUV RGB/YUV
LAC Statistics
7.2.4.11 Histogram
Histogram (H) is a representation of the‘tonal distribution in the image. It plots the number of
pixels for each tonal value. Histogram*provides very useful statistics that can be used in many
algorithms such as Auto Exposure,Auto White Balance, and Tone Mapping.
The histogram output has 256sbins per histogram. The bin width and center points are flexible and
can be assigned to linear or logarithmic bin sizes and widths.

```
</details>

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

###### Image Signal Processor (ISP)

##### Figure 7.39 Histogram High-Level Block Diagram

### 7.2.4.12 Flicker Band

##### The alternating current (AC) is the most popular way in which electric power is delivered to businesses and residences. Some artificial lights such as fluorescent lamps that are powered by AC will flicker when their supply current reverses direction. This flickering is invisible to people, but is picked up on cameras equipped with rolling shutter sensors. The images produced by such cameras exhibit horizontal bandings that alternate between darker and lighter rows.

##### The Flicker Band (FB) unit segments the image into horizontal bands, then computes and returns the average brightness of each band as FB statistics. The software analyzes the FB statistics to detect and correct the flickering.

##### As shown in the following top-level block diagram, the FB unit can be placed anywhere in the crossbar. It produces the FB statistics from Bayer or RGB/YUV data, while leaving the data completely unchanged.

##### Figure 7.40 Flicker Band Top-Level Block Diagram


<details>

<summary>OCR (Page 15)</summary>


```text

Image Signal Processor (ISR)
Figure 7.39 Histogram High-Level Block Diagram
ROl, Lane Selection, Elliptical Mask,
Weight Table, Flexible Bin Control
. ea)
RADTE Flexible: DPRAMS SFO
Weight Bin Interface
Table Mapping (Read, 256 Bins
Modify,
r) wee)
7.2.4.12 Flicker Band
The alternating current (AC) is the most popular_way in which electric power is delivered to
businesses and residences. Some artificial lights-such as fluorescent lamps that are powered by AC
will flicker when their supply current reversesdirection. This flickering is invisible to people, but is
picked up on cameras equipped with rolling’shutter sensors. The images produced by such
cameras exhibit horizontal bandings that alternate between darker and lighter rows.
The Flicker Band (FB) unit segments.the image into horizontal bands, then computes and returns
the average brightness of each band-as FB statistics. The software analyzes the FB statistics to
detect and correct the flickering;
As shown in the following top-level block diagram, the FB unit can be placed anywhere in the
crossbar. It produces the FB.statistics from Bayer or RGB/YUV data, while leaving the data
completely unchanged,
Figure 7.40 Flicker Band Top-Level Block Diagram
Bayer Bayer
FB /—_——f
RGB/YUV RGB/YUV
FB Statistics

```
</details>

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

###### Image Signal Processor (ISP)

### 7.2.4.13 DMX

##### DMX is the Gradient-aware Demosaic component of the Image Signal Processing (ISP) pipeline. The primary function of DMX is to non-linearly interpolate 2x2 Color Filter Array (CFA) data from image sensor to YUV output. DMX uses gradient information extracted from the CFA data to guide the directional interpolation process. The goal is to produce high-resolution output images with reduced image reconstruction-aliasing artifacts as compared to legacy ISP demosaic based on linear filters.

##### DMX is a functional unit inside the Areal Processing (AP) unit of ISP. Conceptually, DMX accepts a 9x9 CFA input of the AP and produces a pixel output in YUVA format. In the current two pixels per clock (2-ppc) implementation, DMX accepts a 10x9 CFA input and produce two pixels output in YUVA format.

##### DMX is primarily developed to improve the demosaiced image quality (IQ), as compared to the Legacy-DM. Legacy-DM is based on the traditional linear shift-invariant (LSI) filters. Our Bayer RAW images are non-band-limiting in luma and phase-misaligned in chroma. LSI filters are theoretically unable to reconstruct the “original” image at the Bayer (near-single-pixel) resolution, but possible to produce good approximations at reduced resolutions. Another weakness of legacy-DM is the chroma artifacts offered by LSI filters.

##### DMX addresses the IQ issues by using gradient-aware, directional interpolation of luma values, and median filtering of chroma values. Although there are numerous variations of gradient-aware demosaic algorithms proposed in the academic literature, there are significant differences between DMX algorithm and those academic approaches. Most of the academic algorithms operate on well- defined RGGB Bayer models. However, as a practical ISP product, we need to be able to handle a wide variety of different sensor types, including many with nonideal characteristics.


<details>

<summary>OCR (Page 16)</summary>


```text

Image Signal Processor (ISR)
7.2.4.13 DMX
DMx is the Gradient-aware Demosaic component of the Image Signal Processing (ISP)pipeline. The
primary function of DMX is to non-linearly interpolate 2x2 Color Filter Array (CFA) data from image
sensor to YUV output. DMX uses gradient information extracted from the CFA data)to guide the
directional interpolation process. The goal is to produce high-resolution output images with
reduced image reconstruction-aliasing artifacts as compared to legacy ISP demosaic based on
linear filters.
DMx is a functional unit inside the Areal Processing (AP) unit of ISP. Conceptually, DMX accepts a
9x9 CFA input of the AP and produces a pixel output in YUVA format{In the current two pixels per
clock (2-ppc) implementation, DMX accepts a 10x9 CFA input and preduce two pixels output in
YUVA format.
DMx is primarily developed to improve the demosaiced image quality (IQ), as compared to the
Legacy-DM. Legacy-DM is based on the traditional linear shift-invariant (LSI) filters. Our Bayer RAW
images are non-band-limiting in luma and phase-misaligned in chroma. LSI filters are theoretically
unable to reconstruct the “original” image at the Bayer (near-single-pixel) resolution, but possible
to produce good approximations at reduced resolutions, Another weakness of legacy-DM is the
chroma artifacts offered by LSI filters.
DMxX addresses the IQ issues by using gradient-aware, directional interpolation of luma values, and
median filtering of chroma values. Although there are numerous variations of gradient-aware
demosaic algorithms proposed in the academic literature, there are significant differences between
DMX algorithm and those academic approaches. Most of the academic algorithms operate on well-
defined RGGB Bayer models. However, as.a practical ISP product, we need to be able to handle a
wide variety of different sensor types, including many with nonideal characteristics.

```
</details>

Hideyuki Sugiura NVIDIA Confidential Denso-BEVS3-ADC 1072259 2025-02-09 17:40:27

###### Display Control Engine (DCE)

##### Figure 7.41 DMX Top-Level Block Diagram

## 7.2.5 Display Control Engine (DCE)

### 7.2.5.1 Overview

##### The Display Control Engine (DCE) is a general-purpose computing subsystem based on an ARM ® Cortex ® -R5F used to perform display controller management tasks. The DCE is a duplicate instance of the Safety Cluster Engine (SCE) module; internally both SCE and DCE are the same, however, some I/O connections are different. The processing cluster consists of two Cortex-R5F processor cores with a tightly coupled RAM, support peripherals (for example, timers, interrupt


<details>

<summary>OCR (Page 17)</summary>


```text

Display Control Engine (DCE)
Figure 7.41 DMX Top-Level Block Diagram
Lsi-buf Cmp-buf
> Lsi Chroma-cmp
[uv]
tsi [y] \si [uv] cmp-map [uv]
ratio-data [uv]
— Gradient Chroma-rank chroma [uv]
bayer| [uv]
Ki ii =
——_ | grd-data —ra yuva
nqs-data -
;-—>} Nyquist |_nasees| Lsv uma grd-cfd
luma-data (from Gradient)
——>} Quartic _
Isi [y] Snr-data
snr-data: snrq, avg-rcp (to Gradient, Nyquist, Clamp units)
grd-data: grd-cfd; hir-cfd, nrd-cfd, angle, hic-soft
nqs-data: nqs-cfd»agqs-mix
luma-data: quartic-detail, hor-detail, ver-detail
ratio-data: avg~luma, rcp-luma
7.2.5 Display‘Control Engine (DCE)
7.2.5.1 Qverview
The Display-Control Engine (DCE) is a general-purpose computing subsystem based on an
ARM*:Cortex® -R5F used to perform display controller management tasks. The DCE is a duplicate
instance of the Safety Cluster Engine (SCE) module; internally both SCE and DCE are the same,
however, some I/O connections are different. The processing cluster consists of two Cortex-R5F
processor cores with a tightly coupled RAM, support peripherals (for example, timers, interrupt

```
</details>
