function triangle(n::Integer)
    if n < 0
        throw(DomainError(n, "Number of rows must be non-negative"))
    elseif n == 0
        return []
    end

    result = Vector{Vector{Int}}()
    for i in 1:n
        if i == 1
            push!(result, [1])
        else
            prev = result[end]
            row = [1]
            for j in 1:length(prev)-1
                push!(row, prev[j] + prev[j+1])
            end
            push!(row, 1)
            push!(result, row)
        end
    end
    return result
end