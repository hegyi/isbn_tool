module IsbnTool
  class Group
    attr_reader :prefix, :group_id

    def initialize(group_text)
      @prefix, @group_id = group_text.split("-")
      @rules = []
    end

    def add_rule(rule)
      @rules += Array(rule)
    end

    def rules
      @rules
    end

    alias :add_rules :add_rule
  end
end
