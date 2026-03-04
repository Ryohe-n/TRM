# 0 : Notemp frame = SF frame 1: Notemp frame = beta * SF frame + (1-beta) * Cur Frame

- AlphaBlendingEn
fixed<0,1,0> (1 bit)
- Alpha Blending enable with non-temporal frame and previous output
frame 0: Output frame = notemp frame 1: Output frame = (1-alpha)*notemp frame + alpha * prev output frame
- AlphaSmoothEn
fixed<0,1,0> (1 bit)
- Spatial Alpha Smooth enable
- TempAlphaRestri
ctEn fixed<0,1,0> (1 bit)
- Temporal alpha restrict enable
- AlphaClipEn
fixed<0,1,0> (1 bit)
- Alpha output clip enable
- BFRangeEn
fixed<0,1,0> (1 bit)
- Bilateral Range Filter enable

