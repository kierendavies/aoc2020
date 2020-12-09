#!/usr/bin/env ruby

def distinct_pairs(slice)
    slice.each_with_index.flat_map do |a, i|
        slice.drop(i + 1).map do |b|
            [a, b]
        end
    end
end

nums = ARGF.lines.map(&:to_i)

first_invalid = nums.each_cons(26).find do |slice|
    distinct_pairs(slice.take(25)).none? { |a, b| a + b == slice.last }
end.last

window_start = 0
window_end = 2
window_sum = nums.take(2).sum
while window_sum != first_invalid
    if window_sum < first_invalid || window_end - window_start <= 2
        window_sum += nums[window_end]
        window_end += 1
    else
        window_sum -= nums[window_start]
        window_start += 1
    end
end

puts nums[window_start...window_end].minmax.sum
