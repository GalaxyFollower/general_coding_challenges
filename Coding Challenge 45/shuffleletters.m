function result=shuffleletters(word) 

[~,I]=sort(rand(length(word),1));

result=word(I);

end