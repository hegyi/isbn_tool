class GroupIdentifierValidator
  attr_reader :group

  def initialize(isbn, groups)
    @isbn = isbn
    @groups = groups
  end

  def valid?
    prefix = extract_prefix
    without_prefix = isbn[prefix.size..-1]
    prefix_with_identifier = [prefix, without_prefix].join("-")

    sorted_groups = mathcing_groups(prefix_with_identifier)
    if sorted_groups.any?
      @group = sorted_groups.first
      true
    else
      false
    end
  end

  def found_prefix
    group.xpath("Prefix").text
  end

  def get_chunk
    found_prefix.split("-").last
  end

  private
  attr_reader :isbn, :groups
  attr_writer :group

  def mathcing_groups(text)
    groups = @groups.select { |g| text.start_with? g.xpath("Prefix").text }
    groups.sort_by { |g| g.xpath("Prefix").text.size }
  end

  def extract_prefix
    @groups.xpath("//Prefix").first.text[/^(\d+)/, 1]
  end

end
