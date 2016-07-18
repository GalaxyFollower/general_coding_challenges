function array=bubble_sort(array)
    flag=1;
    while flag
        flag=0;
        for i=2:length(array)
            if array(i)<array(i-1)
                temp=array(i-1);
                array(i-1)=array(i);
                array(i)=temp;
                flag=1;
            end
        end
    end
end