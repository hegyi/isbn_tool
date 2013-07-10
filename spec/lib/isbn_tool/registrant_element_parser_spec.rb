require 'spec_helper'

module IsbnTool
  describe RegistrantElementParser do
    it "parses the registrant element" do
      isbn = Isbn.new("9783639514971")
      isbn = PrefixElementParser.new(isbn).parse
      isbn = RegistrationGroupElementParser.new(isbn).parse
      parser = RegistrantElementParser.new(isbn)
      isbn = parser.parse
      expect(isbn.registrant_element).to eql("639")
    end
  end
end
