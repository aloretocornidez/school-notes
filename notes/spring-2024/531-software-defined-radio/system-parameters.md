---
id: system-parameters
aliases: []
tags:
  - radio
---

# Parameters

**Note: Output from ChatGPT 3.5**

In software-defined radio (SDR), the following terms are commonly used to
describe parameters and characteristics of the system:

1. **Sample Rate:** Sample rate refers to the number of samples taken per second
   from the analog signal to convert it into a digital format. It is usually
   measured in samples per second (S/s) or Hertz (Hz). In SDR, the sample rate
   determines the bandwidth that can be processed by the system and affects
   various aspects such as signal resolution and processing capability.

2. **Samples per Symbol:** This parameter specifies the number of samples used
   to represent each symbol in the digital modulation scheme. It determines the
   granularity with which the modulated signal is sampled and processed. The
   choice of samples per symbol is influenced by factors such as modulation
   scheme, channel conditions, and receiver processing capabilities.

3. **Frame Size:** Frame size refers to the number of symbols or samples grouped
   together for processing as a unit. In SDR, frames are often used to organize
   data for transmission or processing. The frame size can vary depending on the
   specific application requirements, such as packet length in digital
   communications or processing blocks in signal processing algorithms.

4. **Number of Frames:** This parameter indicates the total number of frames in
   a given data stream or transmission. It can be used to define the duration or
   size of a data transmission, and it may be determined by factors such as
   communication protocol, channel conditions, or system design constraints.

5. **Modulation Order:** Modulation order refers to the number of distinct
   symbols or signal states used to represent information in a digital
   modulation scheme. It determines the number of bits encoded per symbol and
   affects the data rate and spectral efficiency of the communication system.
   Common modulation orders include Binary Phase Shift Keying (BPSK), Quadrature
   Phase Shift Keying (QPSK), and Quadrature Amplitude Modulation (QAM), with
   higher-order modulations allowing for higher data rates at the expense of
   increased susceptibility to noise and interference.

6. **Filter Upsample:** Filter upsampling refers to the process of increasing
   the sampling rate of a signal using interpolation techniques in conjunction
   with a digital filter. This is often done to match the sampling rate of the
   incoming signal to the processing requirements of the receiver or to
   facilitate operations such as interpolation or resampling.

7. **Filter Symbol Span:** Filter symbol span represents the duration of the
   filter in terms of symbol periods. It defines the temporal extent of the
   filtering operation and influences the trade-off between frequency
   selectivity and temporal resolution in signal processing operations such as
   pulse shaping or matched filtering. The choice of filter symbol span depends
   on factors such as channel characteristics, modulation scheme, and system
   performance requirements.
