function result=shortcircuit(P,R,Start,End)

%add reverse connctions to P/R lists
z=length(P);
for i=1:length(P)
    z=z+1;
    P(z,1)=P(i,2);
    P(z,2)=P(i,1);
    R(z)=R(i);
end

Finalpath=[];
Finalsum=[];
z=0;
DFS(Start,0);
[~,I]=min(Finalsum);
result=Finalpath{I};

    function DFS(path, sum)
        current=path(length(path));
        if current==End
            z=z+1;
            Finalpath{z}=path;
            Finalsum(z)=sum;
            return
        end
        
        for j=1:length(P)
            if find(path==P(j,2))
                continue;
            end
            if P(j,1)==current
                DFS([path P(j,2)],sum+R(j));
            end
        end
    end

end