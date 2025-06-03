function saddlepoints(M::AbstractArray{T}) where T
    # Handle the case where M is a vector (1D array)
    if ndims(M) == 1
        return NTuple{2,Int}[]  # Return empty result for vector input
    end
    
    # Regular matrix processing
    nrows, ncols = size(M)
    result = NTuple{2,Int}[]
    if nrows == 0 || ncols == 0
        return result
    end

    rowmax = [maximum(M[i, :]) for i in 1:nrows]
    colmin = [minimum(M[:, j]) for j in 1:ncols]

    for i in 1:nrows
        for j in 1:ncols
            if M[i, j] == rowmax[i] && M[i, j] == colmin[j]
                push!(result, (i, j))
            end
        end
    end
    return result
end