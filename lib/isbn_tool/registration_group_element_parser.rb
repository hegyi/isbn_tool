module IsbnTool 
  class RegistrationGroupElementParser < IsbnParser
    def parse
      raise IsbnParserException.new("Registration group element is invalid!") unless valid?
      group = find_group
      @isbn.registration_group_element = group.group_id
      @isbn.group = group
      @isbn
    end

    def valid?
      !find_group.nil?
    end

    private
    def find_group
      prefix = @isbn.prefix_element
      without_prefix = @isbn.raw_isbn[prefix.size..-1]
      prefix_with_identifier = [prefix, without_prefix].join("-")

      groups = @metadata_collection.groups.select { |group| prefix_with_identifier.start_with? "#{group.prefix}-#{group.group_id}" }

      Array(groups.sort_by { |g| g.prefix.length}).first
    end
  end
end
