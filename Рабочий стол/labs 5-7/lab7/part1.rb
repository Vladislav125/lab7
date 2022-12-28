# frozen_string_literal: true

# class for working with files
class FileWork
  def self.create_files(entered_text)
    return false unless entered_text.match?(/[a-zA-Z0-9'-]+[.,;:?!]?[.?]*( [a-zA-Z0-9'-]+[.,;:?!]?[.?]*)*/)

    fill_file_f(entered_text)
    work_with_file_h
    [File.read('file_F.txt').chomp, File.read('file_H.txt').chomp]
  end

  def self.fill_file_f(entered_text)
    File.open('file_F.txt', 'w') { |file_f| file_f.puts entered_text }
  end

  def self.work_with_file_h
    appropriate_words = select_appropriate_words(appropriate_words)
    appropriate_words = delete_marks(appropriate_words)
    fill_file_h(appropriate_words)
  end

  def self.select_appropriate_words(_appropriate_words)
    File.read('file_F.txt').split(' ').select { |word| word.downcase.split('').include?('a') }
  end

  def self.delete_marks(appropriate_words)
    appropriate_words.map! { |word| word.match(/[^.,;:?!]+/) }
  end

  def self.fill_file_h(appropriate_words)
    File.open('file_H.txt', 'w') { |file_h| file_h.puts appropriate_words.join(', ') }
  end
end
