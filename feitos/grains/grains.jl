function on_square(n::Integer)
    if n < 1 || n > 64
        throw(DomainError(n, "Square number must be between 1 and 64"))
    end
    return UInt64(1) << (n - 1)
end

function total_after(n::Integer)
    if n < 1 || n > 64
        throw(DomainError(n, "Square number must be between 1 and 64"))
    end
    return (UInt64(1) << n) - 1
end