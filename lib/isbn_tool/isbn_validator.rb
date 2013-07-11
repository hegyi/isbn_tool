module IsbnTool
  class IsbnValidator
    
    attr_accessor :isbn, :metadata_collection

    VALIDATOR_CHAIN = [
      ChecksumParser,
      PrefixElementParser,
      RegistrationGroupElementParser,
      RegistrantElementParser,
      PublicationElementParser
    ]

    def initialize(isbn, metadata_collection = IsbnMetadataCollection.instance)
      @isbn = isbn
      @metadata_collection = metadata_collection
    end

    def valid?
      VALIDATOR_CHAIN.each do |validator_class|
        validator = validator_class.new(isbn, metadata_collection)
        isbn = validator.parse
        return false unless validator.valid?
      end
      true
    end
  end
end
