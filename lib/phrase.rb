class Phrase
  attr_reader(:text, :letter_frequencies, :is_valid)

  def initialize(text)
    @text = text
    @letter_frequencies = Hash.new { |hash, key| hash[key] = 0 }
    ('a'..'z').each { |letter| @letter_frequencies[letter] }
    text.each_char { |letter| @letter_frequencies[letter.downcase] += 1  }
    @is_valid = @letter_frequencies['y'] != 0
    vowels = ['a', 'e', 'i', 'o', 'u']
    vowels.each do |vowel|
      @is_valid = @is_valid || (@letter_frequencies[vowel] != 0)
    end
  end

  def anagram(otherPhrase)
    if (!@is_valid) || (!otherPhrase.is_valid)
      return "You need to input actual words!"
    end

    @letter_frequencies.each do |letter, frequency|
      if frequency != otherPhrase.letter_frequencies[letter]
        return "These words are not anagrams."
      end
    end

    "These words are anagrams."
  end
end
