function sieve(limit::Int)
    if limit < 2
        return Int[]
    end
    is_prime = trues(limit)
    is_prime[1] = false  # 1 is not prime
    for i in 2:floor(Int, sqrt(limit))
        if is_prime[i]
            for j in i*i:i:limit
                is_prime[j] = false
            end
        end
    end
    return [i for i in 1:limit if is_prime[i]]
end