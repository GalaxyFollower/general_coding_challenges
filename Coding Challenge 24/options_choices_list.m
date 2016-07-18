function result=options_choices_list(options,choices) 
    result=1:options;
    result=result';
    result=addchoice(result,options,choices-1);
end

function newresult=addchoice(result,options,choices)
    if choices==0
        newresult=result;
        return
    end
    [a,b]=size(result);
    newresult=zeros(a*options,b+1);
    z=1;
    for i=1:a
        for j=1:options
            newresult(z,1:(b+1))=[result(i,:) j];
            z=z+1;
        end
    end
    newresult=addchoice(newresult,options,choices-1);
    
end