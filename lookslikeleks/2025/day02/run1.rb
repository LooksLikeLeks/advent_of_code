s = 0

File
  .read('test.txt')
  .split(',')
  .map do |r|
  from, to = r.split('-').map(&:to_i)

  current_number = from
  until current_number > to
    i_to_s = current_number.to_s
    length = i_to_s.length
    if length.odd?
      current_number += 1
      next
    end

    mid = length / 2
    part1 = i_to_s[0, mid]
    part2 = i_to_s[mid..]
    if part1 == part2
      s += current_number
    end
    current_number += 1
  end
end

p "Sum: #{s}"
