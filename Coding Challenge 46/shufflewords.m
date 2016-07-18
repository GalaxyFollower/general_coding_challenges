function result=shufflewords(sentence) 

    sentence=strread(sentence,'%s','delimiter',' ');

    [~,I]=sort(rand(length(sentence),1));

    result=sentence{I(1)};

    for i=2:length(sentence)
        result=[result ' ' sentence{I(i)}];    
    end

end