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
        @vBox2 = Gtk::ButtonBox.new(:vertical)
        @listeBoutons = Array.new($nbPuzzles);

        @scrolled = Gtk::ScrolledWindow.new
        @scrolled.set_policy(:never, :automatic)
       

        @button1 = Gtk::Button.new(:label => "- Retour -")
        @button1.signal_connect "clicked" do |_widget|
            @gMenu.changerMenu(@pere, self)
        end

        @titre = Gtk::Label.new("Aventure")
        @titre.style_context.add_class("titre")
        @vBox2.add(@titre)

        p1 = GdkPixbuf::Pixbuf.new(:file => "./image/etoile.png")
        p2 = GdkPixbuf::Pixbuf.new(:file => "./image/argent.png")
        @iEtoile = Gtk::Image.new(:pixbuf => p1.scale_simple($icone, $icone, GdkPixbuf::InterpType::BILINEAR))
        @etoile = Gtk::Label.new(@gMenu.joueur.etoiles.to_s())
        @boxEtoile = Gtk::Box.new(:horizontal)
        @boxEtoile.pack_start(@iEtoile, :expand => true)
        @boxEtoile.pack_end(@etoile, :expand => true)
        @iArgent = Gtk::Image.new(:pixbuf => p2.scale_simple($icone, $icone, GdkPixbuf::InterpType::BILINEAR))
        @argent = Gtk::Label.new(@gMenu.joueur.argent.to_s())
        @boxArgent = Gtk::Box.new(:horizontal)
        @boxArgent.pack_start(@iArgent, :expand => true)
        @boxArgent.pack_end(@argent, :expand => true)
        @boxJoueur = Gtk::Box.new(:vertical)
        @borderJoueur = Gtk::Frame.new()

        @listeBoutons.each_index { |index|
            boxBouton = Gtk::ButtonBox.new(:horizontal)
            boxBouton.set_width_request($longListe)
            border = Gtk::Frame.new()
            boxBouton.set_border_width(10)
            textBox = Gtk::Label.new("coucou")
            bouton = Gtk::Button.new()
            bouton.set_label("Puzzle n°" + index.to_s)
            bouton.signal_connect "clicked" do |_widget|
                puts "Jouer au puzzle n°" + index.to_s
            end
            @listeBoutons[index] = bouton
            boxBouton.add(textBox)
            boxBouton.add(bouton)
            border.add(boxBouton)
            @vBox2.add(border)
        } 
    end

    def afficheToi()
        @vBox.add(@button1) 
        @boxJoueur.add(@boxEtoile)
        @boxJoueur.add(@boxArgent)
        @borderJoueur.add(@boxJoueur)
        @vBox.pack_end(@borderJoueur)
        @box.add(@vBox)
        @scrolled.add(@vBox2)
        @box.add(@scrolled)
    end

    def enleveToi()
        @box.remove(@vBox)
        @box.remove(@scrolled)
    end
end