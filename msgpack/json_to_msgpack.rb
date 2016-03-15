#!/usr/bin/env ruby

require 'json'
require 'msgpack'
require 'pp'

file_name = ARGV[0]
if file_name.nil?
  $stderr.puts "json_to_msgpack <inputfile.json> [outputfile.mp]"
  exit 1
end

file_input = File.read(file_name)
pp file_input.size

inp = JSON.parse(file_input)
mp = inp.to_msgpack

pp mp.size

if ARGV.size == 2
  file_name = ARGV[1]
  File.open("#{file_name}", "w+") do |f|
    f.write(mp)
  end
end
