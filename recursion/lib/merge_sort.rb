def merge_sort(data)
  return data if data.length < 2

  data_size = data.length
  pivot = (data.length / 2).round

  left = merge_sort(data[0...pivot])
  right = merge_sort(data[pivot...data_size])

  merge(left, right, data)
end

def merge(left, right, data)
  data_pointer = 0
  left_pointer = 0
  right_pointer = 0

  left_length = left.length
  right_length = right.length

  while left_pointer < left_length && right_pointer < right_length
    if left[left_pointer] < right[right_pointer]
      data[data_pointer] = left[left_pointer]
      left_pointer += 1
    else
      data[data_pointer] = right[right_pointer]
      right_pointer += 1
    end

    data_pointer += 1
  end

  while left_pointer < left_length
    data[data_pointer] = left[left_pointer]
    left_pointer += 1
    data_pointer += 1
  end

  while right_pointer < right_length
    data[data_pointer] = right[right_pointer]
    right_pointer += 1
    data_pointer += 1
  end

  data
end
