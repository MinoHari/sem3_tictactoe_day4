=begin
Auteur: Andryhajanirina, Hari, Fetra
Date: 19-04-2018
====================================

Description: Ce classe est propre à l'utilisateur
On définit le prénom de l'utilisateur et le stocker dans la variable @prenom1, @prenom2
On le rend accessible via l'attribut attr_accessor
=end

class Joueur
    attr_accessor :prenom1
    attr_accessor :prenom2
    def utilisateur
        puts "Utilisateur1 : Entrer votre prenom"
        @prenom1 = gets.chomp
        puts "Utilisateur2 : Entrer votre prenom"
        @prenom2 = gets.chomp
    end
end

=begin
Ce classe hérite de la class Joueur
Elle définit tous les méthodes nécessaires pour jouer au jeux Tic tac toe
=end

class Jeux < Joueur
    #Tout d’abord, on a défini la méthode table_jeux pour créer et maintenir des variables pour les cas de vides sur grille
    def table_jeux
        @a1 = " "
        @a2 = " "
        @a3 = " "
        @b1 = " "
        @b2 = " "
        @b3 = " "
        @c1 = " "
        @c2 = " "
        @c3 = " "
    end
    
    #Ensuite, on a défini la méthode des cases pour activer les cases vides dans un tableau
    def cases
        [@a1, @a2, @a3, @b1, @b2, @b3, @c1, @c2, @c3]     
    end
    
    #Les cas possibles pour gagner à ce jeux
    def coup_gagnant 
        [[@a1, @a2, @a3],
        [@a1, @b2, @c3],
        [@a1, @b1, @c1],
        [@b1, @b2, @b3],
        [@c1, @c2, @c3],
        [@c1, @b2, @a3],
        [@a2, @b2, @c2],
        [@a3, @b3, @c3]]      
    end
    
    #Méthode pour afficher la grille du jeux. 
    def afficher_grille
        puts
        puts "   1   2   3"
        puts "A  #{@a1} | #{@a2} | #{@a3} " 
        puts "  ---|---|---"
        puts "B  #{@b1} | #{@b2} | #{@b3} "
        puts "  ---|---|---"
        puts "C  #{@c1} | #{@c2} | #{@c3} "
        puts
        est_gagnant
        
    end
    
    #Définition de la méthode pour vérifier si une case choisit par l'utilisateur est encore disponible ou non.
    def est_disponible cases_disponibles
        if cases_disponibles == " "
            true
        else
            puts "Ce case est prit. Choisissez un autre!"
        end
    end
    
    #Les cases à cocher pour jouer, ici c'est une case de 3 colonne et 3 lignes
    def choix_utilisateurs_hash
        choix_utilisateur_hash = 
        {
            "a1" => @a1,
            "a2" => @a2,
            "a3" => @a3,
            "b1" => @b1,
            "b2" => @b2,
            "b3" => @b3,
            "c1" => @c1,
            "c2" => @c2,
            "c3" => @c3
        }
    end
    
    #Ce que l'utilisateur2 peux faire, mettre une X sur la case disponible
    def tour_utilisateur1    
        puts "#{prenom1}, C'est ton tour \nChoisissez une cases:"
        choix_utilisateur = gets.chomp.downcase
        choix_utilisateurs_hash.each do |choix, cases|
            if choix_utilisateur == choix 
                if est_disponible(cases)
                cases.sub!(" ", "X")
                afficher_grille
                end
            elsif choix_utilisateur == "q" or choix_utilisateur == "quit"
            exit
            end
        end
    end

    #Ce que l'utilisateur2 peux faire, mettre une O sur la case disponible
    def tour_utilisateur2    
        puts "#{prenom2}, C'est ton tour \nChoisissez une cases:"
        choix_utilisateur = gets.chomp.downcase
        choix_utilisateurs_hash.each do |choix, cases|
            if choix_utilisateur == choix 
                if est_disponible(cases)
                    cases.sub!(" ", "O")
                    afficher_grille
                end
            elsif choix_utilisateur == "q" or choix_utilisateur == "quit"
            exit
            end
        end
    end
  
    #L'utilisateur est gagnant si ses points sont aligné horizontalement ou verticalement ou obliquement
    def est_gagnant 
        coup_gagnant.each do |coup| 
        if coup[0] == "O" && coup[1] == "O" && coup[2] == "O"
            puts "#{prenom2} est gagnants! Bien joué!"
            exit 
        elsif coup[0] == "X" && coup[1] == "X" && coup[2] == "X"
            puts "#{prenom1} est gagnant! Bien joué!"
            exit
        end
        end
    end
    
    #Affichage de message de bienvenue quelques instruction pour pouvoir jouer
    def jouer
        puts "============================================="
        puts "Bienvenu #{prenom1} et #{prenom2}! Envie de jouer!"
        puts
        puts "Placer ton coup sur la grille, entrer le nom de la case (ex: a1, b3)."
        puts "Pour quitter, entrer q à n'importe quel moment"
        puts "#{prenom1} = X"
        puts "#{prenom2} = O"
    end
    
    def lancer_jeux
        utilisateur
        jouer
        table_jeux
        while true
            afficher_grille
            tour_utilisateur1
            tour_utilisateur2
        end
    end
end

joueur1 = Jeux.new
joueur1.lancer_jeux
  
  
  