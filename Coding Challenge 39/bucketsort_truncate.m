function result=bucketsort_truncate(array,N)

buffer=zeros(length(array),1);

buckets=zeros(1+10^N,1);

array=floor(array*10^N)+1;

for i=1:length(array)
    x=array(i);
    if buckets(x)==0
        buckets(x)=i;
    else
        buffer(i)=buckets(x);
        buckets(x)=i;
    end
end
z=0;
result=zeros(length(array),1);
%create result, descending
for i=(1+10^N):-1:1
    x=buckets(i);
    while x~=0
        z=z+1;
        result(z)=x;
        x=buffer(x);
    end
end


end