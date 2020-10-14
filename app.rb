
require 'pp'

require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/scrapper'
#require 'views/....'

puts "veux tu scrapper toutes les emails des mairies du Val d'OIse"
puts ""
puts "a - yes I want"
puts "b - no I do nothing"

input = gets.chomp

# => if du menu a faire

scrap = Scrap_Town.new

binding.pry