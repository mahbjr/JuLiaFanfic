function sum_of_multiples(limit::Int, factors::Vector{Int})
    # Remove zeros from factors to avoid division by zero
    factors = filter(!=(0), factors)
    # If no valid factors, return 0
    if isempty(factors)
        return 0
    end
    # Use a Set to avoid double-counting
    multiples = Set{Int}()
    for f in factors
        for n in f:f:limit-1
            push!(multiples, n)
        end
    end
    return sum(multiples)
end