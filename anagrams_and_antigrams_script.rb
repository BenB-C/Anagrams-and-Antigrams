#!/usr/bin/env ruby

require './lib/phrase'
require 'colorize'

# String.colors = [:black, :light_black, :red, :light_red, :green, :light_green, :yellow, :light_yellow, :blue, :light_blue, :magenta, :light_magenta, :cyan, :light_cyan, :white, :light_white, :default]

prompt_color = :cyan
loop do
  print "Enter a word or phrase: ".colorize(prompt_color)
  phrase1 = Phrase.new(gets.chomp)
  print "Enter another word or phrase: ".colorize(prompt_color)
  phrase2 = Phrase.new(gets.chomp)

  puts phrase1.anagram(phrase2)

  print "Continue (y/n)? ".colorize(prompt_color)
  break if gets.chomp.downcase != 'y'
end
