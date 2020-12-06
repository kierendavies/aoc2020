#!/usr/bin/env ruby

require 'set'

groups = ARGF.read.split("\n\n").map do |group|
    group.split.map { |line| line.chars.to_set }.reduce(&:intersection)
end
puts groups.map(&:size).sum
