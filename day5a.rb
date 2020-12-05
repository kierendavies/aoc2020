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
puts seat_ids.max
