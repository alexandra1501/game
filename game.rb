# frozen_string_literal: true

class Game
  def initialize
    @your_combination = []
    @computer_combination = []
    @computer_strings = %w[
      A1 A2 A3
      B1 B2 B3
      C1 C2 C3
    ]
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
    enter_your_turn
    input = gets.chomp
    if input.chop == 'A' || input.chop == 'B' || input.chop == 'C'
      if input.slice(1) == '1' || input.slice(1) == '2' || input.slice(1) == '3'
        @letter = input.chop
        @number = input.slice(1)
      else
        only_values_from_the_board
        exit
      end
    else
      only_values_from_the_board
      exit
    end
  end

  def your_combination
    your_turn = "#{@letter}#{@number}"
    if @your_combination.include?(your_turn)
      you_had_this_turn
      redo_turn
    elsif @computer_combination.include?(your_turn)
      computer_had_this_turn
      redo_turn
    else
      computer_combination_logic(your_turn)
      @your_combination << your_turn
      puts ''
      puts "Your combination: #{@your_combination}"
    end
  end

  def computer_combination
    random_string_from_array = @computer_strings.sample
    @computer_combination << random_string_from_array
    puts ''
    puts "Computer's combination: #{@computer_combination}"
    computer_combination_logic(random_string_from_array)
  end

  def computer_combination_logic(element)
    element_index = @computer_strings.find_index(element)
    removed_element = @computer_strings.delete_at(element_index)
    @computer_strings -= removed_element.split
  end

  def winner
    COMBINATIONS.map do |c|
      return puts 'You won!' if c.sort == @your_combination.sort

      return puts 'You lost' if c.sort == @computer_combination.sort
    end
    puts 'No one won'
  end

  def redo_turn
    correct_values
    your_combination
  end
end
