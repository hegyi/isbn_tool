module IsbnTool
  class IsbnHyphenatizor
    PARSER_CHAIN = [
      PrefixElementParser,
      RegistrationGroupElementParser,
      RegistrantElementParser,
      PublicationElementParser,
      ChecksumParser
    ]
    def initialize(isbn, metadata_collection = IsbnMetadataCollection.instance)
      @isbn = isbn
      @metadata_collection = metadata_collection
    end

    def hyphenate
      PARSER_CHAIN.each do |parser_class|
        parser = parser_class.new(@isbn, @metadata_collection)
        @isbn = parser.parse
      end
      @isbn.parsed_blocks.join("-")
    end
  end
end
