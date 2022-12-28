# frozen_string_literal: true

require_relative 'part1'

puts 'Input the text which will be written in file_F.txt. Words containing letter \'a\' will be written in file_H.txt.'
input_value = gets.chomp
result = FileWork.create_files(input_value)
if result == false
  puts 'Incorrect string'
else
  puts "File file_F.txt contents: #{result[0]}"
  if result[1].empty?
    puts 'There are no words containing letter \'a\''
  else
    puts "File file_H.txt contents: #{result[1]}"
  end
end
