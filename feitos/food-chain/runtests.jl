function recite(start_verse::Int, end_verse::Int)
    # Definir os animais e suas frases correspondentes
    animals = [
        "fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"
    ]
    
    reactions = [
        "I don't know why she swallowed the fly. Perhaps she'll die.",
        "It wriggled and jiggled and tickled inside her.",
        "How absurd to swallow a bird!",
        "Imagine that, to swallow a cat!",
        "What a hog, to swallow a dog!",
        "Just opened her throat and swallowed a goat!",
        "I don't know how she swallowed a cow!",
        "She's dead, of course!"
    ]
    
    result = String[]
    
    # Para cada verso solicitado
    for verse in start_verse:end_verse
        # Adicionar primeiro verso com o animal atual
        push!(result, "I know an old lady who swallowed a $(animals[verse]).")
        
        # Para o cavalo, apenas adicionamos a reação e terminamos
        if verse == 8
            push!(result, reactions[verse])
            
            # Adicionar linha em branco entre versos, exceto após o último
            if verse < end_verse
                push!(result, "")
            end
            
            continue
        end
        
        # Adicionar a reação específica para este animal (exceto para a mosca)
        if verse > 1
            push!(result, reactions[verse])
        end
        
        # Adicionar versos de "ela engoliu X para pegar Y"
        if verse ≥ 2  # A partir da aranha
            # Caso especial para a aranha
            if verse == 2
                push!(result, "She swallowed the spider to catch the fly.")
            else
                # Do animal atual até o pássaro (3), então cases especiais
                for i in verse:-1:4
                    push!(result, "She swallowed the $(animals[i]) to catch the $(animals[i-1]).")
                end
                # Adicionar o caso especial do bird apenas uma vez
                push!(result, "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.")
                push!(result, "She swallowed the spider to catch the fly.")
            end
        end
        
        # Adicionar o verso final para todos, exceto o cavalo
        push!(result, "I don't know why she swallowed the fly. Perhaps she'll die.")
        
        # Adicionar linha em branco entre versos, exceto após o último
        if verse < end_verse
            push!(result, "")
        end
    end
    
    return result
end