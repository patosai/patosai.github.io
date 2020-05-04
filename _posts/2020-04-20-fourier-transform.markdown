---
layout: default
title:  What is the Fourier Transform, and what's the Fast Fourier Transform?
date:   2020-04-20 17:30:00 -0700
permalink: /:categories/:title
---

{% include mathjax.html %}

###### What's the Fourier Transform?

Given a sampled signal, the Fourier Transform returns the frequencies that make up the signal.

###### How does the algorithm do it, and what do the results mean?

The Fourier Transform for a series of $$N$$ complex numbers $$x_k$$ for $$k = 0, 1, \dots, N-1$$ is defined as

$$X_k = \sum_{n=0}^{N-1} x_n e^{\frac{-j2\pi}{N}kn}$$

Each $$k$$ represents a different frequency (the relation between $$k$$ and its frequency will be discussed soon). From Euler's formula, we know that $$e^{j\theta} = \mathrm{cos(\theta)} + j\mathrm{sin(\theta)}$$, where $$j$$ is the imaginary unit.
- As $$n$$ goes from $$0$$ to $$N-1$$, $$e^{\frac{-j2\pi}{N}kn}$$ completes almost $$k$$ full cycles around the complex unit circle defined by Euler's formula, each cycle being $$2\pi$$ radians, or 360 degrees
- The summation is attempting to calculate how well the signal correlates with a sinusoidal signal, the frequency of which is the one associated with $$k$$

The Fourier Transform is a **complex** operation. Looking back at Euler's formula, the imaginary part comes from $$sin$$ instead of $$cos$$, but the difference between the two is a phase shift. If a signal correlates completely with cosine, the result will be real. For sine, it will be completely imaginary. If it's complex, the phase shift of the signal with respect to cosine is something else. The phase shift in all cases can be calculated by looking back once again at Euler's formula.

<img class="img" src="assets/posts/2020-04-20-fourier-transform/eulers-formula.svg" alt="Diagram showing Euler's formula on the complex coordinate system"/>

The diagram makes it clear that a signal that correlates exactly with cosine will have a phase shift of 0 or $$\pi$$, depending on the sign of the signal. For sine, it's $$\pm\frac{\pi}{2}$$. The phase shift in general can be calculated by

$$\theta = \mathrm{arctan}(\frac{sin(\theta)}{cos(\theta)}) = \mathrm{arctan}(\frac{\text{imaginary part}}{\text{real part}})$$

###### How does $$k$$ relate to the time-domain frequency?

Because of the Nyquist sampling theorem, the frequency components of a signal sampled at a frequency of $$f_s$$ can be determined only for frequencies between 0 and $$\frac{f_s}{2}$$, not including the frequency $$\frac{f_s}{2}$$. Frequencies higher than this range will be aliased and associated with a frequency inside that range.

<img class="img" src="assets/posts/2020-04-20-fourier-transform/aliasing.svg" alt="Example of aliasing"/>

Here is an example where a sinusoidal signal is being sampled at twice its frequency, but at two different offsets. Sample 1 uniquely determines the frequency of the signal. But sample 2 cannot, and this shows that a signal with a frequency $$\frac{f_s}{2}$$ cannot be distinguished from a zero-frequency signal under this special circumstance.

The $$N$$-length array that the Fourier Transform returns represents evenly-spaced frequency buckets from 0 to $$\frac{f_s}{2}$$, excluding $$\frac{f_s}{2}$$. Thus 

$$f_k = \frac{f_s}{2}\frac{k}{N}$$

where $$f_k$$ is the frequency of the $$k$$th bucket, $$f_s$$ is the sampling rate, and $$N$$ is the length of the sample, and $$k$$ goes from 0 to $$N-1$$.

If there was a bucket that represented the Nyquist frequency, $$\frac{f_s}{2}$$, that means $$k = N$$ and you would see that 

$$\begin{align}
X_N &= \sum_{n=0}^{N-1} x_n e^{\frac{-j2\pi}{N}Nn} \\
&= \sum_{n=0}^{N-1} x_n e^{-j2\pi n} \\
&= \sum_{n=0}^{N-1} x_n \\
&= X_0
\end{align}$$

which is another way of looking at this aliasing condition.

---

#### Fast Fourier Transform
The Fast Fourier Transform (FFT) is any algorithm that has a better algorithmic complexity than the naive DFT algorithm, which is $$O(n^2)$$. The most used FFT algorithm is the Cooley-Tukey algorithm, which makes use of symmetry between a FFT of $$N$$ points, and the result of splitting those $$N$$ points into an 'even' and 'odd' group and running FFTs on those, preventing recalculations.

