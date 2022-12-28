# frozen_string_literal: true

require_relative 'part2'

RSpec.describe Int do
  describe 'class with integer number' do
    let(:positive_value_int) { "#{('1'..'9').to_a.sample}#{(1..rand(2..49)).map { ('0'..'9').to_a.sample }.join}" }
    let(:object1) { Int.new(positive_value_int) }
    let(:object2) { Int.new('-4567') }

    it 'should be correct value' do
      expect(object1.output_value).to eq(positive_value_int.to_i)
      expect(object2.output_value).to eq(-4567)
      expect(object2.length).to eq(4)
      expect(object2.value_and_length).to eq('Number -4567 contains 4 digits')
    end

    it 'should be incorrect value' do
      expect(Int.new('123qwerty').output_value).to eq(0)
    end
  end
end

RSpec.describe IntegerAndFloat do
  describe 'class for integer and float numbers' do
    let(:object1) { IntegerAndFloat.new('-4567.4567') }

    it 'should be correct value' do
      expect(IntegerAndFloat.superclass).to eq(Int)
      expect(IntegerAndFloat <= Int).to eq(true)
      expect(object1.is_a?(IntegerAndFloat)).to eq(true)

      expect(object1.return_integer_value).to eq(-4567)
      expect(object1.length).to eq(4)
      expect(object1.return_float_value).to eq('0.4567')
      expect(IntegerAndFloat.new('8.6ujh').return_float_value).to eq('0.0')
    end
  end
end
