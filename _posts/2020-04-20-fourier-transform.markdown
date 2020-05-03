---
layout: default
title:  Derivation of the Fast Fourier Transform
date:   2020-04-20 17:30:00 -0700
permalink: /:categories/:title
---

{% include mathjax.html %}

The discrete Fourier Transform (DFT) for a series of $$N$$ complex numbers $$x_k$$ for $$k = 0, 1, \dots, N-1$$ is defined as

$$X_k = \sum_{n=0}^{N-1} x_n e^{\frac{-j2\pi}{N}kn}$$

where each $$X_k$$ states the signal level associated with a frequency. Due to the Nyquist sampling theorem, the maximum frequency that can be detected is half of the sampling rate, and so $$X_k$$ represents the proportion of the signal that has a frequency of $$\frac{k}{2N}*\text{sampling rate (Hz)}$$.

The term $$e^{\frac{-j2\pi}{N}kn}$$ represents the $$N$$ roots of unity, but raised to the $$k$$th power. Thus for the $$k$$th DFT bucket, it is basically calculating the correlation between the signal $$\mathbf{x}$$ and a signal that rotates around the complex unit circle $$k$$ times in the same timeframe.

For example, for $$k=0$$, the imaginary signal stays equal to 1 for the entire duration. $$X_0$$ becomes the summation of the signal, giving the average DC value of the signal since all other frequency components should ideally cancel out.

For $$k=1$$, the imaginary signal rotates once around the complex unit circle, and the summation gives the correlation of the signal with that signal — how much of the signal is only rotating once around that unit circle.
- If $$\mathbf{x}$$ has no phase difference (or a 180 degree phase difference), and is rotating at exactly that frequency, the correlation will be a real number
- If it's $$\pm90$$ degrees out of phase, the correlation will be an imaginary value (complex values represent phase, and a 90 degree phase shift results in a completely imaginary number)
- If it's somewhere in between, the correlation will be complex

<h2 id="fast-fourier-transform"> Fast Fourier Transform</h2>
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

These two summations are just FFTs on the even-indexed and odd-indexed elements of $x$.

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

It can be seen that a FFT can be broken down into two FFTs, each half the size, and the results added and multiplied with factors of $$e^{\frac{-j2\pi}{N}k}$$ (called twiddle factors). But these FFTs can be continuously broken down until they're each size one, at which point the result is just the input. To rebuild the size $$N$$ FFT, each 'odd' element is multiplied by the twiddle factor and added to its 'even' counterpart, taking $$O(N)$$. There are $$log_2 N$$ steps here, so the total runtime is $$O(N\log_2 N)$$.

The efficiency comes from reuse of calculations that affect multiple elements in $$X$$.
