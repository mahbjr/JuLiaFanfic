function message(msg)
    return strip(match(r"\]:\s*(.*)", msg).captures[1])
end

function log_level(msg)
    return lowercase(match(r"\[(\w+)\]", msg).captures[1])
end

function reformat(msg)
    return string(message(msg), " (", log_level(msg), ")")
end
