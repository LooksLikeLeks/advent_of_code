s = 0

@problems = []
r=0

File.foreach('test.txt') do |line|
  if line[0] == '+' || line[0] == '*'

    line = line.strip.split(' ')
    i = 0
    c = []
    @problems.each do |p|
      unless p.nil?
        c.push(p)
      else
        if line[i] == '+'
          s += c.sum
        else
          s += c.reduce(:*)
        end
        c = []
        i += 1
      end
    end
    if line[i] == '+'
      s += c.sum
    else
      s += c.reduce(:*)
    end
  else

    line = line.sub("\n", '').chars
    if r == 0
      r = line.size
      r.times do |i|
        @problems.push(nil)
      end
    end

    line.each_with_index do |c, i|
      next if c == ' '
      if @problems[i].nil?
        @problems[i] = c.to_i
      else
        @problems[i] = @problems[i] * 10 + c.to_i
      end
    end

  end
end

p @problems
p "Sum: #{s}"
