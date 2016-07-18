function result=remove_dups(array)
    result=[];
    for i=1:length(array)
        if ~ismember(array(i),result)
            result=[result array(i)];
        end
    end
end