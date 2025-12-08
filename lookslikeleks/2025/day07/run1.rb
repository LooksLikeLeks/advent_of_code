splits = 0
l = 0
beams = []

File.foreach('test.txt') do |line|
  if line.include?('S')
    beams.push(line.index('S'))
    l = line.length
    next
  end

  splitters = line.chars.each_index.select { |i| line[i] == '^' }
  splitters.each do |splitter|
    if beams.include?(splitter)
      splits += 1
      beams.delete(splitter)
      beams.push(splitter + 1) if splitter + 1 < l
      beams.push(splitter - 1) if splitter - 1 >= 0
      beams = beams.sort.uniq
    end
  end
end

p "Splits: #{splits}"
