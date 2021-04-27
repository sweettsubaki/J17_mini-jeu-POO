require "pry"

class Player
    attr_accessor :name, :life_points
    
    def initialize(name)
        @name = name
        @life_points = 10
    end

    def show_state
        puts "\nvoici l'état des joueur :\n"
        @life_points > 0 ? (puts "\n#{@name} a #{@life_points} points de vie\n") : (puts "\n#{name} a 0 points de vie\n")
    end

    def gets_damage(damage)
        @life_points -= damage
        @life_points <= 0 ? (puts "Le joueur #{@name} a été tué !") : (show_state)
    end

    def compute_damage
        return rand(1..6)
    end

    def attacks(other_player)
        puts "\nA l'attaque !\n"
        puts "\n #{name} attaque #{other_player.name}\n"
        puts "\n=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=\n"
        random = compute_damage    
        puts "#{other_player.name} reçoit #{random} points de dommages"
        other_player.gets_damage(random)
    end

end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        super(@name)
        @life_points = 100
        @weapon_level = 1
    end

    def show_state
        puts "\nvoici l'état des joueur :\n"
        @life_points > 0 ? (puts "\n#{@name} a #{@life_points} points de vie\n") : (puts "\n#{name} a 0 points de vie\n")
        
    end

    def compute_damage
    rand(1..6) * @weapon_level
    end

    def search_weapon
        new_weapon = rand(1..6)
        puts "Félicitations! Tu as trouvé une arme de niveau #{new_weapon}"
        if
            new_weapon > @weapon_level
            puts "Génial ! Ta nouvelle arme est plus puissante que l'ancienne! Allez on la garde !"
            @weapon_level = new_weapon
        else
            puts "et M****... ... ... Bon bah on garde l'ancienne hein..."
        end
    end

    def search_health_pack
        health_pack = rand(1..6)
        case health_pack
        when
            health_pack = 1 
            puts "Tu n'as rien trouvé, dommage"
        when  
            health_pack = (2..5)
            puts "Tu as trouvé un pack de +50 PVs !"
            if 
                life_points < 50
                @life_points += 50
                puts show_state
            else
                @life_points = 100
                puts show_state
            end
        when
            health_pack = 6
            puts "Tu a trouvé un pack de +80 PVs !"
            if 
                life_points < 20
                @life_points += 80
                puts show_state
            else
                @life_points = 100
                puts show_state
            end
        end
    end

end