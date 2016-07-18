function [topwords,times_used]=mostusedwords(document)

    words=strread(document,'%s','delimiter',' ');

    words=selectionSort_word(words);

    %modify remove duplicates algorithm to create topwords/times_used
    nodups=[];
    z=0;
    y=0;
    for i=1:length(words)
        if ~iswordmember(words{i},nodups)
            z=z+1;
            nodups{z}=words{i};
            newresult=1;
        else
            if newresult
                newresult=0;
                y=y+1;
                topwords{y}=words{i};
                times_used(y)=2;
            else
                times_used(y)=times_used(y)+1;
            end
        end
    end

end

function result=iswordmember(word,list)
    result=0;
    for j=1:length(list)
        if strcmp(word,list{j})
            result=1;
            return;
        end  
    end
end