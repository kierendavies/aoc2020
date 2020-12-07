#!/usr/bin/env ruby

@children = {}

ARGF.each_line do |line|
    parent, rest = line.chomp(".\n").split(' bags contain ')
    next if rest == 'no other bags'
    @children[parent] = rest.split(', ').map do |child|
        count, bag = child.sub(/ bags?/, '').split(' ', 2)
        [bag, count.to_i]
    end.to_h
end

count_descendants = Hash.new do |count_descendants, bag|
    @children.fetch(bag, {}).map do |child, count|
        (1 + count_descendants[child]) * count
    end.sum
end

puts count_descendants['shiny gold']
