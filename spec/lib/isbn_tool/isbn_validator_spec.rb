require 'spec_helper'

module IsbnTool
  describe IsbnValidator do

    [
      "9780966955309",
      "9780201101799",
      "9783847390688",
      "9783847395720",
      "9783659986185",
      "9783639514971",
      "9783639514957",
      "9783639515152",
      "9783659023606",
      "9783659068058",
      "9783659074646",
      "9783659077647"].each do |input, expected|
        it "validates #{input}" do
          isbn = Isbn.new(input)
          validator = IsbnValidator.new(isbn)
          expect(validator).to be_valid
        end
      end
  end

end
