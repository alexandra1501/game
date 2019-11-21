# frozen_string_literal: true

def text_greeting
  puts ''
  puts "Hello, let's play a game :) "
  puts ''
  puts ' ͟|͟ ͟A͟ ͟|͟ ͟B͟ ͟|͟ ͟C͟ ͟|͟'
  puts '1|___|___|___|'
  puts '2|___|___|___|'
  puts '3|___|___|___|'
  puts ''
end

def enter_your_turn
  puts 'Enter your turn: '
  puts ''
end

def only_values_from_the_board
  puts 'Choose values FROM THE BOARD'
end

def you_had_this_turn
  puts ''
  puts 'You already had this turn'
  puts ''
end

def computer_had_this_turn
  puts 'Computer alredy had this turn'
  puts ''
end
