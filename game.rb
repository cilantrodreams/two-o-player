class Game
  def initialize 
    @players = [Player.new("Thomas"), Player.new("Logan")]
    @active_player = 0
    @is_over = false
  end

  def start_game
    
    while !@is_over
      player = @players[@active_player]
      # generate a new problem
      current_problem = Problem.new(rand(1..20), rand(1..20))

      # print the current player's lives
      puts "#{player.name} you have #{player_lives(player.lives)} remaining. Answer wisely."
      
      # print the current player's name and problem string
      puts "#{player.name}: #{current_problem.read_problem}"


      # take input from the console
      answer = 0
      loop do
        print "> "
        answer = $stdin.gets.chomp.to_i
        if answer != 0
          break
        end
        puts "You entered an invalid answer. Please try again"
      end

      # compare the attempt to the solution
      if answer != current_problem.solution
        # describe that the player is about to be wounded
        puts "Unfortunately, #{answer} is not correct."
        # slay player if needed
        player.lose_life
      else 
        # describe that the player has been victorious
        puts "#{answer} is correct. Your lives are intact."
        
      end
      # check players remaining lives
      # if lives more than 0
      # show player remaining lives
      # continue game remembering to change players
      
      if player.lives > 0
        puts "You have #{player.lives} of your 3 lives remaining. Good luck."
        # else (if lives are at 0)
        # end the game
      else 
        puts "You have lost your last life. Go die somewhere else."
        @is_over = true # ends game after first loop
      end
      # switch current player
      # @active_player = (@active_player + 1) % 2
      switch_player

      # new turn line break
      puts "----- NEW TURN -----"
    end # end of game loop

    # display results
    player = @players[@active_player]
    puts "Congratulations #{player.name}! You managed to live another day with #{player_lives(player.lives)} remaining."

  end #end of start_game

  private

  def switch_player
    @active_player = (@active_player + 1) % 2
  end

  # string formatter for plurality on word 'lives'
  def player_lives(count)
    if count > 1
      "#{count} lives"
    else
      "#{count} life"
    end
  end
end







