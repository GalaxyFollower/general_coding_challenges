function result=wordsort_word2num(list) 

    wordfracs=zeros(length(list),1);
    for i=1:length(list)
        wordarray=word2numarr(list{i});
        value=0;
        for j=1:length(wordarray)
            value=value+wordarray(j)*10^(-2*j);
        end
        wordfracs(i)=value;
    end
    [~,result]=sort(wordfracs);

end

function result=word2numarr(word)
    result=double(word)-double('a')+1;
end
