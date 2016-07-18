function error=search_dr_graph(KK,starting_species,rtable)
 
    %create AB variables to identify Rab species
    A=zeros(KK,KK);
    B=zeros(KK,KK);
    for i=1:KK
        A(i,:)=i;
        B(:,i)=i;
    end
    %turn tables into arrays
    rs=rtable(:);  A=A(:);  B=B(:);

    %sort arrays
    [rs,I]=sort(rs,'descend');  A=A(I);  B=B(I);

    marked=zeros(KK,1);
    error=zeros(KK,1);
    marked(starting_species)=1;
    error(starting_species)=1;

    for i=1:KK^2
        if marked(A(i)) && ~marked(B(i))
            threshold=rs(i);
            search(B(i));
        end
        if rs(i)==0
            break
        end
    end

    function search(spec)
        while 1
            specnew=[];
            for j=1:length(spec)
                marked(spec(j))=1;
                error(spec(j))=threshold;
                for k=1:KK
                    if ~marked(k) && rtable(spec(j),k)>threshold
                        specnew=[specnew k];
                    end
                end
            end
            spec=specnew;
            if isempty(spec);break;end
        end 
    end

end
