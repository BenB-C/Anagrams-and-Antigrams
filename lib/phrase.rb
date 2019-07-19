class Phrase
  attr_reader(:text, :letter_frequencies, :has_multiple_words)

  def initialize(text)
    @text = text.downcase
    @letter_frequencies = Hash.new { |hash, key| hash[key] = 0 }
    @has_multiple_words = false
    @text.split('').each do |letter|
      if (letter.match?(/[a-z0-9]/))
        @letter_frequencies[letter] += 1
      elsif letter == ' '
        @has_multiple_words = true
      end
    end
  end

  def anagram(otherPhrase)
    vowelsRegex = /[aeiouy]/
    if (!text.match?(vowelsRegex)) || (!otherPhrase.text.match?(vowelsRegex))
      return "You need to input actual words!"
    else
      descriptor = (has_multiple_words || otherPhrase.has_multiple_words) ? "phrases" : "words"
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
end
