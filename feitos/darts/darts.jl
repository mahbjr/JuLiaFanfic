function score(x, y)
    dist = sqrt(x^2 + y^2)
    if dist <= 1
        return 10
    elseif dist <= 5
        return 5
    elseif dist <= 10
        return 1
    else
        return 0
    end
end