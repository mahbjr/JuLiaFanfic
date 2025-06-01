function eggcount(number::Integer)
    count = 0
    n = number
    while n > 0
        count += n & 1
        n >>= 1
    end
    return count
end