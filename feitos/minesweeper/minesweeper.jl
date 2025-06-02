function annotate(minefield::Vector)
    nrows = length(minefield)
    if nrows == 0
        return String[]
    end
    ncols = length(minefield[1])
    if ncols == 0
        return ["" for _ in 1:nrows]
    end

    # Convert to matrix of chars for easier manipulation
    grid = [collect(row) for row in minefield]

    # Directions for 8 neighbors
    neighbors = ((-1,-1), (-1,0), (-1,1),
                 ( 0,-1),         ( 0,1),
                 ( 1,-1), ( 1,0), ( 1,1))

    result = Vector{String}(undef, nrows)
    for i in 1:nrows
        row = Vector{Char}(undef, ncols)
        for j in 1:ncols
            if grid[i][j] == '*'
                row[j] = '*'
            else
                count = 0
                for (di, dj) in neighbors
                    ni, nj = i + di, j + dj
                    if 1 <= ni <= nrows && 1 <= nj <= ncols
                        if grid[ni][nj] == '*'
                            count += 1
                        end
                    end
                end
                row[j] = count == 0 ? ' ' : Char('0' + count)
            end
        end
        result[i] = String(row)
    end
    return result
end