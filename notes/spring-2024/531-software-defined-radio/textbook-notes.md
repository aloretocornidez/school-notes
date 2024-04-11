---
id: textbook-notes
aliases: []
tags: []
---

# Software Defined Radio For Engineers

# Summaries

## Chapter 2 Summary

SDR experimentation requires both strong computer skills and extensive knowledge
of digital signal processing. This chapter lists some useful topics including
sampling, pulse shaping, and filtering.

On the Pluto SDR transmit path, there is a:

- programmable 128-tap FIR filter
- interpolating halfband filters
- a DAC
- followed by two lowpass analog reconstruction filters (LPF)

On the Pluto SDR receive path, the signal flows

- through an antialiasing filter,
- the ADC
- through digital decimating half band filters
- and eventually a 128-tap programmable FIR where the filtering knowledge is
  useful. This 128-tap programmable FIR can be used to compensate for the loss
  in the passband because of the antialiasing filter.

In order to understand how these work together and properly configure things,
you need to understand sampling theory.

## Chapter 3 Summary

In this chapter, a brief introduction to some of the key mathematical tools for
analyzing and modeling random variables and random processes for communication
systems has been presented.

Of particular importance, the reader should understand how to:

- mathematically manipulate Gaussian random variables
- Gaussian random processes
- and bivariate normal distributions since they frequently occur in digital
  communications and wireless data transmission applications.

Furthermore, understanding how stationarity works and how to apply the EWK
relations to situations involving random processes being filtered by LTI systems
is vitally important, especially when dealing with the processing and treatment
of received wireless signals by the communication system receiver.

## Chapter 4 Summary

A deep and thorough understanding of digital communication theory is vitally
essential when designing and evaluating software-defined radio implementations.

In this chapter, an overview of several useful topics, including:

- several different types of modulation schemes
- the derivation of the probability of error
- Gram-Schmidt orthogonalization

Formulation of the optimal decision rule and the presentation of two receiver
structures were studied in order to provide the reader with the fundamentals
needed in order to master these versatile yet complex systems.

In the subsequent chapters, the fundamental knowledge obtained in this chapter,
as well as the two previous chapters, will be leveraged extensively when
implementing digital communication systems and networks based on
software-defined radio technology.

## Chapter 5

This chapter is basically an explanation on how the Pluto SDR works without
sounding like a datasheet. There's also example scripts that you can run on
matlab to understand how to work with the Pluto using MATLAB.

## Chapter 6

Timing recovery is a fundamental tool for successful transmission between nodes
with independent oscillators.

In this chapter, a model for timing offset was introduced mathematically, in
simulation, and demonstrated with Pluto SDR. To combat this offset, a PLL-based
timing recovery methodology was introduced that included several timing error
detectors.

This included an review and extension to matched filtering introduced in
Chapter 6. MATLAB code was provided for the different components of the timing
recovery algorithms, and a considerable amount of time was spent examining their
configuration and interactions.

Finally, once all the components were investigated, portions of the design's
parameterization were explored. In subsequent chapters, the implementations
developed here will be utilized to created a full receiver design which can
recover signals transmitted between separate Pluto SDR devices.
