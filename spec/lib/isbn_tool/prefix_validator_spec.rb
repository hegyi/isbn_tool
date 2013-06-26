require 'spec_helper'

describe PrefixValidator do
  let(:isbn) { "9780847390688" }
  let(:invalid_isbn) { "0013423432" }
  let(:validator) { PrefixValidator.new(isbn, RANGE_METADATA) }
  let(:invalid_isbn_validator) { PrefixValidator.new(invalid_isbn, RANGE_METADATA) }

  it "validates ISBN prefix" do
    expect(validator).to be_valid
  end

  it "validates retruns relevant groups" do
    expect(validator.filtered_groups).to_not be_empty
  end

  it "returns the extracted prefix" do
    expect(validator.get_chunk).to eq("978")
  end

  it "is not valid" do
    expect(invalid_isbn_validator).not_to be_valid
  end
end
