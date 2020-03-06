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
        @menu.sousMenu = @sousMenu
        @menu.menuRegles = @menuRegles
        @menu.menuModeDeJeu = @menuModeDeJeu
        @menu.afficheToi()
    end

    def changerMenu(menuAff, menuEnl)
        menuEnl.enleveToi()
        menuAff.afficheToi()
        @window.show_all
    end

end

window = Gtk::Window.new("First Menu")
window.set_size_request(800, 450)
window.set_border_width(10)
gMenu = GestionnaireMenus.new(window)

window.signal_connect("delete-event") { |_widget| Gtk.main_quit }
window.show_all

Gtk.main