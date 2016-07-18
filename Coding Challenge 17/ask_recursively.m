function [answer]=ask_recursively(question)


reply = input(question,'s');

if strcmp(reply,'yes')
    answer=1;
elseif strcmp(reply,'no')
    answer=0;
else
    fprintf('please answer "yes" or "no"\n')
    answer=ask_recursively(question);
end

end