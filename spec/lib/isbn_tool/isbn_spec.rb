require 'spec_helper'

module IsbnTool
  class FakeValidator
    def initialize(*)
    end

    def valid?
    end

  end

  describe Isbn do
    it "successfull validation" do
      FakeValidator.any_instance.stub(:valid?) { true }

      isbn = Isbn.new("1234", FakeValidator)
      expect(isbn).to be_valid
    end

    it "unsuccessfull validation" do
      FakeValidator.any_instance.stub(:valid?) { false }

      isbn = Isbn.new("1234", FakeValidator)
      expect(isbn).not_to be_valid
    end

    it "hyphenates the given isbn" do
      isbn = Isbn.new("9783639514957")
      expect(isbn.hyphenate).to eql("978-3-639-51495-7")

    end
  end
end
