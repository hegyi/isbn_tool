module IsbnTool
  class RegistrantElementParser < IsbnParser
    def initialize(*)
      super
      @not_extracted_numbers = isbn.not_extracted_numbers
    end

    def parse
      raise IsbnParserException unless valid?
      rule = find_rule
      isbn.registrant_element = not_extracted_numbers[0...rule.length]
      isbn
    end

    def valid?
      !find_rule.nil?
    end

    private
    attr_reader :not_extracted_numbers

    def find_rule
      rules = isbn.group.rules
      rules.find { |range| range.in_range? not_extracted_numbers }
    end
  end
end
