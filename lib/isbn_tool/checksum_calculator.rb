class ChecksumCalculator
  def initialize(input)
    @input = input
  end

  def calculate
    sum = 0
    cycle = [1,3].cycle
    input_as_digit_array.each do |digit|
      sum += digit * cycle.next
    end
    remainder = sum % 10
    if remainder == 0
      checksum = 0
    else
      checksum = 10 - remainder
    end
  end

  private
  attr_reader :input

  def input_as_digit_array
    input.each_char.map { |c| c.to_i }
  end

end
