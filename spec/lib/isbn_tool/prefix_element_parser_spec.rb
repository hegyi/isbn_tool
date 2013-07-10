require 'spec_helper'
module IsbnTool
  describe PrefixElementParser do
    it "parses the prefix element" do
      isbn = Isbn.new("9783847390688")
      isbn = PrefixElementParser.new(isbn).parse
      expect(isbn.prefix_element).to eql("978")
    end

    it "raises exception when the parsed prefix is not valid" do
      isbn = Isbn.new("1113847390688")
      parser = PrefixElementParser.new(isbn)
      expect { parser.parse }.to raise_error(IsbnParserException)
    end

    it "validates the prefix element" do
      isbn = Isbn.new("9783847390688")
      parser = PrefixElementParser.new(isbn)
      expect(parser).to be_valid
    end
  end
end
