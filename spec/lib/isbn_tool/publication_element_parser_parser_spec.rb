require 'spec_helper'

module IsbnTool
  describe PublicationElementParser do
    it "parses the publication element" do
      isbn = Isbn.new("9783639514971")
      isbn.stub(:not_extracted_numbers) { "514971" }
      parser = PublicationElementParser.new(isbn)
      isbn = parser.parse
      expect(isbn.publication_element).to eql("51497")
    end

    it "raises parse error" do
      isbn = Isbn.new("not_important")
      isbn.stub(:not_extracted_numbers) { "1" }
      parser = PublicationElementParser.new(isbn)
      expect { parser.parse }.to raise_error(IsbnParserException)
    end
  end
end
