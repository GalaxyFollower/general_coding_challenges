function result=no_repeats(year_start,year_end)
    result=[];
    for i=year_start:year_end
        if no_repeat(i)
            result=[result i];
        end
    end
end


function result=no_repeat(year)
    str=num2str(year);
    if length(unique(str))==length(str)
        result=1;
    else
        result=0;
    end
end