function list = selectionSort_word(list)

    listSize = numel(list);
 
    for i = (1:listSize-1)
 
        minElem = list{i};
        minIndex = i;
 
        for j = (i:listSize)  
            if lessthanorequal(list{j},minElem)
                minElem = list{j};
                minIndex = j;
            end
        end
 
        if i ~= minIndex
            list([minIndex i]) = list([i minIndex]); %Swap
        end
 
    end %for
end %selectionSort

function result=lessthanorequal(word1,word2)
    wordlen=min(length(word1),length(word2));
    for i=1:wordlen
        if word1(i)<word2(i)
            result=1;
            return;
        elseif word1(i)>word2(i)
            result=0;
            return;
        end
    end
    %words must have same first letters
    if length(word1)<=length(word2)
        result=1;
    else
        result=0;
    end
end