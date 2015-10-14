class Board
  attr_reader :board, :guesses_made
  
  def initialize(answer)
    @answer = answer.downcase.split('')
    @board = @answer.map{ |space| space == " " ? space = " " : space = "_" }
    @guesses_left = 10
    @guesses_made = []
  end
  
  def show
    @board.each { |space| print space + " " }
    print "\n"
  end
  
  def guess_made?(guess)
    @guesses_made.include?(guess)
  end
  
  def winning_condition?
    @board == @answer
  end
  
  def print_guesses_made
    puts "You have made the following guesses: #{@guesses_made.join(', ')}"
  end

  def print_guesses_left
    puts "You have #{@guesses_left} guesses left"
  end
  
  def losing_condition?
    @guesses_left < 1
  end
  
  def correct_guess?(guess)
    @answer.include?(guess)
  end
  
  def enter_guess_on_board(guess)
    @answer.each_with_index do |space, index|
      @board[index] = guess if space == guess
    end    
  end
  
  def make_guess
    begin
      puts "Please enter a letter: "
      letter = gets.chomp.downcase
    end until letter.length == 1 && !guess_made?(letter)
  
    @guesses_made << letter
  
    if correct_guess?(letter)
      puts "That's a correct guess!"
      enter_guess_on_board(letter)
    else
      puts "That is an incorrect guess!"
      @guesses_left -= 1
    end
  end
end

class Game
  attr_reader :board
  
  def initialize
    puts "Enter your name: "
    name = gets.chomp
    @name = name
    @board = Board.new("Mike Wittenauer")
  end
  
  def play
    loop do
      system 'clear'
      @board.show
      @board.print_guesses_made
      @board.print_guesses_left
      @board.make_guess
      @board.show
      
      if @board.winning_condition?
        puts "Congrats you guessed it right!"
        break
      end
      
      if @board.losing_condition?
        puts "Sorry you lose!"
        break
      end
      
    end
  end
end

puts Game.new.play





