"""
    distance(a, b)

Calcula a distância de Hamming entre duas sequências `a` e `b`.
A distância de Hamming é o número de posições em que os símbolos correspondentes
são diferentes entre duas sequências de mesmo tamanho.

Lança `ArgumentError` se as sequências tiverem tamanhos diferentes.

## Exemplos
```julia-repl
julia> distance("GGACG", "GGTCG")
1
```
"""
function distance(strand1, strand2)
    # Verifica se as sequências têm o mesmo tamanho
    if length(strand1) != length(strand2)
        throw(ArgumentError("As sequências devem ter o mesmo tamanho"))
    end
    
    # Calcula a distância contando as posições em que os caracteres são diferentes
    count = 0
    for i in 1:length(strand1)
        if strand1[i] != strand2[i]
            count += 1
        end
    end
    
    return count
end