function rtable=dr_graph(KK,II,netk,NU)

    rtable=zeros(KK,KK);

    for i=1:KK  
        rden=0;
        for k=1:II
            r=abs(NU(i,k)*netk(k));
            for j=1:KK
                if NU(j,k)~=0
                    rtable(i,j)=rtable(i,j)+r;
                end
            end
            rden=rden+r;
        end
        rtable(i,:)=rtable(i,:)/(rden+eps(rden));
    end
    
end
