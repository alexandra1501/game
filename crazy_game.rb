COMBINATIONS = [
     ['A1', 'B2', 'C3'],
     ['A1', 'A2', 'A3'],
     ['B1', 'B2', 'B3'],
     ['C1', 'C2', 'C3'],
     ['A3', 'B2', 'C1'],
     ['A1', 'B1', 'C1'],
     ['A2', 'B2', 'C2'],
     ['A3', 'B3', 'C3']
]
def game_logic()
    your_combination = []
    computer_combination = []

    while your_combination.length < 3
      puts 'Choose a number and a letter ON A BOARD:'

      choice = gets.chomp
      letter = choice.chop
      number = choice.slice(1)
      if letter == 'A' || letter == 'B' || letter == 'C'
        if number == '1' || number == '2' || number == '3' 
          your_combination << "#{letter}#{number}"
          puts "Your combination: #{your_combination}"
          letters = ['A', 'B', 'C']
          computer_combination << letters.sample + rand(1..3).to_s
          puts "Computer's combination: #{computer_combination}"
        end
      end
    end
    winner(your_combination, computer_combination)
end

def winner(your_combination, computer_combination)
  COMBINATIONS.map do |c|
  if c.sort == your_combination.sort
    return puts 'You won!'
  elsif c.sort == computer_combination.sort
    return puts 'You lost'
  else 
    puts 'No one won'
  end
  end
end

puts "Hello, let's play a game :) "
puts ''
puts ' | A | B | C |'
puts '1|___|___|___|'
puts '2|___|___|___|'
puts '3|___|___|___|'
puts ''
game_logic()