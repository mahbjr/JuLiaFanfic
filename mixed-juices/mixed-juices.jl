function time_to_mix_juice(juice)
    if juice == "Pure Strawberry Joy"
        return 0.5
    elseif juice == "Energizer" || juice == "Green Garden"
        return 1.5
    elseif juice == "Tropical Island"
        return 3
    elseif juice == "All or Nothing"
        return 5
    else
        return 2.5
    end
end

function limes_to_cut(needed, limes)
    wedges = 0
    count = 0
    for lime in limes
        if wedges >= needed
            break
        end
        if lime == "small"
            wedges += 6
        elseif lime == "medium"
            wedges += 8
        elseif lime == "large"
            wedges += 10
        end
        count += 1
    end
    return wedges >= needed ? count : count
end


function order_times(orders)
    return [time_to_mix_juice(order) for order in orders]
end

function remaining_orders(time_left, orders)
    time = time_left
    i = 1
    while i <= length(orders) && time > 0
        time -= time_to_mix_juice(orders[i])
        i += 1
    end
    return orders[i:end]
end
