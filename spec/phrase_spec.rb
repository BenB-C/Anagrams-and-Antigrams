require 'rspec'
require 'pry'
require 'phrase'

describe('Phrase#anagram') do
  it('Returns "These words are anagrams." when object is "ruby" and argument is "bury"') do
    phrase1 = Phrase.new("ruby")
    phrase2 = Phrase.new("bury")
    expect(phrase1.anagram(phrase2)).to(eq("These words are anagrams."))
  end

  it('If two phrases are not anagrams, returns how many letters from the argument are actual matches with the receiver.') do
    phrase1 = Phrase.new("dog")
    phrase2 = Phrase.new("bog")
    expect(phrase1.anagram(phrase2)).to(eq("These words aren't anagrams but 2 letters match: g, o."))
  end

  it('Returns "These words are anagrams." when object is "Tea" and argument is "Eat"') do
    phrase1 = Phrase.new("Eat")
    phrase2 = Phrase.new("Tea")
    expect(phrase1.anagram(phrase2)).to(eq("These words are anagrams."))
  end

  it('Returns "You need to input actual words!" when object is "twx" and argument is "ruby"') do
    phrase1 = Phrase.new("twx")
    phrase2 = Phrase.new("ruby")
    expect(phrase1.anagram(phrase2)).to(eq("You need to input actual words!"))
  end

  it('Returns "You need to input actual words!" when object is "twix" and argument is "rpg"') do
    phrase1 = Phrase.new("twix")
    phrase2 = Phrase.new("rpg")
    expect(phrase1.anagram(phrase2)).to(eq("You need to input actual words!"))
  end

  it('Returns "These words have no letter matches and are antigrams." when object is "hi" and argument is "bye"') do
    phrase1 = Phrase.new("hi")
    phrase2 = Phrase.new("bye")
    expect(phrase1.anagram(phrase2)).to(eq("These words have no letter matches and are antigrams."))
  end

  it('Accounts for multiple words being anagrams') do
    phrase1 = Phrase.new("Dormitory")
    phrase2 = Phrase.new("Dirty room")
    expect(phrase1.anagram(phrase2)).to(eq("These phrases are anagrams."))
  end

  it('Accounts for multiple words being anagrams') do
    phrase1 = Phrase.new("Voices rant on")
    phrase2 = Phrase.new("Conversation")
    expect(phrase1.anagram(phrase2)).to(eq("These phrases are anagrams."))
  end

  it('Accounts for multiple words being antigrams') do
    phrase1 = Phrase.new("A cat ate")
    phrase2 = Phrase.new("My dog")
    expect(phrase1.anagram(phrase2)).to(eq("These phrases have no letter matches and are antigrams."))
  end

  it('Rejects multiple words that do not contain vowels or y') do
    phrase1 = Phrase.new("Drmtr")
    phrase2 = Phrase.new("Drt rm")
    expect(phrase1.anagram(phrase2)).to(eq("You need to input actual words!"))
  end

  it('If two phrases are not anagrams, returns how many letters from the argument are actual matches with the receiver.') do
    phrase1 = Phrase.new("cat")
    phrase2 = Phrase.new("batty")
    expect(phrase1.anagram(phrase2)).to(eq("These words aren't anagrams but 2 letters match: a, t."))
  end

  it('If two phrases are not anagrams, returns how many letters from the argument are actual matches with the receiver.') do
    phrase1 = Phrase.new("catty mac cat face")
    phrase2 = Phrase.new("batty mac bat face")
    expect(phrase1.anagram(phrase2)).to(eq("These phrases aren't anagrams but 13 letters match: a, a, a, a, c, c, e, f, m, t, t, t, y."))
  end

  it('If two phrases are not anagrams, returns how many letters from the argument are actual matches with the receiver.') do
    phrase1 = Phrase.new("hello")
    phrase2 = Phrase.new("hello world")
    expect(phrase1.anagram(phrase2)).to(eq("These phrases aren't anagrams but 5 letters match: e, h, l, l, o."))
  end

  it('If two phrases are not anagrams, returns how many letters from the argument are actual matches with the receiver.') do
    phrase1 = Phrase.new("a")
    phrase2 = Phrase.new("ab")
    expect(phrase1.anagram(phrase2)).to(eq("These words aren't anagrams but 1 letters match: a."))
  end
end

describe('Phrase#palindrome?') do
  it('returns true when the word is "racecar"') do
    word = Phrase.new("racecar")
    expect(word.palindrome?).to(eq(true))
  end

  it('returns true when the phrase is "A man, a plan, a canal, Panama!"') do
    phrase = Phrase.new("A man, a plan, a canal, Panama!")
    expect(phrase.palindrome?).to(eq(true))
  end
end
