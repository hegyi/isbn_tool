class ChecksumValidator
  def initialize(isbn)
    @isbn_without_checksum = isbn[0..-2]
    @last_digit = isbn[-1].to_i
  end

  def valid?
    last_digit == ChecksumCalculator.new(isbn_without_checksum).calculate
  end

  private
  attr_reader :isbn_without_checksum, :last_digit

end
