module IsbnTool
  class IsbnParser
    attr_accessor :isbn, :metadata_collection

    def initialize(isbn, metadata_collection = IsbnMetadataCollection.instance)
      @isbn = isbn
      @metadata_collection = metadata_collection
      @chunk = nil
    end

    def parse
      raise 'Implement it!'
    end

  end
end
