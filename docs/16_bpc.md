# 16 bpc

- Programmed using the Context DMA method
- CSC0LUT
- - - -
- Used to convert from FP16 to fixed point
- Variable step size
- Maximum size: 513
- Programmed directly using methods
- CSC1LUT
- - - -
- Used to convert from fixed point to FP16 linear
- Variable step size
- Maximum size: 513
- Programmed directly using methods
- Precomposition scaling

- Display Controller
- Maximum line width
- - 5120 pixels in 2-tap mode 2560 pixels in 5-tap mode
- Maximum downscale factor
- - 2x in both directions in 2-tap mode 4x in both directions in 5-tap mode
- Scaler overfetch
- Programmable 5-tap coefficients
- Tone Mapping (TMO)
- LUT-based intensity mapping, and 3 intensity zones with configurable color correction
settings
- Programmable range clamping before composition
- Per Head Processing
- Post-composition LUT
- Used to convert from FP16 linear to fixed-point gamma-encoded pixels
- Variable step size. Also supports direct10 mode for medical imaging (DICOM)
- Maximum size: 1025 entries

