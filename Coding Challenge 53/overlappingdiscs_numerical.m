function areatot=overlappingdiscs_numerical(circs)

    r=1;
    dx=0.001;
    dy=0.001;

    [len,~]=size(circs);

    xmin=min(circs(:,1))-1;
    xmax=max(circs(:,1))+1;
    ymin=min(circs(:,2))-1;
    ymax=max(circs(:,2))+1;

    areasq=dx*dy;
    areatot=0;

    for i=xmin:dx:xmax
        for j=ymin:dy:ymax
            overlap=0;
            for z=1:len
                x=circs(z,1);
                y=circs(z,2);
                dist=sqrt((x-i)^2 + (y-j)^2);
                if (dist<r)
                    overlap=overlap+1;
                end
                if (overlap==len)
                    areatot=areatot+areasq;
                    break;
                end 
            end
        end
    end

end