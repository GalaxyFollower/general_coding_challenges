function [max_mines,num_configs]=minefield(xlen,ylen,blocked)

[blen,~]=size(blocked);

field=ones(ylen,xlen);
for i=1:blen
   field(blocked(i,1),blocked(i,2))=0; 
end

I=find(field);

list=binarylist(length(I));

offset=[0 1  0 -1
        1 0 -1  0];
%edit out the adjacents
for i=length(list):-1:1
    temp=zeros(ylen,xlen);
    temp(I)=list(i,:);
    flag=0;
    for x=1:xlen
        for y=1:ylen
            if temp(y,x) % if there is a mine there, look for adjacent mines
                for m=1:4
                    xnew=x+offset(1,m);
                    ynew=y+offset(2,m);
                    if xnew==0||ynew==0||xnew>xlen||ynew>ylen
                        continue;
                    end
                    if temp(ynew,xnew)
                        list(i,:)=[];
                        flag=1;
                        break;
                    end
                end
            end
            if flag;break;end
        end
        if flag;break;end
    end 
end

%determine how many mines per list
[listlen,~]=size(list);
mine_num=zeros(listlen,1);
for i=1:listlen
    mine_num(i)=length(find(list(i,:)));
end

max_mines=max(mine_num);

num_configs=length(find(mine_num==max_mines));


end