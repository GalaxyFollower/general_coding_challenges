function militarytime=convertfrommilitary(militarytime)
    if militarytime{1}>=12
        militarytime{3}='pm';
    else
        militarytime{3}='am';
    end
    
    if strcmp(militarytime{3},'am') && militarytime{1}==0
        militarytime{1}=12;
    end

    if strcmp(militarytime{3},'pm') && militarytime{1}>12
        militarytime{1}=militarytime{1}-12;
    end
end