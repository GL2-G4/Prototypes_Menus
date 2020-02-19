load "SousMenu.rb"
load "MenuRegles.rb"
require "gtk3"

class Menu

    attr :sousMenu, true
    attr :menuRegles, true
    private_class_method :new

    def Menu.creer(gMenu)
        new(gMenu)
    end

    def initialize(gMenu)
        @gMenu = gMenu
        @hBox = gMenu.box
        @vBox1 = Gtk::Box.new(:vertical)
        @vBox2 = Gtk::Box.new(:vertical)
        @button1 = Gtk::Button.new(:label => 'Tutoriel')
        @button1.signal_connect('clicked') {
            print "Bonjour tout le monde\n"
        }
        @button2 = Gtk::Button.new(:label => 'Mode de jeu')
        @button2.signal_connect('clicked') {
            print "Bonjour tout le monde\n"
        }
        @button3 = Gtk::Button.new(:label => 'Boutique')
        @button3.signal_connect('clicked') {
            print "Bonjour tout le monde\n"
        }
        @button4 = Gtk::Button.new(:label => 'Paramètres')
        @button4.signal_connect('clicked') {
            print "Bonjour tout le monde\n"
        }
        @button5 = Gtk::Button.new(:label => 'Règles et Techniques')
        @button5.signal_connect('clicked') {
            gMenu.changerMenu(@menuRegles, self)
        }
        @button6 = Gtk::Button.new(:label => 'Quitter')
        @button6.signal_connect('clicked') {
            Gtk.main_quit
        }

    end

    def afficheToi()
        @vBox1.add(@button1)
        @vBox1.add(@button2)
        @vBox1.add(@button3)
        @vBox2.add(@button4)
        @vBox2.add(@button5)
        @vBox2.add(@button6)
        @hBox.add(@vBox1)
        @hBox.add(@vBox2)
    end

    def enleveToi()
      @hBox.remove(@vBox1)
      @hBox.remove(@vBox2)
    end
end