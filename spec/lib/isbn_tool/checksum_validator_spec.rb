require 'spec_helper'

describe ChecksumValidator do
  it "is valid" do
    validator = ChecksumValidator.new("9783847395720")
    expect(validator).to be_valid
  end

  it "is not valid" do
    validator = ChecksumValidator.new("9783847395721")
    expect(validator).not_to be_valid
  end
end
