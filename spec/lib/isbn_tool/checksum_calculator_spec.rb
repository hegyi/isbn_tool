require 'spec_helper'

describe ChecksumCalculator do
  [
    ["000", 0],
    ["111", 5],
    ["978363951495", 7]
  ].each do |input, expected|
    it "calculates the checksum for the given string" do
      calculator = ChecksumCalculator.new(input)
      expect(calculator.calculate).to eq(expected)
    end
  end
end
