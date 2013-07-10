module IsbnTool
  class IsbnGenerator
    def initialize(isbn_chunk)
      @not_complete_isbn = Isbn.new(isbn_chunk)
    end

    def generate(count)
      raise 'This is a complete isbn!' if @not_complete_isbn.raw_isbn.size >= 13
    end

  end
end
