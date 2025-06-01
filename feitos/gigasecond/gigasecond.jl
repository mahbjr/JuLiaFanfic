module Gigasecond

using Dates

"""
    add_gigasecond(dt::DateTime) -> DateTime

Adds 1,000,000,000 seconds (a gigasecond) to the given DateTime.
"""
function add_gigasecond(dt::DateTime)
    return dt + Second(1_000_000_000)
end

end # module

# To allow direct usage if included as in the test file:
using .Gigasecond: add_gigasecond