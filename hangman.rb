words = File.readlines "5desk.txt"

words.each do |word|
  word.delete!("\n")
end

def select_word(word_arr)
  array_length = word_arr.length
  rand_word = word_arr[rand(array_length)].downcase
  until rand_word.length > 3 && rand_word.length < 13 do
    rand_word = word_arr[rand(array_length)].downcase
  end
  return rand_word
end

def print_game(word, guesses)
  letters = word.split(//)
  letters.each_with_index do |letter, index|
    unless guesses.include? letter
      letters[index] = "_"
    end
  end
  letters.each {|letter| print letter, " "}
  puts ""
end

def check_win(word, guesses)
  letters = word.split(//)
  win = true
  letters.each do |letter|
    if guesses.include? letter
      next
    else
      win = false
    end
  end
  return win
end

def game_loop(word_array)
  win = false
  turn = 1
  game_word = select_word(word_array)
  player_guesses =[]
  puts "------------------------------------------"
  print_game(game_word, player_guesses)
  while turn <= 12 && win == false do
    puts "Enter guess #{turn}, you have #{13-turn} turns left."
    puts "Your guesses are #{player_guesses}"
    player_guesses.push(gets.chomp.downcase)
    print_game(game_word, player_guesses)
    win = check_win(game_word, player_guesses)
    turn += 1
    puts "------------------------------------------"
  end
  if win
    puts "You have won!"
  else
    puts "Try again next time! You ran out of turns! The word was #{game_word}"
  end
end

game_loop(words)
