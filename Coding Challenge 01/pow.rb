def pow(base, exponent)
    result = 1
    
    i = 1
    while i <= exponent
        result = result * base
        i += 1
    end
    
    result
end