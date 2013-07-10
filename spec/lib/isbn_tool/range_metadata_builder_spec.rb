require 'spec_helper'

module IsbnTool
  describe RangeMetadataBuilder do
    it "builds metadata from xml" do
      path_to_xml = File.expand_path('../../../vendor/isbn_range.xml', __FILE__)
      builder = RangeMetadataBuilder.new(path_to_xml)

      range_metadata = builder.build

      last_group = range_metadata.groups.last
      expect(last_group.prefix).to eql("978")
      expect(last_group.group_id).to eql("601")

      expect(last_group.rules.size).to eql(5)
      first_rule = last_group.rules.first
      expect(first_rule.max).to eql(19)
      expect(first_rule.min).to eql(0)
      expect(first_rule.length).to eql(2)
    end
  end
end
