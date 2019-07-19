#!/usr/bin/env ruby

require './lib/phrase'
require 'colorize'

# String.colors = [:black, :light_black, :red, :light_red, :green, :light_green, :yellow, :light_yellow, :blue, :light_blue, :magenta, :light_magenta, :cyan, :light_cyan, :white, :light_white, :default]
response_colors = {
  "You need to input actual words!" => :light_yellow,
  "These words have no letter matches and are antigrams." => :light_magenta,
  "These phrases have no letter matches and are antigrams." => :light_magenta,
  "These words are not anagrams." => :light_red,
  "These phrases are not anagrams." => :light_red,
  "These words are anagrams." => :light_green,
  "These phrases are anagrams." => :light_green,
}

prompt_color = :cyan
loop do
  print "\nEnter a word or phrase: ".colorize(prompt_color)
  phrase1 = Phrase.new(gets.chomp)
  print "Enter another word or phrase: ".colorize(prompt_color)
  phrase2 = Phrase.new(gets.chomp)

  response = phrase1.anagram(phrase2)
  puts response.colorize(response_colors[response])

  print "\nContinue (y/n)? ".colorize(prompt_color)
  break if gets.chomp.downcase != 'y'
end
