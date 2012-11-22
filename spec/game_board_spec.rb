require_relative '../lib/game_board'

describe GameBoard do
  
  let(:board) { GameBoard.new(4, 3) }
  let(:grid) { [[1, 2, 3], 
                [4, 5, 6], 
                [7, 8, 9], 
                [10, 11, 12]] }
  before do 
    board.set_grid(grid)
  end

  context "#set_grid" do
    it "sets a new grid for the game board" do
      new_grid = [[1, 1, 1],[2, 2, 2],[3, 3, 3],[4, 4, 4]]
      expect { board.set_grid(new_grid) }.to change { board.grid }.from([[1, 2, 3],[4, 5, 6], [7, 8, 9], [10, 11, 12]]).to([[1, 1, 1],[2, 2, 2],[3, 3, 3],[4, 4, 4]])
    end
  end

  context "#get_cell" do
    it { board.get_cell(0, 2).should eq 3 }
  end

  context "#set_cell" do
    it "sets a cell at a coordinate" do
      expect { board.set_cell(1, 1, "BOB")}.to change { board.get_cell(1, 1) }.from(5).to("BOB")
    end
  end

  context '#row' do
    it { board.row(1).should eq [4, 5, 6] }
  end

  context '#rows' do
    it { board.rows.should eq [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12]] }
  end

  context '#column' do
    it { board.column(2).should eq [3, 6, 9, 12] }
  end

  context '#columns' do
    it "calculate all columns" do
      board.columns === ([[1, 2, 7, 10], [2, 5, 8, 11], [3, 6, 9, 12]])
    end
  end

  context "#coordinate_diagonals" do
    it { board.coordinate_diagonals(0, 0).should eq [[1, 5, 9], [1]] }
    it { board.coordinate_diagonals(1, 1).should eq [[1, 5, 9], [3, 5, 7]] }
    it { board.coordinate_diagonals(2, 2).should eq [[1, 5, 9], [9, 11]] }  
  end

  context '#diagonals' do
    it 'calculates all diagonals' do 
      #p board.diagonals
      #p [[10], [7, 11], [4, 8, 12], [1, 5, 9], [2, 6], [3], [1], [4, 2], [7, 5, 3], [10, 8, 6], [11, 9], [12]]
      board.diagonals ==  [[10], [7, 11], [4, 8, 12], [1, 5, 9], [2, 6], [3], 
                  [1], [4, 2], [7, 5, 3], [10, 8, 6], [11, 9], [12]]
    end

    board2 = GameBoard.new(2, 4)
    board2.set_grid([[1, 2, 3, 4], 
                     [5, 6, 7, 8]])
    
    it "calculates all diagonals" do
      # p board2.diagonals
      # p [[5], [1, 6], [2, 7], [3, 8], [4], [1], [5, 2], [6, 3], [7, 4], [8]]  
      board2.diagonals ==  [[5], [1, 6], [2, 7], [3, 8], [4], 
                            [1], [5, 2], [6, 3], [7, 4], [8]]  
    end
  end
end
