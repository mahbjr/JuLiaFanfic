function score(str)
    # Retorna 0 para string vazia
    if isempty(str)
        return 0
    end
    
    # Define os valores de cada letra
    letter_values = Dict(
        'a' => 1, 'e' => 1, 'i' => 1, 'o' => 1, 'u' => 1, 'l' => 1, 'n' => 1, 'r' => 1, 's' => 1, 't' => 1,
        'd' => 2, 'g' => 2,
        'b' => 3, 'c' => 3, 'm' => 3, 'p' => 3,
        'f' => 4, 'h' => 4, 'v' => 4, 'w' => 4, 'y' => 4,
        'k' => 5,
        'j' => 8, 'x' => 8,
        'q' => 10, 'z' => 10
    )
    
    # Calcula a pontuação total
    total = 0
    for char in lowercase(str)
        # Apenas pontua caracteres presentes no dicionário
        if haskey(letter_values, char)
            total += letter_values[char]
        end
    end
    
    return total
end
