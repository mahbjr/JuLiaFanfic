const ANIMALS = [
    ("fly", "", ""),
    ("spider", "It wriggled and jiggled and tickled inside her.", " that wriggled and jiggled and tickled inside her."),
    ("bird", "How absurd to swallow a bird!", ""),
    ("cat", "Imagine that, to swallow a cat!", ""),
    ("dog", "What a hog, to swallow a dog!", ""),
    ("goat", "Just opened her throat and swallowed a goat!", ""),
    ("cow", "I don't know how she swallowed a cow!", ""),
    ("horse", "", "")
]

function verse(n)
    idx = n
    animal, comment, swallow_extra = ANIMALS[idx]
    lines = String[]
    push!(lines, "I know an old lady who swallowed a $animal.")

    # Special case: horse
    if animal == "horse"
        push!(lines, "She's dead, of course!")
        return lines
    end

    # Add animal-specific comment if present
    if !isempty(comment)
        push!(lines, comment)
    end

    # Build the chain for verses > 1
    if idx > 1
        for i in reverse(2:idx)
            pred_animal, _, pred_swallow_extra = ANIMALS[i-1]
            curr_animal, _, curr_swallow_extra = ANIMALS[i]
            if curr_animal == "bird" && pred_animal == "spider"
                push!(lines, "She swallowed the $curr_animal to catch the $pred_animal$pred_swallow_extra.")
            else
                push!(lines, "She swallowed the $curr_animal to catch the $pred_animal$pred_swallow_extra.")
            end
        end
    end

    # Always end with the fly line
    push!(lines, "I don't know why she swallowed the fly. Perhaps she'll die.")
    return lines
end

function recite(start_verse, end_verse)
    result = String[]
    for n in start_verse:end_verse
        append!(result, verse(n))
        if n != end_verse
            push!(result, "")
        end
    end
    return result
end