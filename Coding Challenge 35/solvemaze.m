function result=solvemaze(maze)

Start=find(maze=='A');
End=find(maze=='B');
[ylen,xlen]=size(maze);
z=0;
FinalPathlen=[];

DFS(Start)

if isempty(FinalPathlen)
    result=[];
    return;
end
result=min(FinalPathlen);



    function DFS(path)
        current=path(length(path));
        if current==End
            z=z+1;
            FinalPathlen(z)=length(path);
            return;
        end
        x=floor(current/ylen-0.0001)+1;
        y=current-(x-1)*ylen;
        shift=[0  0  1 -1
               1 -1  0  0];
        for i=1:4
            xnew=x+shift(1,i);
            ynew=y+shift(2,i);
            num=ynew+(xnew-1)*ylen;
            if maze(num)=='#' || ~isempty(find(path==num))
                continue;
            end
            DFS([path num])
        end
    end


end