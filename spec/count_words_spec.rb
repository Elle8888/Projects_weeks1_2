require "count_words"

describe "count_words method" do
  it "returns the word count of a string of words" do
    expect(count_words("as a string")).to eq 3
  end
  
  it "returns word count 0 for empty string" do
    expect(count_words("")).to eq 0
  end

  it "returns error when the input is not a string" do
    expect{ count_words([]) }.to raise_error("not a string")
  end
end

