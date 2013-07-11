module IsbnTool
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
      remainder == 0 ? 0 : 10 - remainder
    end

    private
    attr_reader :input

    def input_as_digit_array
      input.each_char.map { |c| c.to_i }
    end

  end
end
