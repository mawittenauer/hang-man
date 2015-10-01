system "clear"
print "What would you like the player to guess? "

ANSWER = gets.chomp.downcase
ANSWER_ARRAY = ANSWER.split("")

guesses_left = 10
player_answer = []
guesses = []

def letter_guesses_left(answer, guesses, guesses_left)
  puts answer.join
  puts "Here are the letters you have guessed so far: #{guesses.join(',')}"
  puts "You have #{guesses_left} guesses left"
  puts "-" * 60
end

ANSWER_ARRAY.each do |n|
  n == " " ? player_answer << " " : player_answer << "_"
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
      print "You can only type one letter, please enter a correct guess: "
    when guesses.include?(guess)
      print "You already guessed that letter, enter one you have not guessed: "
    else
      guesses << guess
      break
    end
  end
  
  if ANSWER_ARRAY.include?(guess)
    ANSWER_ARRAY.each_with_index do |value, index|
      if ANSWER_ARRAY[index] == guess
        player_answer[index] = guess
      end
    end
    puts "That is a correct guess! Here is what you have so far"
    letter_guesses_left(player_answer, guesses, guesses_left)
  else
    guesses_left -= 1
    puts "That is an incorrect guess, here is what you have so far"
    letter_guesses_left(player_answer, guesses, guesses_left)
  end
  
  if guesses_left < 1
    puts "You ran out of guesses, you lose. The right answer was '#{ANSWER}'"
    break
  end

  if ANSWER_ARRAY == player_answer
    puts "You win! Congratulations! they wanted you to guess '#{ANSWER}'"
  end
  
end













