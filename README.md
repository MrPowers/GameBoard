## GameBoard

Authors: [MrPowers](https://github.com/MrPowers), [sandbochs](https://github.com/sandbochs)

This class helps calculate the rows, columns, diagonals, and diagonals of a coordinate for nested array data structures.  It is useful for games like Tic-Tac-Toe, Connect Four, Battleship, etc.

## Getting Started

You can add GameBoard to your Gemfile with:

```ruby
gem 'game_board'
```
  
Run the bundle command afterwards to install the gem.

## Usage

Create a new 4x3 game board:

```ruby
board = GameBoard.new(4,3)
```

Populate the game board with numbers:

```ruby
cells = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12]]
board.set_grid(cells)
```

Get or set a value at a coordinate (row_index, column_index):

```ruby
board.get_cell(0,0) => 1
board.set_cell(0,0, 'X')
board.get_cell(0,0) => X 
```

Get the two diagonals at a coordinate:

```ruby
board.coordinate_diagonals(2, 2) => [[1, 5, 9], [9, 11]]
```

Get all diagonals in the grid:

```ruby
board.diagonals
```

Get a row or column:

```ruby
board.row(1) => [4, 5, 6]
board.column(2) => [3, 6, 9, 12]
```

Get all rows or columns:

```ruby
board.rows
board.columns
```