
function prime_factors(n::Integer)
    factors = Int[]
    x = n
    if x < 2
        return factors
    end
    d = 2
    while d * d <= x
        while x % d == 0
            push!(factors, d)
            x ÷= d
        end
        d += 1
    end
    if x > 1
        push!(factors, x)
    end
    return factors
end