require 'spec_helper'

module IsbnTool
  describe Groups do
    it "groups can be added" do
      isbn_groups = Groups.new
      group = double(:group)
      another_group = double(:another_group)

      isbn_groups.add(group)
      isbn_groups.add(another_group)

      expect(isbn_groups.groups).to eql( [group, another_group] )
    end
  end
end
