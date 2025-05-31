function isisogram(s::AbstractString)
    seen = Set{Char}()
    for c in lowercase(s)
        if isletter(c)
            if c in seen
                return false
            end
            push!(seen, c)
        end
    end
    return true
end