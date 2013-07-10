require 'spec_helper'

module IsbnTool
  describe IsbnValidator do
    it "validates the whole isbn" do
      isbn = Isbn.new("9783639514971")
      validator = IsbnValidator.new(isbn)
      expect(validator).to be_valid
    end
  end
end
