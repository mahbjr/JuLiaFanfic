function transform(ch)
    if ch == '-'
        return "_"
    elseif isspace(ch)
        return ""
    elseif isuppercase(ch)
        return "-" * lowercase(string(ch))
    elseif isdigit(ch)
        return ""
    elseif 'α' <= ch <= 'ω'
        return "?"
    else
        return string(ch)
    end
end

function clean(str)
    return join(transform(ch) for ch in str)
end
