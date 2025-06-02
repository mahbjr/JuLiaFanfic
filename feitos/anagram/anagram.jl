function detect_anagrams(subject::AbstractString, candidates::Vector{String})
    # Helper to normalize and sort letters
    function normalize(word)
        return sort(collect(lowercase(word)))
    end

    subject_lower = lowercase(subject)
    subject_norm = normalize(subject)

    result = String[]
    for candidate in candidates
        candidate_lower = lowercase(candidate)
        # Skip if candidate is the same as subject (case-insensitive)
        if candidate_lower == subject_lower
            continue
        end
        # Check if sorted letters match
        if normalize(candidate) == subject_norm
            push!(result, candidate)
        end
    end
    return result
end