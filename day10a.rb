#!/usr/bin/env ruby

adapters = ARGF.lines.map(&:to_i)
diffs = ([0] + adapters.sort + [adapters.max + 3])\
    .each_cons(2).map { |a, b| b - a }\
    .group_by(&:itself).transform_values(&:size)
puts diffs[1] * diffs[3]
