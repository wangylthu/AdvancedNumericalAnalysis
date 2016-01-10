# Advanced Numerical Analysis

My personal MATLAB implementation for final exam preparation.

Author : Yulong Wang (@wangylthu)

Email: yulong31415@126.com

Include following algorithms:

* Matrix Decomposition
  * LU decomposition (direct method)
  * Cholesky decomposition
* Galerkin methods for solving linear equation
  * $$L_m = K_m$$
    * symmetric : Lanczos
    * non-symmetric : Arnoldi
  * $$L_m = AK_m$$
    * symmetric : MINRES
    * non-symmetric : GMRES
* Ritz methods for solving linear equation
  * Stochastic Gradient Descent (SGD)
  * Conjugate Gradient Descent (CG)
  * Guass-Seidel Precondition Preprocessing
* Orthogonal Iteration
  * plain orthogonal iteration
  * plain QR iteration
  * implicit shift QR iteration
* Eigenvalue Problems
  * Strum method
  * Rayleigh-Ritz method (**NOT IMPLEMENTED**)
  * Divide-and-Conquer method
* SVD 
  * implicit QR iteration (Bulge Chasing)
  * LR iteration
* Variational Methods for Differential Equations
  * Finite Element Method (**BUG NOT FIXED**)
