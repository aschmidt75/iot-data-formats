#!/usr/bin/env ruby

require 'bson'
require 'json'
require 'pp'

file_name = ARGV[0]
if file_name.nil?
  $stderr.puts "json_to_bson <inputfile.json> [outputfile.bson]"
  exit 1
end

file_input = File.read(file_name)
pp file_input.size

inp = JSON.parse(file_input)
comp = inp.to_bson

pp comp.length

if ARGV.length == 2 
  file_name = ARGV[1]
  File.open("#{file_name}", "w+") do |f|
    f.write(comp)
  end
end
