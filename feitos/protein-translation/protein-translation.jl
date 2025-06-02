function proteins(rna::AbstractString)
    codon_table = Dict(
        "AUG" => "Methionine",
        "UUU" => "Phenylalanine",
        "UUC" => "Phenylalanine",
        "UUA" => "Leucine",
        "UUG" => "Leucine",
        "UCU" => "Serine",
        "UCC" => "Serine",
        "UCA" => "Serine",
        "UCG" => "Serine",
        "UAU" => "Tyrosine",
        "UAC" => "Tyrosine",
        "UGU" => "Cysteine",
        "UGC" => "Cysteine",
        "UGG" => "Tryptophan",
        "UAA" => "STOP",
        "UAG" => "STOP",
        "UGA" => "STOP"
    )

    if isempty(rna)
        return String[]
    end

    if length(rna) % 3 != 0
        # If the sequence is not a multiple of 3, check if it ends with a STOP codon
        # or if the incomplete part is after a STOP codon
        # Otherwise, throw DomainError
        # We'll process codons until we hit a STOP or run out of full codons
        n = div(length(rna), 3) * 3
        codons = [rna[i:i+2] for i in 1:3:n]
        for (idx, codon) in enumerate(codons)
            if !haskey(codon_table, codon)
                throw(DomainError("Invalid codon: $codon"))
            end
            if codon_table[codon] == "STOP"
                # If STOP is found, ignore the rest (even if incomplete)
                return [codon_table[c] for c in codons[1:idx-1]]
            end
        end
        # If no STOP codon, but incomplete codon at end, throw error
        throw(DomainError("Incomplete RNA sequence"))
    end

    codons = [rna[i:i+2] for i in 1:3:length(rna)]
    proteins = String[]
    for codon in codons
        aa = get(codon_table, codon, nothing)
        if aa === nothing
            throw(DomainError("Invalid codon: $codon"))
        elseif aa == "STOP"
            break
        else
            push!(proteins, aa)
        end
    end
    return proteins
end