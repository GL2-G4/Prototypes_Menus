require "gtk3"
class Parametres

    def Parametres.creer(gMenu, menuPere)
        new(gMenu, menuPere)
    end

    def initialize(gMenu, menuPere)
        @gMenu = gMenu
        @hBox = gMenu.box
        @pere = menuPere
        @vBox1 = Gtk::Box.new(:vertical)
        @vBox2 = Gtk::Box.new(:vertical)
        @button = Gtk::Button.new(:label => "- Retour -")
        @button.signal_connect "clicked" do |_widget|
            gMenu.changerMenu(@pere, self)
        end

        str = "PARAMETRES\n\n"
        temp = Gtk::TextBuffer.new()
        temp.set_text(str.rjust(95))
        @titre = Gtk::Label.new( str)

        # Selection d'un style de grille
            boxBouton = Gtk::ButtonBox.new(:horizontal)
            @border = Gtk::Frame.new()
            boxBouton.set_border_width(10)
            boxBouton.set_width_request(gMenu.window.size().at(0) - 105)
            textBox = Gtk::Label.new("Style de la grille : ")
            bouton = Gtk::Button.new()
            bouton.set_label("Theme 1")
            bouton.signal_connect "clicked" do |_widget|
                # TODO
            end
            boxBouton.add(textBox)
            boxBouton.add(bouton)
            @border.add(boxBouton)

        # Selection d'une taille de fenetre
            boxBouton2 = Gtk::ButtonBox.new(:horizontal)
            @border2 = Gtk::Frame.new()
            boxBouton2.set_border_width(10)
            boxBouton2.set_width_request(gMenu.window.size().at(0) - 105)
            textBox2 = Gtk::Label.new("Taille de la fenêtre :")
            bouton2 = Gtk::Button.new()
            bouton2.set_label("1920 x 1080")
            bouton2.signal_connect "clicked" do |_widget|
                # TODO
            end
            boxBouton2.add(textBox2)
            boxBouton2.add(bouton2)
            @border2.add(boxBouton2)

        # Selection de l'autocomplétion 
            boxBouton3 = Gtk::ButtonBox.new(:horizontal)
            @border3 = Gtk::Frame.new()
            boxBouton3.set_border_width(10)
            boxBouton3.set_width_request(gMenu.window.size().at(0) - 105)
            textBox2 = Gtk::Label.new("Autocomplétion : ")
            bouton3 = Gtk::CheckButton.new()
            bouton3.set_label("")
            bouton3.set_active true
            bouton3.set_can_focus false
            bouton3.signal_connect("clicked") do |w|
                on_clicked(w)
            end
            boxBouton3.add(textBox2)
            boxBouton3.add(bouton3)
            @border3.add(boxBouton3)
    end

    def on_clicked sender

        if sender.active?
            #TODO
        else
           #TODO
        end
    end

    def afficheToi()
        @vBox1.add(@button)
        @vBox2.add(@titre)
        @vBox2.add(@border)
        @vBox2.add(@border2)
        @vBox2.add(@border3)
        @hBox.add(@vBox1)
        @hBox.add(@vBox2)
    end

    def enleveToi()
        @hBox.remove(@vBox1)
        @hBox.remove(@vBox2)
    end
    
    def to_s()
        return "Parametres"
    end
end
