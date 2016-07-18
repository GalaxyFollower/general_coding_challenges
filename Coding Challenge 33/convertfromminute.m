function result=convertfromminute(minutetime)
    result{1}=floor(minutetime/60);
    result{2}=minutetime-60*result{1};
end