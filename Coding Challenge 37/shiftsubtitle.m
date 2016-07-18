function shiftsubtitle(shift)

fid=fopen('subtitles.txt','r');

entrynum=[];
timefrom=[];
timeto=[];
text=[];
textnum=0;%number of lines of text per entry
z=1;

newentry=1;
while 1
    tline = fgetl(fid);
    if tline==-1
        break;
    end
    if newentry
        entrynum{z}=tline;
        tline = fgetl(fid);
        timefrom{z}={str2num(tline(1:2)) str2num(tline(4:5)) str2num(tline(7:8)) str2num(tline(10:12)) };
        timeto{z}={str2num(tline(18:19)) str2num(tline(21:22)) str2num(tline(24:25)) str2num(tline(26:29)) };
        newentry=0;
        continue;
    end
    if isempty(tline)
        z=z+1;
        textnum(z)=0;
        newentry=1;
    else
        textnum(z)=textnum(z)+1;
        text{z}{textnum(z)}=tline;
    end
end
fclose(fid);

%shift time
shift=converttomilisecond(shift);
for i=1:z
    timefrom{i}=convertfrommilisecond(converttomilisecond(timefrom{i})+shift);
    timeto{i}=convertfrommilisecond(converttomilisecond(timeto{i})+shift);
end


fid=fopen('output.txt','wt');
for i=1:z
    if i~=1
        fprintf(fid,'\n');
    end
    fprintf(fid,'%s\n',entrynum{i});
    fprintf(fid,'%s:%s:%s,%s --> ',sprintf('%02d',timefrom{i}{1}),sprintf('%02d',timefrom{i}{2}), ...
                                   sprintf('%02d',timefrom{i}{3}),sprintf('%03d',timefrom{i}{4}));
    fprintf(fid,'%s:%s:%s,%s\n',sprintf('%02d',timeto{i}{1}),sprintf('%02d',timeto{i}{2}), ...
                                sprintf('%02d',timeto{i}{3}),sprintf('%03d',timeto{i}{4}));
    for j=1:textnum(i)
        fprintf(fid,'%s\n',text{i}{j});
    end                   
end
fclose(fid);






end

function result=converttomilisecond(time)
    result=time{1}*60*60*1000;
    result=result+time{2}*60*1000;
    result=result+time{3}*1000;
    result=result+time{4};
end

function result=convertfrommilisecond(time)
    result{1}=floor(time/60/60/1000);
    time=time-result{1}*60*60*1000;
    result{2}=floor(time/60/1000);
    time=time-result{2}*60*1000;
    result{3}=floor(time/1000);
    result{4}=time-result{3}*1000;
end