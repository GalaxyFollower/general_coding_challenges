function towerofhanoi(n)

movepiece(n,'A','C','B')


end


function movepiece(n,from,final,aux)
    if n==1
        fprintf('move piece 1 from %s to %s\n',from,final);
        return;
    end
    
    movepiece(n-1,from,aux,final)
    
    fprintf('move piece %g from %s to %s\n',n,from,final);

    movepiece(n-1,aux,final,from)
end