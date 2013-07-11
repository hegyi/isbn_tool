module IsbnTool
  class PrefixElementParser < IsbnParser

    def parse
      raise IsbnParserException.new("Not valid prefix element!: #{prefix}") unless valid?
      isbn.prefix_element = prefix
      isbn
    end

    def valid?
      metadata_collection.groups.any? { |g| g.prefix == prefix }
    end

    private
    def prefix
      @prefix ||= isbn.raw_isbn[0...Isbn::PREFIX_LENGTH]
    end
  end
end
