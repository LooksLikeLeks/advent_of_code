
s = 0

ranges = []

File.foreach('test.txt') do |line|
  next unless line.include?('-')
  line = line.strip

  range = line.split('-').map(&:to_i)

  ranges << (range[0]..range[1])
end

ranges = ranges.sort_by(&:begin)

merged = ranges.each_with_object([]) do |range, acc|
  if acc.empty? || acc.last.end < range.begin - 1
    acc << range
  else
    last = acc.pop
    acc << (last.begin..[last.end, range.end].max)
  end
end

p merged

merged.each do |range|
  s += (range.end - range.begin + 1)
end

p s
