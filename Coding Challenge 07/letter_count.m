function [letters,frequency]=letter_count(word)
    word=sort(word);
    word(find(word==' '))=[];
    uniqueword=unique(word);
    for i=1:length(uniqueword)
        letters{i}=uniqueword(i);
        frequency(i)=length(find(word==uniqueword(i)));
    end
end