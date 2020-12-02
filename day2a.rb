valid_passwords = 0
ARGF.each_line do |line|
    line.match(/^(?<lo>[0-9]+)-(?<hi>[0-9]+) (?<c>[a-z]): (?<pw>[a-z]+)$/) do |m|
        char_count = m[:pw].count(m[:c])
        if m[:lo].to_i <= char_count && char_count <= m[:hi].to_i
            valid_passwords += 1
        end
    end
end
puts valid_passwords
