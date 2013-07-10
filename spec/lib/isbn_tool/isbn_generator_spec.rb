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
  end
end
