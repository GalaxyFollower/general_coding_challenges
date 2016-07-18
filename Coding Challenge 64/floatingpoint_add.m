function [m3,n3]=floatingpoint_add(m1,n1,m2,n2)
    %make sure inputs are integers
    m1=int32(m1);
    n1=int32(n1);
    m2=int32(m2);
    n2=int32(n2);

    while n1>n2
        m2=idivide(m2,int32(10));
        n2=n2+1;
    end


    while n2>n1
        m1=idivide(m1,int32(10));
        n1=n1+1;
    end

    m3=m1+m2;
    n3=n1;

    while m3>9999 || m3<-9999
        m3=idivide(m3,int32(10));
        n3=n3+1;
    end

end