function pm=calculatecubemoves(sqnum,movepoints,obstacles)

ylen=25;
xlen=25;
[x,y]=getxy(sqnum);

pm{1}=[];
pm{2}=[];
pm{3}=[];

for i=1:movepoints
    %top, move i up, and -i:i to the right
    for j=-i:i  
        xnew=x+j;ynew=y+i;
        if onboard(xnew,ynew)
            pm{i}(length(pm{i})+1) = sq(xnew,ynew) ;
        end
    end
    %bottom, move i down, and -i:i to the right
    for j=-i:i  
        xnew=x+j;ynew=y-i;
        if onboard(xnew,ynew)
            pm{i}(length(pm{i})+1) = sq(xnew,ynew) ;
        end
    end
    %left, move i left, and (-i+1):(i-1) up
    for j=(-i+1):(i-1)
        xnew=x-i;ynew=y+j;
        if onboard(xnew,ynew)
            pm{i}(length(pm{i})+1) = sq(xnew,ynew) ;
        end
    end
    %right, move i right, and (-i+1):(i-1) up
    for j=(-i+1):(i-1)
        xnew=x+i;ynew=y+j;
        if onboard(xnew,ynew)
            pm{i}(length(pm{i})+1) = sq(xnew,ynew) ;
        end
    end
end
%remove obstacles
for i=1:movepoints
    for j=1:length(obstacles)
        I=find(pm{i}==obstacles(j));
        pm{i}(I)=[];
    end
end

    function result=onboard(x,y)
        if x<=xlen && x>0 && y>0 && y<=ylen
            result=1;
        else
            result=0;
        end
    end

    function result=sq(x,y)
        result = x +(y-1)*xlen ;
    end

    function [x,y]=getxy(sqnum)
        y=floor(sqnum/xlen - 0.0001) + 1;
        x=sqnum-(y-1)*xlen;
    end

end
    

