def sub_strings(string, dictionary)
  result = {}

  base_string = string.downcase

  dictionary.each do |word|
    matches = base_string.scan(word).length

    result[word] = matches unless matches.zero?
  end

  result
end
