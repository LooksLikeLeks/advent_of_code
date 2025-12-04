def print_grid(grid)
  grid.each { |i| p i }
end

def find_neighbors(row, col)
  directions = [
    [-1, -1],
    [-1, 0],
    [-1, 1],
    [0, -1],
    [0, 1],
    [1, -1],
    [1, 0],
    [1, 1]
  ]

  neighbors = []

  directions.each do |dr, dc|
    r, c = row + dr, col + dc
    if r.between?(0, @rows) && c.between?(0, @cols)
      neighbors << @grid[r][c]
    else
      neighbors << nil
    end
  end

  neighbors
end

s = 0

@grid = []

File.foreach('test.txt') do |line|
  chars = line.strip.chars
  if chars
    @grid.push(chars.dup)
  end
end

@rows = @grid.size - 1
@cols = @grid[0].size - 1

@grid.each.with_index do |row, row_index|
  row.each.with_index do |item, col_index|
    next if item == '.'

    neighbors = find_neighbors(row_index, col_index)

    if neighbors.count('@') < 4
      s += 1
    end
  end
end

p "Sum: #{s}"
