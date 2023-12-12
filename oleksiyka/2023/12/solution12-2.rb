#!/usr/bin/env ruby

require 'awesome_print'

filename = 'input.txt'
# filename = 'example.txt'

result = 0
@memo = {}

def some_magic(springs, numbers)
  return @memo["#{springs}:#{numbers.join(',')}"] if @memo["#{springs}:#{numbers.join(',')}"]

  result = some_magic2(springs, numbers)
  @memo["#{springs}:#{numbers.join(',')}"] = result
  # puts "step - #{springs}, #{numbers} - #{result}"
  result
end

def some_magic2(springs, numbers)
  case springs[0]
  when nil
    numbers.empty? ? 1 : 0
  when '.'
    some_magic(springs[1..], numbers)
  when '?'
    some_magic(springs.sub('?', '.'), numbers) + some_magic(springs.sub('?', '#'), numbers)
  when '#'
    return 0 if numbers.empty?
    return 0 if springs.length < numbers[0]
    return 0 if springs[0, numbers[0]].include?('.')

    if numbers.length > 1
      return 0 if springs[numbers[0]] == '#' || springs.length < numbers[0] + 1

      some_magic(springs[(numbers[0] + 1)..], numbers[1..])
    else
      some_magic(springs[numbers[0]..], numbers[1..])
    end
  else
    raise StandardError('You shouldn\'t be here')
  end
end

File.foreach(filename) do |line|
  scan = line.split(' ')
  pre_springs = scan[0]
  springs = ([pre_springs] * 5).join('?').gsub(/\.+/, '.').gsub(/\.+$/, '').gsub(/^\.+/, '')
  pre_numbers = scan[1].to_s.split(',').map(&:to_i)
  numbers = ([pre_numbers] * 5).flatten

  ap "LINE #{springs}, #{numbers}"
  if numbers.length - 1 + numbers.sum == springs.length
    puts '-->1'
    result += 1
    next
  end

  add = some_magic(springs, numbers)
  puts "-->#{add}"
  result += add
end

puts "Result: #{result}"
