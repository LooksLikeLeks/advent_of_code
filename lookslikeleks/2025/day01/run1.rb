arrow = 50
s = 0

File.foreach('test.txt') do |line|
  lr, num = line.scan(/^([LR])(\d+)$/)[0]
  dir = lr == 'L' ? -1 : 1
  num = num.to_i

  arrow = (arrow + dir * num) % 100
  s += 1 if arrow == 0
  p "#{lr}#{num}: #{arrow}"
end

p s
