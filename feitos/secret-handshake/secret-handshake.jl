function secret_handshake(n::Integer)
    actions = ["wink", "double blink", "close your eyes", "jump"]
    result = String[]
    for i in 1:4
        if (n >> (i - 1)) & 1 == 1
            push!(result, actions[i])
        end
    end
    if (n >> 4) & 1 == 1
        reverse!(result)
    end
    return result
end