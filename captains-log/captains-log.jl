function random_planet()
    planet_classes = ['D', 'H', 'J', 'K', 'L', 'M', 'N', 'R', 'T', 'Y']
    return rand(planet_classes)
end

function random_ship_registry_number()
    return "NCC-" * string(rand(1000:9999))
end

function random_stardate()
    return rand() * (42000.0 - 41000.0) + 41000.0
end

function random_stardate_v2()
    return round(rand() * (42000.0 - 41000.0) + 41000.0, digits=1)
end

function pick_starships(starships, number_needed)
    # Convert any iterable to a vector to ensure we can sample from it
    starships_vec = collect(starships)
    
    # Ensure we don't try to sample more elements than available
    n = min(number_needed, length(starships_vec))
    
    # Manually implement sampling without replacement
    result = String[]
    available = copy(starships_vec)
    
    for _ in 1:n
        if isempty(available)
            break
        end
        
        # Select a random index
        idx = rand(1:length(available))
        
        # Add the selected item to the result
        push!(result, available[idx])
        
        # Remove the selected item from available items to prevent duplicates
        deleteat!(available, idx)
    end
    
    return result
end
