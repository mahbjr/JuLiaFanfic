function luhn(s::AbstractString)
    # Remove spaces
    digits = filter(!isspace, s)
    # Must be at least two digits and all characters must be digits
    if length(digits) < 2 || any(!isdigit, digits)
        return false
    end
    # Convert to integer array, right to left
    nums = reverse([parse(Int, c) for c in digits])
    # Apply Luhn algorithm
    total = 0
    for (i, n) in enumerate(nums)
        if isodd(i)
            total += n
        else
            d = n * 2
            total += d > 9 ? d - 9 : d
        end
    end
    return total % 10 == 0
end