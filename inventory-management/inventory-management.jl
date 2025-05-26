function create_inventory(items)
    return Dict(item => count(==(item), items) for item in unique(items))
end

function add_items(inventory, items)
    for item in items
        inventory[item] = get(inventory, item, 0) + 1
    end
    return inventory
end

function decrement_items(inventory, items)
    for item in items
        if haskey(inventory, item)
            inventory[item] = max(inventory[item] - 1, 0)
        end
    end
    return inventory
end

function remove_item(inventory, item)
    if haskey(inventory, item)
        delete!(inventory, item)
    end
    return inventory
end

function list_inventory(inventory)
    return sort([item => qty for (item, qty) in inventory if qty > 0], by = x -> x.first)
end
