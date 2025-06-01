function clean(number::AbstractString)
    # Remove all non-digit characters
    digits = filter(isdigit, number)

    # Check for valid length
    if length(digits) == 11
        if digits[1] != '1'
            throw(ArgumentError("11-digit numbers must start with 1"))
        end
        digits = digits[2:end]
    elseif length(digits) != 10
        throw(ArgumentError("Phone number must be 10 or 11 digits"))
    end

    # Area code and exchange code checks
    area = digits[1:3]
    exchange = digits[4:6]

    if area[1] == '0' || area[1] == '1'
        throw(ArgumentError("Area code cannot start with 0 or 1"))
    end
    if exchange[1] == '0' || exchange[1] == '1'
        throw(ArgumentError("Exchange code cannot start with 0 or 1"))
    end

    return digits
end