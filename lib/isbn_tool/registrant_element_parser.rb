module IsbnTool
  class RegistrantElementParser < IsbnParser

    def parse
      raise IsbnParserException unless valid?
      rule = find_rule
      @isbn.registrant_element = @isbn.not_extracted_numbers[0...rule.length]
      @isbn
    end

    def valid?
      !find_rule.nil?
    end
    private

    def find_rule
      rules = @isbn.group.rules
      rules.find { |range| range.in_range? @isbn.not_extracted_numbers }
    end
  end
end
