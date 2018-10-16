require 'rspec'
require 'spec_helper'
require_relative '../../lib/core/board'
require_relative '../../lib/core/Player'

RSpec.describe Board do
  it "Populates the board with tiles on init" do
    board = Board.new(3)
    for i in 0..2 do
      for j in 0..2 do
        expect(board.tile(i, j)).to eql(' ')
      end
    end
  end

  it "Checks a tile with the player's symbol" do
    player = Player.new('X')
    board = Board.new(3)
    board.check_tile(1,2, player)
    expect(board.tile(1, 2)).to eql('X')
  end

  it "Validates if all the tiles are checked" do
    player = Player.new('X')
    board = Board.new(1)
    board.check_tile(0,0, player) # In a 1x1, this is the only tile.
    expect(board.is_board_complete?).to eql(true)
  end

  it "Return a column of tiles given the position within the matrix" do
    board = Board.new(3)
    column = board.column(2)
    expect(column[0]).to eql(board.tile(0, 2))
    expect(column[1]).to eql(board.tile(1, 2))
    expect(column[2]).to eql(board.tile(2, 2))
  end

  it "Get the diagonal of the board" do
    board = Board.new(3)
    diagonal = board.diagonal
    expect(diagonal[0]).to eql(board.tile(0, 0))
    expect(diagonal[1]).to eql(board.tile(1, 1))
    expect(diagonal[2]).to eql(board.tile(2, 2))
  end

  it "Get the anti-diagonal of the board" do
    board = Board.new(3)
    diagonal = board.anti_diagonal
    expect(diagonal[0]).to eql(board.tile(0, 2))
    expect(diagonal[1]).to eql(board.tile(1, 1))
    expect(diagonal[2]).to eql(board.tile(2, 0))
  end

  it "Mark the board as finished/won if a player has a whole ROW checked" do
    player1 = Player.new('X')
    board = Board.new(3)
    for i in 0..2 do
      board.check_tile(0, i, player1)
    end

    expect(board.has_won?(player1)).to eql(true)
  end

  it "A player hasn't won if there is a tile missing in the middle row" do
      player1 = Player.new('X')
      board = Board.new(3)
      board.check_tile(1, 1, player1)
      board.check_tile(1, 2, player1)

    expect(board.has_won?(player1)).to eql(false)
  end

  it "A player hasn't won if there is a tile missing in the last row" do
    player1 = Player.new('X')
    board = Board.new(3)
    board.check_tile(2, 1, player1)
    board.check_tile(2, 2, player1)

    expect(board.has_won?(player1)).to eql(false)
  end

  it "Mark the board as finished/won if a player has a whole COLUMN checked" do
      player1 = Player.new('X')
      board = Board.new(3)
      for i in 0..2 do
        board.check_tile(i, 2, player1)
      end

    expect(board.has_won?(player1)).to eql(true)
  end

  it "A player hasn't won if there is a tile missing in the first column" do
    player1 = Player.new('X')
    board = Board.new(3)
    board.check_tile(0, 0, player1)
    board.check_tile(1, 0, player1)

    expect(board.has_won?(player1)).to eql(false)
  end

  it "A player hasn't won if there is a tile missing in the last column" do
    player1 = Player.new('X')
    board = Board.new(3)
    board.check_tile(0, 2, player1)
    board.check_tile(1, 2, player1)

    expect(board.has_won?(player1)).to eql(false)
  end

  it "Mark board as finished/won if a player has the DIAGONAL checked" do
    player1 = Player.new('X')
    board = Board.new(3)
    board.check_tile(0,0, player1)
    board.check_tile(1,1, player1)
    board.check_tile(2,2, player1)

    expect(board.has_won?(player1)).to eql(true)
  end

  it "A player hasn't won if there is a tile missing in the diagonal" do
    player1 = Player.new('X')
    board = Board.new(3)
    board.check_tile(0,0, player1)
    board.check_tile(2,2, player1)

    expect(board.has_won?(player1)).to eql(false)
  end

  it "A player hasn't won if there is a tile missing in the diagonal (part II)" do
    player1 = Player.new('X')
    board = Board.new(3)
    board.check_tile(0,0, player1)
    board.check_tile(1,1, player1)

    expect(board.has_won?(player1)).to eql(false)
  end

  it "Mark board as finished/won if a player has the ANTI-DIAGONAL checked" do
    player1 = Player.new('X')
    board = Board.new(3)
    board.check_tile(0,2, player1)
    board.check_tile(1,1, player1)
    board.check_tile(2,0, player1)

    expect(board.has_won?(player1)).to eql(true)
  end

  it "A player hasn't won if there is a tile missing in the anti-diagonal" do
    player1 = Player.new('X')
    board = Board.new(3)
    board.check_tile(0,2, player1)
    board.check_tile(2,0, player1)

    expect(board.has_won?(player1)).to eql(false)
  end
end