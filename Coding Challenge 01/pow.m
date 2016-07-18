function result=pow(base,exponent)
    result=1;
    for i=1:exponent
        result=result*base;
    end
end