$$\begin{align}
X_k &= \sum_{n=0}^{N-1} x_n e^{\frac{-j2\pi}{N}kn} \\
&= \sum_{n=0}^{N/2-1} x_{2n} e^{\frac{-j2\pi}{N}k(2n)} + \sum_{n=0}^{N/2-1} x_{2n+1} e^{\frac{-j2\pi}{N}k(2n+1)}
\end{align}$$

The first summation contains the signal at even indices, and the second summation contains the signal at odd indices, thus 'even' and 'odd' groups.

$$\begin{align}
X_k &= \sum_{n=0}^{N/2-1} x_{2n} e^{\frac{-j2\pi}{N}k(2n)} + \sum_{n=0}^{N/2-1} x_{2n+1} e^{\frac{-j2\pi}{N}k(2n+1)} \\
&= \sum_{n=0}^{N/2-1} x_{2n} e^{\frac{-j2\pi}{N}k(2n)} + e^{\frac{-j2\pi}{N}k} \sum_{n=0}^{N/2-1} x_{2n+1} e^{\frac{-j2\pi}{N}k(2n)} \\
&= \sum_{n=0}^{N/2-1} x_{2n} e^{\frac{-j2\pi}{N/2}kn} + e^{\frac{-j2\pi}{N}k} \sum_{n=0}^{N/2-1} x_{2n+1} e^{\frac{-j2\pi}{N/2}kn}
\end{align}$$

These two summations are just FFTs on the even-indexed and odd-indexed elements of $$x$$, here denoted as $$x_\text{even}$$ and $$x_\text{odd}$$ respectively.

$$\begin{align}
X_k &= \sum_{n=0}^{N/2-1} x_{2n} e^{\frac{-j2\pi}{N/2}kn} + e^{\frac{-j2\pi}{N}k} \sum_{n=0}^{N/2-1} x_{2n+1} e^{\frac{-j2\pi}{N/2}kn} \\
&= \mathrm{FFT}(x_\text{even})[k] + e^{\frac{-j2\pi}{N}k} \mathrm{FFT}(x_\text{odd})[k]
\end{align}$$

where $$\mathrm{FFT}(x)[k]$$ represents the $$k$$th element of the FFT of $$x$$. The length of the FFT equals the length of the input matrix, but $$k$$ may be greater than the length of $$x_\text{even}$$ or $$x_\text{odd}$$, but there is a relation here that solves this issue.

$$\begin{align}
X_{k+\frac{N}{2}} &= \sum_{n=0}^{N/2-1} x_{2n} e^{\frac{-j2\pi}{N/2}n(k+\frac{N}{2})} + e^{\frac{-j2\pi}{N}(k+\frac{N}{2})} \sum_{n=0}^{N/2-1} x_{2n+1} e^{\frac{-j2\pi}{N/2}n(k+\frac{N}{2})} \\
&= \sum_{n=0}^{N/2-1} x_{2n} e^{\frac{-j2\pi}{N/2}nk}e^{-j2\pi n} + e^{\frac{-j2\pi}Nk}e^{-j\pi} \sum_{n=0}^{N/2-1} x_{2n+1} e^{\frac{-j2\pi}{N/2}nk}e^{-j2\pi n} \\
&= \sum_{n=0}^{N/2-1} x_{2n} e^{\frac{-j2\pi}{N/2}nk} - e^{\frac{-j2\pi}Nk} \sum_{n=0}^{N/2-1} x_{2n+1} e^{\frac{-j2\pi}{N/2}nk} \\
&= \mathrm{FFT}(x_\text{even})[k] - e^{\frac{-j2\pi}{N}k} \mathrm{FFT}(x_\text{odd})[k]
\end{align}$$

For example, for a 1024-point FFT, first the FFT of the 0th, 2nd, 4th, ... 1023rd points are calculated, as well as the FFT of the 1st, 3rd, 5th, ..., 1022nd points. Let these be $$\mathrm{FFT}(x_\text{even})$$ and $$\mathrm{FFT}(x_\text{odd})$$ respectively. The 11th element (at index 10) in the 1024-point FFT will be $$\mathrm{FFT}(x_\text{even})[10] - e^{\frac{-j20\pi}{1024}} \mathrm{FFT}(x_\text{odd})[10]$$

It can be seen that a FFT can be broken down into two FFTs, each half the size, and the results added and multiplied with factors of $$e^{\frac{-j2\pi}{N}k}$$ (called twiddle factors). But these FFTs can be continuously broken down until they're each size one, at which point the result is just the input. To rebuild the size $$N$$ FFT, each 'odd' element is multiplied by the twiddle factor and added to its 'even' counterpart, taking $$O(N)$$. There are $$log_2 N$$ steps here, so the total runtime is $$O(N\log_2 N)$$.

The efficiency comes from reuse of calculations that affect multiple elements in $$X$$.
