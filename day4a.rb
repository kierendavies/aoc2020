#!/usr/bin/env ruby

require 'set'

passports = ARGF.read.split("\n\n").map do |fields|
    fields.split.map { |kv| kv.split(?:) }.to_h
end

required_fields = Set.new(%w(byr iyr eyr hgt hcl ecl pid))

puts passports.filter { |p| p.keys.to_set >= required_fields }.size
