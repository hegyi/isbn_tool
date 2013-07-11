module IsbnTool
  class Group
    attr_reader :prefix, :group_id
    attr_accessor :rules

    def initialize(group_text)
      @prefix, @group_id = group_text.split("-")
      @rules = []
    end

    def add_rule(rule)
      @rules += Array(rule)
    end

    alias :add_rules :add_rule
  end
end
