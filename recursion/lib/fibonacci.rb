def fibs(num)
  (2..num).reduce([0, 1]) do |array, i|
    array.push(array[i - 1] + array[i - 2])
  end
end

def fibs_rec(num)
  return [0] if num.zero?
  return [0, 1] if num == 1

  array = fibs_rec(num - 1)

  array << (array[-2] + array[-1])
end
