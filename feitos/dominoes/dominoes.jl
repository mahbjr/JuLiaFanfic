using DataStructures

function dominoes(dominoes)
    # Caso especial: entrada vazia
    if isempty(dominoes)
        return true
    end
    
    # Caso especial: dominó único
    if isa(dominoes, Vector{Int})
        return dominoes[1] == dominoes[2]
    end
    
    # Normalizar a entrada
    doms = [typeof(d) <: Tuple ? d : Tuple(d) for d in dominoes]
    
    # Construir um grafo direcionado para representar as peças
    graph = Dict{Int, Vector{Tuple{Int, Int}}}()
    
    # Inicializar o grafo
    for (a, b) in doms
        if !haskey(graph, a)
            graph[a] = []
        end
        if !haskey(graph, b)
            graph[b] = []
        end
        # Adicionar ambas as direções, já que podemos virar o dominó
        push!(graph[a], (b, length(graph[a]) + 1))
        push!(graph[b], (a, length(graph[b]) + 1))
    end
    
    # Para cada vértice, tentar construir um caminho euleriano
    for start in keys(graph)
        if length(graph[start]) > 0
            # Criar uma cópia do grafo para não modificar o original
            graph_copy = deepcopy(graph)
            
            # Tentar encontrar um caminho euleriano
            if can_form_chain(graph_copy, start, start, length(doms))
                return true
            end
        end
    end
    
    return false
end

function can_form_chain(graph, current, target, remaining)
    # Se não há mais peças para posicionar, verificamos se podemos fechar o ciclo
    if remaining == 0
        return true
    end
    
    # Tentar cada aresta saindo do vértice atual
    edges = copy(graph[current])
    for (next, idx) in edges
        # Remover esta aresta do grafo (tanto ida quanto volta)
        filter!(e -> e[2] != idx, graph[current])
        back_idx = findfirst(e -> e[1] == current, graph[next])
        if back_idx !== nothing
            deleteat!(graph[next], back_idx)
        end
        
        # Tentar construir o restante do caminho
        if can_form_chain(graph, next, target, remaining - 1)
            return true
        end
        
        # Backtracking: restaurar as arestas removidas
        push!(graph[current], (next, idx))
        if back_idx !== nothing
            push!(graph[next], (current, back_idx))
        end
    end
    
    return false
end