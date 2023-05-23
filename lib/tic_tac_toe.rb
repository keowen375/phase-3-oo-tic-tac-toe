class TicTacToe
    attr_accessor :board, :move
    WIN_COMBINATIONS = [
      [0, 1, 2],
      [0, 3, 6],
      [0, 4, 8],
      [1, 4, 7],
      [2, 5, 8],
      [2, 4, 6],
      [3, 4, 5],
      [6, 7, 8],
    ]
  
    def initialize
      @board = []
      9.times { @board << " " }
    end
  
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "------------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "------------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
  
    def input_to_index(move)
      move.to_i - 1
    end
  
    def move(index, token = "X")
      @board[index] = token
    end
  
    def position_taken?(index)
      @board[index] != " "
    end
  
    def valid_move?(position)
      if (position > -1 && position < 9 && self.position_taken?(position) == false)
        true
      else
        false
      end
    end
  
    def turn_count
      @board.filter { |x| x != " " }.length
    end
  
    def current_player
      self.turn_count % 2 == 0 ? "X" : "O"
    end
  
    def turn
      puts "Please play your move"
  
      user_input = gets.strip
      index = input_to_index(user_input)
  
      if valid_move?(index)
        player = self.current_player
        move(index, player)
        self.display_board
      else
        self.turn
      end
    end
  
    def won?
      WIN_COMBINATIONS.any? do |win|
        if position_taken?(win[0]) && @board[win[0]] == @board[win[1]] && @board[win[1]] == @board[win[2]]
          return win
        end
      end
    end
  
    def full?
      x = @board.filter { |box| box == " " }
      x.empty?
    end
  
    def draw?
      self.full? && !(self.won?)
    end
  
    def over?
      won? || draw?
    end
  
    def winner
      win = won?
      if win
        @board[win[0]]
      end
    end
  
    def play
      turn until over?
      x = winner ? "Congratulations #{winner}!" : "Cat's Game!"
      puts x
    end
  end
  
  f = TicTacToe.new
  
  f.display_board