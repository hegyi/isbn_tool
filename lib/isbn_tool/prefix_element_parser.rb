module IsbnTool
  class PrefixElementParser < IsbnParser
    PREFIX_LENGTH = 3

    def parse
      raise IsbnParserException.new("Not valid prefix element!: #{chunk}") unless valid?
      @isbn.prefix_element = chunk
      @isbn
    end

    def valid?
      @metadata_collection.groups.any? { |g| g.prefix == chunk }
    end

    private
    def chunk
      @chunk ||= @isbn.raw_isbn[0...PREFIX_LENGTH]
    end
  end
end
