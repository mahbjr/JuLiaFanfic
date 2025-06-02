function keep(values, predicate)
    [x for x in values if predicate(x)]
end

function discard(values, predicate)
    [x for x in values if !predicate(x)]
end