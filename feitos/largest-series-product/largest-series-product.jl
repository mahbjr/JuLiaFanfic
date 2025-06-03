function largest_product(digits::AbstractString, span::Integer)
    # Error checks
    if span < 0
        throw(ArgumentError("Span must be non-negative"))
    end
    if span > length(digits)
        throw(ArgumentError("Span longer than string length"))
    end
    if span > 0 && isempty(digits)
        throw(ArgumentError("Empty string with nonzero span"))
    end
    if any(c -> !isdigit(c), digits)
        throw(ArgumentError("Invalid character in digits"))
    end
    if span == 0
        return 1
    end

    maxprod = 0
    for i in 1:(length(digits) - span + 1)
        window = digits[i:i+span-1]
        product_value = prod(map(c -> parse(Int, c), collect(window)))
        if product_value > maxprod
            maxprod = product_value
        end
    end
    return maxprod
end