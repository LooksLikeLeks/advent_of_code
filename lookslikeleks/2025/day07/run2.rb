l = 0
beams = []

File.foreach('test.txt') do |line|
  line = line.strip
  if line.include?('S')
    l = line.length
    l.times { beams.push(0) }
    beams[line.index('S')] = 1
    next
  end

  splitters = line.chars.each_index.select { |i| line[i] == '^' }
  splitters.each do |splitter|
    if beams[splitter] >= 0
      beams[splitter + 1] += beams[splitter] if splitter + 1 < l
      beams[splitter - 1] += beams[splitter] if splitter - 1 >= 0
      beams[splitter] = 0
    end
  end
end

p "Splits: #{beams.sum}"
