def count_words(str)
  if str.is_a?(String)
    return str.split(" ").length
  end

  raise("not a string") 
end