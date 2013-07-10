module IsbnTool
  class Isbn
    def initialize(isbn, validator)
      @isbn = isbn
      @validator = validator
    end

    def valid?
      @validator.valid?(@isbn)
    end
  end
end
