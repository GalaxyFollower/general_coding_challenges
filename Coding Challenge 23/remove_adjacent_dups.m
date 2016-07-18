function result=remove_adjacent_dups(array)
    result=array(1);
    for i=2:length(array)
        if array(i)~=result(length(result))
            result=[result array(i)];
        end
    end
end