#!/usr/bin/env ruby

@map = ARGF.map(&:chomp)

def tree?(x, y)
    @map[y][x % @map.first.size] == ?#
end

def trees_on_slope(dx, dy)
    x = 0
    y = 0
    trees = 0

    while y < @map.size
        if tree?(x, y)
            trees += 1
        end
        x += dx
        y += dy
    end

    trees
end

slopes = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]
puts slopes.map { |dx, dy| trees_on_slope(dx, dy) }.reduce(&:*)
