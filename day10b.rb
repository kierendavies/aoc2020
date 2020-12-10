#!/usr/bin/env ruby

require 'set'

adapters = ARGF.lines.map(&:to_i).to_set

dp = [0, 0, 1]
(1..adapters.max).each do |j|
    dp << (adapters.include?(j) ? dp.sum : 0)
    dp.shift
end
puts dp.last
