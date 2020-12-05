#!/usr/bin/env ruby

require 'set'

REQUIRED_FIELDS = Set.new(%w(byr iyr eyr hgt hcl ecl pid))
EYE_COLOURS = Set.new(%w(amb blu brn gry grn hzl oth))

def valid_year?(y, min, max)
    y =~ /^[0-9]{4}$/ && y.to_i >= min && y.to_i <= max
end

def passport_valid?(passport)
    passport.keys.to_set >= REQUIRED_FIELDS && \
    valid_year?(passport['byr'], 1920, 2002) && \
    valid_year?(passport['iyr'], 2010, 2020) && \
    valid_year?(passport['eyr'], 2020, 2030) && \
    passport['hgt'].match(/^(?<h>[0-9]+)(?<unit>cm|in)$/) do |m|
        h = m[:h].to_i
        if m[:unit] == 'cm'
            h >= 150 && h <= 193
        else # m[:unit] == 'in'
            h >= 59 && h <= 76
        end
    end && \
    passport['hcl'] =~ /^#[0-9a-f]{6}$/ && \
    EYE_COLOURS.include?(passport['ecl']) && \
    passport['pid'] =~ /^[0-9]{9}$/
end

passports = ARGF.read.split("\n\n").map do |fields|
    fields.split.map { |kv| kv.split(?:) }.to_h
end

puts passports.filter { |p| passport_valid?(p) }.size
