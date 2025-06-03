using Dates

function meetup(year::Integer, month::Integer, descriptor::AbstractString, day_of_week::AbstractString)
    # Converter o nome do dia para seu valor numérico (Monday=1, Sunday=7)
    dow = Dict(
        "Monday" => 1,
        "Tuesday" => 2, 
        "Wednesday" => 3, 
        "Thursday" => 4, 
        "Friday" => 5, 
        "Saturday" => 6, 
        "Sunday" => 7
    )[day_of_week]
    
    # Determinar o primeiro dia do mês e o último dia
    first_day = Date(year, month, 1)
    last_day = lastdayofmonth(first_day)
    
    # Encontrar todas as datas no mês que correspondem ao dia da semana desejado
    matching_dates = filter(d -> dayofweek(d) == dow, first_day:Day(1):last_day)
    
    # Aplicar o descritor para selecionar a data específica
    if descriptor == "first"
        return matching_dates[1]
    elseif descriptor == "second"
        return matching_dates[2]
    elseif descriptor == "third"
        return matching_dates[3]
    elseif descriptor == "fourth"
        return matching_dates[4]
    elseif descriptor == "last"
        return matching_dates[end]
    elseif descriptor == "teenth"
        # Encontrar a data entre os dias 13 e 19
        return filter(d -> 13 <= day(d) <= 19, matching_dates)[1]
    else
        # Caso o descritor não seja reconhecido
        throw(ArgumentError("Unknown descriptor: $descriptor"))
    end
end