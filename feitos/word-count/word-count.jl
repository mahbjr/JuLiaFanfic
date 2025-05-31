function wordcount(s::AbstractString)
    # Convert to lowercase for case-insensitivity
    s = lowercase(s)
    # Use regex to match words: letters, numbers, and apostrophes inside words
    words = collect(m.match for m in eachmatch(r"\b[0-9a-z]+(?:'[0-9a-z]+)?\b", s))
    counts = Dict{String, Int}()
    for w in words
        counts[w] = get(counts, w, 0) + 1
    end
    return counts
end