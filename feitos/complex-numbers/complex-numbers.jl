struct ComplexNumber <: Number
    re::Float64
    im::Float64
end

# Constructors
ComplexNumber(re::Real, im::Real) = ComplexNumber(float(re), float(im))

# Equality
import Base: ==, +, -, *, /, abs, conj, real, imag, ^, show, convert, promote_rule, exp

==(a::ComplexNumber, b::ComplexNumber) = isapprox(a.re, b.re) && isapprox(a.im, b.im)

# Arithmetic
+(a::ComplexNumber, b::ComplexNumber) = ComplexNumber(a.re + b.re, a.im + b.im)
-(a::ComplexNumber, b::ComplexNumber) = ComplexNumber(a.re - b.re, a.im - b.im)
*(a::ComplexNumber, b::ComplexNumber) = ComplexNumber(a.re*b.re - a.im*b.im, a.re*b.im + a.im*b.re)
function /(a::ComplexNumber, b::ComplexNumber)
    denom = b.re^2 + b.im^2
    ComplexNumber((a.re*b.re + a.im*b.im)/denom, (a.im*b.re - a.re*b.im)/denom)
end

# Power
^(a::ComplexNumber, n::Integer) = begin
    result = ComplexNumber(1.0, 0.0)
    for _ in 1:abs(n)
        result = result * a
    end
    n < 0 ? ComplexNumber(1.0, 0.0) / result : result
end

# Absolute value
abs(a::ComplexNumber) = hypot(a.re, a.im)

# Conjugate
conj(a::ComplexNumber) = ComplexNumber(a.re, -a.im)

# Real and Imaginary parts
real(a::ComplexNumber) = a.re
imag(a::ComplexNumber) = a.im

# Show
function show(io::IO, z::ComplexNumber)
    print(io, "ComplexNumber(", z.re, ", ", z.im, ")")
end

# Promotion and conversion
convert(::Type{ComplexNumber}, x::Real) = ComplexNumber(float(x), 0.0)
promote_rule(::Type{ComplexNumber}, ::Type{T}) where {T<:Real} = ComplexNumber

# Bonus A: Complex exponential
exp(z::ComplexNumber) = ComplexNumber(exp(z.re)*cos(z.im), exp(z.re)*sin(z.im))

# Bonus B: Syntax sugar jm
const jm = ComplexNumber(0.0, 1.0)
import Base: +
+(x::Real, y::ComplexNumber) = ComplexNumber(float(x) + y.re, y.im)
+(x::ComplexNumber, y::Real) = ComplexNumber(x.re + float(y), x.im)
-(x::Real, y::ComplexNumber) = ComplexNumber(float(x) - y.re, -y.im)
-(x::ComplexNumber, y::Real) = ComplexNumber(x.re - float(y), x.im)
*(x::Real, y::ComplexNumber) = ComplexNumber(float(x)*y.re, float(x)*y.im)
*(x::ComplexNumber, y::Real) = ComplexNumber(x.re*float(y), x.im*float(y))
/(x::Real, y::ComplexNumber) = ComplexNumber(float(x), 0.0) / y
/(x::ComplexNumber, y::Real) = ComplexNumber(x.re/float(y), x.im/float(y))

# Syntax sugar: 1 + 1jm
import Base: ^, convert
import Base: literal_pow
literal_pow(::typeof(^), x::ComplexNumber, ::Val{2}) = x * x

# Allow 1 + 1jm syntax
import Base: promote
promote(x::Real, y::ComplexNumber) = (ComplexNumber(float(x), 0.0), y)
promote(x::ComplexNumber, y::Real) = (x, ComplexNumber(float(y), 0.0))

# Allow 1 + 1jm syntax
import Base: parse
# Not needed for this exercise, as 1 + 1jm is handled by above methods.