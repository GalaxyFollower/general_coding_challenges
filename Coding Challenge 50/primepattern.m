function result=primepattern(x,y)
    result=0;
    if isprime(findsqnum(x,y))
        return;
    end
    offset=[1 0 -1  0
            0 1  0 -1];
    search=[x y];
    while 1
        result=result+1;
        searchnew=[];
        [searchlen,~]=size(search);
        for j=1:searchlen
            x=search(j,1);
            y=search(j,2);
            for i=1:4
                xnew=x+offset(1,i);
                ynew=y+offset(2,i);
                searchnew=[searchnew; xnew ynew];
                if isprime(findsqnum(xnew,ynew))
                    return;
                end
            end
        end
        search=searchnew;
    end
end


function sqnum=findsqnum(xfinal,yfinal)
    sqnum=0;
    x=0;
    y=0;
    if x==xfinal && y==yfinal
        return
    end
    walk=1;
    posneg=1;
    while 1
        for i=1:walk
            x=x+posneg;
            sqnum=sqnum+1;
            if x==xfinal && y==yfinal
                return
            end
        end
        for i=1:walk
            y=y+posneg;
            sqnum=sqnum+1;
            if x==xfinal && y==yfinal
                return
            end
        end
        walk=walk+1;
        posneg=-1*posneg;
    end
end