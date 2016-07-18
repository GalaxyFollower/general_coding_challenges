function [result,remainder]=integer_div_mod(m,n)
    remainder=m;
    result=0;
    while 1
        if remainder-n > 0
            result=result+1;
            remainder=remainder-n;
        else
            break;
        end
    end
end