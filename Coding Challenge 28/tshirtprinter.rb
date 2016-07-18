#Example input: jobs=[10,15,20,24,30,45,75]
#npresses=2
def tshirtprinter(jobs,npresses)
    massive = generate_massive_array(jobs,npresses)
    times = make_array_of_times(massive)
    i=times.index(times.min)
    massive[i]
end

def generate_massive_array(jobs,npresses)
    massive_array = jobs.dup
    (npresses-1).times do
        if massive_array[0].class == Array
            working_array = []
            massive_array.each do |subarray|
                new_array = split_array(subarray.pop)
                new_array.each {|item| working_array << (subarray + item)}
            end
            massive_array = working_array
            else
            massive_array = split_array(massive_array)
        end
    end
    massive_array
end

def split_array(array)
    big_array = []
    (2**array.length).times do |binary_index|
        extracted, left = [],[]
        array.length.times do |index|
            if (2**index & binary_index != 0)
                extracted << array[index]
                else
                left << array[index]
            end
        end
        big_array << [extracted,left] unless extracted == [] || left == []
    end
    big_array
end

def make_array_of_times(bigarray)
    newarr = []
    bigarray.each do |x|
        y = []
        x.each do |item|
            y << item.inject(:+)
        end
        newarr << y.max
    end
    newarr
end