function result=options_choices_list(options,choices) 



result=binarylist(choices);

add_value=1;
search_value=2;
for i=3:options
    [a,~]=size(result);
    newList=zeros(i^choices,choices);
    z=1;
    for j=1:a
        I=find(result(j,1:choices)==search_value);
        Ilen=length(I);
        if Ilen==0
            newList(z,1:choices)=result(j,1:choices);
            z=z+1;
            continue
        end
        tempList=binarylist(Ilen)+add_value;
        newList(z:z+2^Ilen-1,1:choices)=repmat(result(j,1:choices),2^Ilen,1);
        newList(z:z+2^Ilen-1,I)=tempList;
        z=z+2^Ilen;
    end
    add_value=add_value+1;
    search_value=search_value+1;
    result=newList;
end

end

function result=binarylist(choices)
    result=zeros(2^choices,choices);
    for i=0:2^choices-1
        for j=0:choices-1
            if bitand(i,2^j)
                result(i+1,j+1)=1;
            end
        end
    end
    result=result+1;
end