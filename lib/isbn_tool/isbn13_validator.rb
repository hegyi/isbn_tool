class ISBN13Validator

  def initialize(isbn, range_metadata = RangeMetadata.new)
    @isbn = isbn
    @range_metadata = range_metadata
    @splits = []
  end

  def valid?
    return valid unless valid.nil?

    return false unless isbn.match(/^\d+$/)

    checksum_validator = ChecksumValidator.new(isbn)
    return valid = false unless checksum_validator.valid?

    prefix_validator = PrefixValidator.new(isbn, range_metadata)
    return valid = false unless prefix_validator.valid?
    splits << prefix_validator.get_chunk

    group_identifier_validator = GroupIdentifierValidator.new(isbn, prefix_validator.filtered_groups)
    return valid = false unless group_identifier_validator.valid?
    splits << group_identifier_validator.get_chunk

    range_table_validator = RangeTableValidator.new(remaining_digits, group_identifier_validator.group)
    return valid = false unless range_table_validator.valid?

    splits << range_table_validator.get_chunk

    splits << isbn[splitted_digits_length...-1]
    splits << isbn[-1]

    valid = true
  end

  def hyphenate
    valid? ? splits.join("-") : nil
  end

  private

  def remaining_digits
    isbn[splitted_digits_length..-1]
  end

  def splitted_digits_length
    splits.inject(0) { |size, str| size += str.size }
  end

  attr_reader :isbn, :range_metadata, :splits, :valid
end
