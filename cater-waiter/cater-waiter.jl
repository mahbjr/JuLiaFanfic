include("sets_categories_data.jl")

function clean_ingredients(dish_name, dish_ingredients)
    return (dish_name, Set(dish_ingredients))
end

function check_drinks(drink_name, drink_ingredients)
    if any(ingredient in ALCOHOLS for ingredient in drink_ingredients)
        return "$drink_name Cocktail"
    else
        return "$drink_name Mocktail"
    end
end

function categorize_dish(dish_name, dish_ingredients)
    if dish_ingredients ⊆ VEGAN
        return "$dish_name: VEGAN"
    elseif dish_ingredients ⊆ VEGETARIAN
        return "$dish_name: VEGETARIAN"
    elseif dish_ingredients ⊆ PALEO
        return "$dish_name: PALEO"
    elseif dish_ingredients ⊆ KETO
        return "$dish_name: KETO"
    else
        return "$dish_name: OMNIVORE"
    end
end

function tag_special_ingredients(dish)
    name, ingredients = dish
    specials = Set(ingredients) ∩ SPECIAL_INGREDIENTS
    return (name, specials)
end

function compile_ingredients(dishes)
    return reduce(union, dishes)
end

function separate_appetizers(dishes, appetizers)
    return collect(setdiff(Set(dishes), Set(appetizers)))
end

function singleton_ingredients(dishes, intersection)
    return setdiff(reduce(union, dishes), intersection)
end
