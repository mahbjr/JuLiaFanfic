function z(x, y)
    return complex(float(x), float(y))
end

function euler(r, θ)
    return r * cis(θ)
end

function rotate(x, y, θ)
    p = z(x, y) * cis(θ)
    return (real(p), imag(p))
end

function rdisplace(x, y, r)
    norm = sqrt(x^2 + y^2)
    new_x = x + r * x / norm
    new_y = y + r * y / norm
    return (new_x, new_y)
end

function findsong(x, y, r, θ)
    x1, y1 = rdisplace(x, y, r)
    x2, y2 = rotate(x1, y1, θ)
    return (x2, y2)
end
