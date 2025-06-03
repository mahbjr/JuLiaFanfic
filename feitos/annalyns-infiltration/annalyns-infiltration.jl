function can_do_fast_attack(knight_awake)
    return !knight_awake
end

function can_spy(knight_awake, archer_awake, prisoner_awake)
    return knight_awake || archer_awake || prisoner_awake
end

function can_signal_prisoner(archer_awake, prisoner_awake)
    return prisoner_awake && !archer_awake
end

function can_free_prisoner(knight_awake, archer_awake, prisoner_awake, dog_present)
    # Cenário 1: Com o cachorro (o arqueiro deve estar dormindo)
    scenario1 = dog_present && !archer_awake
    
    # Cenário 2: Sem o cachorro (prisioneiro acordado e ambos cavaleiro e arqueiro dormindo)
    scenario2 = !dog_present && prisoner_awake && !knight_awake && !archer_awake
    
    # Retorna true se qualquer cenário for válido
    return scenario1 || scenario2
end
