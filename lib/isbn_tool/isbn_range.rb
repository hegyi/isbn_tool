class ISBNRange
  attr_reader :min, :max
  attr_reader :length

  def initialize(range, length)
    @length = length.to_i
    @min, @max = extract_range(range, @length)
  end

  def in_range?(remaining_isbn)
    remaining_isbn = remaining_isbn[0...length].to_i
    (min..max).include? remaining_isbn
  end

  private
  
  def extract_range(range, length)
    length = length.to_i
    range.split("-").map { |number| number[0...length].to_i }
  end

end
