# Formalization of JSP-000945: Integers Whose Differences from Twice Smaller Squares Are Prime

Machine-checked Lean 4 formalization for **JSP-000945** from [The Justin Sun Prize problem bank](https://github.com/TheJustinSunPrize/awards).

## Problem Description
> **JSP-000945**: Is there an integer whose differences from twice every permitted smaller square are all prime?
>
> **Mathematical Area**: Number theory  
> **Status**: Solved (Affirmative)

## Mathematical Background & Constructive Witnesses
Paul Erdős investigated additive properties of integers and asked whether there exists an integer $n$ such that $n - 2k^2$ is prime for every permitted smaller square $k^2$ (i.e. whenever $2k^2 < n$).

Mihai Epure and Alexandru Gica (2010), in *"Principal quadratic real fields in connection with some additive problems"*, *Bull. Math. Soc. Sci. Math. Roumanie (N.S.)* 53 (101), no. 3, pp. 251–259 (building on class number one criteria for real quadratic fields by Mollin and Williams 1989), analyzed positive integers $N \equiv 2 \pmod 8$ such that $N - a^2$ is double a prime for every non-negative even integer $a$ with $a^2 \le N$.
They proved that there are exactly four such positive integers:
$$N \in \{10, 26, 62, 362\}.$$

Setting $a = 2k$ and $n = N/2$, the condition $N - (2k)^2 = 2(n - 2k^2)$ implies that $n - 2k^2$ is prime for every $k \ge 0$ with $2k^2 < n$.
The corresponding values of $n$ are:
$$n \in \{5, 13, 31, 181\}.$$

### Concrete Verifications
- **$n = 5$**:
  - $k = 0 \implies 5 - 2(0)^2 = 5$ (prime)
  - $k = 1 \implies 5 - 2(1)^2 = 3$ (prime)
  - For $k \ge 2$: $2k^2 \ge 8 > 5$.
- **$n = 13$**:
  - $k = 0 \implies 13$ (prime)
  - $k = 1 \implies 13 - 2 = 11$ (prime)
  - $k = 2 \implies 13 - 8 = 5$ (prime)
  - For $k \ge 3$: $2k^2 \ge 18 > 13$.
- **$n = 31$**:
  - $k = 0 \implies 31$ (prime)
  - $k = 1 \implies 29$ (prime)
  - $k = 2 \implies 23$ (prime)
  - $k = 3 \implies 13$ (prime)
  - For $k \ge 4$: $2k^2 \ge 32 > 31$.
- **$n = 181$**:
  - $k \in \{0, 1, 2, 3, 4, 5, 6, 7, 8, 9\}$ gives $\{181, 179, 173, 163, 149, 131, 109, 83, 53, 19\}$, all prime.
  - For $k \ge 10$: $2k^2 \ge 200 > 181$.

## Formalized Theorems
- `jsp_000945_affirmative`: $\exists n : \mathbb{N}, \text{DifferencesFromTwiceSquaresArePrime}(n)$
- `jsp_000945_pos_affirmative`: $\exists n : \mathbb{N}, n > 2 \land \text{PosDifferencesFromTwiceSquaresArePrime}(n)$
- `jsp_000945_four_witnesses`: Simultaneous verification of all four witnesses $n \in \{5, 13, 31, 181\}$.

## Verification
- **Lean Toolchain**: `leanprover/lean4:v4.34.0`
- **Dependencies**: Lean 4 core (pure, zero external libraries).
- **Axioms**: Clean (`[propext, Quot.sound]`, 0 `sorry`, 0 custom axioms).

```bash
lake build
```

## Statement of record — `Challenge.lean`

`Challenge.lean` declares the definitions the problem is phrased with and the proposition
`JSP000945.jsp000945Statement`. It proves nothing, so a reviewer has only to read that one file to judge *what* has
been claimed.

```lean
  DifferencesFromTwiceSquaresArePrime 5 ∧
      DifferencesFromTwiceSquaresArePrime 13 ∧
      DifferencesFromTwiceSquaresArePrime 31 ∧
      DifferencesFromTwiceSquaresArePrime 181
```

## Proof — `Submission.lean`

`Submission.lean` imports `Challenge.lean`, so the proof and the statement refer to the *same*
`JSP000945.jsp000945Statement` constant and cannot drift apart. The top-level result is

```lean
JSP000945.jsp_000945_four_witnesses
```

It depends on `Quot.sound`, `propext` only, and the file contains no `sorry`, no `admit` and no `axiom`
declaration. `check.py` type-checks the bridge

```
example : JSP000945.jsp000945Statement := JSP000945.jsp_000945_four_witnesses
```

and re-runs the axiom audit.

## Build and check

```sh
lake build
python3 check.py
```

Toolchain: `leanprover/lean4:v4.34.0` (commit `293d5d0c0c3f3dded4688b3ccd6a33939ac5102b`). The development is self-contained:
it uses Lean core only and depends on no external library.
