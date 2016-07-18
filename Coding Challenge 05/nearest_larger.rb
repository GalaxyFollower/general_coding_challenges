#example input: nearest_larger([2,3,4,8], 2)
def nearest_larger(array, idx)
  diff = 1
  loop do
    left = idx - diff
    right = idx + diff

    if (left >= 0) && (array[left] > array[idx])
      return left
    elsif (right < array.length) && (array[right] > array[idx])
      return right
    elsif (left < 0) && (right >= array.length)
      return nil
    end

    diff += 1
  end
end
