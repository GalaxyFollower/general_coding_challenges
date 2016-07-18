function result=averagetime(times)

    for i=1:length(times)
        minutetime(i)=converttominute(converttomilitary(times{i}));
    end

    for i=0:1439
        temptime=minutetime;
        temptime=temptime+i;
        I=find(temptime>=1440);
        temptime(I)=temptime(I)-1440;
        timesum(i+1)=sum(temptime);
    end
    avetime=timesum/length(minutetime);

    [~,I]=min(timesum);
    shift=I-1;
    avetime=avetime(I)-shift;
    if avetime<0
        avetime=avetime+1440;
    end

    result=convertfrommilitary(convertfromminute(avetime));

end