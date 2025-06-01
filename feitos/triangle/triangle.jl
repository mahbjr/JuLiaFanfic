# triangle.jl

function is_valid_triangle(sides::AbstractVector{<:Real})
    a, b, c = sort(sides)
    return a > 0 && a + b > c
end

function is_equilateral(sides::AbstractVector{<:Real})
    is_valid_triangle(sides) && length(unique(sides)) == 1
end

function is_isosceles(sides::AbstractVector{<:Real})
    is_valid_triangle(sides) && length(unique(sides)) ≤ 2
end

function is_scalene(sides::AbstractVector{<:Real})
    is_valid_triangle(sides) && length(unique(sides)) == 3
end