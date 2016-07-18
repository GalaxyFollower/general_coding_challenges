function result=word_unscrambler(word,dictionary)
    word=sort(word);
    z=0;
    for i=1:length(dictionary)
        if word==sort(dictionary{i})
            z=z+1;
            result{z}=dictionary{i};
        end
    end
end