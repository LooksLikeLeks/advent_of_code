arrow = 50
sum = 0

File.foreach('test.txt') do |line|
  lr, num = line.scan(/^([LR])(\d+)$/)[0]
  dir = lr == 'L' ? -1 : 1
  num = num.to_i

  # engineer time costs more than upgrading to a new CPU
  num.times do
    arrow += dir
    arrow = arrow % 100
    sum += 1 if arrow == 0
  end
end

p sum
