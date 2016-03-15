#!/usr/bin/env ruby

require 'json'
require 'json/ext'
require 'libcbor'
require 'pp'

file_name = ARGV[0]
if file_name.nil?
  $stderr.puts "cbor_to_json <file.cbor>"
  exit 1
end

file_input = File.read(file_name)
pp file_input.size

inp = CBOR.decode(file_input)
json_str = inp.to_json

pp json_str.size

File.open("#{file_name}.json", "w+") do |f|
  f.write(json_str)
end
