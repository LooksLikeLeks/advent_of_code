def is_safe(report)
  current_sign = 0
  report.each_with_index do |level, index|
    next if index.zero? 

    return false unless (level - report[index - 1]).abs <= 3 && (level - report[index - 1]).abs >= 1
    if index == 1
      current_sign = (level - report[index - 1]) > 0 ? 1 : -1
    end
    return false if current_sign * (level - report[index - 1]) < 0
  end

  return true
end

reports = []
res = 0
File.open('input2.txt', 'r') do |file|
    file.each_line do |line|
      reports.push(line.split(" ").map(&:to_i))
      report = line.split(" ").map(&:to_i) 
      res += 1 if is_safe(report) 
    end
end

pp res

