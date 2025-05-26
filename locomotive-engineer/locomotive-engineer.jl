function get_vector_of_wagons(args...)
    return collect(args)
end

function fix_vector_of_wagons(each_wagons_id, missing_wagons)
    # Move the first two wagons to the end
    reordered = vcat(each_wagons_id[3:end], each_wagons_id[1:2])
    # Find the index of the locomotive (ID 1)
    loc_idx = findfirst(==(1), reordered)
    # Insert missing_wagons after the locomotive
    vcat(
        reordered[1:loc_idx],
        missing_wagons,
        reordered[(loc_idx+1):end]
    )
end

function add_missing_stops(route, stops...)
    # Create a copy of the original route dictionary to avoid modifying it directly
    new_route = copy(route)
    
    # Create a list of stops from the pairs
    stops_vec = [pair[2] for pair in stops]
    
    # Create a new key for stops with the vector as its value
    new_route = merge(new_route, Dict("stops" => stops_vec))
    
    return new_route
end

function extend_route_information(route; more_route_information...)
    return merge(route, Dict(more_route_information))
end
