require 'json'

class Phrase
  attr_reader(:words, :is_valid, :letter_frequencies)

  @@dictionary_array = File.readlines('words.txt').map { |line| line.strip }
  @@dictionary_hash = JSON.parse(File.read('words_dictionary.json'))

  def initialize(text)
    @text = text.downcase.gsub(/[^a-z0-9 ]/, '')
    @words = @text.split(' ')
    @is_valid = true
    @words.each do |word|
      if !@@dictionary_array.include?(word) & !@@dictionary_hash[word] then
        @is_valid = false
      end
    end
    @text.gsub!(/ /, '')
    @letter_frequencies = Hash.new { |hash, key| hash[key] = 0 }
    @text.each_char { |letter| @letter_frequencies[letter] += 1 }
  end

  def anagram(otherPhrase)
    if (!is_valid || !otherPhrase.is_valid)
      "You need to input actual words!"
    else
      descriptor = (words.length > 1 || otherPhrase.words.length > 1) ? "phrases" : "words"
      matching_letters = []
      are_anagrams = true
      letter_frequencies.each do |letter, frequency|
        otherFrequency = otherPhrase.letter_frequencies[letter]
        if otherFrequency
          are_anagrams = are_anagrams & (frequency == otherFrequency)
          count = [frequency, otherFrequency].min
          matching_letters += [letter] * count
        else
          are_anagrams = false
        end
      end
      matching_letters.sort!
      if are_anagrams
        "These #{descriptor} are anagrams."
      elsif matching_letters.length == 0
        "These #{descriptor} have no letter matches and are antigrams."
      else()
        "These #{descriptor} aren't anagrams but #{matching_letters.length} letters match: #{matching_letters.join(', ')}."
      end
    end
  end

  def palindrome?
    is_panlindrome = true
    (@text.length / 2).times do |i|
      if @text[i] != @text[-(i + 1)]
        is_panlindrome = false
      end
    end
    is_panlindrome
  end
end
