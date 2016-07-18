function result=report_dups(array)
    uniquelist=[];
    result=[];
    for i=1:length(array)
        if ismember(array(i),uniquelist)
            if ~ismember(array(i),result)
                result=[result array(i)];
            end
        else
            uniquelist=[uniquelist array(i)];
        end
    end
end