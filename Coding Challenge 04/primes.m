function result=primes(max)
    result=[];
    for i=2:max
        if isprime(i)
            result=[result i];
        end
    end
end

%works for values greater than 1
function result=isprime(num)
    for i=2:num-1
        if rem(num,i)==0
            result=false;
            return;
        end
    end
    result=true;
end