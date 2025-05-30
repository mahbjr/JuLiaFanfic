"""
    encode(s::String) -> String

Converte uma string para sua representação em run-length encoding.
Sequências de caracteres repetidos são substituídas pela quantidade seguida do caractere.
Caracteres únicos permanecem inalterados.

## Exemplos
```julia-repl
julia> encode("AABBBCCCC")
"2A3B4C"
```
"""
function encode(s)
    # String vazia retorna vazia
    isempty(s) && return ""
    
    result = ""
    count = 1
    
    # Para cada caractere na string (exceto o último)
    for i in 1:length(s)-1
        if s[i] == s[i+1]
            # Se o próximo caractere for igual, incrementa o contador
            count += 1
        else
            # Caso contrário, adiciona a contagem (se maior que 1) e o caractere
            result *= (count > 1 ? string(count) : "") * s[i]
            count = 1
        end
    end
    
    # Processa o último caractere
    result *= (count > 1 ? string(count) : "") * s[end]
    
    return result
end

"""
    decode(s::String) -> String

Converte uma string de run-length encoding para sua representação normal.
Números seguidos de um caractere são expandidos para repetições desse caractere.

## Exemplos
```julia-repl
julia> decode("2A3B4C")
"AABBBCCCC"
```
"""
function decode(s)
    # String vazia retorna vazia
    isempty(s) && return ""
    
    result = ""
    count_str = ""
    
    # Para cada caractere na string
    for char in s
        if isdigit(char)
            # Se for um dígito, adiciona ao acumulador de contagem
            count_str *= char
        else
            # Se não for um dígito, é um caractere a ser repetido
            count = isempty(count_str) ? 1 : parse(Int, count_str)
            result *= repeat(char, count)
            count_str = ""
        end
    end
    
    return result
end
