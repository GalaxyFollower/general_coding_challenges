function result=recursiveSort(list)

    if length(list)==1
        result=list;
        return;
    end

    [result,I]=min(list);
    list(I)=[];
    list=recursiveSort(list);
    result=[result list];

end