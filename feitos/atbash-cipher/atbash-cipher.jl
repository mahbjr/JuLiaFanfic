module AtbashCipher

const ALPHABET = 'a':'z'
const REVERSED = reverse(ALPHABET)
const ATBASH_MAP = Dict(c => REVERSED[i] for (i, c) in enumerate(ALPHABET))

function encode(input::AbstractString)
    result = IOBuffer()
    count = 0
    for c in lowercase(input)
        if isletter(c)
            print(result, ATBASH_MAP[c])
            count += 1
        elseif isdigit(c)
            print(result, c)
            count += 1
        else
            continue
        end
        if count % 5 == 0
            print(result, ' ')
        end
    end
    s = String(take!(result))
    return strip(s)
end

function decode(input::AbstractString)
    result = IOBuffer()
    for c in lowercase(input)
        if isletter(c)
            print(result, ATBASH_MAP[c])
        elseif isdigit(c)
            print(result, c)
        end
    end
    return String(take!(result))
end

end # module

using .AtbashCipher: encode, decode
