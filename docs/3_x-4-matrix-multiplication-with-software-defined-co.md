# 3 x 4 matrix multiplication with software-defined coefficients in the [-16, 16) range There are several CSC matrixes at different stages of the pipe.

- Per-window LUTs (ILUT, CSC0LUT, CSC1LUT)
programmable matrix + variable step size LUT-based CSC from input to ICtCp; also from
- ICtCp to RGB with final output gamut. The scaling and tone mapping are done in ICtCp
domain.
- Input range is limited to [0,1]. Can be mirrored around 0 to support [-1,1]
- ILUT
- - - - -
- Used to convert from fixed point to FP16 linear
- Variable step size and direct index mode
- Maximum size: 1025 entries

