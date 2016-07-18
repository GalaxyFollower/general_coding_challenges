function [donetime,donedate]=busineshours(job,time,date)


time=converttominute(converttomilitary(time));
donetime=time;
donedate=date;

while job>0
    [open,close]=hoursopen(donedate);
    
    %were closed come back tomorrow
    if isempty(open)
        gotonextday;
        donetimenextopen;
        continue
    end
    
    %were open, but not going to get done today
    timetoday=close-max(open,donetime);
    if job>timetoday
        job=job-timetoday;
        gotonextday;
        donetimenextopen;
        continue
    end
    
    %its done today!!!
    donetime=max(open,donetime)+job;
    job=0;
    
end

donetime=convertfrommilitary(convertfromminute(donetime));

    function donetimenextopen
        [open,~]=hoursopen(donedate);
        if ~isempty(open)
            donetime=open;
        end
    end

    function gotonextday
        if strcmp(donedate{1},'Dec') && donedate{2}==31
            donedate{1}='Jan';
            donedate{2}=1;
            donedate{3}=donedate{3}+1;
            return
        end
        months={'Jan' 'Feb' 'Mar' 'Apr' 'May' 'Jun' 'Jul' 'Aug' 'Sep' 'Oct' 'Nov' 'Dec'};
        Imonth=find(strcmp(months,donedate{1}));
        C=calendar(donedate{3},Imonth)';
        C=C(find(C));
        if donedate{2}==length(C)
            donedate{1}=months{Imonth+1};
            donedate{2}=1;
            return
        end
        donedate{2}=donedate{2}+1;
    end


end



function [open,close]=hoursopen(date)
    open={9 00 'am'};
    close={3 00 'pm'};
    if strcmp(date{1},'Dec') && date{2}==24
        open={8 00 'am'};
        close={1 00 'pm'};
    end
    if strcmp(date{1},'Dec') && date{2}==25
        open=[];
        close=[];
        return
    end
    %find day of week
    months={'Jan' 'Feb' 'Mar' 'Apr' 'May' 'Jun' 'Jul' 'Aug' 'Sep' 'Oct' 'Nov' 'Dec'};
    C=calendar(date{3},find(strcmp(months,date{1})));
    days={'Sun' 'Mon' 'Tue' 'Wed' 'Thu' 'Fri' 'Sat'};
    [~,I]=find(C==date{2});
    day=days{I};
    if strcmp(day,'Sun') || strcmp(day,'Wed')
        open=[];
        close=[];
        return
    end
    open=converttominute(converttomilitary(open));
    close=converttominute(converttomilitary(close));
end