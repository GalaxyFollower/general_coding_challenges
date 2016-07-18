function result=multiply(m,n)
    result=0;

    if n>=0
        for i=1:n
            result=result+m;
        end
    else
        for i=1:abs(n)
            result=result-m;
        end
    end
end