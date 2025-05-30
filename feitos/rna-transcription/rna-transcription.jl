"""
    to_rna(dna::String)

Transcreve uma sequência de DNA em seu complemento de RNA.

As regras de transcrição seguidas são:
- G -> C
- C -> G
- T -> A
- A -> U

Lança ErrorException se a sequência contiver caracteres diferentes de A, C, G ou T.

## Exemplos
```julia-repl
julia> to_rna("ACGT")
"UGCA"
```
"""
function to_rna(dna)
    # Define o mapeamento de DNA para RNA
    transcription_map = Dict('G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U')
    
    # Para string vazia, retorna string vazia
    if isempty(dna)
        return ""
    end
    
    # Converte cada caractere e verifica se é válido
    rna = ""
    for nucleotide in dna
        if !haskey(transcription_map, nucleotide)
            throw(ErrorException("Nucleotídeo inválido: $nucleotide"))
        end
        
        rna *= transcription_map[nucleotide]
    end
    
    return rna
end

