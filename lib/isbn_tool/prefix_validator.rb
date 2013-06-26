class PrefixValidator
  PREFIX_LENGTH = 3

  def initialize(isbn, range_metadata)
    @prefix = isbn[0...PREFIX_LENGTH]
    @range_metadata = range_metadata
  end

  def valid?
    return valid unless valid.nil?

    @groups ||= range_metadata.groups_for_prefix(prefix)
    valid = @groups.any?
  end

  def get_chunk
    prefix if valid?
  end

  def filtered_groups
    @groups if valid?
  end

  private
  attr_reader :prefix, :range_metadata
  attr_accessor :valid
end
