# Tracking Turntable

Welcome to Tracking Turntable on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

`Complex numbers` are not complicated.
They just need a less alarming name.

They are so useful, especially in engineering and science, that Julia includes complex numbers as standard numeric types alongside integers and floating-point numbers.

## Basics

A `complex` value in Julia is essentially a pair of numbers: usually but not always floating-point.
These are called the "real" and "imaginary" parts, for unfortunate historical reasons.
Again, it is best to focus on the underlying simplicity and not the strange names.

To create complex numbers from two real numbers, just add the suffix `im` to the imaginary part.

```julia-repl
julia> z = 1.2 + 3.4im
1.2 + 3.4im
julia> typeof(z)
ComplexF64 (alias for Complex{Float64})
julia> zi = 1 + 2im
1 + 2im
julia> typeof(zi)
Complex{Int64}
```

Thus there are various `Complex` types, derived from the corresponding integer or floating-point type.

To create a complex number from real variables, the above syntax will not work.
Writing `a + bim` confuses the parser into thinking `bim` is a (non-existent) variable name.

Writing `b*im` is possible, but the preferred method uses the `complex()` function, which sidesteps the multiplication and addition operations.

```julia-repl
julia> a = 1.2; b = 3.4; complex(a, b)
1.2 + 3.4im
```

To access the parts of a complex number individually:

```julia-repl
julia> z = 1.2 + 3.4im
1.2 + 3.4im
julia> real(z)
1.2
julia> imag(z)
3.4
```

Or together:

```julia-repl
julia> reim(z)
(1.2, 3.4)
```

Either part can be zero and mathematicians may then talk of the number being "wholly real" or "wholly imaginary".
However, it is still a complex number in Julia.

```julia-repl
julia> zr = 1.2 + 0im
1.2 + 0.0im
julia> typeof(zr)
ComplexF64 (alias for Complex{Float64})
julia> zi = 3.4im
0.0 + 3.4im
julia> typeof(zi)
ComplexF64 (alias for Complex{Float64})
```

You may have heard that "`i` (or `j`) is the square root of -1".

For now, all this means is that the imaginary part _by definition_ satisfies the following equality:

```julia-repl
julia> 1im * 1im == -1
true
```

This is a simple idea, but it leads to interesting consequences.

## Arithmetic

All of the standard mathematical `operators` and elementary functions used with floats and integers also work with complex numbers. A small sample:

```julia-repl
julia> z1 = 1.5 + 2im
1.5 + 2.0im
julia> z2 = 2 + 1.5im
2.0 + 1.5im
julia> z1 + z2  # addition
3.5 + 3.5im
julia> z1 * z2  # multiplication
0.0 + 6.25im
julia> z1 / z2  # division
0.96 + 0.28im
julia> z1^2  # exponentiation
-1.75 + 6.0im
julia> 2^z1  # another exponentiation
0.5188946835878313 + 2.7804223253571183im
```

## Functions

There are several functions, in addition to `real()` and `imag()`, with particular relevance for complex numbers.

- `conj()` simply flips the sign of the imaginary part of a complex number (_from + to - or vice-versa_).
    - Because of the way complex multiplication works, this is more useful than you might think.
- `abs(<complex number>)` is guaranteed to return a real number with no imaginary part.
- `abs2(<complex number>)` returns the square of `abs(<complex number>)`: quicker to calculate than `abs()`, and often what a calculation needs.
- `angle(<complex number>)` returns the phase angle in radians.

```julia-repl
julia> z1
1.5 + 2.0im
julia> conj(z1)
1.5 - 2.0im
julia> abs(z1)
2.5
julia> abs2(z1)
6.25
julia> angle(z1)
0.9272952180016122
```
A partial explanation, for the mathematically-minded:

- The `(real, imag)` representation of `z1` in effect uses Cartesian coordinates on the complex plane.
- The same complex number can be represented in `(r, θ)` notation, using polar coordinates.
- Here, `r` and `θ` are given by `abs(z1)` and `angle(z1)` respectively.

Here is an example using some constants:

```julia-repl
julia> euler = exp(1im * π)
-1.0 + 1.2246467991473532e-16im
julia> real(euler)
-1.0
julia> round(imag(euler), digits=15)  # round to 15 decimal places
0.0
```

The polar `(r, θ)` notation is so useful, that there are built-in functions `cis` (short for `cos(x) + isin(x)`) and `cispi` (short for `cos(πx) + isin(πx)`) which can help in constructing it more efficiently.

The usefulness of polar notation is found in Euler's elegant formula, `ℯ^(iθ) = cos(θ) + isin(θ) = x + iy`, where `|x + iy| = 1`.
With `|x + iy| = r`, we have the more general polar form of `r * ℯ^(iθ) = r * (cos(θ) + isin(θ)) = x + iy`.
Note that the exponential form, in particular, is compact and easy to manipulate.

