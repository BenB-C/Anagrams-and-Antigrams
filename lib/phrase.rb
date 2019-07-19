require 'colorize'

class Phrase
  attr_reader(:text, :letter_frequencies, :is_valid, :letters_in_text, :has_multiple_words)

  def initialize(text)
    @text = text.downcase
    @letter_frequencies = Hash.new { |hash, key| hash[key] = 0 }
    ('a'..'z').each { |letter| @letter_frequencies[letter] }
    @letters_in_text = []
    @has_multiple_words = false
    @text.split('').each do |letter|
      if (letter.match?(/[a-z0-9]/))
        @letter_frequencies[letter] += 1
        if !@letters_in_text.include?(letter)
          @letters_in_text.push(letter)
        end
      elsif letter == ' '
        @has_multiple_words = true
      end
    end
    letters_in_text.sort!
    @is_valid = @letters_in_text & ['a', 'e', 'i', 'o', 'u', 'y'] != []
  end

  def anagram(otherPhrase)
    if (!@is_valid) || (!otherPhrase.is_valid)
      return "You need to input actual words!".colorize(:light_yellow)
    end

    descriptor = (@has_multiple_words || otherPhrase.has_multiple_words) ? "phrases" : "words"

    if @letters_in_text & otherPhrase.letters_in_text == []
      return "These #{descriptor} have no letter matches and are antigrams.".colorize(:light_magenta)
    end

    @letter_frequencies.each do |letter, frequency|
      if frequency != otherPhrase.letter_frequencies[letter]
        return "These #{descriptor} are not anagrams.".colorize(:light_red)
      end
    end

    "These #{descriptor} are anagrams.".colorize(:light_green)
  end
end
