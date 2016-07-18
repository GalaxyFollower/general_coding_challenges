function pathoutput=hexagonpuzzle(vertexstart)

looking=1;
i=0;
while looking
    i=i+1;
    moves=options_choices_list(6,i);
    for j=1:6^i
        vertex=vertexstart;
        for k=1:i
            rotate(moves(j,k));
        end
        if vertex==[0 0 0 1 0 0 1 0 1 1 0 0 0]
            path=moves(j,:);
            looking=0;
            break;
        end
    end
end
pathoutput=[];
for i=1:length(path)
    switch path(i)
        case 1
            pathoutput=[pathoutput; 1 1];
        case 2
            pathoutput=[pathoutput; 1 0];
        case 3
            pathoutput=[pathoutput; 2 1];
        case 4
            pathoutput=[pathoutput; 2 0];
        case 5
            pathoutput=[pathoutput; 3 1];
        case 6
            pathoutput=[pathoutput; 3 0];
    end
    
    
end



    function rotate(hex)
        switch hex
            case 1 %rotate hex1 cw
                verts = [1  4  7  9  6 3];
                dir=1;
            case 2 %rotate hex1 ccw
                verts = [1  4  7  9  6 3];
                dir=0;
            case 3 %rotate hex2 cw
                verts = [2  5  8 10  7 4];
                dir=1;
            case 4 %rotate hex2 ccw
                verts = [2  5  8 10  7 4];
                dir=0;
            case 5 %rotate hex3 cw
                verts = [7 10 12 13 11 9];
                dir=1;
            case 6 %rotate hex3 ccw
                verts = [7 10 12 13 11 9];
                dir=0;
        end
        temp=vertex(verts);
        if dir %dir==1 clockwise
            temp=[temp(6) temp];
            temp(7)=[];
        else
            temp=[temp temp(1)];
            temp(1)=[];
        end
        vertex(verts)=temp;
    end

end


