function result=calc_sin(x)
    N=500;

    result=x;
    term=x;

    for n=1:N
        term=-term*x*x/(2*n)/(2*n+1);
        result=result+term;
    end
end