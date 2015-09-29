print "What would you like the player to guess? "

ANSWER = gets.chomp.downcase
ANSWER_ARRAY = ANSWER.split("")

guesses_left = 10
player_answer = []
guesses = []

ANSWER_ARRAY.each do |n|
  if n == " "
    player_answer << " "
  else
    player_answer << "_"
  end
end

system "clear"
puts "Below is the empty phrase. You have ten guesses, good luck!"
p player_answer.join

while ANSWER_ARRAY != player_answer
  print "Enter your guess here: "
  guess = ' '
  loop do
    guess = gets.chomp
    case
    when guess.length > 1
      puts "You can only type one letter, please enter a correct guess"
    when guesses.include?(guess)
      puts "You already guessed that letter, enter one you have not guessed: "
    else
      guesses << guess
      break
    end
  end
  
  if ANSWER_ARRAY.include?(guess)
    puts "That is a correct guess"
    ANSWER_ARRAY.each_with_index do |value, index|
      if ANSWER_ARRAY[index] == guess
        player_answer[index] = guess
      end
    end
    puts "Here is what you have so far"
    puts player_answer.join
    puts "Here are the letters you have guessed so far: #{guesses.join(',')}"
    puts "You have #{guesses_left} guesses left"
  else
    guesses_left -= 1
    puts "That is an incorrect guess, here is what you have so far"
    puts player_answer.join
    puts "Here are the letters you have guessed so far: #{guesses.join(',')}"
    puts "You have #{guesses_left} guesses left"
  end
  
  if guesses_left < 1
    puts "You ran out of guesses, you lose. The right answer was '#{ANSWER}'"
    break
  end

  if ANSWER_ARRAY == player_answer
    puts "You win! Congratulations! they wanted you to guess '#{ANSWER}'"
  end
  
end











