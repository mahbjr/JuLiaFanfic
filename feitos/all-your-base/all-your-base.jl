function all_your_base(digits::Vector, input_base::Int, output_base::Int)
    # Validate bases
    if input_base ≤ 1 || output_base ≤ 1
        throw(DomainError("Bases must be greater than 1"))
    end
    
    # Handle empty array case
    if isempty(digits)
        return [0]
    end
    
    # Validate digits
    if any(d -> d < 0 || d ≥ input_base, digits)
        throw(DomainError("Digits must be non-negative and less than input base"))
    end

    # Remove leading zeros
    first_nonzero = findfirst(!=(0), digits)
    if first_nonzero === nothing
        return [0]  # All zeros
    end
    digits = digits[first_nonzero:end]

    # Convert input digits to integer value
    value = 0
    for d in digits
        value = value * input_base + d
    end

    # Convert integer value to output base
    out_digits = Int[]
    if value == 0
        return [0]
    end
    while value > 0
        pushfirst!(out_digits, value % output_base)
        value ÷= output_base
    end
    return out_digits
end