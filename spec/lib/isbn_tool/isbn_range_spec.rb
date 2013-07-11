require 'spec_helper'

module IsbnTool
  describe ISBNRange do
    describe ".in_range?" do
      let(:range) { ISBNRange.new("55555-66666", "3") }

      it "should be in range" do
        expect(range.in_range?("600000")).to be_true
      end

      it "should be out of range" do
        range = ISBNRange.new("55555-66666", "3")
        expect(range.in_range?("700000")).to be_false
      end

    end

  end

end
