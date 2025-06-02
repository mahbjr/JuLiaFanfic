function collatz_steps(n::Integer)
    if n <= 0
        throw(DomainError(n, "Input must be a positive integer"))
    end
    steps = 0
    while n != 1
        if iseven(n)
            n ÷= 2
        else
            n = 3n + 1
        end
        steps += 1
    end
    return steps
end