```julia-repl
julia> exp(1im * π) ≈ cis(π) ≈ cispi(1)
true
```

The approximate equality above is because the functions `cis` and `cispi` can give nicer numerical outputs, with `cispi` in particular when dealing with arguments that are arbitrary factors of π (e.g. radians!).

```julia-repl
julia> cis(π)
-1.0 + 0.0im
julia> cispi(1)
-1.0 + 0.0im
julia> θ = π/2;
julia> exp(im*θ)
6.123233995736766e-17 + 1.0im
julia> cis(θ)
6.123233995736766e-17 + 1.0im
julia> cispi(θ / π)  # θ/π == 1/2
0.0 + 1.0im
```

Incidentally, this makes complex numbers very useful for performing rotations and radial displacements in 2D.

For rotations, the complex number `z = x + iy`, can be rotated an angle `θ` about the origin with a simple multiplication: `z * ℯ^(iθ)`.
Note that the `x` and `y` here are just the usual coordinates on the real 2D Cartesian plane, and a positive angle results in a *counterclockwise* rotation, while a negative angle results in a *clockwise* one.

Likewise simply, a radial displacement `Δr` can be made by adding it to the magnitude `r` of a complex number in the polar form (eg. `z = r * ℯ^(iθ)` -> `z' = (r + Δr) * ℯ^(iθ)`).
Note how the angular part stays the same and only the magnitude, `r`, is varied, as expected.

## Instructions

Turndit Inc. is producing a new turntable which can skip between tracks on a record. Nobody knows why that is a good thing, but they insist on doing it anyway, so just let them. They currently need help in figuring out how to direct the needle to the correct part of the record when desired.

There are two parts to the setup:

The needle is suspended above the turntable and can move left/right and forwards/backwards across the record (think claw machine!).
Since the mechanism controlling the needle moves linearly, it keeps track of its position in a pair of coordinates `(x, y)`, with the origin at the center of the record.

There is a further optical setup which keeps track of where the needle is and where the previous or next song begins.
Since the record is rotating, it's easier to track the radial difference and the angular separation between the two points, `(Δr, Δθ)`, again with the origin at the center of the record.

Turndit needs to know how to find the new `(x, y)` coordinates to which the needle will move when a different track is selected.

~~~~exercism/note
These operations can be done through trigonometric functions and/or rotation matrices, but they can be made simpler (and more fun, I assure you!) with the use of complex numbers via rotations and radial displacements. 
In fact, each function in this exercise can be written in assigment form (i.e. a one-liner) using complex numbers and built-in Julia methods/functionality, should you so desire.
~~~~

## 1. Construct a complex number from Cartesian coordinates

Implement the `z(x, y)` function which takes an `x` coordinate, a `y` coordinate from the complex plane and returns the equivalent complex number.

```julia-repl
julia> z(1, 1)
1.0 + 1.0im

julia> z(4.5, -7.3)
4.5 - 7.3im
```

## 2. Construct a complex number from Polar coordinates

Implement the `euler(r, θ)` function, which takes a radial coordinate `r`, an angle `θ` (in radians) and returns the equivalent complex number in rectangular form.

```julia-repl
julia> euler(1, π)
-1.0 + 0.0im

julia> euler(3, π/2)
0.0 + 3.0im

julia> euler(2, -π/4)
1.4142135623730951 - 1.414213562373095im  # √2 - √2im
```

## 3. Perform a 2D vector rotation

Implement the `rotate(x, y, θ)` function which takes an `x` coordinate, a `y` coordinate and an angle `θ` (in radians).
The function should rotate the point about the origin by the given angle `θ` and return the new coordinates as a tuple.

```julia-repl
julia> rotate(0, 1, π)
(0, -1)

julia> rotate(1, 1, -π/2)
(1, -1)
```
## 4. Perform a radial displacement

Implement the function `rdisplace(x, y, r)` which takes an `x` coordinate, a `y` coordinate and a radial displacement `r`.
The function should displace the point along the radius by the amount `r` and return the new coordinates as a tuple.

```julia-repl
julia> rdisplace(0, 1, 1)
(0, 2)

julia> rdisplace(1, 1, √2)
(2, 2)
```
## 5. Find the desired song

Implement a function `findsong(x, y, r, θ)` which takes the x and y coordinates of the needle as well as the radial and angular displacement between the needle and the beginning of the desired song. The new coordinates should be returned as a tuple.

```julia-repl
julia> findsong(0, 1, 3, -π/2)
(4, 0)

julia> findsong(√2, √2, 0, 3π/4)
(-2, 0)
```

## Source

### Created by

- @depial