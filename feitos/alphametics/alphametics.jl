export solve  # Add this line to export the function

"""
    solve(puzzle::String) -> Union{Dict{Char, Int}, Nothing}

Solves an alphametics puzzle given as a string, e.g. "SEND + MORE == MONEY".
Returns a Dict mapping each letter to its digit, or `nothing` if no solution.
"""
function solve(puzzle::String)
    # Parse the puzzle
    lhs, rhs = split(puzzle, "==")
    lhs_words = split(replace(lhs, "+" => " "), ' ', keepempty=false)
    rhs_word = strip(rhs)
    words = [lhs_words; [rhs_word]]
    
    # Extract letters and ensure they're unique
    letters = Set{Char}()
    for word in words
        for letter in word
            if isletter(letter)
                push!(letters, letter)
            end
        end
    end
    
    # Check if we have too many letters
    if length(letters) > 10
        return nothing
    end
    
    # Identify leading letters (cannot be zero)
    leading_letters = Set{Char}()
    for word in words
        for char in word
            if isletter(char)
                push!(leading_letters, char)
                break
            end
        end
    end
    
    # Convert to arrays for indexing
    letters_arr = collect(letters)
    
    # Try different digit assignments
    function backtrack(idx, used_digits, letter_vals)
        # Base case: all letters assigned
        if idx > length(letters_arr)
            # Check if the equation is satisfied
            lhs_val = 0
            for word in lhs_words
                word_val = 0
                for c in word
                    if isletter(c)
                        word_val = word_val * 10 + letter_vals[c]
                    end
                end
                lhs_val += word_val
            end
            
            rhs_val = 0
            for c in rhs_word
                if isletter(c)
                    rhs_val = rhs_val * 10 + letter_vals[c]
                end
            end
            
            return lhs_val == rhs_val ? letter_vals : nothing
        end
        
        # Try assigning each available digit to the current letter
        letter = letters_arr[idx]
        for digit in 0:9
            # Skip if digit already used
            if digit in used_digits
                continue
            end
            
            # Skip if assigning 0 to a leading letter
            if digit == 0 && letter in leading_letters
                continue
            end
            
            # Try this digit
            new_letter_vals = copy(letter_vals)
            new_letter_vals[letter] = digit
            new_used_digits = copy(used_digits)
            push!(new_used_digits, digit)
            
            result = backtrack(idx + 1, new_used_digits, new_letter_vals)
            if result !== nothing
                return result
            end
        end
        
        return nothing
    end
    
    return backtrack(1, Set{Int}(), Dict{Char, Int}())
end
