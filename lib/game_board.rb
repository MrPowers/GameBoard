require 'game_board/version'

class GameBoard
  attr_reader :grid, :number_of_rows, :number_of_columns

  def initialize(number_of_rows, number_of_columns)
    @grid = Array.new(number_of_rows) { Array.new(number_of_columns) }
    @number_of_rows = number_of_rows
    @number_of_columns = number_of_columns
  end

  def set_grid(new_grid)
    grid.replace(new_grid)
  end

  def get_cell(row_index, column_index)
    grid[row_index][column_index]
  end

  def set_cell(row_index, column_index, value)
    grid[row_index][column_index] = value
  end

  def row(row_index)
    grid[row_index]
  end

  def rows
    grid
  end

  def column(column_index)
    columns[column_index]
  end

  def columns
    grid.transpose
  end

  # returns the two diagonals from one coordinate
  def coordinate_diagonals(row_index, column_index)
    [diagonal_from_coordinate(row_index, column_index, grid),
     diagonal_from_coordinate(row_index, column_index_reflected_about_y_axis(column_index), grid_reflected_about_y_axis)]
  end
  # returns all possible diagonals from the grid
  def diagonals
    down_right_diagonals(grid) + down_right_diagonals(grid_reflected_about_x_axis)
  end

  def to_s
    grid.collect{ |row| row.to_s }.join("\n")
  end

  private

  # returns the down-right diagonal from a coordinate
  def diagonal_from_coordinate(row_index, column_index, grid_array)
    row_index < column_index ? lower = row_index : lower = column_index
    down_right_diagonal(row_index - lower, column_index - lower, grid_array)
  end

  def column_index_reflected_about_y_axis(column_index)
    number_of_columns - column_index - 1
  end

  def down_right_diagonal(row_index, column_index, grid_array)
    diag = []
    while (row_index < number_of_rows) && (column_index < number_of_columns)
      diag << grid_array[row_index][column_index]
      row_index += 1
      column_index += 1
    end
    diag
  end

  def down_right_diagonals(grid_array)
    number_of_rows.times.map { |row_index| down_right_diagonal(row_index, 0, grid_array) }.reverse +
    (1..number_of_columns - 1).map { |column_index| down_right_diagonal(0, column_index, grid_array)}
  end

  def grid_reflected_about_y_axis
    grid.map { |row| row.reverse }
  end

  def grid_reflected_about_x_axis
    grid.reverse
  end
end