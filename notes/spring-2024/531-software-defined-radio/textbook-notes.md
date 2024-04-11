---
id: textbook-notes
aliases: []
tags: []
---

# Software Defined Radio For Engineers

Book Link
[here](https://www.analog.com/media/en/training-seminars/design-handbooks/Software-Defined-Radio-for-Engineers-2018/SDR4Engineers.pdf)

# Summaries

Here is a list of all of the chapter summaries:

- Chapter 1 | Introduction To Software Defined Radio
- Chapter 2 | Signals and Systems
- Chapter 3 | Probability in Communications
- Chapter 4 | Digital Communications Fundamentals
- Chapter 5 | Understanding SDR Hardware
- Chapter 6 | Timing Synchronization
- Chapter 7 | Carrier Synchronization
- Chapter 8 | Frame Synchronization and Channel Coding
- Chapter 9 | Channel Estimation and Equalization
- Chapter 10 | Orthogonal Frequency Division Multiplexing
- Chapter 11 | Applications for Software Defined Radio

## Chapter 1 | Introduction To Software Defined Radio

In this chapter multiple topics were addressed such as:

- What is software defined radio?
- Networking and SDR
- RF Architectures for SDR
- Processing Architectures for SDR
- Software Environments for SDR

## Chapter 2 | Signals and Systems

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

## Chapter 3 | Probability in Communications

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

## Chapter 4 | Digital Communications Fundamentals

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

## Chapter 5 | Understanding SDR Hardware

This chapter is basically an explanation on how the Pluto SDR works without
sounding like a datasheet. There's also example scripts that you can run on
`MATLAB` to understand how to work with the Pluto using `MATLAB`.

## Chapter 6 | Timing Synchronization

Timing recovery is a fundamental tool for successful transmission between nodes
with independent oscillators.

In this chapter, a model for timing offset was introduced mathematically, in
simulation, and demonstrated with Pluto SDR. To combat this offset, a
phase-locked loop(PLL)-based timing recovery methodology was introduced that
included several timing error detectors.

This included an review and extension to matched filtering introduced in
Chapter 6. `MATLAB` code was provided for the different components of the timing
recovery algorithms, and a considerable amount of time was spent examining their
configuration and interactions.

Finally, once all the components were investigated, portions of the design's
parameterization were explored. In subsequent chapters, the implementations
developed here will be utilized to created a full receiver design which can
recover signals transmitted between separate Pluto SDR devices.

## Chapter 7 | Carrier Synchronization

In this chapter we have discussed and provided a model of carrier offset and how
it relates to receiver operations. From this model we have provided two schemes
for compensating for carrier offset including coarse and fine recovery
algorithms. However, other implementations do exist that can jointly perform
timing and carrier recovery if desired. We have examined how these algorithms
can be used at the system level, as well as how individual performance can be
evaluated. These include characterization of their parameterization as well as
metric on the recovered data.

In summary, carrier offset compensation is a necessary synchronization technique
when transmitting data between two disjoint nodes with independent LOs.

## Chapter 8 | Frame Synchronization and Channel Coding

This chapter examined the concept of frame synchronization through correlation
techniques and covered some common channel coding techniques through redundancy
insertion.

Given the last piece of the receiver with regard to synchronization provided
here, a full receiver can be implemented for frame recovery. Possible
arrangement for the receiver algorithms as discussed throughout the book so far
have been examined, focusing on requirements from the design.

Once full synchronization was covered, we moved on to techniques for making our
links more robust through encoding implementations, including a discussion on
their drawbacks and advantages with regard to implementation and use.

## Chapter 9 | Channel Estimation and Equalization

In this chapter we introduced the concept of channel estimation and
equalization. We have built several equalizer designs around the gradient
descent algorithm 'Least Mean Squares' (LMS), which is the dominant cost
function in the field. We provided different strategies for implementing
equalizers when training data is available and when blind operation is required.

Finally, we provided a discussion on receiver implementation strategies that
combine multiple equalizer designs as well as different use cases for
nonidealities from the environment.

For the interested reader, brief mathematical derivations for the basic linear
equalizer design, zero-forcing equalizer, and decision feedback equalizer are
available in Appendix C.

## Chapter 10 | Orthogonal Frequency Division Multiplexing

This chapter focused on the principle and implementation of multicarrier
modulation, based on the 802.11a WLAN standard. Details were provided on the
benefits of Orthogonal Frequency Division Multiplexing (OFDM), including the
simplistic receiver design.

OFDM is the modern mechanism for high-speed transmission and reception, ranging
from wired internet to even some satellite links. Although the implementation of
the receiver is basically reversed from the previous succession of chapters, it
can be considered much simpler than our single-carrier implementations.

## Chapter 11 | Applications for Software Defined Radio

In this chapter, we briefly examined two real-world applications that can
extensively leverage SDR technology: cognitive radio and vehicular networking.

With respect to cognitive radio, we explored how to set up the cognitive radio
engine on a SDR platform and presented at least two ways to construct the
decision-making process using either a bumblebee behavioral model or a
reinforcement learning approach.

Regarding vehicular network, we presented a short introduction to the IEEE
802.11p and IEEE 1609 standards that can enable us to construct our own
vehicular networks from scratch using SDR technology.

In this book, we have delved into the theoretical foundations of signals,
systems, and communications, and then explored the real-world issues associated
with communication systems and the solutions needed to mitigate these
impairments, and finally presented several advanced topics in equalization and
OFDM implementations before introducing real-world applications such as
cognitive radio and vehicular networking.

Of course, this book only scratches the surface of the entire communication
systems domain, but it is hoped that this book will serve as a starting point
for mastering this very important topic.

<!-- End -->
