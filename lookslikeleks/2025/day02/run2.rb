s = 0

File
  .read('test.txt')
  .split(',')
  .map do |r|
  from, to = r.split('-').map(&:to_i)

  current_number = from
  until current_number > to
    cn_to_s = current_number.to_s
    length = cn_to_s.length

    mid = length / 2
    (1..mid).each do |i|
      next unless length % i == 0

      repetitions = length / i
      part = cn_to_s[0, i]
      if part * repetitions == cn_to_s
        s += current_number
        break
      end
    end

    current_number += 1
  end
end

p "Sum: #{s}"
