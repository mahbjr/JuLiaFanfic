# Define a custom error type for machine errors
struct MachineError <: Exception
    msg::String
end

"""
Check humidity level and log results
Throws an error if humidity is too high (>70%)
"""
function humiditycheck(humidity)
    if humidity > 70
        @error "humidity level check failed: $humidity%"
        throw(ErrorException("$humidity"))
    else
        @info "humidity level check passed: $humidity%"
    end
end

"""
Check temperature level and log results
Throws errors if temperature is too high (>500°C) or if sensor is broken (nothing)
"""
function temperaturecheck(temperature)
    if isnothing(temperature)
        @warn "sensor is broken"
        throw(ArgumentError("sensor is broken"))
    elseif temperature > 500
        @error "overheating detected: $temperature °C"
        throw(DomainError("$temperature"))
    else
        @info "temperature check passed: $temperature °C"
    end
end

"""
Monitor both humidity and temperature
Throws a MachineError if either check fails
"""
function machinemonitor(humidity, temperature)
    humidity_ok = true
    temp_ok = true
    
    # Check humidity
    try
        humiditycheck(humidity)
    catch e
        humidity_ok = false
    end
    
    # Check temperature
    try
        temperaturecheck(temperature)
    catch e
        temp_ok = false
    end
    
    # If either check failed, throw a MachineError
    if !humidity_ok || !temp_ok
        throw(MachineError("machine check failed"))
    end
    
    return nothing
end
