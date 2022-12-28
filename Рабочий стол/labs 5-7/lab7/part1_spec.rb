# frozen_string_literal: true

require_relative 'part1'

RSpec.describe FileWork do
  describe 'class for testing part1.rb' do
    let(:word_without_a) { (1..rand(2..29)).map { ('b'..'z').to_a.sample }.join }
    let(:word_with_a) { "a#{(1..rand(2..28)).map { ('a'..'z').to_a.sample }.join}" }
    let(:string_without_a) { "#{word_without_a} #{word_without_a}" }
    let(:string_with_a) { "#{word_with_a} #{word_with_a} #{word_without_a}" }

    it 'should be false' do
      expect(described_class.create_files('[]')).to eq(false)
      expect(described_class.create_files('')).to eq(false)
    end

    it 'should be right' do
      expect(described_class.create_files(string_without_a)).to eq([string_without_a, ''])
      expect(described_class.create_files(string_with_a)).to eq([string_with_a, "#{word_with_a}, #{word_with_a}"])
      expect(described_class.create_files("Call Jack's brother, please")).to eq(["Call Jack's brother, please",
                                                                                 "Call, Jack's, please"])
      expect(File.open('file_F.txt').readlines.first.chomp).to eq("Call Jack's brother, please")
      expect(File.open('file_H.txt').readlines.first.chomp).to eq("Call, Jack's, please")
      expect(File.exist?('file_F.txt')).to eq(true)
      expect(File.exist?('file_H.txt')).to eq(true)
    end
  end
end
