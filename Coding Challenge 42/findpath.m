function result=findpath(path,start,finish)

result=[];
[pathlen,~]=size(path);

DFS(finish)


    function DFS(route)
        current=route(1);
        if current==start
            result=route;
            return
        end
        for i=1:pathlen
            if path(i,2)==current
                DFS([path(i,1) route]);
                break;
            end
        end
    end


end