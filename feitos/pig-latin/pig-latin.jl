function translate(text::AbstractString)
    words = split(text)
    return join(translate_word.(words), " ")
end

function translate_word(word::AbstractString)
    # Regra: palavras começando com som de vogal
    if startswith(word, r"^(a|e|i|o|u|xr|yt)")
        return word * "ay"
    end
    
    # Regra: palavras começando com consoante + "qu"
    if occursin(r"^([^aeiou]+)qu", word)
        m = match(r"^([^aeiou]+)qu(.*)$", word)
        if m !== nothing
            prefix, rest = m.captures
            return rest * prefix * "qu" * "ay"
        end
    end
    
    # Regra: palavras começando com "qu"
    if startswith(word, "qu")
        return word[3:end] * "qu" * "ay"
    end
    
    # Regra: palavras começando com 'y'
    if startswith(word, "y")
        return word[2:end] * "y" * "ay"
    end
    
    # Regra: consoantes seguidas por 'y', tratando 'y' como vogal
    m = match(r"^([^aeiou]+)(y.*)$", word)
    if m !== nothing
        prefix, rest = m.captures
        return rest * prefix * "ay"
    end
    
    # Regra: grupos de consoantes no início (ch, th, thr, sch, etc.)
    m = match(r"^([^aeiou]+)(.*)$", word)
    if m !== nothing
        prefix, rest = m.captures
        return rest * prefix * "ay"
    end
    
    # Caso padrão (não deve ser alcançado)
    return word * "ay"
end