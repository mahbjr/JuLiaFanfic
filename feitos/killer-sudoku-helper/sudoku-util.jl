function combinations_in_cage(target_sum::Int, n::Int, exclude::Vector{Int}=Int[])
    # Digits allowed in Sudoku (1-9, minus any excluded digits)
    digits = setdiff(1:9, exclude)
    
    # Generate all combinations of n digits from allowed digits
    combs = collect(combinations(digits, n))
    
    # Filter combinations whose sum is the required sum
    result = [sort(c) for c in combs if sum(c) == target_sum]
    
    # Sort the result for consistent order
    sort(result)
end

# Helper function for combinations (since base Julia's combinations is in Combinatorics.jl)
function combinations(iter, k)
    if k == 0
        return [[]]
    end
    result = []
    for (i, x) in enumerate(iter)
        for tail in combinations(iter[i+1:end], k-1)
            push!(result, [x; tail])
        end
    end
    return result
end