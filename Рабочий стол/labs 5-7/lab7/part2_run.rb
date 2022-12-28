# frozen_string_literal: true

require_relative 'part2'

printf 'Input integer value for object creation: '
value_int = gets.chomp
object1 = Int.new(value_int)
puts "Object value: #{object1.output_value}"
puts "The returned number of digits in integer value is #{object1.length}"
puts object1.value_and_length

printf 'Input float value for inherited object creation: '
value_float = gets.chomp
object2 = IntegerAndFloat.new(value_float)
object2.output_values
puts "Returned integer value: #{object2.return_integer_value}"
puts "Returned float value: #{object2.return_float_value}"
puts "The number of digits in integer value is #{object2.length}"
