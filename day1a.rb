#!/usr/bin/env ruby

require 'set'

nums = ARGF.each_line.map(&:to_i).to_set

nums.each do |n|
    m = 2020 - n
    if nums.include?(m)
        puts n * m
        break
    end
end
