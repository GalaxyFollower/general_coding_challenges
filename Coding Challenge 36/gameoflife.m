function result=gameoflife(height,width)

    g=round(rand(height,width));
    
    while 1
        gprev=g;
        evolve;
        if g==gprev
            result=g;
            return
        end
    end
    
    
    function evolve
        gnew=g;
        offset=[0 1 1  1  0 -1 -1 -1       
                1 1 0 -1 -1 -1  0  1];
        for y=1:height
            for x=1:width
                N=0;
                for i=1:8
                    xnew=x+offset(1,i);
                    ynew=y+offset(2,i);
                    if xnew<1;xnew=width;end
                    if xnew>width;xnew=1;end
                    if ynew<1;ynew=height;end
                    if ynew>height;ynew=1;end
                    N=N+g(ynew,xnew);
                end
                if g(y,x) && (N<2||N>3)
                    gnew(y,x)=0;
                end
                if ~g(y,x) && N==3
                    gnew(y,x)=1;
                end
            end
        end
        g=gnew;
    end
end