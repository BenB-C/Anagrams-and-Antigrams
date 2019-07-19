class Phrase
  attr_reader(:text, :letter_frequencies, :is_valid, :letters_in_text)

  def initialize(text)
    @text = text.downcase
    @letter_frequencies = Hash.new { |hash, key| hash[key] = 0 }
    ('a'..'z').each { |letter| @letter_frequencies[letter] }
    @letters_in_text = []
    @text.split('').each do |letter|
      @letter_frequencies[letter] += 1
      if !@letters_in_text.include?(letter)
        @letters_in_text.push(letter)
      end
    end
    letters_in_text.sort!
    puts "@letters_in_text: #{@letters_in_text}"
    puts "vowels in text: #{@letters_in_text & ['a', 'e', 'i', 'o', 'u', 'y']}"
    @is_valid = @letters_in_text & ['a', 'e', 'i', 'o', 'u', 'y'] != []
  end

  def anagram(otherPhrase)
    if (!@is_valid) || (!otherPhrase.is_valid)
      return "You need to input actual words!"
    end

    if @letters_in_text & otherPhrase.letters_in_text == []
      return "These words have no letter matches and are antigrams."
    end

    @letter_frequencies.each do |letter, frequency|
      if frequency != otherPhrase.letter_frequencies[letter]
        return "These words are not anagrams."
      end
    end

    "These words are anagrams."
  end
end
