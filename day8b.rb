#!/usr/bin/env ruby

require 'set'

original_instrs = ARGF.lines.map(&:chomp)

original_instrs.each_with_index do |bad_op, bad_i|
    instrs = original_instrs.dup
    instrs[bad_i] = if bad_op.start_with?('jmp')
        bad_op.sub(/^jmp/, 'nop')
    else
        bad_op.sub(/^nop/, 'jmp')
    end

    i = 0
    acc = 0

    past_i = Set.new
    until past_i.include?(i) || i >= instrs.size
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

    if i == instrs.size
        puts acc
        break
    end
end
