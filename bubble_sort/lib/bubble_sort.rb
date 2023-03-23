def bubble_sort(array)
  for i in (0...array.length)
    sorted = true

    for j in (0...(array.length - i - 1))
      if array[j] > array[j + 1]
        array[j], array[j + 1] = array[j + 1], array[j]
        sorted = false
      end
    end

    break if sorted
  end

  array
end
