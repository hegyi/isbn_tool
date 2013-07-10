module IsbnTool
  class IsbnGenerator
    def initialize(isbn_chunk)
      @not_complete_isbn = Isbn.new(isbn_chunk)
    end

    def generate(count)
      raise 'This is a complete isbn!' if @not_complete_isbn.raw_isbn.size >= 13

      current_length = @not_complete_isbn.raw_isbn.size
      checksum_length = 1
      random_number_length = (Isbn::VALID_LENGTH - current_length - checksum_length).to_i

      random_numbers = random_numbers_with_fixed_length(random_number_length, count)

      random_numbers.map do |number|
        build_random_isbn(number)
      end
    end

    private

    def build_random_isbn(number)
      without_checksum = "#{@not_complete_isbn.raw_isbn}#{number}"
      checksum = ChecksumCalculator.new(without_checksum).calculate
      "#{without_checksum}#{checksum}"
    end

    def random_numbers_with_fixed_length(length, count)
      min = (length - 1) ** 10
      max = (length ** 10) - 1
      (min..max).to_a.sample(count)
    end
  end
end
