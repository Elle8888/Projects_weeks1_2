require "music_tracker"

describe Musiclist do
  before(:each)do
    @musiclist = Musiclist.new
  end

  context "track method" do
    it "raises an error for an empty array input" do # 1
      expect { @musiclist.track([]) }.to raise_error "input not a hash"
    end
  
    it "raises an error for a string input" do # 2
      expect { @musiclist.track("Master of Puppets") }.to raise_error "input not a hash"
    end
  
    it "raises an error for an integer input" do # 3
      expect { @musiclist.track(8) }.to raise_error "input not a hash"
    end

    it "does not raise an error if the hash has 4 key value pairs" do # 4
      input = {artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero", genre: "Pop"}
      expect { @musiclist.track(input) }.not_to raise_error
    end

    it "raise an error when a key value pair is wrong" do # 5
      input = {artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero", gene: "Pop"}
      expect { @musiclist.track(input) }.to raise_error "put missing value"
    end

    it "raise an error when a key is missing (i.e. genre)" do # 6
      input = {artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero"}
      expect { @musiclist.track(input) }.to raise_error "put missing value"
    end 

    it "raise an error when a key is missing (i.e. title)" do # 7
      input = {artist: "Taylor Swift", album: "Midnights", genre: "Pop"}
      expect { @musiclist.track(input) }.to raise_error "put missing value"
    end

    it "raise an error when a key is missing (i.e. album)" do # 8
      input = {artist: "Taylor Swift", title: "Anti-Hero", genre: "Pop"}
      expect { @musiclist.track(input) }.to raise_error "put missing value"
    end

    it "raise an error when a key is missing (i.e. artist)" do # 9
      input = {album: "Midnights", title: "Anti-Hero", gene: "Pop"}
      expect { @musiclist.track(input) }.to raise_error "put missing value"
    end
  end

  context "list method" do
    it "returns an empty list when no song is added" do # 10
      expect(@musiclist.list).to eq []
    end

    it "returns a list with 2 inputs" do # 11
      inputs = [
        {artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero", genre: "Pop"},
        {artist: "Taylor Swift", album: "Fearless", title: "Love Story", genre: "Country"}
      ]
      inputs.each do |input|
        @musiclist.track(input)
    end
    expect(@musiclist.list).to eq [
      {artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero", genre: "Pop"},
      {artist: "Taylor Swift", album: "Fearless", title: "Love Story", genre: "Country"}
    ]
    end 

    it "returns a list without duplicates" do # 12
      inputs = [
        {artist: "Metallica", album: "Master of Puppets", title: "Master of Puppets", genre: "Rock"},
        {artist: "Metallica", album: "Master of Puppets", title: "Master of Puppets", genre: "Rock"} 
      ]
      inputs.each do |input|
        @musiclist.track(input)
      end
    expect(@musiclist.list).to eq [
      {artist: "Metallica", album: "Master of Puppets", title: "Master of Puppets", genre: "Rock"}
    ]
    end

    it "returns a list of all the songs even if no key value pair is entered" do # 13
      inputs = [
        {artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero", genre: "Pop"},
        {artist: "Metallica", album: "Master of Puppets", title: "Master of Puppets", genre: "Rock"}
      ]
      inputs.each do |input|
        @musiclist.track(input)
      end
      expect(@musiclist.list).to eq [
        {artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero", genre: "Pop"},
        {artist: "Metallica", album: "Master of Puppets", title: "Master of Puppets", genre: "Rock"}
      ]
    end 

    it "returns a list of songs by a chosen key (i.e. artist) based on the list by the same artist" do
      inputs = [
        {artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero", genre: "Pop"},
        {artist: "Taylor Swift", album: "Fearless", title: "Love Story", genre: "Country"}
      ]
      inputs.each do |input|
        @musiclist.track(input)
      end
      expect(@musiclist.list({artist: "Taylor Swift"})).to eq [
        {artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero", genre: "Pop"},
        {artist: "Taylor Swift", album: "Fearless", title: "Love Story", genre: "Country"}
    ]
    end

    it "returns a list songs by a chosen key (i.e. album) based on the list from various artists" do
      inputs = [
        {artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero", genre: "Pop"},
        {artist: "Metallica", album: "Master of Puppets", title: "Master of Puppets", genre: "Rock"}
      ]
      inputs.each do |input|
        @musiclist.track(input)
      end
      expect(@musiclist.list({album: "Midnights"})).to eq [
        {artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero", genre: "Pop"}
      ]
    end

    it "returns an empty array if the filter key doesn't exist in the array" do 
      input = {artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero", genre: "Pop"}
      expect(@musiclist.list({producer: "Taylor Swift"})).to eq []
    end
  end

  context "exists? method" do
    it "it exists" do
      @musiclist.track({artist: "Metallica", album: "Master of Puppets", title: "Master of Puppets", genre: "Rock"})
      expect(@musiclist.exists?({artist: "Metallica", album: "Master of Puppets", title: "Master of Puppets", genre: "Rock"}))
    end
  end
end