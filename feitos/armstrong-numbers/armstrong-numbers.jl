function isarmstrong(n::Integer)
    # Use Base.digits to convert n to an array of its digits
    digit_array = Base.digits(n)
    power = length(digit_array)
    sum(x -> x^power, digit_array) == n
end