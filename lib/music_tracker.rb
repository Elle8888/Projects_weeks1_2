class Musiclist
  def initialize
    @songs = []
  end

  def track(song)
    raise "input not a hash" unless song.is_a?(Hash)
    
    [:artist, :album, :title, :genre].each do |expected_key|
      raise "put missing value" unless song.include?(expected_key)
    end

    return if self.exists?(song)

    @songs << song
  end

  def list(filter={})
    return @songs if filter.empty?

    filter_key = filter.keys[0]
    filter_value = filter[filter_key]

    @songs.select do |element|
      element[filter_key] == filter_value
    end
  end

  def exists?(song)
    @songs.each do |element|
      return true if element == song
    end
  
    return false
  end
end