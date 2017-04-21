#I used this source to write the checkGuess method
#https://stackoverflow.com/questions/29636503/getting-the-indexes-of-duplicate-elements-in-arrays-ruby

class Hangman

def select_random_word
  @word = File.readlines("c://sites/hangman/5desk.txt").sample.to_s.chomp

  if @word.length == 4 || @word.length <= 12
    @word
  else select_random_word
  end

end

def startGame
  select_random_word
  @wordArray = @word.split("")
  @length = @word.length
  @hint = Array.new(@length){"_"}

  print "Let's play Hangman!\nYou have 8 chances to guess my word.\nHere is your hint: #{@hint}\nGive me a letter!"
  @letter = gets.chomp
  checkGuess
end

def checkGuess
@index = @wordArray.each_index.select { |i| @wordArray [i] == @letter }
if @index.empty? == true
  turn
else
@index.map {|x| @hint[x] = @letter}
end
  #@index = @wordArray.index(@letter)
  #if @wordArray.index(@letter) != nil
  #@hint[@index] = @letter
#end
print @hint.join(" ")
checkWin
end

def checkWin
  if @hint.include?("_") == false
    print "You win!"
    exit
    else
    print "\nGive me another letter!"
    @letter = gets.chomp
    checkGuess
  end
end

def turn
  @i ||= -1
  @i += 1

  if @win != true
  print "\nYou have #{7-@i} guesses left!\n"
  end

  if @i == 7
  print "Game over!"
  print @wordArray.join()
  exit
  end

end

end

a = Hangman.new
puts a.startGame
