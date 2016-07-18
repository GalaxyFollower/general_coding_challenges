function [result,num]=report_dups_num(array)
    uniquelist=[];
    result=[];
    num=[];
    for i=1:length(array)
        if ismember(array(i),uniquelist)
            if ~ismember(array(i),result)
                result=[result array(i)];
                num=[num 2];
            else
                I=find(result==array(i));
                num(I)=num(I)+1;
            end
        else
            uniquelist=[uniquelist array(i)];
        end
    end
end