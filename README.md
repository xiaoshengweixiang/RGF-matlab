# RGF-matlab
A code provides simplest Green-Function calculation.
Focus on system has such a form, under tight-binding model.

$$
\begin{equation*}
H=\sum _{i} \epsilon _{i} \ a_{i}^{\dagger } a_{i} +\sum _{i}\left( t_{x} a_{i+x}^{\dagger } a_{i} +t_{y} a_{i+y}^{\dagger } a_{i} +t_{\delta } a_{i+x-y}^{\dagger } a_{i} +h.c.\right)
\end{equation*}
$$

![1](https://user-images.githubusercontent.com/84439883/224943803-7de31ade-9481-4268-bc3c-117148e7af41.png)

If you provide the correspond $\epsilon$, $t_{x}$, $t_{y}$, $N$, you can get the band stucture $E(k_x)$ and Transmittance with different fermi-energy $T_{LR}(E_f)$ .
# How to use
Just follow the steps show in example:

1.input correspond $\epsilon$, $t_{x}$, $t_{y}$, $N$.

2.use bands function to obtain band structure.

3.use transmission function to obtain Transmittance.
# Detail information
N is the width of the system

Is code don't consider the contracts/leads of the sample, which means the two leads are sample itself.

basic princple
https://arxiv.org/pdf/cond-mat/0210519.pdf
