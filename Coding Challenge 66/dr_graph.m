function rtable=dr_graph(KK,II,netk,NU)

    for i=1:KK
        par_reac{i}=find(NU(i,:)~=0);
    end
    
    for i=1:II
        par_spec{i}=find(NU(:,i)~=0);
    end
    
    rtable=zeros(KK,KK);

    for i=1:KK  
        rden=0;
        reacs=par_reac{i};
        for k=1:length(reacs)
            reac=reacs(k);
            r=abs(NU(i,reac)*netk(reac));
            spec=par_spec{reac};
            rtable(i,spec)=rtable(i,spec)+r;
            rden=rden+r;
        end
        rtable(i,:)=rtable(i,:)/(rden+eps(rden));
    end
    
end
