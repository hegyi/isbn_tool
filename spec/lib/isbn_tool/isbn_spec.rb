require 'spec_helper'

module IsbnTool
  describe Isbn do
    it "successfull validation" do
      validator = double(:validator, :valid? => true)
      isbn = Isbn.new("1234", validator)
      expect(isbn).to be_valid
    end

    it "unsuccessfull validation" do
      validator = double(:validator, :valid? => false)
      isbn = Isbn.new("1234", validator)
      expect(isbn).not_to be_valid
    end
  end
end
