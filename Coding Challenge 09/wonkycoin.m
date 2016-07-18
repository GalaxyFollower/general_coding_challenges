function result=wonkycoin(n)
    if n==0
        result=1;
        return
    end
    result=wonkycoin(floor(n/2)) + ...
           wonkycoin(floor(n/3)) + ...
           wonkycoin(floor(n/4));
    

end