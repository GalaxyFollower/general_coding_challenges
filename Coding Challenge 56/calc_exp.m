function result=calc_exp(x)
    N=500;

    result=1;
    term=1;

    for n=1:N
        term=term*x/n;
        result=result+term;
    end
end