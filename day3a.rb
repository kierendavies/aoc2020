#!/usr/bin/env ruby

@map = ARGF.map(&:chomp)

def tree?(x, y)
    @map[y][x % @map.first.size] == ?#
end

dx = 3
dy = 1
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

puts trees
