#!/usr/bin/env ruby

layout = ARGF.lines.map { |line| line.chomp.chars }

ADJ = [-1, 0, 1].product([-1, 0, 1])
ADJ.delete([0, 0])
def occupied_adjacent(layout, x, y)
    ADJ.map do |dx, dy|
        xx = x + dx
        yy = y + dy
        if xx >= 0 && xx < layout.first.size && yy >= 0 && yy < layout.size
            layout[yy][xx]
        else
            nil
        end
    end.count(?#)
end

def iterate_layout(layout)
    layout.each_with_index.map do |row, y|
        row.each_with_index.map do |cell, x|
            if cell == ?L && occupied_adjacent(layout, x, y) == 0
                ?#
            elsif cell == ?# && occupied_adjacent(layout, x, y) >= 4
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
