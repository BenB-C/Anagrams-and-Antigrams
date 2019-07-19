class Phrase
  attr_reader(:text, :letter_frequencies, :is_valid, :letters_in_text, :has_multiple_words)

  def initialize(text)
    @text = text.downcase
    @letter_frequencies = Hash.new { |hash, key| hash[key] = 0 }
    # ('a'..'z').each { |letter| @letter_frequencies[letter] }
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
      return "You need to input actual words!"
    end

    descriptor = (@has_multiple_words || otherPhrase.has_multiple_words) ? "phrases" : "words"

    matching_letters = []
    are_anagrams = true
    @letter_frequencies.each do |letter, frequency|
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
    
    if matching_letters.length == 0
      "These #{descriptor} have no letter matches and are antigrams."
    elsif are_anagrams
      "These #{descriptor} are anagrams."
    else
      "These #{descriptor} aren't anagrams but #{matching_letters.length} letters match: #{matching_letters.join(', ')}."
    end
  end
end
