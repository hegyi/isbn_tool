require 'spec_helper'

describe GroupIdentifierValidator do
  let(:validator) { GroupIdentifierValidator.new(isbn, prefix_validator.filtered_groups) }
  let(:isbn) { "9780847390688" }
  let(:prefix_validator) { PrefixValidator.new(isbn, RANGE_METADATA) }

  let(:invalid_validator) { GroupIdentifierValidator.new(invalid_isbn, invalid_prefix_validator.filtered_groups) }
  let(:invalid_isbn) { "978999847390688" }
  let(:invalid_prefix_validator) { PrefixValidator.new(invalid_isbn, RANGE_METADATA) }

  it "should be valid" do
    expect(validator).to be_valid
  end

  it "should not be valid" do
    expect(invalid_validator).not_to be_valid
  end
end
