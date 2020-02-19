require "gtk3"
class MenuModeDeJeu

    def MenuModeDeJeu.creer(gMenu, menuPere)
        new(gMenu, menuPere)
    end

    def initialize(gMenu, menuPere)
        @gMenu = gMenu
        @box = gMenu.box
        @pere = menuPere
        @vBox = Gtk::Box.new(:vertical)

        @button1 = Gtk::Button.new(:label => "- Retour -")
        @button1.signal_connect "clicked" do |_widget|
            gMenu.changerMenu(@pere, self)
        end
        @button2 = Gtk::Button.new(:label => "Aventure")
        @button2.signal_connect "clicked" do |_widget|
            print "Aventure Bonjour tout le monde\n"
        end
        @button3 = Gtk::Button.new(:label => "Apprentissage")
        @button3.signal_connect "clicked" do |_widget|
            print "Apprend Bonjour tout le monde\n"
        end
        @button4 = Gtk::Button.new(:label => "Challenge")
        @button4.signal_connect "clicked" do |_widget|
            print "Challenge Bonjour tout le monde\n"
        end
    end

    def afficheToi()
        @vBox.add(@button2)
        @vBox.add(@button3)
        @vBox.add(@button4)
        @vBox.add(@button1)
        @box.add(@vBox)
    end

    def enleveToi()
        @box.remove(@vBox)
    end
end