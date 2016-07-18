def getwordlist
    word = []
    while 1
        puts "enter word:"
        word2 = gets.chomp
        if word2 == "\n"
            return word
        end
        word[word.length] = word2
    end
end