require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "  =~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~="
puts "  || Bienvenue à vous sur le jeu 'ILS VEULENT MA POO'       ||"
puts "  || Serez-vous capable de survivre à ce qui vous attends ? ||"
puts "  =~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~="
puts " Quel est votre nom jeune guerrier ?"
puts " >"
user = HumanPlayer.new(gets.chomp.to_s)
puts " Je vous souhaites de grandes et sanglantes batailles !"
puts " Que vos faits d'armes inspirent nos prochaines générations !"


player1 = Player.new('Josiane') # create a new player
player2 = Player.new('José') ## create a new player
enemies = [player1, player2]    

while
    user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
    puts "\n\n###~~~~###~~~~###~~~~###~~~~###~~~~###~~~~###~~~" #Tout d'abord on demande au jouer s'il veut savoir dans quel état il est
    puts " Souhaiteriez-vous connaitre votre état ? O/N"
    puts " >"
    réponse = gets.chomp.to_s
        if réponse == "O"
            puts user.show_state
        else
        end
    puts "\n\n###~~~~###~~~~###~~~~###~~~~###~~~~###~~~~###~~~"
    puts " Souhaiteriez-vous connaitre l'état de vos adversaires ? O/N" #pareil mais avec les adversaires
    puts " >"
    réponse = gets.chomp.to_s
        if réponse == "O"
            puts player1.show_state
            puts player2.show_state
        else
        end
        
    puts "\n###~~~~###~~~~###~~~~###~~~~###~~~~###~~~~\n"
    puts "\n  Quelle action souhaites-tu effectuer ?\n\n" #menu: on indique les choix possibles
    puts "  a - chercher une meilleure arme"
    puts "  s - chercher de quoi se soigner"
    puts "\n\nAttaquer un joueur en vue:"
if player1.life_points <= 0
puts "  1 - Josianne a 0 PVs"
else
    puts "  1 - Josianne a #{player2.life_points} PVs"
end
    if player2.life_points <= 0
        puts "  2 - José a 0 PVs"
    else
        puts "  2 - José a #{player2.life_points} PVs"
    end    
    puts  ">"
    menu = gets.chomp
    if menu == "a"
        user.search_weapon
    elsif menu == "s"
        user.search_health_pack
    elsif menu == 1
        user.attacks(player1)
    else menu == 2
        user.attacks(player2)
    end
    
  
    puts "les ennemis t'attaquent!"
    enemies.each do |bad_guys|
        bad_guys.attacks(user) if bad_guys.life_points > 0
    end
end

puts "~Fin~de~Partie"
    if user.life_points > 0
        puts "Félicitations Brave Guerrier! Nous transmettrons ton Histoires dans nos chants"
    else "Lo-lo-loser!!!!!!!"
    end

binding.pry
