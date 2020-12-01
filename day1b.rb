require 'set'

nums = ARGF.each_line.map(&:to_i).to_set

catch :done do
    nums.each do |n|
        nums.each do |m|
            l = 2020 - m - n
            if nums.include?(l)
                puts n * m * l
                throw :done
            end
        end
    end
end
