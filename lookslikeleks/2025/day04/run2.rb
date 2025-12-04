def print_grid(grid)
  grid.each { |i| p i.join }
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

@grid = []
@changed_grid = []

File.foreach('test.txt') do |line|
  chars = line.strip.chars
  if chars
    @grid.push(chars.dup)
    @changed_grid.push(chars.dup)
  end
end

@rows = @grid.size - 1
@cols = @grid[0].size - 1

s = 0
j = -1

while j != 0
  j = 0
  @grid.each.with_index do |row, row_index|
    row.each.with_index do |item, col_index|
      next if item == '.' || item == 'x'

      neighbors = find_neighbors(row_index, col_index)

      if neighbors.count('@') < 4
        j += 1
        @changed_grid[row_index][col_index] = 'x'
      end
    end
  end
  @grid = @changed_grid.map(&:dup)
  s += j
end

p "Sum: #{s}"
