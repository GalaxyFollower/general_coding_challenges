function result=listofwords(document)

    words=strread(document,'%s','delimiter',' ');

    words=selectionSort_word(words);

    %remove duplicates
    result=[];
    z=0;
    for i=1:length(words)
        if ~iswordmember(words{i},result)
            z=z+1;
            result{z}=words{i};
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