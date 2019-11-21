# frozen_string_literal: true

class Game
  def initialize
    @your_combination = []
    @computer_combination = []
  end

  def order
    text_greeting
    game_logic
  end

  def game_logic
    while @your_combination.length < 3
      correct_values
      your_combination
      computer_combination
    end
    winner
  end

  def correct_values
    puts 'Enter your turn: '
    puts ''
    input = gets.chomp
    if input.chop == 'A' || input.chop == 'B' || input.chop == 'C'
      if input.slice(1) == '1' || input.slice(1) == '2' || input.slice(1) == '3'
        @letter = input.chop
        @number = input.slice(1)
      else
        puts 'Choose values FROM THE BOARD'
        exit
      end
    else
      puts 'Choose values FROM THE BOARD'
      exit
    end
  end

  def your_combination
    @your_combination << "#{@letter}#{@number}"
    puts ''
    puts "Your combination: #{@your_combination}"
  end

  def computer_combination
    @computer_combination << %w[A B C].sample + rand(1..3).to_s
    puts ''
    puts "Computer's combination: #{@computer_combination}"
  end

  def winner
    COMBINATIONS.map do |c|
      return puts 'You won!' if c.sort == @your_combination.sort

      return puts 'You lost' if c.sort == @computer_combination.sort

      puts 'No one won'
    end
  end

  def text_greeting
    puts ''
    puts "Hello, let's play a game :) "
    puts ''
    puts ' | A | B | C |'
    puts '1|___|___|___|'
    puts '2|___|___|___|'
    puts '3|___|___|___|'
    puts ''
  end
end
