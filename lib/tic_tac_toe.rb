class TicTacToe
    attr_accessor :board

    def initialize
        @board = Array.new(9, " ")
    end

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0, 4, 8], [2,4,6]]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        index = input.to_i - 1
    end

    def move(index, token = "X")
        self.board[index] = token
    end

    def position_taken?(index)
        self.board[index] == " " ? false : true
    end

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
        self.board.count {|box| box != " "}
    end

    def current_player
        turn_count.odd? ? "O" : "X"
    end

    def turn
        puts "Please enter 1-9:"
        index = input_to_index(gets.strip)
        valid_move?(index) ? move(index, current_player) : turn
        display_board
    end

    def won?
        WIN_COMBINATIONS.each do |combo|
                if @board[combo[0]] == 'X' && @board[combo[1]] == 'X' && @board[combo[2]] == 'X'
                return combo
                elsif @board[combo[0]] == 'O' && @board[combo[1]] == 'O' && @board[combo[2]] == 'O'
                return combo
                end
            end
        return false
    end

    def full?
    self.board.all? {|box| box != " " }
    end

    def draw?
        if self.full? == false
          return false
        elsif self.won? == false
          return true
        end
      end

    def over?
        if self.full? == true
          return true
        elsif self.won? == false
          return false
        else
          return true
        end
      end

      def winner
        if self.won? == false
          return nil
        else
          return self.board[self.won?[0]]
        end
      end

      def play
        until self.over? == true
          if self.draw?
            return "Cat\'s Game!"
          end
          self.turn
        end
      
        if self.won?
          puts "Congratulations #{self.winner}!"
        elsif self.draw?
          puts "Cat\'s Game!"
        end
      end
end