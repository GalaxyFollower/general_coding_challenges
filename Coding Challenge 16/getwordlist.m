function [answer]=getwordlist
i=1;
answer=[];
while 1
    word = input('enter word:','s');
    if isempty(word)
        return
    end
    answer{i}=word;
    i=i+1;
end

end