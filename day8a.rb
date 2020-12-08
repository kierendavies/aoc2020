#!/usr/bin/env ruby

require 'set'

instrs = ARGF.lines.map(&:chomp)
i = 0
acc = 0

past_i = Set.new
until past_i.include?(i)
    past_i << i
    op, arg = instrs[i].split
    case op
    when 'acc'
        acc += arg.to_i
        i += 1
    when 'jmp'
        i += arg.to_i
    when 'nop'
        i += 1
    end
end

puts acc
