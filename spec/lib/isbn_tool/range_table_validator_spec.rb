require 'spec_helper'

describe RangeTableValidator do
  let(:range) { ISBNRange.new("55555-66666", "3") }

  it "is not valid" do
    validator = RangeTableValidator.new("1234", nil)
    validator.stub(:build_ranges) { [] }
    expect(validator).not_to be_valid
  end

  it "is valid" do
    validator = RangeTableValidator.new("60000", nil)
    validator.stub(:build_ranges) { [range] }
    expect(validator).to be_valid
  end

  it "returns the number in range" do
    validator = RangeTableValidator.new("60000", nil)
    validator.stub(:build_ranges) { [range] }
    expect(validator.get_chunk).to eq("600")
  end
end
