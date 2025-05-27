function cleanupname(name)
    return strip(replace(name, '-' => ' '))
end

function firstletter(name)
    return string(first(cleanupname(name)))
end

function initial(name)
    return uppercase(string(firstletter(name))) * "."
end

function couple(name1, name2)
    return "❤ $(initial(name1))  +  $(initial(name2)) ❤"
end
