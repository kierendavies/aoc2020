#!/usr/bin/env ruby

layout = ARGF.lines.map { |line| line.chomp.chars }

def seat_in_direction(layout, x, y, dx, dy)
    xx = x
    yy = y
    loop do
        xx += dx
        yy += dy
        if xx < 0 || xx >= layout.first.size || yy < 0 || yy >= layout.size
            return nil
        elsif layout[yy][xx] != ?.
            return layout[yy][xx]
        end
    end
end

ADJ = [-1, 0, 1].product([-1, 0, 1])
ADJ.delete([0, 0])
def occupied_adjacent(layout, x, y)
    ADJ.map do |dx, dy|
        seat_in_direction(layout, x, y, dx, dy)
    end.count(?#)
end

def iterate_layout(layout)
    layout.each_with_index.map do |row, y|
        row.each_with_index.map do |cell, x|
            if cell == ?L && occupied_adjacent(layout, x, y) == 0
                ?#
            elsif cell == ?# && occupied_adjacent(layout, x, y) >= 5
                ?L
            else
                cell
            end
        end
    end
end

last_layout = nil
until layout == last_layout
    last_layout = layout
    layout = iterate_layout(layout)
end

puts layout.flatten.count(?#)
