function result=number_shuffle(num)
num=sscanf( sprintf( '%g', num ), '%1d' )';
N=length(num);
Golist=options_choices_list(N,N);
for i=length(Golist):-1:1
    if length(unique(Golist(i,:)))<N
       Golist(i,:)=[]; 
    end
end
Table=num(Golist);
for i=1:length(Table);
    v=Table(i,:);
    for n=1:length(v)
        x(n)=num2str(v(n));
    end
    result(i)=str2num(x);
end

result=sort(result);
end