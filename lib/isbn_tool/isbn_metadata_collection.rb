require 'singleton'
module IsbnTool
  class IsbnMetadataCollection
    include Singleton

    def initialize
      path_to_xml = ENV['ISBN_METADATA_XML'] || File.expand_path('../../../vendor/isbn_range.xml', __FILE__)
      @collection = IsbnMetadataBuilder.new(path_to_xml).build
    end

    def groups
      @collection.groups
    end
  end
end
