def included_in_ranges?(n)
  @ranges.any? do |range|
    n >= range[0] && n <= range[1]
  end
end

s = 0

@ranges = []

File.foreach('test.txt') do |line|
  line = line.strip

  if line.include?('-')
    range = line.split('-').map(&:to_i)
    @ranges << range
  else
    s += 1 if included_in_ranges?(line.to_i)
  end
end

p "Sum: #{s}"
