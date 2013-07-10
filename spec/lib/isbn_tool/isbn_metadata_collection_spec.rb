require 'spec_helper'

module IsbnTool
  describe IsbnMetadataCollection do
    it "loads the metadata in a singleton object" do
      collection = IsbnMetadataCollection.instance
      expect(collection.groups.size).to eql(2)
    end
  end
end
