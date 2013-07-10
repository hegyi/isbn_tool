module IsbnTool
  class IsbnParser
    def initialize(isbn, metadata_collection = IsbnMetadataCollection.instance)
      @isbn = isbn
      @metadata_collection = metadata_collection
      @chunk = nil
    end

    def parse
      raise 'Implement it!'
    end

    private
    def chunk
      raise 'Implement it!'
    end
  end
end
