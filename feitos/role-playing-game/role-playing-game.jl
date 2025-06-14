# 1. Define type unions
const StringOrMissing = Union{String, Missing}
const IntOrNothing = Union{Int, Nothing}

# 2. Implement the Player composite type
mutable struct Player
    name::StringOrMissing
    level::Int
    health::Int
    mana::IntOrNothing
    
    # Inner constructor without type annotations in parameters
    function Player(name=missing, level=0, health=100, mana=nothing)
        # Manually check types and convert if needed
        if !(name isa StringOrMissing)
            throw(MethodError(Player, (name,)))
        end
        if !(level isa Int)
            level = convert(Int, level)  # This will throw InexactError for non-integer values
        end
        if !(health isa Int)
            health = convert(Int, health)  # This will throw InexactError for non-integer values
        end
        if !(mana isa IntOrNothing)
            if mana isa Int
                # Allow integer values
            else
                mana = convert(Int, mana)  # This will throw InexactError for non-convertible values
            end
        end
        
        return new(name, level, health, mana)
    end
end

# Keyword arguments constructor
Player(; name=missing, level=0, health=100, mana=nothing) = 
    Player(name, level, health, mana)

# 3. Introduce yourself
function introduce(player::Player)
    return ismissing(player.name) ? "Mighty Magician" : player.name
end

# 4. Implement increment methods
function increment(name::StringOrMissing)
    return ismissing(name) ? "The Great" : "$name the Great"
end

function increment(mana::IntOrNothing)
    return isnothing(mana) ? 50 : mana + 100
end

# 5. Implement the title function
function title(player::Player)
    if player.level == 42
        # Update the player's name using increment
        player.name = increment(player.name)
    end
    return player.name
end

# 6. Implement the revive function
function revive(player::Player)
    if player.health > 0
        # Player is still alive, do nothing
        return player
    end
    
    # Player is dead, restore health and increase mana
    player.health = 100
    player.mana = increment(player.mana)
    return player
end
