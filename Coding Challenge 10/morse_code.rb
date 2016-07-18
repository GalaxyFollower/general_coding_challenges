#example input: morse_code("cat in hat")
MORSE_CODE = {
  "a" => ".-",
  "b" => "-...",
  "c" => "-.-.",
  "d" => "-..",
  "e" => ".",
  "f" => "..-.",
  "g" => "--.",
  "h" => "....",
  "i" => "..",
  "j" => ".---",
  "k" => "-.-",
  "l" => ".-..",
  "m" => "--",
  "n" => "-.",
  "o" => "---",
  "p" => ".--.",
  "q" => "--.-",
  "r" => ".-.",
  "s" => "...",
  "t" => "-",
  "u" => "..-",
  "v" => "...-",
  "w" => ".--",
  "x" => "-..-",
  "y" => "-.--",
  "z" => "--.."
}

def morse_code(str)
  words = str.split(" ")
  coded_words = words.map { |word| morse_code_word(word) }
  coded_words.join("  ")
end

def morse_code_word(word)
  letters = word.split("")
  codes = letters.map { |l| MORSE_CODE[l] }
  codes.join(" ")
end
