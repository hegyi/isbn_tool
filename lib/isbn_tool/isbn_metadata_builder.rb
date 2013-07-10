require 'nokogiri'

module IsbnTool
  class IsbnMetadataBuilder
    def initialize(path_to_xml)
      @path_to_xml = path_to_xml
    end

    def build
      groups = Groups.new
      doc = Nokogiri::XML(File.read(path_to_xml))
      doc.xpath("//RegistrationGroups/Group").each do |raw_group|
        prefix = raw_group.xpath("Prefix").text
        group = Group.new(prefix)
        group.add_rules(build_rules(raw_group))
        groups.add(group)
      end
      groups
    end

    private
    attr_reader :path_to_xml

    def build_rules(raw_group)
      raw_group.xpath("Rules/Rule").map do |raw_rule|
        range_text = raw_rule.xpath("Range").text
        length = raw_rule.xpath("Length").text
        ISBNRange.new(range_text, length)
      end
    end
  end
end
