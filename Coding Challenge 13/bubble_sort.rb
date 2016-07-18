#example input: bubble_sort([5,4,3,2,1])
def bubble_sort(arr)
  sorted = false
  until sorted
    sorted = true
    (arr.count - 1).times do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        sorted = false
      end
    end
  end

  arr
end
