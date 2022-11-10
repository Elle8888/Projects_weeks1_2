def contains_todo?(text)
  raise "not a string" unless text.is_a?(String)
  #unless text.is_a?(String) 
  # raise "not a string"
  #end

  return text.include?("#TODO")
  #if text.include?("#TODO") 
  #  return true
  #end

  #return false
end