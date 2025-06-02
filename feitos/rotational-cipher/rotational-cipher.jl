module RotationalCipher

"""
    rotate(n, s)

Rotates each letter in `s` by `n` positions in the alphabet.
Non-letter characters are unchanged.
If `s` is a Char, returns a Char. If `s` is a String, returns a String.
"""
function rotate(n::Integer, s::AbstractString)
    return join(rotate(n, c) for c in s)
end

function rotate(n::Integer, c::Char)
    if 'a' <= c <= 'z'
        return Char('a' + mod(Int(c) - Int('a') + n, 26))
    elseif 'A' <= c <= 'Z'
        return Char('A' + mod(Int(c) - Int('A') + n, 26))
    else
        return c
    end
end

# Bonus A: R13 string literal macro
macro R13_str(s)
    return :(RotationalCipher.rotate(13, $s))
end

# Bonus B: Rn string literal macros
for n in 1:26
    macro_name = Symbol("@R$(n)_str")
    @eval begin
        macro $macro_name(s)
            return :(RotationalCipher.rotate($n, $s))
        end
    end
end

end # module

using .RotationalCipher: rotate
export rotate

# Export bonus macros if needed
for n in 1:26
    macro_name = Symbol("@R$(n)_str")
    @eval export $macro_name
end
export @R13_str