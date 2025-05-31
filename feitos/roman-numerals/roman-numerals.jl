function to_roman(n::Integer)
    if n < 1 || n > 3999
        throw(ErrorException("Input must be between 1 and 3999"))
    end
    numerals = [
        (1000, "M"),
        (900, "CM"),
        (500, "D"),
        (400, "CD"),
        (100, "C"),
        (90, "XC"),
        (50, "L"),
        (40, "XL"),
        (10, "X"),
        (9, "IX"),
        (5, "V"),
        (4, "IV"),
        (1, "I"),
    ]
    result = IOBuffer()
    num = n
    for (value, roman) in numerals
        while num >= value
            print(result, roman)
            num -= value
        end
    end
    return String(take!(result))
end