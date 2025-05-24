function exchange_money(budget, exchange_rate)
    budget / exchange_rate
end

function get_change(budget, exchanging_value)
    budget - exchanging_value
end

function get_value_of_bills(denomination, number_of_bills)
    denomination * number_of_bills
end

function get_number_of_bills(amount, denomination)
    amount ÷ denomination
end

function get_leftover_of_bills(amount, denomination)
    amount % denomination
end

function exchangeable_value(budget, exchange_rate, spread, denomination)
    budget_in_foreign_currency = exchange_money(budget, exchange_rate)
    value_after_spread = budget_in_foreign_currency * (1 - spread)
    number_of_bills = get_number_of_bills(value_after_spread, denomination)
    value_of_bills = get_value_of_bills(denomination, number_of_bills)
    leftover = get_leftover_of_bills(value_after_spread, denomination)
    return value_of_bills, leftover
end
