require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "  =~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~="
puts "  || Bienvenue à vous sur le jeu 'ILS VEULENT MA POO'       ||"
puts "  || Serez-vous capable de survivre à ce qui vous attends ? ||"
puts "  =~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~="
puts "   Quel est votre nom jeune guerrier ?"
puts "   >"
user_name = gets.chomp
puts "   Je vous souhaites de grandes et sanglantes batailles !"
puts "   Que vos faits d'armes inspirent nos prochaines générations !"


my_game = Game.new(user_name)
my_game.show_players


while my_game.is_still_ongoing?
    my_game.menu
    my_game.menu_choice(gets.chomp)
    my_game.show_players
    my_game.enemies_attack
end