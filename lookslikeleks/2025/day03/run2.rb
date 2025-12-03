s = 0
digits = 12

File.foreach('test.txt') do |line|
  chars = line.strip.chars.map(&:to_i)

  batteries = []
  pointer = 0
  digits.times do |i|
    if (digits - i - 1) > 0
      section = chars[pointer...-(digits - i - 1)]
    else
      section = chars[pointer..]
    end
    battery = section.max
    battery_index = section.index(battery) + pointer
    batteries.push(battery)
    pointer = battery_index + 1
  end

  number = batteries.join.to_i
  s += number
end

p "Sum: #{s}"
