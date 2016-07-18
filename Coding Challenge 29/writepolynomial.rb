#Example input: coeffs=[-3,-4,1,0,6,1]
def writepolynomial(coeffs)
    output = []
    coeffs.reverse!
    
    coeffs.each_with_index do |coefficient,index|
        # In case of a negative number the sign is already present.
        sign = (coefficient.to_i < 0)  ? "" : "+"
        unless coefficient.to_i == 0
            #uncomment next line and comment line after it if you want to convert program to 3x^2 type format
            #variable_part =   index != 0 ? (index == 1 ? "x" : "x^#{index}") : ""
            variable_part =   index != 0 ? (index == 1 ? "x" : "x**#{index}") : ""
            case
                when coefficient.to_i == -1 then coefficient = "-"
                # Remove 1 from places where there is no variable part.
                # Example : 3x^2 + (remove 1)x + 1(keep 1)
                when (coefficient.to_i == 1 && index != 0) then coefficient = ""
                #comment next line if you want to convert program to 3x^2 type format
                when (coefficient.to_i != 1 && index != 0) then coefficient = coefficient.to_s + "*"
            end
            output << "#{sign}#{coefficient}#{variable_part}"
        end
    end
    
    output    = output.reverse
    output    << "0"  if output.empty?
    # Remove "+" from the first term
    output[0] = output[0].gsub("+","")
    output    = output.join("")
    
    #uncomment if want to output to screen
    #puts "def runpolynomial(x)\n   " + output + "\nend"

    #uncomment if want to output to file runpolynomial.rb
    polyfile = File.open( "runpolynomial.rb", "w")
    polyfile << "def runpolynomial(x)\n   " + output + "\nend"
    polyfile.close
    
end