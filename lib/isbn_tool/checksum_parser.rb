module IsbnTool
  class ChecksumParser < IsbnParser
    def parse
      raise IsbnParserException.new("Isbn length must be 13!") if wrong_length?
      raise IsbnParserException.new("Invalid checksum: #{@isbn.last_digit}") unless valid?
      isbn.check_digit = isbn.last_digit.to_s
      isbn
    end

    def valid?
      isbn.last_digit.to_i == ChecksumCalculator.new(isbn.without_checksum).calculate
    end

    private
    def wrong_length?
      isbn.raw_isbn.length != Isbn::VALID_LENGTH
    end
  end

end
