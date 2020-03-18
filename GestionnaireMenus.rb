load "Menu.rb"
load "SousMenu.rb"


require "gtk3"

$nbPuzzles = 30
$paddingBouton = 40
$paddingBox = 30
$longListe = 550

class GestionnaireMenus

    attr :box, true
    attr :window, true

    def GestionnaireMenus.creer(window)
        new(window)
    end
 
    def initialize(window)

        @window = window
        @box =  Gtk::Box.new(:horizontal)
        @box.set_spacing($paddingBox)
        #@box.set_homogeneous(true)
        @window.add(@box)

        @menu = Menu.creer(self)
        @sousMenu = SousMenu.creer(self, @menu)
        @menuRegles = MenuRegles.creer(self,@menu)
        @menuModeDeJeu = MenuModeDeJeu.creer(self, @menu)
        @parametres = Parametres.creer(self, @menu)
        @tuto = Tutoriel.creer(self, @menu)
        @menu.sousMenu = @sousMenu
        @menu.menuRegles = @menuRegles
        @menu.menuModeDeJeu = @menuModeDeJeu
        @menu.tuto = @tuto
        @menu.parametres = @parametres
        @menu.afficheToi()
    end

    def changerMenu(menuAff, menuEnl)
        menuEnl.enleveToi()
        menuAff.afficheToi()
        @window.show_all
    end

    def changerTaille(t)
        if(t == "1920 x 1080")
            window.set_size_request(1920, 1080)
            $longListe = 1750
            $paddingBox = 240
            $paddingBouton = 250
        elsif (t == "1600 x 900")
            window.set_size_request(1600, 900)
            $longListe = 1430
            $paddingBox = 170
            $paddingBouton = 180
        elsif (t == "1280 x 720")
            window.set_size_request(1280, 720)
            $longListe = 1110
            $paddingBox = 100
            $paddingBouton = 110
        elsif (t == "720 x 480")
            window.set_size_request(720, 480)
            $longListe = 550
            $paddingBox = 30
            $paddingBouton = 40
        end
        @window.show_all
    end

end

window = Gtk::Window.new("First Menu")
window.set_default_size(720, 480)
window.resizable=(false)
window.set_border_width(10)
gMenu = GestionnaireMenus.new(window)

window.signal_connect("delete-event") { |_widget| Gtk.main_quit }
window.show_all

Gtk.main