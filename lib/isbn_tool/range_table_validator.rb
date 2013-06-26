
class RangeTableValidator
  def initialize(remaining, group)
    @remaining = remaining
    @group = group
  end

  def valid?
    return @valid unless @valid.nil?

    ranges = build_ranges
    range = ranges.find { |range| range.in_range? remaining }
    if range
      @number_in_range = remaining[0...range.length]
      @valid = true
    else
      @valid = false
    end
  end

  def get_chunk
    number_in_range if valid?
  end

  private
  attr_accessor :group, :number_in_range
  attr_reader :remaining

  def build_ranges
    group.xpath("Rules/Rule").map do |rule|
      ISBNRange.new(rule.xpath("Range").text, rule.xpath("Length").text)
    end
  end

end
