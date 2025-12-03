s = 0

File.foreach('test.txt') do |line|
  chars = line.strip.chars.map(&:to_i)
  first_digit = chars[0...-1].max
  first_index = chars.index(first_digit)
  last_digit = chars[first_index + 1..-1].max
  number = first_digit * 10 + last_digit
  p "Line: #{line.strip} => Number: #{number}"
  s += number
end

p "Sum: #{s}"
