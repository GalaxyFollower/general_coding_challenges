function result=rec_intersection(rect1,rect2)
    Ax=rect1{1}(1);
    Ay=rect1{1}(2);
    Bx=rect1{2}(1);
    By=rect1{2}(2);
    Cx=rect2{1}(1);
    Cy=rect2{1}(2);
    Dx=rect2{2}(1);
    Dy=rect2{2}(2);

    Ex=max(Ax,Cx);
    Ey=max(Ay,Cy);
    Fx=min(Bx,Dx);
    Fy=min(By,Dy);

    if Ex>Fx || Ey>Fy
        Ex=[];
        Ey=[];
        Fx=[];
        Fy=[];
    end

    result={[Ex Ey] [Fx Fy]};
end