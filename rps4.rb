class RockPaperScissors
  
# R == S / P == R / S == P
 WINS = {R: :S, P: :R, S: :P}

def initialize
  @playerScore = 0
  @computerScore = 0
end



 NAMES = {R: "rock", P: "paper", S: "scissors"}
 
 RESULTS = {
   :player => "Player Wins",
   :computer => "Computer Wins",
   :score => "The score is #{@playerScore} to #{@computerScore}",
   :invalid => "Invalid choice pick again",
   nil => "A tie!" 
 }
 



 def start
  @winner = nil
   while @winner!=""
    play_a_round
   end
 end
  

 def play_a_round
   get_player_play
   get_computer_play
   get_winner
   print_state
 end
 

 def get_player_play
   prompt
   @player_play = gets.chomp.upcase.to_sym
   @winner = :invalid if  @player_play != :R || :P || :S
   @winner = "" if @player_play == :Q
   @winner = :score if @player_play == :X
 end
 
 def prompt
   puts "Type R to throw a Rock, P to throw Paper, and S to throw Scissors:"
 end

 def get_computer_play
   @computer_play = WINS.keys.sample
   puts "I threw #{NAMES[@computer_play]}!" #NAMES[P]
 end

 def get_winner
  if @player_play == @computer_play
  @winner = nil
  else
  @winner = :player   if WINS[@player_play] == @computer_play
  @winner = :computer if WINS[@computer_play] == @player_play
  end
  
 end

 def print_state
  if @winner == :score
    puts print_score
  else
    puts RESULTS[@winner]
  end
  @playerScore += 1 if @winner == :player
  @computerScore += 1 if @winner == :computer
 end

 def print_score
  "Your score is :#{@playerScore} and the computer's score is :#{@computerScore}"
 end
   
end
