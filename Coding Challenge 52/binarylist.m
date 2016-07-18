function result=binarylist(choices)
    result=zeros(2^choices,choices);
    for i=0:2^choices-1
        for j=0:choices-1
            if bitand(i,2^j)
                result(i+1,j+1)=1;
            end
        end
    end
end