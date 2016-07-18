function result=morse_code(str)
    str=strread(str,'%s','delimiter',' ');
    result=[];
    for i=1:length(str)
        result=[result '  ' morse_code_word(str{i})];
    end
    
end


function result=morse_code_word(word)
    letters='abcdefghijklmnopqrstuvwxyz';
    code={'.-' '-...' '-.-.' '-..' '.' '..-.' '--.' '....' '..' '.---' '-.-.' '.-..' '--' '-.' '---' '.--.' '--.-' '.-.' '...' '-' '..-' '...-' '.--' '-..-' '-.--' '--..'};
    result=[];
    for i=1:length(word)
        I=find(letters==word(i));
        result=[result ' ' code{I}];
    end
end