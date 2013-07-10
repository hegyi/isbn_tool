require 'spec_helper'

module IsbnTool
  describe IsbnGenerator do
    it "raises exception when it is a complete isbn" do
      generator = IsbnGenerator.new("9783659986185")
      expect { generator.generate(5) }.to raise_error(RuntimeError)
    end

    it "raises exception when it is longer than normal isbn" do
      generator = IsbnGenerator.new("97836599861852314324234")
      expect { generator.generate(5) }.to raise_error(RuntimeError)
    end

    it "generates 5 isbns" do
      generator = IsbnGenerator.new("9786593333")
      expect(generator.generate(5).size).to eq(5)
    end

    it "generates valid isbns" do
      generator = IsbnGenerator.new("97838473333")
      generator.generate(5).each do |raw_isbn|
        isbn = Isbn.new(raw_isbn)
        expect(isbn).to be_valid
      end
    end

  end
end
