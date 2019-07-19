require 'rspec'
require 'pry'
require 'phrase'

describe('Phrase#anagram') do
  it('Returns "These words are anagrams" when object is "ruby" and argument is "bury"') do
    phrase1 = Phrase.new("ruby")
    phrase2 = Phrase.new("bury")
    expect(phrase1.anagram(phrase2)).to(eq("These words are anagrams"))
  end
end
