function [pm,path]=calculatecylindermoves(sqnum,movepoints,obstacles)

ylen=25;
xlen=25;


pm{1}=sqnum;
pm{2}=[];%1 movepoint
pm{3}=[];
pm{4}=[];
path=[];

offset=[1 -1  0  0
        0  0 -1  1];

for i=2:movepoints+1
    for j=1:length(pm{i-1})
        [x,y]=getxy(pm{i-1}(j));
        for k=1:4
            xnew=x+offset(1,k);
            ynew=y+offset(2,k);
            if onboard(xnew,ynew)
                pm{i}(length(pm{i})+1) = sq(xnew,ynew) ;
                %add to path table
                [plen,~]=size(path);
                path(plen+1,1)=sq(x,y);
                path(plen+1,2)=sq(xnew,ynew);
            end 
        end
    end
    %remove duplicates
    pm{i}=unique(pm{i});
    %remove obstacles
    for j=1:length(obstacles)
        I=find(pm{i}==obstacles(j));
        pm{i}(I)=[];
    end
    %remove squares from previous steps
    for j=1:i-1
        for k=1:length(pm{j})
            I=find(pm{i}==pm{j}(k));
            pm{i}(I)=[];
        end
    end
end
    

%remove starting pm
pm(1)=[];



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