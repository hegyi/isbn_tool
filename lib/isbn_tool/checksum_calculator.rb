module IsbnTool
  class ChecksumCalculator
    def initialize(input)
      @input = input
    end

    def calculate
      cycle = [1,3].cycle
      sum = input_as_digit_array.inject(0) do |_sum, digit|
        _sum += digit * cycle.next
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
