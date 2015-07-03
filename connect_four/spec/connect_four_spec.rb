=begin
  
  Computer ->

    get move
      type of return is int
      int is within (0..6)

  Human ->

    get move
      type of return is int
      int is within (0..6)

  Player ->
    
    valid_move?
      returns true if move within (0..6) and col not full
      returns false if move outside (0..6)
      returns false if col full

  Board ->

    init
      returns a 7 x 6 array populated with 0s

    move
      changes correct spot on board

    victory?
      true when vertical victory present
      true when horizontal victory present
      true when diaganol victory present, \
      true when diaganol victory present, /
      false when no victory present
      (many edge cases)


  ConnectFour

    __init__
      @player1 is a Computer object
      @player2 is a Human oject
      @board is a Board object

=end

require "connect_four"
require "computer"
require "player"
require "human"

describe ConnectFour do

  let(:n){ConnectFour.new}

  describe "#initialize" do

    it "sets @player1 as a Computer object" do
      expect(n.instance_variable_get(:@player1)).to be_a(Computer)
    end

    it "sets @player2 as a Human object" do
      expect(n.instance_variable_get(:@player2)).to be_a(Human)
    end

    it "sets @board as a Board object" do
      expect(n.instance_variable_get(:@board)).to be_a(Board)
    end

  end

  describe "#switch_player" do

    it "if current_player is player 1, switches to player 2" do
      player1 = n.instance_variable_get(:@player1)
      player2 = n.instance_variable_get(:@player2)
      n.instance_variable_set(:@current_player, player1)
      n.switch_player
      expect(n.instance_variable_get(:@current_player)).to eq(player2)
    end

    it "if current_player is player 2, switches to player 1" do
      player1 = n.instance_variable_get(:@player1)
      player2 = n.instance_variable_get(:@player2)
      n.instance_variable_set(:@current_player, player2)
      n.switch_player
      expect(n.instance_variable_get(:@current_player)).to eq(player1)
    end

  end
  
end