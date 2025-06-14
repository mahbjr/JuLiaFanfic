"""
Performs a bitwise right shift operation.
"""
function shift_back(number::Integer, shift_amount::Integer)
    # Use a conversão para Int32 conforme exigido pelo teste
    if isa(number, Int32)
        return number >>> shift_amount
    else
        # Converter para Int32 e depois fazer a operação de shift
        return Int32(number) >>> shift_amount
    end
end

"""
Sets specific bits in a number.
When a bit in the mask is 1, that same bit in the number is set to 1.
"""
function set_bits(number::Integer, mask::Integer)
    return number | mask
end

"""
Flips specific bits in a number.
When a bit in the mask is 1, that same bit in the number is flipped.
"""
function flip_bits(number::Integer, mask::Integer)
    return number ⊻ mask  # Utilizando o operador XOR (⊻)
end

"""
Clears specific bits in a number.
When a bit in the mask is 1, that same bit in the number is cleared to 0.
"""
function clear_bits(number::Integer, mask::Integer)
    return number & ~mask  # Inverte o mask e faz AND bit a bit
end
