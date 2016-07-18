function areatot=overlappingdiscs_final(circs)

    r=1;
    
    [clen,~]=size(circs);

    intersect=circleToPolygon(circs(1,1),circs(1,2),r);

    for j=2:clen
        x2=circs(j,1);
        y2=circs(j,2);
        intersect = poly_circle_intersect(intersect,x2,y2,r);
    end

    areatot=polyarea(intersect(:,1),intersect(:,2));

end
function intersect = poly_circle_intersect(poly1,x2,y2,r2)
    intersect=[];
    canstart=0;
    flag=0;
    canend=0;
    while 1
        for i=1:length(poly1)
            x=poly1(i,1);y=poly1(i,2);
            dist=sqrt((x-x2)^2 + (y-y2)^2);
            if dist<=r2
                if canstart
                    intersect=[intersect; x y];
                    canend=1;
                end
            else
                if ~canstart
                    canstart=1;
                end
                if canend
                    flag=1;
                    break;
                end
            end
        end
        if flag;break;end
    end

    if isempty(intersect);return;end

    pt1x=intersect(1,1);pt1y=intersect(1,2);
    L=length(intersect);
    pt2x=intersect(L,1);pt2y=intersect(L,2);

    poly2=circleToPolygon(x2,y2,r2);

    dist_pt1=zeros(length(poly2),1);
    dist_pt2=zeros(length(poly2),1);

    for i=1:length(poly2)
        x=poly2(i,1);y=poly2(i,2);
        dist_pt1(i)=sqrt((x-pt1x)^2 + (y-pt1y)^2);
        dist_pt2(i)=sqrt((x-pt2x)^2 + (y-pt2y)^2);
    end
    [~,I1]=min(dist_pt1);
    [~,I2]=min(dist_pt2);

    if I2<I1
        intersect=[intersect; poly2(I2:I1,:)];
    else
        intersect=[intersect; poly2(I2:length(poly2),:)];
        intersect=[intersect; poly2(1:I1,:)];
    end


end

function poly=circleToPolygon(x0,y0,r)
    N = 100000;
    t = linspace(0, 2*pi, N+1)';
    x = x0 + r * cos(t);
    y = y0 + r * sin(t);
    poly=[x y];
end