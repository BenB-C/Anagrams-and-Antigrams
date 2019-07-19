require 'rspec'
require 'pry'
require 'phrase'

describe('Phrase#anagram') do
  it('Returns "These words are anagrams" when object is "ruby" and argument is "bury"') do
    phrase1 = Phrase.new("ruby")
    phrase2 = Phrase.new("bury")
    expect(phrase1.anagram(phrase2)).to(eq("These words are anagrams"))
  end

  it('Returns "These words are not anagrams" when object is "dog" and argument is "bog"') do
    phrase1 = Phrase.new("dog")
    phrase2 = Phrase.new("bog")
    expect(phrase1.anagram(phrase2)).to(eq("These words are not anagrams"))
  end

  it('Returns "These words are anagrams" when object is "Tea" and argument is "Eat"') do
    phrase1 = Phrase.new("Eat")
    phrase2 = Phrase.new("Tea")
    expect(phrase1.anagram(phrase2)).to(eq("These words are anagrams"))
  end

  it('Returns "You need to input actual words!" when object is "twx" and argument is "ruby"') do
    phrase1 = Phrase.new("twx")
    phrase2 = Phrase.new("ruby")
    expect(phrase1.anagram(phrase2)).to(eq("You need to input actual words!"))
  end

  it('Returns "You need to input actual words!" when object is "twix" and argument is "rpg"') do
    phrase1 = Phrase.new("twx")
    phrase2 = Phrase.new("ruby")
    expect(phrase1.anagram(phrase2)).to(eq("You need to input actual words!"))
  end
end
