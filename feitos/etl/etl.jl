function transform(input::Dict{Int, Vector{Char}})
    output = Dict{Char, Int}()
    for (score, letters) in input
        for letter in letters
            output[lowercase(letter)] = score
        end
    end
    return output
end