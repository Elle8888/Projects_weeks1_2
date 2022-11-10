require "task_tracker"

describe "contains_todo? method" do

	it "returns true if the string includes #TODO" do
		expect(contains_todo?("laundry#TODO")).to eq true
	end

	it "returns false if the string does not include #TODO" do
		expect(contains_todo?("shopping")).to eq false
	end	

	it "returns false for an empty string" do
		expect(contains_todo?("")).to eq false
	end

	it "raises an error for an integer" do
		expect { contains_todo?(1) }.to raise_error "not a string"
	end

	it "raises an error for nil" do
		expect { contains_todo?(nil)}.to raise_error "not a string"
	end

end