# Extrinsic/intrinsic Riemannian finite-difference methods
This repository contains the implementation in Matlab of the derivative-free Riemannian optimization methods using finite-difference gradient approximations proposed in [1], available on arxiv at https://arxiv.org/abs/2601.08751. The methods are mainly inspired by the works [2,3,4]. The Manopt toolbox [5] is used to handle the manifold structure.


[1] T. Taminiau, E. Massart and G. N. Grapiglia, Riemannian optimization with finite-difference gradient approximations, arXiv e-prints, page arXiv:2601.08751, 2025.

[2] G. N. Grapiglia. Worst-case evaluation complexity of a derivative-free quadratic regularization
method. Optimization Letters, 18:1–19, 2023.

[3] V. Kungurtsev, F. Rinaldi, and D. Zeffiro. Retraction-Based Direct Search Methods for
Derivative Free Riemannian Optimization. Journal of Optimization Theory and Applications,
203(2):1710–1735, 2023.

[4] D. Davar and G. N. Grapiglia. TRFD: A Derivative-Free Trust-Region Method Based on
Finite Differences for Composite Nonsmooth Optimization. SIAM Journal on Optimization,
35(3):1792–1821, 2025.

[5] N. Boumal, B. Mishra, P.-A. Absil, and R. Sepulchre. Manopt, a Matlab Toolbox for Optimiza-
tion on Manifolds. Journal of Machine Learning Research, 15:1455–1459, 2014.