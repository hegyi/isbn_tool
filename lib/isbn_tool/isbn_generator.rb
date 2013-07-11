require 'set'

module IsbnTool
  class IsbnGenerator
    def initialize(isbn_chunk)
      @not_complete_isbn = Isbn.new(isbn_chunk)
      @random_numbers = Set.new
    end

    def generate(count)
      raise 'This is a complete isbn!' if not_complete_isbn.raw_isbn.size >= 13

      current_length = not_complete_isbn.raw_isbn.size
      random_number_length = (Isbn::VALID_LENGTH - current_length - Isbn::CHECKSUM_LENGTH).to_i

      random_numbers = random_numbers_with_fixed_length(random_number_length, count)

      random_numbers.map do |number|
        build_random_isbn(number)
      end
    end

    private
    attr_reader :random_numbers, :not_complete_isbn

    def build_random_isbn(number)
      without_checksum = "#{@not_complete_isbn.raw_isbn}#{number}"
      checksum = ChecksumCalculator.new(without_checksum).calculate
      "#{without_checksum}#{checksum}"
    end

    def random_numbers_with_fixed_length(length, count)
      min = 10 ** (length - 1)
      max = (10 ** length) - 1

      maximum_possible = length == 1 ? 9 : (max - min)

      maximum_to_generate_count = count < maximum_possible ? count : maximum_possible

      while random_numbers.size != maximum_to_generate_count
        number = rand(maximum_possible) + min
        random_numbers.add(number)
      end
      random_numbers
    end
  end
end
