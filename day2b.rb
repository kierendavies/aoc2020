valid_passwords = 0
ARGF.each_line do |line|
    line.match(/^(?<i>[0-9]+)-(?<j>[0-9]+) (?<c>[a-z]): (?<pw>[a-z]+)$/) do |m|
        if (m[:pw][m[:i].to_i - 1] == m[:c]) ^(m[:pw][m[:j].to_i - 1] == m[:c])
            valid_passwords += 1
        end
    end
end
puts valid_passwords
