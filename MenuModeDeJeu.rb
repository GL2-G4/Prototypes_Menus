load "MenuAventure.rb"
load "MenuApprentissage.rb"
load "MenuChallenge.rb"

require "gtk3"

class MenuModeDeJeu

    private_class_method :new

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
            gMenu.changerMenu(MenuAventure.creer(@gMenu, self), self)
        end
        @button3 = Gtk::Button.new(:label => "Apprentissage")
        @button3.signal_connect "clicked" do |_widget|
            gMenu.changerMenu(MenuApprentissage.creer(@gMenu, self), self)
        end
        @button4 = Gtk::Button.new(:label => "Challenge")
        @button4.signal_connect "clicked" do |_widget|
            gMenu.changerMenu(MenuChallenge.creer(@gMenu, self), self)
        end
    end

    def afficheToi()
        @vBox.pack_start(@button2, :expand => true, :fill => true, :padding => $paddingBouton)
        @vBox.pack_start(@button3, :expand => true, :fill => true, :padding => $paddingBouton)
        @vBox.pack_start(@button4, :expand => true, :fill => true, :padding => $paddingBouton)
        @vBox.pack_end(@button1, :expand => true, :fill => true, :padding => $paddingBouton)
        @box.pack_start(@vBox, :expand => true, :fill => true, :padding => $paddingBox)
    end

    def enleveToi()
        @box.remove(@vBox)
    end
end