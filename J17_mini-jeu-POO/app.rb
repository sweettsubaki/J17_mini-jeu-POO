require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new('Josiane') # creation de nouveaux joueurs
player2 = Player.new('José') 
    

while player1.life_points > 0 && player2.life_points > 0
  puts "Voici l'état de chaque joueur :"
  puts player1.show_state
  puts player2.show_state

  puts "Passons à la phase d'attaque :"
  player1.attacks(player2)
  break if player2.life_points <= 0
  player2.attacks(player1)
end

binding.pry
