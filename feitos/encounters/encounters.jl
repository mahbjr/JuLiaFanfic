abstract type Pet end

struct Dog <: Pet
    name::String
end

struct Cat <: Pet
    name::String
end

name(p::Dog) = p.name
name(p::Cat) = p.name

name(p::Pet) = error("name not implemented for this Pet")

meets(a::Dog, b::Dog) = "$(name(a)) meets $(name(b)) and sniffs."
meets(a::Dog, b::Cat) = "$(name(a)) meets $(name(b)) and chases."
meets(a::Cat, b::Dog) = "$(name(a)) meets $(name(b)) and hisses."
meets(a::Cat, b::Cat) = "$(name(a)) meets $(name(b)) and slinks."
meets(a::Pet, b::Pet) = "$(name(a)) meets $(name(b)) and is cautious."
meets(a::Pet, b) = "$(name(a)) meets $(name(b)) and runs away."
meets(a, b::Pet) = "$(name(a)) meets $(name(b)) and nothing happens."
meets(a, b) = "$(name(a)) meets $(name(b)) and nothing happens."

encounter(a, b) = meets(a, b)
