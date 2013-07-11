require 'spec_helper'

module IsbnTool
  class FakeValidator
    def initialize(*)
    end

    def valid?
    end
  end

  class FakeHyphenatizor
    def initialize(*)
    end

    def hyphenate
      "test"
    end
  end

  describe Isbn do
    describe "#valid?" do
      it "successfull validation" do
        FakeValidator.any_instance.stub(:valid?) { true }

        isbn = Isbn.new("1234", FakeValidator)
        expect(isbn).to be_valid
      end

      it "unsuccessfull validation" do
        FakeValidator.any_instance.stub(:valid?) { false }

        isbn = Isbn.new("1234", FakeValidator)
        expect(isbn).not_to be_valid
      end
    end

    describe "#hyphenate" do
      it "calls the injected hyphenatizor class" do
        isbn = Isbn.new("9783639514957", FakeValidator, FakeHyphenatizor)
        expect(isbn.hyphenate).to eql("test")
      end
    end

    describe '#without_checksum' do
      let(:isbn) { Isbn.new("9783639514957") }

      it "returns the isbn without the checksum" do
        expect(isbn.without_checksum).to eql("978363951495")
      end
    end

    describe '#last_digit' do
      let(:isbn) { Isbn.new("9783639514957") }

      it "returns the last digit of the isbn" do
        expect(isbn.last_digit).to eql("7")
      end
    end

    describe '#not_extracted_numbers' do
      context "returns the not extracted/parsed part of the isbn" do
        let(:isbn) { Isbn.new("9783639514957") }

        it do
          isbn.prefix_element = "978"
          expect(isbn.not_extracted_numbers).to eql("3639514957")
        end

        it do
          isbn.prefix_element = "978"
          isbn.registration_group_element = "3"
          expect(isbn.not_extracted_numbers).to eql("639514957")
        end
      end
    end
  end
end
