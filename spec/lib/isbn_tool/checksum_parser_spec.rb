require 'spec_helper'

module IsbnTool
  describe ChecksumParser do
    it "parses the checksum" do
      isbn = Isbn.new("9783639514971")
      parser = ChecksumParser.new(isbn)
      isbn = parser.parse
      expect(isbn.check_digit).to eql("1")
    end

    it "raises parser exception when the checksum is wrong" do
      isbn = Isbn.new("9783639514975")
      parser = ChecksumParser.new(isbn)
      expect { parser.parse }.to raise_error(IsbnParserException)
    end
  end
end
