struct CustomSet{T} <: Base.AbstractSet{T}
    elements::Base.Set{T}
    
    # Construtor para array de elementos
    function CustomSet{T}(elems::Vector{T}) where T
        new(Base.Set(elems))
    end
end

# Construtor sem especificar o tipo
CustomSet(elems::Vector{T}) where T = CustomSet{T}(elems)

# Construtor para conjunto vazio
CustomSet{T}() where T = CustomSet{T}(T[])
CustomSet() = CustomSet{Any}()

import Base: in, isempty, issubset, length, ==, copy, iterate, push!, union, union!, intersect, intersect!

# Verifica se o conjunto está vazio
isempty(cs::CustomSet) = isempty(cs.elements)

# Retorna o número de elementos
length(cs::CustomSet) = length(cs.elements)

# Verifica se um elemento pertence ao conjunto
function in(x, cs::CustomSet)
    return x in cs.elements
end

# Verifica se um conjunto é subconjunto de outro
function issubset(a::CustomSet, b::CustomSet)
    return issubset(a.elements, b.elements)
end

# Verifica se dois conjuntos são disjuntos (não têm elementos em comum)
function disjoint(a::CustomSet, b::CustomSet)
    return isempty(intersect(a.elements, b.elements))
end

# Verifica a igualdade entre dois conjuntos
function ==(a::CustomSet, b::CustomSet)
    return a.elements == b.elements
end

# Adiciona um elemento ao conjunto
function push!(cs::CustomSet, x)
    push!(cs.elements, x)
    return cs
end

# União de dois conjuntos (não modifica os originais)
function union(cs1::CustomSet, cs2::CustomSet)
    result = copy(cs1)
    union!(result, cs2)
    return result
end

# União in-place (modifica cs1)
function union!(cs1::CustomSet, cs2::CustomSet)
    union!(cs1.elements, cs2.elements)
    return cs1
end

# Interseção de dois conjuntos (não modifica os originais)
function intersect(cs1::CustomSet, cs2::CustomSet)
    result = copy(cs1)
    intersect!(result, cs2)
    return result
end

# Interseção in-place (modifica cs1)
function intersect!(cs1::CustomSet, cs2::CustomSet)
    intersect!(cs1.elements, cs2.elements)
    return cs1
end

# Diferença entre conjuntos (complement)
function complement(cs1::CustomSet, cs2::CustomSet)
    result = copy(cs1)
    complement!(result, cs2)
    return result
end

# Diferença in-place (modifica cs1)
function complement!(cs1::CustomSet, cs2::CustomSet)
    setdiff!(cs1.elements, cs2.elements)
    return cs1
end

# Suporte para iteração
function iterate(cs::CustomSet, state...)
    return iterate(cs.elements, state...)
end

# Cria uma cópia do conjunto
function copy(cs::CustomSet{T}) where T
    return CustomSet{T}(collect(cs.elements))
end