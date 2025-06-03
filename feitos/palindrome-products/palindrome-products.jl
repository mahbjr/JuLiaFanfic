function is_palindrome(n::Int)
    s = string(n)
    return s == reverse(s)
end

function palindromeproducts(min::Int, max::Int, find_smallest::Bool)
    if min > max
        throw(ArgumentError("min must not be greater than max"))
    end

    found = false
    best_palindrome = find_smallest ? typemax(Int) : typemin(Int)
    factor_pairs = []

    for i in min:max
        for j in i:max
            prod = i * j
            if is_palindrome(prod)
                if find_smallest
                    if prod < best_palindrome
                        best_palindrome = prod
                        factor_pairs = [[i, j]]
                        found = true
                    elseif prod == best_palindrome
                        push!(factor_pairs, [i, j])
                    end
                else
                    if prod > best_palindrome
                        best_palindrome = prod
                        factor_pairs = [[i, j]]
                        found = true
                    elseif prod == best_palindrome
                        push!(factor_pairs, [i, j])
                    end
                end
            end
        end
    end

    if !found
        return (nothing, [])
    else
        return (best_palindrome, factor_pairs)
    end
end