module IsbnTool
  class PublicationElementParser < IsbnParser
    def parse
      raise IsbnParserException.new("Invalid publication element!") unless valid?
      isbn.publication_element = numbers_before_checksum
      isbn
    end

    def valid?
      numbers_before_checksum.size > 0
    end

    private
    def numbers_before_checksum
      @numbers_before_checksum ||= @isbn.not_extracted_numbers[0..-2]
    end
  end
end
