function print_name_badge(id, name, department)
    dept_str = department === nothing ? "OWNER" : uppercase(department)
    if id === missing
        return "$name - $dept_str"
    else
        return "[$id] - $name - $dept_str"
    end
end

function salaries_no_id(ids, salaries)
    return sum(salaries[i] for i in eachindex(ids) if ids[i] === missing; init=0)
end
