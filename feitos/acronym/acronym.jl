function acronym(phrase::AbstractString)
    # Replace delimiters with spaces
    cleaned = replace(phrase, r"[-_,]" => " ")
    # Split on whitespace
    words = split(cleaned)
    # Extract first letter of each word
    letters = []
    for word in words
        if !isempty(word) && occursin(r"[A-Za-z]", word)
            # Find the first letter in the word
            for char in word
                if isletter(char)
                    push!(letters, char)
                    break
                end
            end
        end
    end
    # Concatenate and uppercase
    return uppercase(join(letters))
end