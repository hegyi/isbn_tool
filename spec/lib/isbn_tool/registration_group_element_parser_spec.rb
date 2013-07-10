require 'spec_helper'

module IsbnTool
  describe RegistrationGroupElementParser do
    it "parses the registration group element" do
      isbn = Isbn.new("9783639514971")
      isbn.prefix_element = "978"
      parser = RegistrationGroupElementParser.new(isbn)
      isbn = parser.parse
      expect(isbn.registration_group_element).to eql("3")
    end

    it "raises exception if the element is invalid" do
      isbn = Isbn.new("978990000")
      isbn.prefix_element = "978"
      parser = RegistrationGroupElementParser.new(isbn)
      expect { parser.parse }.to raise_error(IsbnParserException)
    end
  end
end
