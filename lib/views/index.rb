
require 'pp'

require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/....'
require 'views/....'

puts "veux tu scrapper toutes les emails des mairies du Val d'OIse"
puts ""