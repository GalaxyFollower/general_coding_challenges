function helloname_lovely
    name = input('Hello, what is your name?\n','s');

    fprintf('Hello, %s.\n',name);

    if (strcmpi(name,'Max'))
        fprintf('What a lovely name!\n')
    elseif (strcmpi(name,'Taylor'))
        fprintf('What a lovely name!\n')
    end
end