require 'nokogiri'
class RangeMetadata

  def initialize(path_to_xml = File.expand_path('../../../vendor/isbn_range.xml', __FILE__))
    @doc = Nokogiri::XML(File.read(path_to_xml))
  end

  def groups_for_prefix(prefix)
    @doc.xpath("//RegistrationGroups/Group/Prefix[starts-with(text(), #{prefix})]/..")
  end
end

