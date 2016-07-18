function size=landwater(world,x,y)
    global world
    world
    size=findsize(x,y);
end
     
function size=findsize(x,y)
    global world
    if world(y,x)=='M'
        size=1;
        world(y,x)='C';
    else
        size=0;
        return;
    end

    offset=[-1 1  0 0 -1 1 -1  1
             0 0 -1 1 -1 1  1 -1];
    for i=1:8
        xnew=x+offset(1,i);
        ynew=y+offset(2,i);
        size=size+findsize(xnew,ynew);
    end
end