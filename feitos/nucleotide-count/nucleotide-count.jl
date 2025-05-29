"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    valid_nucleotides = ['A', 'C', 'G', 'T']
    counts = Dict(nuc => 0 for nuc in valid_nucleotides)
    for c in strand
        if c ∉ valid_nucleotides
            throw(DomainError("Invalid nucleotide: $c"))
        end
        counts[c] += 1
    end
    return counts
end

