module IsbnTool
  class Isbn
    VALID_LENGTH = 13
    attr_accessor :prefix_element, :registration_group_element, :registrant_element, :publication_element, :check_digit, :group
    attr_accessor :raw_isbn

    def initialize(isbn, validator = IsbnValidator)

      @validator = validator.new(self)

      @raw_isbn = isbn

      @prefix_element = nil
      @registration_group_element = nil
      @registrant_element = nil
      @publication_element = nil
      @check_digit = nil
      @group = nil
    end

    def not_extracted_numbers
      length = parsed_blocks.join.size
      @raw_isbn[length..-1]
    end

    def valid?
      @validator.valid?
    end

    def hyphenate
      IsbnHyphenatizor.new(self).hyphenate
    end

    def last_digit
      @raw_isbn[-1].to_i
    end

    def without_checksum
      @raw_isbn[0..-2]
    end

    def parsed_blocks
      [
        @prefix_element,
        @registration_group_element,
        @registrant_element,
        @publication_element,
        @check_digit
      ].compact
    end
  end
end
