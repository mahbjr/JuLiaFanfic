"Square the sum of the first `n` positive integers"
function square_of_sum(n)
    # A soma dos primeiros n inteiros positivos é n*(n+1)/2
    sum = n * (n + 1) ÷ 2
    # Retorna o quadrado dessa soma
    return sum^2
end

"Sum the squares of the first `n` positive integers"
function sum_of_squares(n)
    # A soma dos quadrados dos primeiros n inteiros positivos é n*(n+1)*(2n+1)/6
    return n * (n + 1) * (2n + 1) ÷ 6
end

"Subtract the sum of squares from square of the sum of the first `n` positive ints"
function difference(n)
    # Para n=0, retornamos 0 diretamente (caso especial no teste)
    if n == 0
        return 0
    end
    
    # Calcula a diferença entre o quadrado da soma e a soma dos quadrados
    return square_of_sum(n) - sum_of_squares(n)
end
