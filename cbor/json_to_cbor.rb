#!/usr/bin/env ruby

require 'json'
require 'cbor'
require 'pp'

file_name = ARGV[0]
if file_name.nil?
  $stderr.puts "json_to_cbor <inputfile.json> [outputfile.cbor]"
  exit 1
end

file_input = File.read(file_name)
pp file_input.size

inp = JSON.parse(file_input)
cbor = inp.to_cbor

pp cbor.size

if ARGV.size == 2
  file_name = ARGV[1]
  File.open("#{file_name}", "w+") do |f|
    f.write(cbor)
  end
end
