const ALLERGENS = [
    "eggs",
    "peanuts",
    "shellfish",
    "strawberries",
    "tomatoes",
    "chocolate",
    "pollen",
    "cats"
]

function allergic_to(score::Integer, allergen::AbstractString)
    idx = findfirst(==(allergen), ALLERGENS)
    return idx === nothing ? false : (score & (1 << (idx - 1))) != 0
end

function allergy_list(score::Integer)
    Set([a for (i, a) in enumerate(ALLERGENS) if (score & (1 << (i - 1))) != 0])
end