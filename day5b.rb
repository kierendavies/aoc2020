#!/usr/bin/env ruby

def seat_id(seat)
    row = seat.chars.take(7).reduce(0) do |acc, c|
        (acc << 1) + (c == ?B ? 1 : 0)
    end
    col = seat.chars.drop(7).reduce(0) do |acc, c|
        (acc << 1) + (c == ?R ? 1 : 0)
    end
    row * 8 + col
end

seat_ids = ARGF.lines.map { |seat| seat_id(seat.chomp) }
seat_ids.sort.each_cons(2) do |a, b|
    if b - a > 1
        puts a + 1
        break
    end
end
