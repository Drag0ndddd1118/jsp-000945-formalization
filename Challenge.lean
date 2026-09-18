/-
  The Justin Sun Prize (孙宇晨奖) — JSP-000945

  **Challenge.lean: the statement of record.**

  This file declares the definitions the problem is phrased with, and the proposition
  `jsp000945Statement`. It proves nothing. `Submission.lean` imports this file, so the proof and the
  statement refer to the *same* constant and the statement cannot drift between them.
  `check.py` type-checks the bridge

      example : JSP000945.jsp000945Statement := JSP000945.jsp_000945_four_witnesses

  and audits the axioms the submitted proof depends on. A reviewer has only to read this
  file in order to judge *what* has been claimed.
-/


namespace JSP000945

/-- Computable primality test on natural numbers. -/
def isPrime (p : Nat) : Bool :=
  2 ≤ p && (List.range (p - 2)).all (fun i => p % (i + 2) != 0)

/-- The property that n is positive and its difference from twice every permitted
    smaller square (k ≥ 0 with 2 * k^2 < n) is prime. -/
def DifferencesFromTwiceSquaresArePrime (n : Nat) : Prop :=
  0 < n ∧ ∀ k : Nat, 2 * k ^ 2 < n → isPrime (n - 2 * k ^ 2) = true

/-- Strict version: considering strictly positive squares k ≥ 1 with 2 * k^2 < n. -/
def PosDifferencesFromTwiceSquaresArePrime (n : Nat) : Prop :=
  2 < n ∧ ∀ k : Nat, 0 < k → 2 * k ^ 2 < n → isPrime (n - 2 * k ^ 2) = true

/-- **Statement of record for JSP-000945.**

The proposition this development resolves, phrased with the definitions above and
nothing else. -/

def jsp000945Statement : Prop :=
  DifferencesFromTwiceSquaresArePrime 5 ∧
      DifferencesFromTwiceSquaresArePrime 13 ∧
      DifferencesFromTwiceSquaresArePrime 31 ∧
      DifferencesFromTwiceSquaresArePrime 181

end JSP000945
