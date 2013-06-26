require 'spec_helper'

describe ISBN13Validator do

  [
    "9783847390688",
    "9783847395720",
    "9783659986185",
    "9783639514971",
    "9783639514957",
    "9783639515152",
    "9783659023606",
    "9783659068058",
    "9783659074646",
    "9783659077647"
  ].each do |isbn|
    it "ISBN should be valid" do
      validator = ISBN13Validator.new(isbn, RANGE_METADATA)
      expect(validator).to be_valid
    end
  end

  it "should hyphenate the given isbn" do
    validator = ISBN13Validator.new("9783847390688", RANGE_METADATA)
    expect(validator.hyphenate).to eq("978-3-8473-9068-8")
  end

  ["asdfasdf", "978-3-8473-9068-8"].each do |input|
    it "should accept only numbers" do
      validator = ISBN13Validator.new(input, RANGE_METADATA)
      expect(validator).not_to be_valid
    end
  end
end
