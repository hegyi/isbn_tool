module IsbnTool
  class ChecksumParser < IsbnParser
    def parse
      raise IsbnParserException.new("Invalid checksum: #{@isbn.last_digit}") unless valid?
      @isbn.check_digit = @isbn.last_digit.to_s
      @isbn
    end

    def valid?
      @isbn.last_digit == ChecksumCalculator.new(@isbn.without_checksum).calculate
    end
  end

end
