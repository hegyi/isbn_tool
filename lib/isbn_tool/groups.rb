module IsbnTool
  class Groups
    def add(group)
      @groups ||= []
      @groups << group
    end

    def groups
      @groups
    end
  end
end
