s = 0

@problems = []
r=0

File.foreach('test.txt') do |line|
  line = line.strip.split(' ')

  if line[0] == '+' || line[0] == '*'
    line.each_with_index do |c, i|
      if c == '+'
        s += @problems[i].sum
      elsif c == '*'
        s += @problems[i].reduce(:*)
      end
    end
  else
    if r == 0
      r = line.size
      r.times do |i|
        @problems.push([])
      end
    end

    line.each_with_index do |c, i|
      @problems[i].push(c.to_i)
    end
  end
end

p "Sum: #{s}"
