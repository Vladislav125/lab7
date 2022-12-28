# frozen_string_literal: true

# class Integer
class Int
  def initialize(value)
    if value.match?(/^(-?([1-9]|[1-9]\d*)|0)$/)
      @value = value.to_i
    else
      puts 'Inappropriate value. Default integer value: 0'
      @value = 0
    end
  end

  def output_value
    @value
  end

  def length
    number = 0
    @value.to_s.split('').each do |symbol|
      number += 1 if symbol.match?(/\d/)
    end
    number
  end

  def value_and_length
    if length != 1
      "Number #{@value} contains #{length} digits"
    else
      "Number #{@value} contains #{length} digit"
    end
  end
end

# class IntegerAndFloat < Integer
# This class smells of :reek:InstanceVariableAssumption
class IntegerAndFloat < Int
  def initialize(value)
    if value.match?(/^(-?(0[.]\d+|[1-9]\d*([.]\d+)?)|0)$/)
      value_mas = value.split('.')
      super(value_mas[0])
      @value_float = value_mas[1]
    else
      puts 'Inappropriate value. Default float value: 0.0'
      @value_float = 0
    end
  end

  def output_values
    puts "Float value: #{@value}.#{@value_float}"
  end

  def return_integer_value
    @value
  end

  def return_float_value
    "0.#{@value_float}"
  end
end
