/-
# Formalization of JSP-000945 (Integers Whose Differences from Twice Smaller Squares Are Prime)

*Problem Statement (JSP-000945):*
"Is there an integer whose differences from twice every permitted smaller square are all prime?"

*Mathematical Area:*
Number theory

*Current Status:*
Solved (Affirmative)

*Mathematical Background:*
Erdős investigated additive properties of integers and asked whether there exists an integer
`n` such that `n - 2 * k^2` is prime for every permitted smaller square `k^2` (i.e. whenever
`2 * k^2 < n`).

Mihai Epure and Alexandru Gica (2010), in "Principal quadratic real fields in connection with
some additive problems", Bull. Math. Soc. Sci. Math. Roumanie (N.S.) 53 (101), no. 3, pp. 251–259
(building on class number one criteria for real quadratic fields by Mollin and Williams 1989),
analyzed positive integers `N ≡ 2 (mod 8)` such that `N - a^2` is double a prime for every
non-negative even integer `a` with `a^2 ≤ N`.
They proved that there are exactly four such positive integers:
  `N ∈ {10, 26, 62, 362}`.

Setting `a = 2k` and `n = N / 2`, the condition `N - (2k)^2 = 2 * (n - 2k^2)` implies that
`n - 2 * k^2` is a prime number for every `k ≥ 0` with `2 * k^2 < n`.
The corresponding values of `n` are:
  `n ∈ {5, 13, 31, 181}`.

This file provides a machine-checked constructive resolution to JSP-000945 in Lean 4 without axioms.
We verify the explicit witnesses:
- `n = 5`:
  * k = 0: 5 - 2(0)^2 = 5 (prime)
  * k = 1: 5 - 2(1)^2 = 3 (prime)
  * k ≥ 2: 2 * k^2 ≥ 8 > 5, so no other permitted squares exist.
- `n = 13`:
  * k = 0: 13 (prime)
  * k = 1: 13 - 2 = 11 (prime)
  * k = 2: 13 - 8 = 5 (prime)
  * k ≥ 3: 2 * k^2 ≥ 18 > 13.
- `n = 31`:
  * k = 0: 31 (prime)
  * k = 1: 29 (prime)
  * k = 2: 23 (prime)
  * k = 3: 13 (prime)
  * k ≥ 4: 2 * k^2 ≥ 32 > 31.
- `n = 181`:
  * k ∈ {0, 1, 2, 3, 4, 5, 6, 7, 8, 9} yields primes {181, 179, 173, 163, 149, 131, 109, 83, 53, 19}.
  * k ≥ 10: 2 * k^2 ≥ 200 > 181.

Both the non-negative square version (k ≥ 0) and the strictly positive square version (k ≥ 1)
are formalized and proven.

*Axiom status:* Clean (zero custom axioms, zero sorry, kernel-verified in Lean 4 core).
-/

import Challenge

namespace JSP000945

/-- Square expansion identity in Nat. -/
theorem sq_eq_mul (k : Nat) : k ^ 2 = k * k := by
  change (1 * k) * k = k * k
  rw [Nat.one_mul]

/-! ### Verification of the Witnesses -/

/-- n = 5 satisfies the property. -/
theorem diffs_prime_5 : DifferencesFromTwiceSquaresArePrime 5 := by
  refine ⟨by decide, ?_⟩
  intro k hk
  rw [sq_eq_mul] at hk
  match k with
  | 0 => decide
  | 1 => decide
  | m + 2 =>
    have : 8 ≤ 2 * ((m + 2) * (m + 2)) := by
      have : 2 ≤ m + 2 := by omega
      have : 4 ≤ (m + 2) * (m + 2) := Nat.mul_le_mul this this
      omega
    omega

/-- n = 13 satisfies the property. -/
theorem diffs_prime_13 : DifferencesFromTwiceSquaresArePrime 13 := by
  refine ⟨by decide, ?_⟩
  intro k hk
  rw [sq_eq_mul] at hk
  match k with
  | 0 => decide
  | 1 => decide
  | 2 => decide
  | m + 3 =>
    have : 18 ≤ 2 * ((m + 3) * (m + 3)) := by
      have : 3 ≤ m + 3 := by omega
      have : 9 ≤ (m + 3) * (m + 3) := Nat.mul_le_mul this this
      omega
    omega

/-- n = 31 satisfies the property. -/
theorem diffs_prime_31 : DifferencesFromTwiceSquaresArePrime 31 := by
  refine ⟨by decide, ?_⟩
  intro k hk
  rw [sq_eq_mul] at hk
  match k with
  | 0 => decide
  | 1 => decide
  | 2 => decide
  | 3 => decide
  | m + 4 =>
    have : 32 ≤ 2 * ((m + 4) * (m + 4)) := by
      have : 4 ≤ m + 4 := by omega
      have : 16 ≤ (m + 4) * (m + 4) := Nat.mul_le_mul this this
      omega
    omega

/-- n = 181 satisfies the property. -/
theorem diffs_prime_181 : DifferencesFromTwiceSquaresArePrime 181 := by
  refine ⟨by decide, ?_⟩
  intro k hk
  rw [sq_eq_mul] at hk
  match k with
  | 0 => decide
  | 1 => decide
  | 2 => decide
  | 3 => decide
  | 4 => decide
  | 5 => decide
  | 6 => decide
  | 7 => decide
  | 8 => decide
  | 9 => decide
  | m + 10 =>
    have : 200 ≤ 2 * ((m + 10) * (m + 10)) := by
      have : 10 ≤ m + 10 := by omega
      have : 100 ≤ (m + 10) * (m + 10) := Nat.mul_le_mul this this
      omega
    omega

/-! ### Main Theorems Resolving JSP-000945 -/

/-- Affirmative resolution of JSP-000945:
    There exists an integer whose differences from twice every permitted
    smaller square are all prime. -/
theorem jsp_000945_affirmative : ∃ n : Nat, DifferencesFromTwiceSquaresArePrime n :=
  ⟨5, diffs_prime_5⟩

/-- Affirmative resolution of JSP-000945 for strictly positive squares (k ≥ 1). -/
theorem jsp_000945_pos_affirmative : ∃ n : Nat, PosDifferencesFromTwiceSquaresArePrime n := by
  refine ⟨5, by decide, fun k _ hk => diffs_prime_5.2 k hk⟩

/-- Multiple explicit witnesses exist (5, 13, 31, 181). -/
theorem jsp_000945_four_witnesses :
    DifferencesFromTwiceSquaresArePrime 5 ∧
    DifferencesFromTwiceSquaresArePrime 13 ∧
    DifferencesFromTwiceSquaresArePrime 31 ∧
    DifferencesFromTwiceSquaresArePrime 181 :=
  ⟨diffs_prime_5, diffs_prime_13, diffs_prime_31, diffs_prime_181⟩

end JSP000945

#print axioms JSP000945.jsp_000945_four_witnesses
