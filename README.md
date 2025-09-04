# Linear System Solvers in MATLAB

This project demonstrates and compares different numerical methods for solving systems of linear equations in MATLAB.  
It contains two main scripts: `main_3_1.m` and `main_3_2.m`.

Might not work perfectly, educational purposes only.
Made for test, might be errors in caculation/comparing process

Manually alter the pivot restriction range if needed.

---

## 1. Features

### Implemented Methods
- **LU Factorization (`slu + slv`)**  
  Factorizes a matrix into `L` (lower) and `U` (upper) triangular matrices, then solves via forward/backward substitution.
- **Gaussian Elimination (`gauss_elim`)**  
  Classical row-reduction method for solving linear systems.
- **Cofactor Inverse (`cofactor_inv`)**  
  Computes the inverse of a matrix using the cofactor (adjoint/determinant) method.
- **MATLAB Built-in `inv()`**  
  Directly computes the inverse of a matrix with MATLAB’s built-in function.

---

## 2. Files

| File | Description |
|------|-------------|
| `main_3_1.m` | Compares four solution methods (`slu`, `gauss_elim`, `inv()`, and `cofactor_inv`) on a small 3×3 system. Also benchmarks execution times. |
| `main_3_2.m` | Solves a **20×20 system** derived from signal frequencies and time samples. Loads measurement data from `output.mat` and compares LU, Cofactor, and `inv()` solutions. |
| `slu.m` | Custom LU factorization function (not provided in snippet). |
| `slv.m` | Forward and backward substitution solver (not provided in snippet). |
| `gauss_elim.m` | Gaussian elimination solver (not provided in snippet). |
| `cofactor_inv.m` | Matrix inverse using cofactors (not provided in snippet). |
| `output.mat` | Contains a `20×1` output vector used in `main_3_2.m`. |

---

## 3. Usage

1. Clone or download the repository.
2. Ensure the following files are present in the working directory:
   - `main_3_1.m`
   - `main_3_2.m`
   - `slu.m`, `slv.m`, `gauss_elim.m`, `cofactor_inv.m`
   - `output.mat` (for `main_3_2`)
  
##output.mat should be manually created!


Output example:

=== Compare Summary ===
LU        : 0.000xxx s
Gauss     : 0.000xxx s
inv()     : 0.000xxx s
Cofactor  : 0.000xxx s


## 4. Notes

tol is used to avoid numerical instability (pivot thresholds, small determinant checks, etc.).

The cofactor method is extremely inefficient for larger matrices but included for comparison and educational purposes.

inv() is generally discouraged in practical numerical computing (prefer A\b in MATLAB).
