#!/usr/bin/env ruby

# Hey look I made spaghetti
catch :done do
    ARGF.lines.map(&:to_i).each_cons(26) do |slice|
        pre = slice.take(25)
        target = slice.last
        catch :valid do
            pre.each_with_index do |a, i|
                pre.drop(i + 1).each do |b|
                    throw :valid if a + b == target
                end
            end

            puts target
            throw :done
        end
    end
end
