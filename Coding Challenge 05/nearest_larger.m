function result=nearest_larger(array,i)
    diff = 1;
    while 1
        left = i - diff;
        right = i + diff;
        
        if (left > 0) && (array(left) > array(i))
            result = left;
            return
        elseif (right <= length(array)) && (array(right) > array(i))
            result = right;
            return
        elseif (left < 1) && (right > length(array))
            result = [];
            return
        end
        
        diff = diff + 1;
    end
end