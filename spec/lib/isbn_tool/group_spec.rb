require 'spec_helper'

module IsbnTool
  describe Group do
    let(:group) { Group.new("978-3") }

    it "returns the prefix" do
      expect(group.prefix).to eql("978")
    end

    it "returns the group identifier" do
      expect(group.group_id).to eql("3")
    end

    it "rules can be added to a group" do
      rule = double(:rule)
      another_rule = double(:another_rule)

      group.add_rule(rule)
      group.add_rule(another_rule)

      expect(group.rules).to eql( [rule, another_rule] )
    end

    it "more rules can be added" do
      rule = double(:rule)
      another_rule = double(:another_rule)

      group.add_rules([rule, another_rule])

      expect(group.rules).to eql( [rule, another_rule] )
    end


  end

end
