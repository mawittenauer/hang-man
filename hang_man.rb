print "What would you like the player to guess? "

ANSWER = gets.chomp.downcase
ANSWER_ARRAY = ANSWER.split("")

guesses_left = 10
player_answer = []

ANSWER_ARRAY.each do |n|
  if n == " "
    player_answer << " "
  else
    player_answer << "_"
  end
end

puts "An underscore indicates a letter and a dash indicates a space"
p player_answer

while ANSWER_ARRAY != player_answer
  print "Enter your guess here: "
  guess = gets.chomp
  
  if ANSWER_ARRAY.include?(guess)
    puts "That is a correct guess"
    ANSWER_ARRAY.each_with_index do |value, index|
      if ANSWER_ARRAY[index] == guess
        player_answer[index] = guess
      end
    end
    puts "Here is what you have so far"
    print player_answer
    puts " You have #{guesses_left} guesses left"
  else
    guesses_left -= 1
    puts "That is an incorrect guess, here is what you have so far"
    print player_answer
    puts " You have #{guesses_left} guesses left"
  end
  
  if guesses_left < 0
    puts "You ran out of guesses, you lose"
    break
  end
end

