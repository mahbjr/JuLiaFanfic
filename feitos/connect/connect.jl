function connect(board)
    # Processar o tabuleiro para remover espaços em branco
    processed_board = [filter(c -> c != ' ', row) for row in board]
    height = length(processed_board)
    
    if height == 0
        return ""
    end
    
    width = length(processed_board[1])
    
    # Verificar se X venceu (conectando da esquerda para a direita)
    if check_win(processed_board, 'X', width, height)
        return "X"
    end
    
    # Verificar se O venceu (conectando de cima para baixo)
    if check_win(processed_board, 'O', width, height)
        return "O"
    end
    
    # Nenhum vencedor
    return ""
end

function check_win(board, player, width, height)
    # Construir uma representação de matriz do tabuleiro para facilitar a navegação
    grid = [collect(row) for row in board]
    
    # Para X, verificar se existe um caminho da borda esquerda à direita
    if player == 'X'
        # Encontrar todas as células na primeira coluna que contêm X
        starting_points = [(i, 1) for i in 1:height if grid[i][1] == 'X']
        target_check = (_, j) -> j == width  # Chegou à borda direita?
    else # player == 'O'
        # Encontrar todas as células na primeira linha que contêm O
        starting_points = [(1, j) for j in 1:width if grid[1][j] == 'O']
        target_check = (i, _) -> i == height  # Chegou à borda inferior?
    end
    
    # Verificar a partir de cada ponto de partida
    for start in starting_points
        visited = Set{Tuple{Int, Int}}()
        if dfs(grid, start[1], start[2], player, visited, target_check, width, height)
            return true
        end
    end
    
    return false
end

function dfs(grid, i, j, player, visited, target_check, width, height)
    # Verificar se chegamos ao destino
    if target_check(i, j)
        return true
    end
    
    # Marcar como visitado
    push!(visited, (i, j))
    
    # Direções para os vizinhos (ajustadas para o formato hexagonal)
    # Em um tabuleiro hexagonal deslocado, os vizinhos são:
    directions = [
        (-1, 0), (-1, 1),  # Superior esquerdo, Superior direito
        (0, -1), (0, 1),   # Esquerda, Direita
        (1, -1), (1, 0)    # Inferior esquerdo, Inferior direito
    ]
    
    # Verificar cada vizinho
    for (di, dj) in directions
        ni, nj = i + di, j + dj
        
        # Verificar se o vizinho está dentro dos limites do tabuleiro
        if 1 <= ni <= height && 1 <= nj <= width
            # Verificar se o vizinho é do mesmo jogador e não foi visitado
            if grid[ni][nj] == player && !((ni, nj) in visited)
                if dfs(grid, ni, nj, player, visited, target_check, width, height)
                    return true
                end
            end
        end
    end
    
    return false
end
