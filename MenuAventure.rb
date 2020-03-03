require "gtk3"
class MenuAventure

    private_class_method :new

    def MenuAventure.creer(gMenu, menuPere)
        new(gMenu, menuPere)
    end

    def initialize(gMenu, menuPere)
        @gMenu = gMenu
        @box = gMenu.box
        @pere = menuPere
        @vBox = Gtk::Box.new(:vertical)
        @vBox2 = Gtk::Box.new(:vertical)
        @listeBoutons = Array.new(10);

        @button1 = Gtk::Button.new(:label => "- Retour -")
        @button1.signal_connect "clicked" do |_widget|
            gMenu.changerMenu(@pere, self)
        end
        @listeBoutons.each { |bouton|
            bouton = Gtk::Button.new()
            bouton.set_label("Bouton" + @listeBoutons.find_index(bouton).to_s)
            print  @listeBoutons.find_index(bouton).to_s
            bouton.signal_connect "clicked" do |_widget|
                print "Salut tout le monde"
            end
            @vBox2.add(bouton)
        } 
    end

    def afficheToi()
        @vBox.add(@button1) 
        @box.add(@vBox)
        @box.add(@vBox2)
    end

    def enleveToi()
        @box.remove(@vBox)
        @box.remove(@vBox2)
    end
end