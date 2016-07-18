def helloname_lovely
    puts 'Hello, what is your name?'
    name = gets.chomp
    puts 'Hello, ' + name + '.'
    
    if name == 'Max'
        puts 'What a lovely name!'
    elsif name == 'Taylor'
        puts 'What a lovely name!'
    end
end