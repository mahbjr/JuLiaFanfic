# define the Coord type
struct Coord
    x::UInt16
    y::UInt16
end

# define the Plot keyword type
struct Plot
    bottom_left::Coord
    top_right::Coord
end

# Add a keyword constructor for Plot
Plot(; bottom_left, top_right) = Plot(bottom_left, top_right)

function is_claim_staked(claim::Plot, register::Set{Plot})
    return claim in register
end

function stake_claim!(claim::Plot, register::Set{Plot})
    if claim in register
        return false
    else
        push!(register, claim)
        return true
    end
end

function get_longest_side(claim::Plot)
    width = claim.top_right.x - claim.bottom_left.x
    height = claim.top_right.y - claim.bottom_left.y
    return max(width, height)
end

function get_claim_with_longest_side(register::Set{Plot})
    if isempty(register)
        return Set{Plot}()
    end
    max_side = maximum(get_longest_side(plot) for plot in register)
    return Set(filter(plot -> get_longest_side(plot) == max_side, register))
end
