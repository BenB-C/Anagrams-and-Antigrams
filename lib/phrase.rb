class Phrase
  attr_reader(:text, :letter_frequencies)

  def initialize(text)
    @text = text
    @letter_frequencies = Hash.new { |hash, key| hash[key] = 0 }
    ('a'..'z').each { |letter| @letter_frequencies[letter] }
    text.each_char { |letter| @letter_frequencies[letter] += 1  }
    puts @letter_frequencies
  end

  def anagram(otherPhrase)
    @letter_frequencies.each do |letter, frequency|
      if frequency != otherPhrase.letter_frequencies[letter]
        return "These words are not anagrams"
      end
    end
    "These words are anagrams"
  end
end
