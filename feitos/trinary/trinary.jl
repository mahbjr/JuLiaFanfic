function trinary_to_decimal(s::AbstractString)
    # Check if the string contains only valid trinary digits
    all(c -> c in ('0', '1', '2'), s) || return 0
    result = 0
    for (i, c) in enumerate(reverse(s))
        result += (Int(c) - Int('0')) * 3^(i - 1)
    end
    return result
end