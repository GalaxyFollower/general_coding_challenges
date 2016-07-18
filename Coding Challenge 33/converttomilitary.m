function normaltime=converttomilitary(normaltime)
    if strcmp(normaltime{3},'am') && normaltime{1}==12
        normaltime{1}=0;
    end
    if strcmp(normaltime{3},'pm') && normaltime{1}~=12
        normaltime{1}=normaltime{1}+12;
    end
    normaltime(3)=[];
    
end