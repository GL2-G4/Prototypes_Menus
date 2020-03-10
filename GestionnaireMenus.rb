load "Menu.rb"
load "SousMenu.rb"


require "gtk3"

class GestionnaireMenus

    attr :box, true
    attr :window, true

    def GestionnaireMenus.creer(window)
        new(window)
    end
 
    def initialize(window)

        @window = window
        @box =  Gtk::Box.new(:horizontal)
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
        elsif (t == "1600 x 900")
            window.set_size_request(1600, 900)
        elsif (t == "1280 x 720")
            window.set_size_request(1280, 720)
        elsif (t == "720 x 480")
            window.set_size_request(720, 480)
        end
        @window.show_all
    end

    def changerTheme(t)
        if(t == "Dark Theme")
            @window.modify_bg(STATE_NORMAL,Gdk::Color.new(254*254, 253*253,236*236))
        end
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