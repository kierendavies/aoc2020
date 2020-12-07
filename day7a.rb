#!/usr/bin/env ruby

require 'set'

parents = Hash.new { |h, k| h[k] = Set.new }

ARGF.each_line do |line|
    parent, rest = line.chomp(".\n").split(' bags contain ')
    next if rest == 'no other bags'
    children = rest.split(', ').map do |child|
        child.sub(/^\d+ /, '').sub(/ bags?$/, '')
    end
    children.each do |child|
        parents[child] << parent
    end
end

contain_shiny_gold = Set.new
queue = parents['shiny gold'].to_a
until queue.empty?
    child = queue.shift
    contain_shiny_gold << child
    parents[child].each do |parent|
        queue << parent unless contain_shiny_gold.include?(parent)
    end
end
puts contain_shiny_gold.size
