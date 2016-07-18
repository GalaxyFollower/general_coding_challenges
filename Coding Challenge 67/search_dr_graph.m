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
            search(B(i))
        end
        if rs(i)==0
            break
        end
    end

        function search(spec)
            marked(spec)=1;
            error(spec)=threshold;
            for j=1:KK
                if ~marked(j) && rtable(spec,j)>threshold
                    search(j);
                end

            end
        end

end
