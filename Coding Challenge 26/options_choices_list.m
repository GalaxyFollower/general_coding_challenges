function result=options_choices_list(options,choices)
    for i=0:(options^choices)-1
        List(i+1,:)=dec2base(i,options,choices);
    end
    for i=1:choices
        result(:,i)=str2num(List(:,i));
    end
    result=result+1;
end