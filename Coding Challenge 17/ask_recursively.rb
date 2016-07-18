#Example input: ask_recursively 'Do you wet the bed'
def ask_recursively question
    puts question
    reply = gets.chomp.downcase
    if reply == "yes"
        true
    elsif reply== "no"
        false
    else
        ask_recursively question
    end
end

