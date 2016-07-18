function result=orderedvowels(str)
    str=strread(str,'%s','delimiter',' ');
    result=[];
    for i=1:length(str)
        if ordered_vowel_word(str{i})
            result=[result ' ' str{i}];
        end
    end
end

function result=ordered_vowel_word(word)
    vowels='aeiou';
    I=ismember(word,vowels);
    vowels_in_word=word(I);
    if sort(vowels_in_word)==vowels_in_word;
        result=1;
    else
        result=0;
    end
end