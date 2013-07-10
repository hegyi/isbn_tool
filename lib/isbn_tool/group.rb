module IsbnTool
  class Group
    attr_reader :prefix, :group_id

    def initialize(group_text)
      @prefix, @group_id = group_text.split("-")
    end

    def add_rule(rule)
      @rules ||= []
      @rules << rule
    end

    def rules
      @rules
    end
  end
end
