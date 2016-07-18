function result=factorial(num)
    if (num <0)
        fprintf('you cant take the factorial of a negative number\n');
        return
    end
    result=1;
    for i=1:num
        result=result*i;
    end
end