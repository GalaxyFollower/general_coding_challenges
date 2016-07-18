function result=calc_cos(x)
    N=500;

    result=1;
    term=1;

    for n=1:N
        term=-term*x*x/(2*n)/(2*n-1);
        result=result+term;
    end
end