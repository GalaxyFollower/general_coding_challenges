function [max_mines,num_configs]=minefield(xlen,ylen,blocked)

%find cell numbers that a mine can be placed
[blen,~]=size(blocked);
field=ones(ylen,xlen);
for i=1:blen
   field(blocked(i,1),blocked(i,2))=0; 
end
I=find(field);

%get starting list
list=binarylist(length(I));

%organize list by number of mines
[listlen,~]=size(list);
mine_num=zeros(listlen,1);
for i=1:listlen
    mine_num(i)=length(find(list(i,:)));
end
[mine_num,I2]=sort(mine_num,'descend');
list=list(I2,:);


%want to start search at ceil(0.5*length(I)), max of 2 mines for 3 spaces, etc
searchstart=min(find(mine_num==ceil(0.5*length(I))));

%edit out the adjacents
offset=[0 1  0 -1
        1 0 -1  0];

num_configs=0;
max_mines=0;
for i=searchstart:length(list)
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
                        flag=1;
                        break;
                    end
                end
            end
            if flag;break;end
        end
        if flag;break;end
    end 
    if flag==0 %we got a solution!
        if length(find(temp))>=max_mines
            max_mines=length(find(temp));
            num_configs=num_configs+1;
        else
            return
        end
    end
end



end